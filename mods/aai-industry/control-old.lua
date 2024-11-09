local version = 000104 -- 0.1.4

local util = require("util")
local fx_search_range = 50

local function raise_event(event_name, event_data)
    local responses = {}
    for interface_name, interface_functions in pairs(remote.interfaces) do
        if interface_functions[event_name] then
            responses[interface_name] = remote.call(interface_name, event_name, event_data)
        end
    end
    return responses
end

local function reverse_direction (direction)
  if direction == defines.direction.north then
    return defines.direction.south
  elseif direction == defines.direction.west then
    return defines.direction.east
  elseif direction == defines.direction.east then
    return defines.direction.west
  end
  return defines.direction.north
end

local function offshore_pump_setup(entity)
  local direction = entity.direction
  local position = entity.position
  local offset_distance = 0
  if direction == defines.direction.north then
    position.y = position.y + offset_distance
  elseif direction == defines.direction.south then
    position.y = position.y - offset_distance
  elseif direction == defines.direction.west then
    position.x = position.x + offset_distance
  elseif direction == defines.direction.east then
    position.x = position.x - offset_distance
  end
  position.y = position.y + 1/32
  entity.surface.create_entity{
    name="offshore-pump-output",
    position=position,
    direction=direction,
    force=entity.force
  }
end
local function burner_turbine_setup (entity)

  global.burner_turbines = global.burner_turbines or  {}
  global.burner_turbines_next_id = global.burner_turbines_next_id or 1

  local generator = entity.surface.find_entities_filtered{
    name="burner-turbine-generator",
    position=entity.position
  }[1]
  if not generator then
    generator = entity.surface.create_entity{
      name="burner-turbine-generator",
      position={entity.position.x, entity.position.y},
      direction=entity.direction,
      force=entity.force
    }
  end

  local struct = {
    struct_id = global.burner_turbines_next_id,
    burner = entity,
    generator = generator
  }
  global.burner_turbines[entity.unit_number] = struct
  global.burner_turbines_next_id = global.burner_turbines_next_id + 1

end

local function on_entity_created(event)
  if event.created_entity and event.created_entity.valid then
    local entity = event.created_entity
    if entity.name == "offshore-pump" then
      offshore_pump_setup(entity)
    elseif entity.name == "burner-turbine" then
      burner_turbine_setup(entity)
    end
  end
end

local function remove_entities(surface, names, position, area)
  -- area is range, can upgrade later to box
  for _, name in pairs(names) do
    for _, entity in pairs(surface.find_entities_filtered{
      area= {{position.x -area, position.y -area},{position.x +area, position.y +area}},
      name=name,
    }) do
      entity.destroy()
    end
  end
end


local function on_entity_removed(event)
  if event.entity and event.entity.valid then
    local entity = event.entity
    if entity.name == "offshore-pump-output" then
      remove_entities(entity.surface, {"offshore-pump"}, entity.position, 0.5)
    elseif entity.name == "offshore-pump" then
      remove_entities(entity.surface, {"offshore-pump-output"}, entity.position, 0.5)
    elseif entity.name == "burner-turbine" then
      remove_entities(entity.surface, {"burner-turbine-generator"}, entity.position, 2)
    end
  end
end

local function on_player_rotated_entity(event)
  if event.entity and event.entity.valid then
    local entity = event.entity
    if entity.name == "offshore-pump-output" then
      local pumps = entity.surface.find_entities_filtered{
        area= {{entity.position.x -0.5, entity.position.y -0.5},{entity.position.x +0.5, entity.position.y +0.5}},
        name="offshore-pump-output",
        limit = 1
      }
      if #pumps > 0 then
        local pump = pumps[1]
        entity.direction = pump.direction
      end
    elseif entity.name == "burner-turbine" then
        entity.direction = defines.direction.north
    end
  end
end

local function get_player_name(character)
  local name = character.name
  if string.len(name) == 0 then
    return {"fallback-player-name"}
  end
  return name
end

local function dump_player_inventory_to_containers(player_index)
  if game.tick > 1 then return end
  local containers = global.starting_containers or {}
  local character = game.players[player_index]
  if not character then return end
  character.print({"player-has-crash-landed", get_player_name(character)}, {r=1, g=0.85, b=0})
  local item_data = {} -- stored as [type][name] = {signal = signal, count = count}
  for _, inv_name in pairs({defines.inventory.player_quickbar, defines.inventory.player_main}) do
      if character.get_inventory(inv_name) then
        util.signal_container_add_inventory(item_data, character, inv_name)
        character.get_inventory(inv_name).clear()
      end
  end
  local surface = character.surface
  for type, type_data in pairs(item_data) do
    for name, signal in pairs(type_data) do
      local stack = {name = name, count = signal.count}
      local loop = 0
      while stack.count > 0 and loop < 100 do
        loop = loop + 1
        local container = containers[1]
        if container then
          if container.can_insert(stack) then
            local inserted = container.insert(stack)
            stack.count = stack.count - inserted
          else
            util.remove_from_table(containers, container)
          end
        else
          local try_position = util.vectors_add(character.position, util.orientation_to_vector(math.random(), 5 *  math.random()))
          local safe_position = surface.find_non_colliding_position("aai-big-ship-wreck-1", try_position, fx_search_range, 1)
          safe_position = safe_position or try_position
          local type = nil
          local r = math.random()
          if r < 0.1 then type = "aai-big-ship-wreck-2"
          elseif r < 0.5 then type = "aai-medium-ship-wreck-1"
          else type = "aai-medium-ship-wreck-2"
          end
          container = surface.create_entity{
            name= type,
            position=safe_position,
            force = character.force}
          containers[1] = container
        end
      end
    end
  end
end

local function starting_fx(task)
  local effects_duration = 2000
  if game.tick >= effects_duration then task.valid = false return end
  local surface = game.surfaces["nauvis"]
  local intensity = (effects_duration - game.tick) / effects_duration
  if math.random() < intensity * 0.3 then
    -- do an effect
    local r = math.random()
    local settings = nil
    if r < 0.005 * intensity then settings = {names = {"massive-explosion"}, count = 1, radius = 10}
    elseif r < 0.01 * intensity then settings = {names = {"big-explosion"}, count = 1, radius = 15}
    elseif r < 0.05 * intensity then settings = {names = {"medium-explosion"}, count = 1, radius = 20}
    elseif r < 0.1 then settings = {names = {"fire-flame"}, count = 1, radius = 10}
    elseif r < 0.2 then settings = {names = {"fire-flame-on-tree"}, count = 1, radius = 20}
    elseif r < 0.4 then settings = {names = {"fire-smoke"}, count = 1, radius = 10}
    elseif r < 0.7 then settings = {names = {"fire-smoke-without-glow"}, count = 1, radius = 20}
    else settings = {names = {"fire-smoke-on-adding-fuel"}, count = 1, radius = 15}

    end
    if settings then
      local min_radius = settings.min_radius or 0
      for i = 1, settings.count, 1 do
        local try_position = util.orientation_to_vector(math.random(), min_radius + (settings.radius - min_radius) * math.random())
        local safe_position = surface.find_non_colliding_position("aai-medium-ship-wreck-1", try_position, fx_search_range, 0.25)
        safe_position = safe_position or try_position
        for _, name in pairs(settings.names) do
          if name == "fire-flame" or name == "fire-flame-on-tree" then
            -- don't put fire on players, they may be lagging
            local range = 2
            if #surface.find_entities_filtered{
              area={{safe_position.x-range, safe_position.y-range},{safe_position.x+range, safe_position.y+range}},
              name="character",limit=1} == 0 then
              surface.create_entity{name=name, position=safe_position, force = game.forces["character"]}
            end
          else
            if name == "fire-smoke" or name == "fire-smoke-without-glow" or name == "fire-smoke-on-adding-fuel" then
              surface.create_trivial_smoke{name=name, position=safe_position}
            else
              surface.create_entity{name=name, position=safe_position, force = game.forces["character"]}
            end
          end
        end
      end
    end
  end

end

local function on_tick(event)
  if global.tick_tasks then
    for _, task in pairs(global.tick_tasks) do
      if task.task_name == "dump-player-inventories-to-containers" then
        for _, character in pairs(game.players) do
            dump_player_inventory_to_containers(character.index)
        end
        global.tick_tasks[_] = nil
      end
      if task.task_name == "starting-fx" then
          starting_fx(task)
          if not task.valid then
            global.tick_tasks[_] = nil
          end
      end
    end
  end

  if global.burner_turbines and game.tick % 60 == 0 then
    for _, struct in pairs(global.burner_turbines) do
      if not struct.burner.valid or not struct.generator.valid then global.burner_turbines[_] = nil return end
      -- fill the burner water slot
      struct.burner.fluidbox[1] = {name = "water", amount = struct.burner.fluidbox.get_capacity(1), temperature = 15}

      -- get the steam
      local burner_steam = struct.burner.fluidbox[2] and struct.burner.fluidbox[2].amount or 0
      local generator_steam = (struct.generator.fluidbox and struct.generator.fluidbox[1]) and struct.generator.fluidbox[1].amount or 0
      -- buffer transfer to stop stutter
      local to_transfer = math.max(0, math.min(burner_steam, struct.generator.fluidbox.get_capacity(1) - generator_steam)) / 2
	  
      if to_transfer > 1 then
        struct.burner.fluidbox[2] = {name = "steam", amount = burner_steam - to_transfer, temperature = 165}
        struct.generator.fluidbox[1] = {name = "steam", amount = generator_steam + to_transfer, temperature = 165}
      end
    end
  end
end

script.on_event(defines.events.on_built_entity, on_entity_created)
script.on_event(defines.events.on_robot_built_entity, on_entity_created)

script.on_event(defines.events.on_player_rotated_entity, on_player_rotated_entity)

script.on_event(defines.events.on_entity_died, on_entity_removed)
script.on_event(defines.events.on_pre_player_mined_item, on_entity_removed)
script.on_event(defines.events.on_robot_pre_mined, on_entity_removed)

script.on_event(defines.events.on_tick, on_tick)

local function on_configuration_changed(data)
    global.version = global.version or 0
    if data.mod_changes and data.mod_changes["aai-industry"] then
        if global.version ~= version then
            if global.version < 000101 then
                -- find and fix offshore pumps
                for _, surface in pairs(game.surfaces) do
                    for _, entity in pairs(surface.find_entities_filtered{name="offshore-pump"}) do
                      offshore_pump_setup(entity)
                    end
                end
            end
            if global.version < 000104 then
                -- Collect and existing burner generators
                for _, surface in pairs(game.surfaces) do
                    for _, entity in pairs(surface.find_entities_filtered{name="burner-turbine"}) do
                      burner_turbine_setup(entity)
                    end
                end
            end
            global.version = version
        end
    end

    -- enable any recipes that should be unlocked.
    -- mainly required for entity-update-externals as a migration file won't work
    for _, force in pairs(game.forces) do
      for _, tech in pairs(force.technologies) do
        if tech.researched then
          for _, effect in pairs(tech.effects) do
            if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
              force.recipes[effect.recipe].enabled = true
            end
          end
        end
      end
    end

end

script.on_configuration_changed(on_configuration_changed)

local function init_crash_sequence()

    local surface = game.surfaces["nauvis"]
    local range = 20
    local trees = surface.find_entities_filtered{type="tree", area={{-range, -range}, {range, range}}}
    for _, tree in pairs(trees) do
        local distance = math.sqrt(tree.position.x * tree.position.x +  tree.position.y * tree.position.y)
        if math.random() > (distance / range) * 3 - 2 then
          if math.random() < 0.1 and distance > range / 2 then
            --surface.create_entity{name="fire-flame-on-tree", position = tree.position}
          else
            tree.destroy()
          end
        end
    end

    local create_list = {
      {names = {"small-rock"}, count = 30, radius = 10},
      {names = {"small-rock"}, count = 30, radius = 20},
      {names = {"small-rock"}, count = 30, radius = 40},
      {names = {"big-remnants"}, count = 5, radius = 15},
      {names = {"medium-remnants"}, count = 10, radius = 25},
      {names = {"small-remnants"}, count = 15, radius = 50},
      {names = {"aai-big-ship-wreck-1", "massive-explosion"}, count = 1, radius = 10},
      {names = {"aai-big-ship-wreck-2", "big-explosion"}, count = 1, radius = 10},
      {names = {"aai-big-ship-wreck-3"}, count = 3, radius = 10},
      {names = {"aai-medium-ship-wreck-1", "medium-explosion"}, count = 3, radius = 25},
      {names = {"aai-medium-ship-wreck-2"}, count = 3, radius = 25},
      {names = {"aai-small-ship-wreck"}, count = 30, radius = 50},
      {names = {"fire-flame-on-tree"}, count = 25, radius = 15, min_radius = 5},
      {names = {"dead-dry-hairy-tree", "fire-flame-on-tree", "fire-flame-on-tree"}, count = 10, radius = 20, min_radius = 5}
    }
    local containers = {}
    for _, settings in pairs(create_list) do
      local min_radius = settings.min_radius or 0
      for i = 1, settings.count, 1 do
        local try_position = util.orientation_to_vector(math.random(), min_radius + (settings.radius - min_radius) * math.random())
        local safe_position = surface.find_non_colliding_position("aai-big-ship-wreck-1", try_position, fx_search_range, 1)
        safe_position = safe_position or try_position
        for _, name in pairs(settings.names) do
          if name == "small-rock" then
            surface.create_decoratives{check_collision = false, decoratives={{name=name, position = safe_position, amount = math.ceil(math.random() * 7)}}}
			
			--[[
          else		  
            local entity = surface.create_entity{name=name, position=safe_position, force = game.forces["character"]}
            if name == "aai-big-ship-wreck-1" then
                entity.insert({name = "steel-axe"})
            end
            if name == "aai-big-ship-wreck-2" then
                entity.insert({name = "stone-brick", count = 4})
            end
            if name == "aai-big-ship-wreck-3" then
                entity.insert({name = "motor", count = 1})
            end

            if entity.type == "container" then
              table.insert(containers, entity)
            end
			--]]
          end
        end
      end
    end
    global.starting_containers = containers
    global.tick_tasks[1] = {
      id = 1,
      task_name = "dump-player-inventories-to-containers"
    }
    global.tick_tasks[2] = {
      id = 2,
      valid = true,
      task_name = "starting-fx"
    }
    global.tick_tasks_next_id = 3

end

local function on_init()

  global.tick_tasks = {}
  global.tick_tasks_next_id = 1

  -- only run at the start

  if game.tick < 2 then
    -- mods can cancel or allow the sequence
    -- they can set a weight to override other mods changing this setting
    -- remote.add_interface("mymod", { allow_aai_crash_sequence = function(data) return {allow = true, weight = 1} end})
    local results = raise_event('allow_aai_crash_sequence', {})
    local max_weight = 0
    local allow = settings.startup["crash-sequence"].value == true
    for _, result in pairs(results) do
      if result.allow ~= nil and (result.weight or 0) >= max_weight then
        allow = result.allow
      end
    end
    if allow then
      init_crash_sequence()
    end
  end

end

script.on_init(on_init)
--[[
local function on_player_created(event)
    local player = event and game.players[event.player_index]
    if player and player.color.a == 0.5 then
      player.color = {r=math.random()*255, g=math.random()*255, b=math.random()*255, a = 0.6}
    end
end
]]--

script.on_event(defines.events.on_player_created, on_player_created)
