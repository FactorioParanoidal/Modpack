require("util")
local compound_entities = require("prototypes.compound_entities.main_list")

return function (mod_name)
  local common = {}

  ------------------------------------------------------------------------------------
  -- Get mod name and path to mod
  common.modName = script and script.mod_name or mod_name
  common.modRoot = "__" .. common.modName .. "__"


  ------------------------------------------------------------------------------------
  -- Greatly improved version check for mods (thanks to eradicator!)
  common.Version = {}
  do
    local V = common.Version

    local function parse_version(vstr) -- string "Major.Minor.Patch"
      local err = function()
        error('Invalid Version String: <' .. tostring(vstr) .. '>')
      end
      local r = {vstr:match('^(%d+)%.(%d+)%.(%d+)$')}

      if #r ~= 3 then
        err()
      end

      for i=1, 3 do
        r[i] = tonumber(r[i])
      end

      return r
    end

    V.gtr = function(verA, verB)
      local a, b, c = unpack(parse_version(verA))
      local x, y, z = unpack(parse_version(verB))
      return (a > x) or (a == x and b > y) or (a == x and b == y and c > z)
    end
    local map = {
      ['=' ] = function(A, B) return not (V.gtr(A, B)   or V.gtr(B, A)) end,
      ['>' ] = V.gtr,
      ['!='] = function(A, B) return (V.gtr(A, B)       or V.gtr(B, A)) end,
      ['<='] = function(A, B) return V.gtr(B, A)        or (not V.gtr(A, B)) end,
      ['>='] = function(A, B) return V.gtr(A, B)        or (not V.gtr(B, A)) end,
      ['~='] = function(A, B) return (V.gtr(A, B)       or V.gtr(B, A)) end,
      ['<' ] = function(A, B) return V.gtr(B, A) end,
    }

    --~ common.Version.compare = function(mod_name, operator, need_version)
    common.check_version = function(mod_name, operator, need_version)
      local mod_version = (mods and mods[mod_name]) or (script and script.active_mods[mod_name])
      return map[operator](mod_version, need_version)
    end
  end

  ------------------------------------------------------------------------------------
  -- Sane values for collision masks
  -- Default: {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
  --~ common.RAIL_BRIDGE_MASK = {"floor-layer", "object-layer", "consider-tile-transitions"}
  common.RAIL_BRIDGE_MASK = {"object-layer", "consider-tile-transitions"}

  -- "Transport Drones" removes "object-layer" from rails, so if bridges have only
  -- {"object-layer"}, there collision mask will be empty, and they can be built even
  -- over cliffs. So we need to add another layer to bridges ("floor-layer").
  -- As of Factorio 1.1.0, rails need to have "rail-layer" in their mask. This will work
  -- alright, but isn't available in earlier versions of Factorio, so we will use
  -- "floor-layer" there instead.
  local need = common.check_version("base", ">=", "1.1.0") and "rail-layer" or "floor-layer"
  table.insert(common.RAIL_BRIDGE_MASK, need)

  -- Rails use basically the same mask as rail bridges, ...
  common.RAIL_MASK = util.table.deepcopy(common.RAIL_BRIDGE_MASK)
  -- ... we just need to add some layers so our rails have the same mask as vanilla rails.
  table.insert(common.RAIL_MASK, "item-layer")
  table.insert(common.RAIL_MASK, "water-tile")
--~ log("common.RAIL_BRIDGE_MASK: " .. serpent.block(common.RAIL_BRIDGE_MASK))
--~ log("common.RAIL_MASK: " .. serpent.block(common.RAIL_MASK))



  ------------------------------------------------------------------------------------
  -- Set maximum_wire_distance of Power-to-rail connectors
  common.POWER_TO_RAIL_WIRE_DISTANCE = 4



  ------------------------------------------------------------------------------------
  -- List of compound entities
  -- Key:       name of the base entity
  -- tab:       name of the global table where data of these entity are stored
  -- hidden:    table containing the hidden entities needed by this entity
  --            (Key:   name under which the hidden entity will be stored in the table;
  --             Value: name of the entity that should be placed)
  common.compound_entities = compound_entities.get_HE_list()

  -- Map the short handles of hidden entities (e.g. "pole") to real prototype types
  -- (e.g. "electric-pole")
  common.HE_map = compound_entities.HE_map
  -- Reverse lookup
  common.HE_map_reverse = compound_entities.HE_map_reverse

  ------------------------------------------------------------------------------------
  -- There may be trees for which we don't want to create variations. These patterns
  -- are used to build a list of trees we want to ignore.
  common.ignore_name_patterns = {
    -- Ignore our own trees
    "bio%-tree%-.+%-%d",
    -- Tree prototypes created by "Robot Tree Farm" or "Tral's Robot Tree Farm"
    "rtf%-.+%-%d+",
  }


  -- Get list of tree prototypes that we want to ignore
  common.get_tree_ignore_list = function()
  --~ log("Entered function get_tree_ignore_list!")
    local ignore = {}
    local trees = game and
                    game.get_filtered_entity_prototypes({{filter = "type", type = "tree"}}) or
                    data.raw.tree
    for tree_name, tree in pairs(trees) do
--~ log("tree_name: " .. tree_name)
      for p, pattern in ipairs(common.ignore_name_patterns) do
--~ log("Check for match against pattern " .. pattern)
        if tree_name:match(pattern) then
--~ log("Pattern matches!")
          ignore[tree_name] = true
          break
        end
      end
    end
    --~ log("Tree ignore list (" .. table_size(ignore) .. "): " .. serpent.block(ignore))
    return ignore
  end

  ------------------------------------------------------------------------------------
  -- Enable writing to log file until startup options are set, so debugging output
  -- from the start of a game session can be logged. This depends on a locally
  -- installed dummy mod to allow debugging output during development without
  -- spamming real users.
  -- If the "_debug" dummy mod is active, debugging will always be on. If you don't
  -- have this dummy mod but want to turn on logging anyway, set the default value
  -- to true!
  local default = false

  common.is_debug = ( (mods and mods["_debug"]) or
                      (script and script.active_mods["_debug"])) and
                    true or default


  ------------------------------------------------------------------------------------
  --                               DEBUGGING FUNCTIONS                              --
  ------------------------------------------------------------------------------------


  ------------------------------------------------------------------------------------
  -- Output debugging text
  common.writeDebug = function(msg, tab, print_line)
    local args = {}
    -- Use serpent.line instead of serpent.block if this is true!
    local line = print_line and
                  (string.lower(print_line) == "line" or string.lower(print_line) == "l") and
                  true or false

    if common.is_debug then
      if type(tab) ~= "table" then
        tab = { tab }
      end
      local v
      for k = 1, #tab do
        v = tab[k]
        -- NIL
        if v == nil then
          args[#args + 1] = "NIL"
        -- TABLE
        elseif type(v) == "table" then
          args[#args + 1] = line and serpent.line(table.deepcopy(v)) or
                                      serpent.block(table.deepcopy(v))
        -- OTHER VALUE
        else
          args[#args + 1] = v
        end
      end
      if #args == 0 then
        args[1] = "nil"
      end
      args.n = #args

      -- Print the message text to log and game
      log(string.format(tostring(msg), table.unpack(args)))

      if game then
        game.print(string.format(tostring(msg), table.unpack(args)))
      end
    end
  end

  ------------------------------------------------------------------------------------
  -- Simple helper to show a single value with descriptive text
  common.show = function(desc, term)
    if common.is_debug then
      common.writeDebug(tostring(desc) .. ": %s", type(term) == "table" and { term } or term)
    end
  end

  ------------------------------------------------------------------------------------
  -- Print "entityname (id)"
  common.print_name_id = function(entity)
    local id
    local name = "unknown entity"

    if entity and entity.valid then
    -- Stickers don't have an index or unit_number!
      id =  (entity.type == "sticker" and entity.type) or
            entity.unit_number or entity.type

      name = entity.name
    end

    --~ return name .. " (" .. tostring(id) .. ")"
    return string.format("%s (%s)", name, id or "nil")
  end

  ------------------------------------------------------------------------------------
  -- Print "entityname"
  common.print_name = function(entity)
    return entity and entity.valid and entity.name or ""
  end


  ------------------------------------------------------------------------------------
  -- Throw an error if a wrong argument has been passed to a function
  common.arg_err = function(arg, arg_type)
    error(string.format(
        "Wrong argument! %s is not %s!",
        (arg or "nil"), (arg_type and "a valid " .. arg_type or "valid")
      )
    )
  end

  ------------------------------------------------------------------------------------
  -- Rudimentary check of the arguments passed to a function
  common.check_args = function(arg, arg_type, desc)
    if not (arg and type(arg) == arg_type) then
      common.arg_err(arg or "nil", desc or arg_type or "nil")
    end
  end



  ------------------------------------------------------------------------------------
  --                                  MOD SPECIFIC                                  --
  ------------------------------------------------------------------------------------

  ------------------------------------------------------------------------------------
  -- Are tiles from Alien Biomes available? (Returns true or false)
  common.AB_tiles = function()

    local ret = false

    if game then
      local AB = game.item_prototypes["fertilizer"].place_as_tile_result.result.name
      -- In data stage, place_as_tile is only changed to Alien Biomes tiles if
      -- both "vegetation-green-grass-1" and "vegetation-green-grass-3" exist. Therefore,
      -- we only need to check for one tile in the control stage.
      ret = (AB == "vegetation-green-grass-3") and true or false
    else
      ret = data.raw.tile["vegetation-green-grass-1"] and
            data.raw.tile["vegetation-green-grass-3"] and true or false
    end

    return ret
  end

  ------------------------------------------------------------------------------------
  -- Function for removing individual entities
  common.remove_entity = function(entity)
    if entity and entity.valid then
      --~ entity.destroy()
      entity.destroy{raise_destroy = true}
    end
  end

  ------------------------------------------------------------------------------------
  -- Function for removing invalid prototypes from list of compound entities
  common.rebuild_compound_entity_list = function()
    local f_name = "rebuild_compound_entity_list"
    common.writeDebug("Entered function %s()", {f_name})

    local ret = {}
    local h_type

    for c_name, c_data in pairs(common.compound_entities) do
common.show("base_name", c_name)
common.show("data", c_data)
      -- Is the base entity in the game?
      if c_data.base and c_data.base.name and game.entity_prototypes[c_data.base.name] then
        -- Make a copy of the compound-entity data
        common.writeDebug("%s exists -- copying data", {c_name})
        ret[c_name] = util.table.deepcopy(c_data)

        -- Check hidden entities
        for h_key, h_data in pairs(ret[c_name].hidden) do
          --~ h_type = common.HE_map[h_key]
common.writeDebug("h_key: %s\th_data: %s", {h_key, h_data})
          -- Remove hidden entity if it doesn't exist
          if not game.entity_prototypes[h_data.name] then
            common.writeDebug("Removing %s (%s) from list of hidden entities!", {h_data.name, h_key})
            ret[c_name].hidden[h_key] = nil
          end
        end

      -- Clean table
      else
        local tab = c_data.tab
        if tab then
          -- Remove main table from global
          common.writeDebug("Removing %s (%s obsolete entries)", {tab, #tab})
          global[tab] = nil
        end

        -- If this compound entity requires additional tables in global, initialize
        -- them now!
        local related_tables = c_data.add_global_tables
        if related_tables then
          for t, tab in ipairs(related_tables or {}) do
            common.writeDebug("Removing global[%s] (%s values)", {tab, table_size(global[tab])})
            global[tab] = nil
          end
        end

        -- If this compound entity requires additional values in global, remove them!
        local related_vars = c_data.add_global_values
        if related_vars then
          for var_name, value in pairs(related_vars or {}) do
            common.writeDebug("Removing global[%s] (was: %s)", {var_name, global[var_name]})
            global[var_name] = nil
          end
        end
      end
    end
    common.show("ret", ret)
    return ret
  end
  ------------------------------------------------------------------------------------
  -- Function to add all optional values for a compound entity to the table entry.
  common.add_optional_data = function(base)
    local f_name = "add_optional_data"
common.writeDebug("Entered function %s(%s)", {f_name, common.print_name_id(base)})
    if not (base and base.valid and global.compound_entities[base.name]) then
      common.arg_err(base, "base of a compound entity")
    end

    -- Add optional values to global table
    local data = global.compound_entities[base.name]
common.show("data", data)
    local tab = data.tab
common.show("tab", tab)
common.show("global[tab]", global[tab] or "nil")

    local entry = global[tab][base.unit_number]

    for k, v in pairs(data.optional or {}) do
      if entry[k] then
        common.writeDebug("%s already exists: %s", {k, entry[k]})
      else
        entry[k] = v
        common.writeDebug("Added data to %s: %s = %s", {common.print_name_id(base), k, v})
      end
    end
  end


  ------------------------------------------------------------------------------------
  -- Function for removing all parts of invalid compound entities
  common.clean_global_compounds_table = function(entity_name)
    local f_name = "clean_table"
common.writeDebug("Entered function %s(%s)", {f_name, entity_name or "nil"})
common.writeDebug("Entries in common.compound_entities[%s]: %s", {entity_name, table_size(global.compound_entities[entity_name])})

    --~ local entity_table = global[common.compound_entities[entity_name].tab]
    --~ local hidden_entities = common.compound_entities[entity_name].hidden
    local entity_table = global.compound_entities[entity_name]
common.show("entity_table", entity_table and entity_table.tab)
    entity_table = entity_table and entity_table.tab and global[entity_table.tab]
common.writeDebug("entity_table: %s", {entity_table}, "line")
    local hidden_entities = global.compound_entities[entity_name].hidden
common.show("hidden_entities", hidden_entities)
    local removed = 0
    -- Scan the whole table
    for c, compound in pairs(entity_table) do
common.writeDebug ("c: %s\tcompound: %s", {c, compound})
      -- No or invalid base entity!
      if not (compound.base and compound.base.valid) then
common.writeDebug("%s (%s) has no valid base entity -- removing entry!", {entity_name, c})

        for h_name, h_entity in pairs(hidden_entities) do
common.writeDebug("Removing %s (%s)", {h_name, h_entity.name})
          common.remove_entity(compound[h_name])
        end
        entity_table[c] = nil
        removed = removed + 1
common.writeDebug("Removed %s %s", {entity_name, c})
      end
    end
common.show("Removed entities", removed)
common.show("Pruned list size", table_size(entity_table))
--~ common.show("Pruned list", entity_table)
    return removed
  end


  ------------------------------------------------------------------------------------
  -- Function to resore missing parts of compound entities
  common.restore_missing_entities = function(entity_name)
    local f_name = "restore_missing_entities"
common.writeDebug("Entered function %s(%s)", {f_name, entity_name or "nil"})
--~ common.writeDebug("global.compound_entities[%s]: %s", {entity_name, global.compound_entities[entity_name]})
common.writeDebug("global.compound_entities[%s]: %s entries", {entity_name, table_size(global.compound_entities[entity_name])})

    local check = global.compound_entities[entity_name]
    local entity_table = check and global[check.tab] or {}
    local hidden_entities = check and check.hidden or {}

    local checked = 0
    local restored = 0
    -- Scan the whole table
    for c, compound in pairs(entity_table) do
--~ common.writeDebug("c: %s\tcompound: %s", {c, compound})
      -- Base entity is valid!
      if (compound.base and compound.base.valid) then
common.writeDebug("%s is valid -- checking hidden entities!", {common.print_name_id(compound.base)})
        for h_name, h_entity in pairs(hidden_entities) do
--~ common.writeDebug("h_name: %s\th_entity: %s", {h_name, h_entity})
          -- Hidden entity is missing
          if compound[h_name] and compound[h_name].valid then
            common.writeDebug("%s: OK", {h_name})
          else
            common.writeDebug("%s: MISSING!", {h_name})
            common.create_entities(entity_table, compound.base, {[h_name] = h_entity.name})
            restored = restored + 1
            common.writeDebug("Created %s (%s) for %s",
                              {h_name, h_entity.name, common.print_name_id(compound.base)})
          end
        end
        checked = checked + 1
--~ common.writeDebug("Restored %s %s", {entity_name, c})
      end
    end
common.writeDebug("Checked %s compound entities", {checked})
common.writeDebug("Restored %s entities", {restored})
--~ common.show("Fixed list", entity_table)
    return {checked = checked, restored = restored}
  end


  ------------------------------------------------------------------------------------
  -- Function to find all unregistered compound entities of a particular type
  common.register_in_compound_entity_tab = function(compound_name)
  local f_name = "register_in_compound_entity_tab"
    common.writeDebug("Entered function %s(%s)", {f_name, compound_name})

    local cnt = 0
    local h_cnt = 0
    local data = global.compound_entities[compound_name]
    if not data then
      common.arg_err(compound_name, "name of a compound entity")
    end

    local g_tab = global[data.tab]
    local found, h_found ,created

    -- Scan all surfaces
    for s, surface in pairs(game.surfaces) do
      -- Check the bases of all compound entities on the surface
      found = surface.find_entities_filtered({name = compound_name})
      for b, base in ipairs(found) do
        -- Base entity isn't registered yet!
        if not g_tab[base.unit_number] then
          common.writeDebug("Found unregistered entity: %s!", {common.print_name_id(base)})
          -- Create an entry in the global table
          g_tab[base.unit_number] = {base = base}
          -- Add optional data to the table, if there are any
          common.add_optional_data(base)


          -- Check if it already has any hidden entities
          for h_name, h_data in pairs(data.hidden) do
            h_found = surface.find_entities_filtered({
              name = h_data.name,
              type = h_data.type,
              position = common.offset_position(base.position, h_data.base_offset),
            })

            -- Check for multiple hidden entities of the same type in the same position!
            if #h_found > 1 then
              local cnt = 0
              for duplicate = 2, #h_found do
                h_found[duplicate].destroy({raise_destroy = true})
                cnt = cnt + 1
              end
              common.writeDebug("Removed %s duplicate entities (%s)!", {cnt, h_data.name})
            end

            -- There still is one hidden entity left. Add it to the table!
            if next(h_found) then
              common.writeDebug("Found %s -- adding it to the table.", {common.print_name_id(base)})
              g_tab[base.unit_number][h_name] = h_found[1]

            -- Create hidden entity! This will automatically add it to the table.
            else
              created = common.create_entities(g_tab, base, {[h_name] = h_data})
              common.writeDebug("Created hidden %s: %s",
                                {h_name, created and common.print_name_id(created) or "nil"})
              h_cnt = h_cnt + 1
            end
          end
          cnt = cnt + 1
        end
      end
    end
    common.writeDebug("Registered %s compound entities and created %s hidden entities", {cnt, h_cnt})
    return cnt
  end

  ------------------------------------------------------------------------------------
  -- Function to find all unregistered compound entities
  common.find_unregistered_entities = function()
    local f_name = "find_unregistered_entities"
    common.writeDebug("Entered function %s()", {f_name})

    local cnt = 0
    for compound_entity, c in pairs(global.compound_entities) do
      cnt = cnt + common.register_in_compound_entity_tab(compound_entity)
    end
    --~ common.writeDebug("Registered %s compound entities", {cnt})
    common.writeDebug("Registered %s compound entities.", {cnt})
    return cnt
  end

  ------------------------------------------------------------------------------------
  -- Function to normalize positions
  common.normalize_position = function(pos)
    if pos and type(pos) == "table" and table_size(pos) == 2 then
      local x = pos.x or pos[1]
      local y = pos.y or pos[2]
      if x and y and type(x) == "number" and type(y) == "number" then
        return { x = x, y = y }
      end
    end
  end


  ------------------------------------------------------------------------------------
  -- Calculate the offset position of a hidden entity
  common.offset_position = function(base_pos, offset)
    common.check_args(base_pos, "table", "position")
    offset = offset or {x = 0, y = 0}
    common.check_args(offset, "table", "position")

    base_pos = common.normalize_position(base_pos)
    offset = common.normalize_position(offset)

common.show("base_pos", base_pos)
common.show("offset", offset)
common.show("new", {x = base_pos.x + offset.x, y = base_pos.y + offset.y})
    return {x = base_pos.x + offset.x, y = base_pos.y + offset.y}
  end

  ------------------------------------------------------------------------------------
  -- Check if argument is a valid surface
  common.is_surface = function(surface)
    local t = type(surface)
    surface = (t == "number" or t == "string" and game.surfaces[surface]) or
              (t == "table" and surface.object_name and
                                surface.object_name == "LuaSurface" and surface)
    return surface
  end


  ------------------------------------------------------------------------------------
  -- Make hidden entities unminable and indestructible
  local function make_unminable(entities)
    for e, entity in ipairs(entities or {}) do
      if entity.valid then
        entity.minable = false
        entity.destructible = false
      end
    end
  end

  --------------------------------------------------------------------
  -- Create and register hidden entities
  --~ common.create_entities = function(g_table, base_entity, hidden_entity_names, position, ...)
  common.create_entities = function(g_table, base_entity, hidden_entities)
    local f_name = "create_entities"
    common.writeDebug("Entered function %s(%s, %s, %s)",
                      {f_name, "g_table", base_entity, hidden_entities})
    common.show("#g_table", g_table and table_size(g_table))
    --~ common.show("hidden_entities", hidden_entities)

    common.check_args(g_table, "table")
    common.check_args(base_entity, "table")

    if not base_entity.valid then
      common.arg_err(base_entity, "base entity")
    -- A table is required, but it may be empty! (This is needed for the
    -- bio gardens, which only have a hidden pole if the "Easy Gardens"
    -- setting is enabled.)
    elseif not (hidden_entities and type(hidden_entities) == "table") then
      common.arg_err(hidden_entities, "array of hidden-entity names")
    end
    local base_pos = common.normalize_position(base_entity.position) or
                      common.arg_err(position or "nil", "position")

    local entity, offset, pos

    -- Initialize entry in global table
    g_table[base_entity.unit_number] = g_table[base_entity.unit_number] or {}
    g_table[base_entity.unit_number].base = base_entity

    -- Create hidden entities
    local data
    for key, tab in pairs(hidden_entities) do
common.writeDebug("key: %s\tname: %s", {key, tab})
--~ data = common.compound_entities[base_entity.name].hidden[key]
      data = global.compound_entities[base_entity.name].hidden[key]
--~ common.show("common.compound_entities[base_entity.name].hidden",
            --~ common.compound_entities[base_entity.name].hidden)
common.show("data", data)
      entity = base_entity.surface.create_entity({
        name = data.name,
        type = data.type,
        position = common.offset_position(base_pos, data.base_offset),
        force = base_entity.force,
      })
      -- Raise the event manually, so we can pass on extra data!
      script.raise_event(defines.events.script_raised_built, {
        entity = entity,
        base_entity = base_entity
      })

      -- Make hidden entity unminable/undestructible
      make_unminable({entity})

      -- Add hidden entity to global table
      g_table[base_entity.unit_number][key] = entity
    end

    -- Add optional values to global table
    --~ local optional = global.compound_entities[base_entity.name].optional
    --~ for k, v in pairs(optional or {}) do
      --~ g_table[base_entity.unit_number][k] = v
    --~ end
    common.add_optional_data(base_entity)
    common.writeDebug("g_table[%s]: %s", {base_entity.unit_number, g_table[base_entity.unit_number]})
  end


  --------------------------------------------------------------------
  -- Make a list of the pole types that Bio gardens may connect to
  common.get_garden_pole_connectors = function()
    --~ local ret = {}
    local ret
    if common.get_startup_setting("BI_Easy_Bio_Gardens") then
common.writeDebug("\"Easy gardens\": Compiling list of poles they can connect to!" )
      ret = {}
      local poles = game.get_filtered_entity_prototypes({
        {filter = "type", type = "electric-pole"},
        {filter = "name", name = {
            -- Poles named here will be ignored!
            "bi-bio-garden-hidden-pole"
            }, invert = true, mode = "and"
        }
      })
      for p, pole in pairs(poles) do
        ret[#ret + 1] = pole.name
      end
    else
common.writeDebug("\"Easy gardens\": Not active -- nothing to do!" )
    end
    return ret
  end

  --------------------------------------------------------------------
  -- Connect hidden poles of Bio gardens!
  -- (This function may be called for hidden poles that have not been
  -- added to the table yet if the pole has just been built. In this
  -- case, we pass on the new pole explicitly!)
  common.connect_garden_pole = function(base, new_pole)
    local compound_entity = global.compound_entities["bi-bio-garden"]
    --~ local pole_type = "electric-pole"
    --~ local pole = global[compound_entity.tab][base.unit_number] and
                  --~ global[compound_entity.tab][base.unit_number][pole_type] or
                  --~ new_pole
    local pole = global[compound_entity.tab][base.unit_number] and
                  global[compound_entity.tab][base.unit_number].pole or
                  new_pole

    --~ if pole and pole.valid then
      --~ local wire_reach = game.entity_prototypes[compound_entity.hidden[pole_type]] and
                          --~ game.entity_prototypes[compound_entity.hidden[pole_type]].max_wire_distance
    if pole and pole.valid and  compound_entity.hidden and
                                compound_entity.hidden.pole and
                                compound_entity.hidden.pole.name then
      local wire_reach = game.entity_prototypes[compound_entity.hidden.pole.name] and
                          game.entity_prototypes[compound_entity.hidden.pole.name].max_wire_distance
      if not wire_reach then
        error("Prototype for hidden pole of Bio gardens doesn't exist!")
      end

      pole.disconnect_neighbour()

      -- Each pole can only have 5 connections. Let's connect to other hidden
      -- poles first!
      local connected
      local neighbours = pole.surface.find_entities_filtered({
        position = pole.position,
        radius = wire_reach,
        type = "electric-pole",
        name = compound_entity.hidden.pole.name
      })
common.writeDebug("Pole %g has %s neighbours", {pole.unit_number, #neighbours - 1})

      for n, neighbour in pairs(neighbours or{}) do
        if pole ~= neighbour then
          connected = pole.connect_neighbour(neighbour)
common.writeDebug("Connected pole %g to %s %g: %s",
                  {pole.unit_number, neighbour.name, neighbour.unit_number, connected})
        end
      end

      --~ -- Connect hidden poles to other poles that may be in reach.
      --~ common.garden_pole_connectors = common.garden_pole_connectors and next() or
                                      --~ common.get_garden_pole_connectors()
--~ common.show("Poles hidden bio-garden poles may connect to", global.mod_settings.garden_pole_connectors)

      -- Look for other poles around this one
      neighbours = pole.surface.find_entities_filtered({
        position = pole.position,
        radius = wire_reach,
        type = "electric-pole",
        name = global.mod_settings.garden_pole_connectors,
      })
common.writeDebug("Pole %g has %s neighbours", {pole.unit_number, #neighbours})
      for n, neighbour in pairs(neighbours or{}) do
        connected = pole.connect_neighbour(neighbour)
common.writeDebug("Connected pole %g to neighbour %s (%g): %s",
                  {pole.unit_number, neighbour.name, neighbour.unit_number, connected})
      end
    end
  end

  --------------------------------------------------------------------
  -- Connect hidden poles of powered rails -- this is also used in
  -- migration scripts, so make it a function in common.lua!
  -- (This function may be called for hidden poles that have not been
  -- added to the table yet if the pole has just been built. In this
  -- case, we pass on the new pole explicitly!)
  common.connect_power_rail = function(base, new_pole)
    --~ local pole_type = "electric-pole"

    local pole = global.bi_power_rail_table[base.unit_number].pole or new_pole
    if pole and pole.valid then
      -- Remove all copper wires from new pole
      pole.disconnect_neighbour()
common.writeDebug("Removed all wires from %s %g", {pole.name, pole.unit_number})

      -- Look for connecting rails at front and back of the new rail
      for s, side in ipairs( {"front", "back"} ) do
common.writeDebug("Looking for rails at %s", {side})
        local neighbour
        -- Look in all three directions
        for d, direction in ipairs( {"left", "straight", "right"} ) do
common.writeDebug("Looking for rails in %s direction", {direction})
          neighbour = base.get_connected_rail{
            rail_direction = defines.rail_direction[side],
            rail_connection_direction = defines.rail_connection_direction[direction]
          }
common.writeDebug("Rail %s of %s (%s): %s (%s)", {direction, base.name, base.unit_number, (neighbour and neighbour.name or "nil"), (neighbour and neighbour.unit_number or "nil")})

          -- Only make a connection if found rail is a powered rail
          -- (We'll know it's the right type if we find it in our table!)
          neighbour = neighbour and neighbour.valid and global.bi_power_rail_table[neighbour.unit_number]
          if neighbour and neighbour.pole and neighbour.pole.valid then
            pole.connect_neighbour(neighbour.pole)
            common.writeDebug("Connected poles!")
          end
        end
      end

      -- Look for Power-rail connectors
      local connector = base.surface.find_entities_filtered{
        position = base.position,
        radius = common.POWER_TO_RAIL_WIRE_DISTANCE,    -- maximum_wire_distance of Power-to-rail-connectors
        name = "bi-power-to-rail-pole"
      }
      -- Connect to first Power-rail connector we've found
      if connector and next(connector) then
        pole.connect_neighbour(connector[1])
        common.writeDebug("Connected " .. pole.name .. " (" .. pole.unit_number ..
                          ") to " .. connector[1].name .. " (" .. connector[1].unit_number .. ")")
        common.writeDebug("Connected %s (%g) to %s (%g)", {pole.name, pole.unit_number, connector[1].name, connector[1].unit_number})
      end
      common.writeDebug("Stored %s (%g) in global table", {base.name, base.unit_number})
    end
  end


  ------------------------------------------------------------------------------------
  -- Get the value of a startup setting
  common.get_startup_setting = function(setting_name)
    return settings.startup[setting_name] and settings.startup[setting_name].value
  end


  ------------------------------------------------------------------------------------
  -- Add the "icons" property based on the value of "icon"
  ------------------------------------------------------------------------------------
  common.BI_add_icons = function()
    for tab_name, tab in pairs(data.raw) do
      --~ common.writeDebug("Checking data.raw[%s]", {tab_name})
      for proto_type_name, proto_type in pairs(data.raw[tab_name] or {}) do
--~ common.show("proto_type.BI_add_icon", proto_type.BI_add_icon or "nil" )

        if proto_type.BI_add_icon then
          proto_type.icons = {
            {
              icon = proto_type.icon,
              icon_size = proto_type.icon_size,
              icon_mipmaps = proto_type.icon_mipmaps
            }
          }
          proto_type.BI_add_icon = nil
          common.writeDebug("Added \"icons\" property to data.raw[\"%s\"][\"%s\"]: %s",
                            {tab_name, proto_type_name, proto_type.icons}, "line")
        end
      end
    end
  end

------------------------------------------------------------------------------------
--                                    END OF FILE
------------------------------------------------------------------------------------
return common
end
