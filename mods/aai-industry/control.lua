local version = 000312 -- 0.3.12

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
--[[
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
]]--

local function on_entity_created(event)
  local entity = event.created_entity or event.entity
  if entity and entity.valid then
    --[[
	if entity.name == "offshore-pump" then
      offshore_pump_setup(entity)
	]]--
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
	--[[
    if entity.name == "offshore-pump-output" then
      remove_entities(entity.surface, {"offshore-pump"}, entity.position, 0.5)
    elseif entity.name == "offshore-pump" then
      remove_entities(entity.surface, {"offshore-pump-output"}, entity.position, 0.5)
    else
	]]--
	if entity.name == "burner-turbine" then
      remove_entities(entity.surface, {"burner-turbine-generator"}, entity.position, 2)
    end
  end
end

local function on_player_rotated_entity(event)
  if event.entity and event.entity.valid then
    local entity = event.entity
	--[[
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
    else
	]]--
	if entity.name == "burner-turbine" then
        entity.direction = defines.direction.north
    end
  end
end

local function get_player_name(player)
  local name = player.name
  if string.len(name) == 0 then
    return {"fallback-player-name"}
  end
  return name
end

local function dump_player_inventory_to_containers(player_index)
  if game.tick > 1 then return end
  local containers = global.starting_containers or {}
  local player = game.players[player_index]
  if not player then return end
  player.print{"player-has-crash-landed", get_player_name(player)}
  local item_data = {} -- stored as [type][name] = {signal = signal, count = count}
  for _, inv_name in pairs({defines.inventory.character_main}) do
      if player.get_inventory(inv_name) then
        util.signal_container_add_inventory(item_data, player, inv_name)
        player.get_inventory(inv_name).clear()
      end
  end
  local surface = player.surface
  for type, type_data in pairs(item_data) do
    for name, signal in pairs(type_data) do
      local stack = {name = name, count = signal.count}
      local loop = 0
      while stack.count > 0 and loop < 100 do
        loop = loop + 1
        local container = containers[1]
        if container and container.valid then
          if container.can_insert(stack) then
            local inserted = container.insert(stack)
            stack.count = stack.count - inserted
          else
            util.remove_from_table(containers, container)
          end
        else
          local try_position = util.vectors_add(player.position, util.orientation_to_vector(math.random(), 5 *  math.random()))
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
            force = player.force}
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
              surface.create_entity{name=name, position=safe_position, force = game.forces["player"]}
            end
          else
            if name == "fire-smoke" or name == "fire-smoke-without-glow" or name == "fire-smoke-on-adding-fuel" then
              surface.create_trivial_smoke{name=name, position=safe_position}
            else
              surface.create_entity{name=name, position=safe_position, force = game.forces["player"]}
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
        for _, player in pairs(game.players) do
            dump_player_inventory_to_containers(player.index)
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
end

script.on_event(defines.events.on_built_entity, on_entity_created)
script.on_event(defines.events.on_robot_built_entity, on_entity_created)
script.on_event(defines.events.script_raised_built, on_entity_created)
script.on_event(defines.events.script_raised_revive, on_entity_created)

script.on_event(defines.events.on_player_rotated_entity, on_player_rotated_entity)

script.on_event(defines.events.on_entity_died, on_entity_removed)
script.on_event(defines.events.on_pre_player_mined_item, on_entity_removed)
script.on_event(defines.events.on_robot_pre_mined, on_entity_removed)

script.on_event(defines.events.on_tick, on_tick)

local function on_configuration_changed(data)
    global.version = global.version or 0

    if global.version < 000312 then
      for _, force in pairs(game.forces) do
        if force.technologies["toolbelt"].researched then
          force.technologies["toolbelt-2"].researched = true
        end
      end
    end


    global.version = version
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
          else
            local entity = surface.create_entity{name=name, position=safe_position, force = game.forces["player"]}
            if name == "aai-big-ship-wreck-1" then
                entity.insert({name = "burner-assembling-machine"})
            end
            if name == "aai-big-ship-wreck-2" then
                entity.insert({name = "iron-plate", count = 6})
            end
            if name == "aai-big-ship-wreck-3" then
                entity.insert({name = "motor", count = 1})
            end
            if entity.type == "container" then
              table.insert(containers, entity)
            end
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

  global.version = version

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
        max_weight = result.weight or 0
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
]]
script.on_event(defines.events.on_player_created, on_player_created)
