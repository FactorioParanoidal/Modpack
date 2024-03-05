return function (mod_name)
--~ log("Entered common.lua!")

  local common = {}



  ------------------------------------------------------------------------------------
  -- Get mod name and path to mod
  common.modName = mod_name
  common.modRoot = "__" .. mod_name .. "__"

  ------------------------------------------------------------------------------------
  -- When looking for alternative characters, use this search pattern
  common.pattern = "SKIN"

  ------------------------------------------------------------------------------------
  -- Name of the surface we create as storage for dummy characters
  common.dummy_surface = "dummy_dungeon"

  ------------------------------------------------------------------------------------
  -- Name of the dummy character prototype
  common.dummy_character_name = "minime_character_dummy"

  ------------------------------------------------------------------------------------
  -- Name of God-mode button
  common.remove_character_name = "God-mode"

  ------------------------------------------------------------------------------------
  -- Names of inventories
  common.inventory_list = { "ammo", "armor", "guns", "main", "trash" }

  ------------------------------------------------------------------------------------
  -- Number of dummy's bonus trash slots
  common.character_trash_slot_count_bonus = 500


  ------------------------------------------------------------------------------------
  -- Enable character selector?
  common.minime_character_selector = settings.startup["minime_character-selector"].value

  ------------------------------------------------------------------------------------
  -- Close GUI after a character has been selected?
  common.minime_close_gui_on_selection = settings.startup["minime_close-gui-on-selection"].value

  ------------------------------------------------------------------------------------
  -- Look for matching pattern at start of a string
  common.prefixed = function(str, start)
    return str:sub(1, #start) == start
  end


  ------------------------------------------------------------------------------------
  -- Enable writing to log file until startup options are set, so debugging output
  -- from the start of a game session can be logged. This depends on a locally
  -- installed dummy mod to allow debugging output during development without
  -- spamming real users.
  -- If you don't have this mod or don't want to activate it, you can also change
  -- the value of debug_default!
  local debug_default = false
  -- Control stage
  if game then
    common.debug_in_log = (game.active_mods["_debug"] and true) or debug_default
  -- on_load
  elseif script then
    common.debug_in_log = (script.active_mods["_debug"] and true) or debug_default
  -- Data stage
  else
    common.debug_in_log = (mods["_debug"] and true) or debug_default
  end


  ------------------------------------------------------------------------------------
  -- Output: Print to user and debug-print
  common.output = function(player, msg)
      --~ common.dprint("Entered function " .. common.modName .. ".output(" ..
                    --~ tostring(player.name) .. ", " .. tostring({msg}) .. ")")

    if player.valid and player.is_player() then
      player.print({"", msg})
      --~ common.dprint({"", msg})
    elseif not player.valid then
      common.dprint({"", common.modName, ": Couldn't print to player -- player isn't valid!"})
    else
      common.dprint({"", common.modName, ": Couldn't print to " .. player.name .. " -- not a player!"})
    end

    --~ common.dprint("End of function " .. common.modName .. ".output(" ..
                    --~ tostring(player.name) .. ", " .. tostring({msg}) .. ")")
  end

  ------------------------------------------------------------------------------------
  -- Debug function
  common.dprint = function(msg)
    if common.debug_in_log then log({"", msg}) end

    if game and msg then
      for index, player in pairs(game.players) do
        if global.player_settings and global.player_settings[index]
                                  and global.player_settings[index].debug_in_game then
          --~ game.players[index].print({"", common.modName, ': ', msg}, {r=.75, g=.5, b=.25})
          game.players[index].print({"", common.modName, ': ', msg})
        end
      end
    end
  end

  ------------------------------------------------------------------------------------
  -- Helper function to show value and type of variables
  common.show = function(var, msg)
      common.dprint({"", "Show", tostring(msg and " " .. msg), ":\t" .. serpent.block(var)})
  end


  ------------------------------------------------------------------------------------
  -- Localize entity names for output routines
  -- (Returns localized entity name; falls back to entity name, or to default string)
  common.loc_name = function (entity)
      return entity and entity.valid and (entity.localised_name or entity.name) or ""
  end


  ------------------------------------------------------------------------------------
  --                 Get the version of a mod and split the number!                 --
  ------------------------------------------------------------------------------------
  local function split_number(version)
    local ret = {}

    if version then
      for x in string.gmatch(version, "(%d+)") do
         ret[#ret + 1] = tonumber(x)
      end
    end

    return table_size(ret) == 3 and ret or nil
  end

  ------------------------------------------------------------------------------------
  --       Check if a mod has a version greater than or equal to this number!       --
  ------------------------------------------------------------------------------------
  common.check_mod_version_ge = function(mod_name, target_version)
    --~ local f_name = "common.check_mod_version_ge"
    --~ common.dprint("Entered function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")

    if not (mod_name and target_version) then
      error("Missing  arguments!")
    end

    local mod_version = script and script.active_mods[mod_name] or
                        game and game.active_mods[mod_name]
    local ret = false
--~ common.show(mod_version, "mod_version")

    -- Only continue check if mod is active
    mod_version = split_number(mod_version)
--~ common.show(mod_version, "mod_version after split")
    if mod_version then
      target_version = split_number(target_version)
--~ common.show(target_version, "target_version")
      if mod_version[1] > target_version[1] then
        ret = true
      elseif mod_version[1] == target_version[1] then
        if mod_version[2] > target_version[2] then
          ret = true
        elseif (
            mod_version[2] == target_version[2] and
            mod_version[3] >= target_version[3]
        ) then
          ret = true
        end
      end
    end
--~ common.show(ret, "Return")
    --~ common.dprint("End of function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")
    return ret
  end


  ------------------------------------------------------------------------------------
  --         Check if a mod has a version less than or equal to this number!        --
  ------------------------------------------------------------------------------------
  common.check_mod_version_le = function(mod_name, target_version)
    --~ local f_name = "common.check_mod_version_le"
    --~ common.dprint("Entered function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")

    if not (mod_name and target_version) then
      error("Missing  arguments!")
    end

    local mod_version = script and script.active_mods[mod_name] or
                        game and game.active_mods[mod_name]
    local ret = false

    -- Only continue check if mod is active
    mod_version = split_number(mod_version)
    if mod_version then
      target_version = split_number(target_version)

      if mod_version[1] < target_version[1] then
        ret = true
      elseif mod_version[1] == target_version[1] then
        if mod_version[2] < target_version[2] then
          ret = true
        elseif (
            mod_version[2] == target_version[2] and
            mod_version[3] <= target_version[3]
        ) then
          ret = true
        end
      end
    end

    --~ common.dprint("End of function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")
    return ret
  end

  ------------------------------------------------------------------------------------
  --               Check if a mod has a version less than this number!              --
  ------------------------------------------------------------------------------------
  common.check_mod_version_less = function(mod_name, target_version)
    --~ local f_name = "common.check_mod_version_less"
    --~ common.dprint("Entered function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")

    if not (mod_name and target_version) then
      error("Missing  arguments!")
    end

    local mod_version = script and script.active_mods[mod_name] or
                        game and game.active_mods[mod_name]

    local ret = false

    -- Same version isn't less!
    if mod_version ~= target_version and common.check_mod_version_le(mod_name, target_version) then
      ret = true
    end

    --~ common.dprint("End of function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")
    return ret
  end

  ------------------------------------------------------------------------------------
  --             Check if a mod has a version greater than this number!             --
  ------------------------------------------------------------------------------------
  common.check_mod_version_greater = function(mod_name, target_version)
    --~ local f_name = "common.check_mod_version_greater"
    --~ common.dprint("Entered function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")

    if not (mod_name and target_version) then
      error("Missing  arguments!")
    end

    local mod_version = script and script.active_mods[mod_name] or
                        game and game.active_mods[mod_name]

    local ret = false

    -- Same version isn't greater!
    if mod_version ~= target_version and common.check_mod_version_ge(mod_name, target_version) then
      ret = true
    end

    --~ common.dprint("End of function " .. f_name .. "(" .. tostring(mod_name) ..
                  --~ ", " .. tostring(target_version) .. ")")
    return ret
  end

  ------------------------------------------------------------------------------------
  --                            Copy character settings!                            --
  ------------------------------------------------------------------------------------
  common.copy_character = function(src, dst)
    local f_name = "common.copy_character_settings"
    common.dprint("Entered function " .. f_name .. "(" .. tostring(src and src.name) .. ", " ..
                  tostring(dst and dst.name) .. ")")

    if not (src and src.valid and src.type == "character") then
      error(serpent.block(src) .. " is not a valid character!")
    elseif not (dst and dst.valid and dst.type == "character") then
      error(serpent.block(dst) .. " is not a valid character!")
    end

    -- Transfer inventories
    --~ local inventory_list = { "armor", "ammo", "guns", "main", "trash" }
    local inventory_list = common.inventory_list
    local inventory
    for i, inv in ipairs(inventory_list) do
      common.dprint(i .. ": Transferring items from inventory " .. serpent.line(inv))
      inventory = defines.inventory["character_" .. inv]
      common.transfer_inventory(src.get_inventory(inventory), dst.get_inventory(inventory))
    end


    -- Copy settings/filters from Personal logistic slots
--    local slots = src.character_logistic_slot_count
--    dst.character_logistic_slot_count = slots

--    for i = 1, slots do
--      dst.set_personal_logistic_slot(i, src.get_personal_logistic_slot(i))
--    end
--    common.dprint("Copied ".. slots .. " personal logistic slots from " ..
--                  serpent.line(common.loc_name(src)) .. " to " .. serpent.line(common.loc_name(dst)) .. ".")

    -- Copy status of switch for personal logistic requests
    dst.character_personal_logistic_requests_enabled = src.character_personal_logistic_requests_enabled
    common.dprint("Personal logistic requests are " ..
                  tostring(src.character_personal_logistic_requests_enabled and "enabled." or "disabled."))

    -- Copy status of switch for personal roboport
    dst.allow_dispatching_robots = src.allow_dispatching_robots
    common.dprint("Personal bots are " ..
                  tostring(src.allow_dispatching_robots and "enabled." or "disabled."))

    -- Copy status of flashlight
    if src.is_flashlight_enabled() then
      dst.enable_flashlight()
      common.dprint("Flashlight is enabled.")
    else
      dst.disable_flashlight()
      common.dprint("Flashlight is disabled.")
    end


    common.dprint("End of function " .. f_name .. "(" .. tostring(src and src.name) .. ", " ..
                  tostring(dst and dst.name) .. ")")
  end


  ------------------------------------------------------------------------------------
  -- Create a dummy character
  common.make_dummy = function(p)
    local f_name = "make_dummy"
    common.dprint("Entered function " .. f_name .. "(" .. serpent.line(p) .. ").")

    p = p and (type(p) == "number") and game.players[p] or p
    if not (p and p.valid and p.is_player()) then
      error(serpent.line(p) .. " is not a valid player!")
    end

    local dummy = game.surfaces[common.dummy_surface].create_entity{
      --~ name = "character",
      name = common.dummy_character_name,
      position = {0, 0}
    }
    common.dprint("Created dummy character for player " .. p.name .. ".")

    -- Add a generous amount of trash slots
    dummy.character_trash_slot_count_bonus = common.character_trash_slot_count_bonus

    -- Check if we have an old dummy that we need to migrate
    local p_data = global.player_data[p.index]
    if p_data and p_data.dummy and (p_data.dummy.name ~= common.dummy_character_name) then
      --~ common.copy_character(global.player_data[p].dummy, dummy)
      common.copy_character(p_data.dummy, dummy)
   end

    common.dprint("End of function " .. f_name .. "(" .. serpent.line(p) .. ").")
    return dummy
  end


  ------------------------------------------------------------------------------------
  --                               Transfer inventory!                              --
  ------------------------------------------------------------------------------------
  common.transfer_inventory = function(src, dst)
    local f_name = "transfer_inventory"
    common.dprint("Entered function " .. f_name .. "(" .. tostring(src) .. ", " .. tostring(dst) .. ")")

    for _, i in pairs({ src, dst }) do
      if not (i and i.valid) then
        error(serpent.line(i) .. " is not a valid inventory!")
      end
    end
common.dprint("SRC: " .. serpent.block(src))
    common.dprint("SRC slots: " .. #src)
    common.dprint("DST slots: " .. #dst)

    local limit = (#src > #dst) and #dst or #src

    -- Transfer inventory contents if inventory isn't empty
    if src.is_empty() then
      -- Shouldn't be really necessary, but just let's play it safe!
      dst.clear()
    else
      for i = 1, limit do
        local test_d = dst[i].valid_for_read
        local test_s = src[i].valid_for_read
        common.dprint("src[" .. i .. "]: " .. serpent.line(test_s and src[i].name) .. " (" .. serpent.line(test_s and src[i].count) .. ")\tdst[" .. i .. "]:" .. serpent.line(test_d and dst[i].name) .. " (" .. serpent.line(test_d and dst[i].count) .. ")")
        --~ dst[i].transfer_stack(src[i])         -- Doesn't work, it moves items.
        dst[i].set_stack(src[i])                  -- Much better, this copies them!

        test_d = dst[i].valid_for_read
        common.dprint("dst[" .. i .. "]: " .. serpent.line(test_d and dst[i].name) .. " (" .. serpent.line(test_d and dst[i].count) .. ")")
      end
      common.dprint("Transferred " .. limit .. tostring(limit == 1 and " stack." or " stacks."))
    end

    -- Copy filters if at least one slot is filtered
    if src.is_filtered() then
      for i = 1, limit do
        dst.set_filter(i, src.get_filter(i))
      end
      common.dprint("Set filters")
    end

    common.dprint("End of function " .. f_name .. "(" .. tostring(src) .. ", " .. tostring(dst) .. ")")
  end


  --~ log("End of common.lua!")
  return common

end
