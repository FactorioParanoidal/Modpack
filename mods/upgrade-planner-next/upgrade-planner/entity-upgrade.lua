local upgrade_planner_entity_upgrade = {}

local function create_new_entity_data(player, old_entity, new_entity_prototype)
  local surface = old_entity.surface
  player.cursor_stack.set_stack {name = "blueprint", count = 1}
  player.cursor_stack.create_blueprint {
    surface = surface,
    force = old_entity.force,
    area = old_entity.bounding_box,
  }
  local old_width = old_entity.bounding_box.right_bottom.x -
                        old_entity.bounding_box.left_top.x
  local old_height = old_entity.bounding_box.right_bottom.y -
                         old_entity.bounding_box.left_top.y

  local new_width = new_entity_prototype.collision_box.right_bottom.x -
                        new_entity_prototype.collision_box.left_top.x
  local new_height = new_entity_prototype.collision_box.right_bottom.y -
                         new_entity_prototype.collision_box.left_top.y

  if old_entity.direction == 2 or old_entity.direction == 6 then
    new_width, new_height = new_height, new_width
  end

  local diff_width = old_width - new_width
  local diff_height = old_height - new_height

  local new_x = old_entity.position.x
  local new_y = old_entity.position.y

  if diff_height > 0 and ((diff_height % 2) > 0.5 and (diff_height % 2) < 1.5) then
    new_y = new_y - 1
  end

  if diff_width > 0 and ((diff_width % 2) > 0.5 and (diff_width % 2) < 1.5) then
    new_x = new_x - 1
  end

  local new_entity_data = player.cursor_stack.get_blueprint_entities()[1]
  new_entity_data.name = new_entity_prototype.name
  new_entity_data.position = {x = new_x, y = new_y}
  new_entity_data.force = old_entity.force
  new_entity_data.direction = old_entity.direction
  new_entity_data.player = player
  new_entity_data.spill = false

  player.cursor_stack.set_stack {name = "upgrade-builder", count = 1}

  return new_entity_data
end

local function get_hashmap(config)
  local items = game.item_prototypes
  local hashmap = {}
  for k, entry in pairs(config) do
    local item_from = items[entry.from]
    local item_to = items[entry.to]
    if item_to and item_from then
      hashmap[entry.from] = {item_to = entry.to}
      local entity_from = item_from.place_result
      local entity_to = item_to.place_result
      if entity_from and entity_to then
        hashmap[entity_from.name] = {
          entity_to = entity_to.name,
          item_to = entry.to,
          item_from = entry.from,
        }
      end
      if item_from.type == "rail-planner" and item_to.type == "rail-planner" then
        hashmap[item_from.straight_rail.name] =
            {
              entity_to = item_to.straight_rail.name,
              item_to = entry.to,
              item_from = entry.from,
            }
        hashmap[item_from.curved_rail.name] =
            {
              entity_to = item_to.curved_rail.name,
              item_to = entry.to,
              item_from = entry.from,
              item_amount = 4,
            }
      end
    end
  end
  return hashmap
end
upgrade_planner_entity_upgrade.get_hashmap = get_hashmap

local function get_recipe(owner)
  local recipe
  if not owner.valid then return end
  if owner.type == "beacon" then
    recipe = game.recipe_prototypes["stone-furnace"] -- Some dummy recipe to get correct limitation
  elseif owner.type == "assembling-machine" or owner.type == "furnace" then
    recipe = owner.get_recipe() or "iron-gear-wheel"
  end
  return recipe
end

local function check_module_eligibility(name, recipe)
  if not recipe then return true end
  local item = game.item_prototypes[name]
  if not item then return false end
  local effects = item.module_effects
  if not effects then return true end
  if not effects.productivity then return true end
  if not item.limitations then return true end
  for _, limitation in pairs(item.limitations) do
    if limitation == recipe.name then return true end
  end
  return false
end

local function player_upgrade_modules(player, inventory, map, owner)
  for k = 1, #inventory do
    local slot = inventory[k]
    if slot.valid and slot.valid_for_read then
      if not global.temporary_ignore[slot.name] then
        local upgrade = map[slot.name]
        local recipe = get_recipe(owner)
        if upgrade and upgrade.item_to and recipe and
            check_module_eligibility(upgrade.item_to, recipe) then
          if player.get_item_count(upgrade.item_to) >= slot.count or
              player.cheat_mode then
            player.remove_item {name = upgrade.item_to, count = slot.count}
            player.insert {name = slot.name, count = slot.count}
            slot.set_stack {name = upgrade.item_to, count = slot.count}
          else
            global.temporary_ignore[slot.name] = true
            owner.surface.create_entity {
              name = "flying-text",
              position = {owner.position.x - 1.3, owner.position.y - 0.5},
              text = {"upgrade-planner.insufficient-items"},
              color = {r = 1, g = 0.6, b = 0.6},
            }
          end
        end
      end
    end
  end
end

local function player_upgrade(player, old_entity, upgrade, upgrade_neighbours)
  if not old_entity then return end
  if old_entity.to_be_deconstructed() then return end
  if not upgrade.entity_to then
    log("Tried to upgrade when entry had no entity: " .. serpent.line(upgrade))
    return
  end
  if global.temporary_ignore[old_entity.name] then return end
  local surface = old_entity.surface
  local amount = upgrade.item_amount or 1
  if player.get_item_count(upgrade.item_to) >= amount or player.cheat_mode then
    local new_entity
    local new_entity_prototype
    if string.find(upgrade.item_to, "miniloader") then
      local prototype_to = upgrade.item_to .. '-inserter'
      new_entity_prototype = game.entity_prototypes[prototype_to]
    else
      new_entity_prototype = game.entity_prototypes[upgrade.item_to]
    end
    local new_entity_data = create_new_entity_data(player, old_entity,
                                                   new_entity_prototype)
    local insert_item = false

    -- script.raise_event(defines.events.on_pre_player_mined_item,
    --                   {player_index = player.index, entity = old_entity})
    new_entity_data.fast_replace = true
    new_entity_data.create_build_effect_smoke = false

    if old_entity.type == "inserter" then
      local drop = {
        x = old_entity.drop_position.x,
        y = old_entity.drop_position.y,
      }
      local pickup = {
        x = old_entity.pickup_position.x,
        y = old_entity.pickup_position.y,
      }
      new_entity = surface.create_entity(new_entity_data)
      if new_entity.valid and new_entity.type == "inserter" then
        new_entity.pickup_position = pickup
        new_entity.drop_position = drop
      end
    else
      if old_entity.type == "underground-belt" then
        if old_entity.neighbours and upgrade_neighbours then
          player_upgrade(player, old_entity.neighbours, upgrade, false)
        end
      end
      new_entity = surface.create_entity(new_entity_data)
    end

    new_entity_data.fast_replace = false

    if old_entity.valid then
      if old_entity.type == "legacy-straight-rail" or old_entity.type == "legacy-curved-rail" then
        old_entity.destroy()
        new_entity = surface.create_entity {
          name = upgrade.entity_to,
          position = old_entity.position,
          force = old_entity.force,
          direction = old_entity.direction,
        }
      end
    end

    if old_entity.valid then
      if new_entity and new_entity.valid then new_entity.destroy() end
      local a = old_entity.bounding_box

      -- Get current entity data and copy other values
      player.cursor_stack.set_stack {name = "blueprint", count = 1}
      player.cursor_stack.create_blueprint {
        surface = surface,
        force = old_entity.force,
        area = a,
      }
      local entity_data = player.cursor_stack.get_blueprint_entities()[1]
      entity_data.position = old_entity.position
      entity_data.force = old_entity.force
      entity_data.direction = old_entity.direction
      entity_data.player = player

      player.cursor_stack.set_stack {name = "upgrade-builder", count = 1}

      -- Stash inventories for later distribution
      local inventories = {}
      for index = 1, 10 do
        if old_entity.get_inventory(index) ~= nil then
          inventories[index] = {}
          inventories[index].name = index
          inventories[index].contents = old_entity.get_inventory(index)
                                            .get_contents()
        end
      end

      old_entity.destroy()

      -- Check if new entity can be placed, otherwise recreate the old one
      if surface.can_place_entity(new_entity_data) then
        new_entity = surface.create_entity(new_entity_data)
        insert_item = true
      else
        new_entity = surface.create_entity(entity_data)
        player.create_local_flying_text {
          text = {"upgrade-planner.upgrade-placement-blocked"},
          position = entity_data.position,
          color = {r = 1, g = 0, b = 0},
        }
      end

      -- Redistribute inventories
      for j, items in pairs(inventories) do
        for item, count in pairs(items.contents) do
          if new_entity ~= nil then
            local inv = new_entity.get_inventory(items.name)
            if inv then
              inv.insert {name = item, count = count}
            else
              local num = player.insert {name = item, count = count}
              if num < count then
                player.surface.spill_item_stack(player.position, {
                  name = item,
                  count = (count - num),
                }, true, nil, false)
              end
            end
          end
        end
      end

      local proxy = surface.find_entities_filtered {
        area = a,
        name = "item-request-proxy",
      }
      if proxy[1] ~= nil then proxy[1].destroy() end
    end

    -- Insert items not replaced with fast-replace
    if insert_item then
      local inser_cnt = player.insert {name = upgrade.item_from, count = amount}
      if inser_cnt < amount then
        player.surface.spill_item_stack(player.position, {
          name = upgrade.item_from,
          count = (amount - inser_cnt),
        }, true, nil, false)
      end
    end

    -- Raise appropriate events
    player.remove_item {name = upgrade.item_to, count = amount}
    -- script.raise_event(defines.events.on_player_mined_item, {
    --  player_index = player.index,
    --  item_stack = {name = upgrade.item_from, count = 1},
    -- })
    -- script.raise_event(defines.events.on_built_entity, {
    --  player_index = player.index,
    --  created_entity = new_entity,
    --  stack = player.cursor_stack,
    -- })
  else
    global.temporary_ignore[old_entity.name] = true
    surface.create_entity {
      name = "flying-text",
      position = {old_entity.position.x - 1.3, old_entity.position.y - 0.5},
      text = {"upgrade-planner.insufficient-items"},
      color = {r = 1, g = 0.6, b = 0.6},
    }
  end
end

upgrade_planner_entity_upgrade.upgrade_area_player =
    function(event)
      if event.item ~= "upgrade-builder" then return end
      -- If its a upgrade builder

      local player = game.players[event.player_index]
      local config = global.current_config[player.index]
      if config == nil then return end
      local hashmap = get_hashmap(config)
      global.temporary_ignore = {}
      for k, entity in pairs(event.entities) do -- Get the items that are set to be upgraded
        if entity.valid then
          local upgrade = hashmap[entity.name]
          if entity.get_module_inventory() then
            player_upgrade_modules(player, entity.get_module_inventory(),
                                   hashmap, entity)
          end
          if upgrade ~= nil and upgrade ~= "" then
            player_upgrade(player, entity, upgrade, true)
          end
        end
      end
      global.temporary_ignore = nil
    end

local function robot_upgrade_modules(inventory, map, owner)
  if not owner then return end
  if not owner.valid then return end
  local surface = owner.surface
  local modules = {}
  local proxy = false
  for k = 1, #inventory do
    local slot = inventory[k]
    if slot.valid and slot.valid_for_read then
      local upgrade = map[slot.name]
      local recipe = get_recipe(owner)
      if upgrade and upgrade.item_to and recipe and
          check_module_eligibility(upgrade.item_to, recipe) then
        local entity = surface.create_entity {
          name = "item-on-ground",
          stack = {name = slot.name, count = slot.count},
          position = owner.position,
          force = owner.force,
        }
        entity.order_deconstruction(owner.force)
        if modules[upgrade.item_to] then
          modules[upgrade.item_to] = modules[upgrade.item_to] + slot.count
        else
          modules[upgrade.item_to] = slot.count
        end
        proxy = true
        slot.clear()
      end
    end
  end
  if proxy then
    surface.create_entity {
      name = "item-request-proxy",
      force = owner.force,
      position = owner.position,
      modules = modules,
      target = owner,
    }
  end
end

upgrade_planner_entity_upgrade.upgrade_area_bot =
    function(event)
      -- this is a lot simpler... but less cool
      if event.item ~= "upgrade-builder" then return end
      local player = game.players[event.player_index]
      local config = global.current_config[player.index]
      if not config then return end
      local hashmap = get_hashmap(config)
      for k, entity in pairs(event.entities) do
        if entity.valid then
          local upgrade = hashmap[entity.name]
          if upgrade and upgrade ~= "" then
            entity.order_upgrade({
              force = entity.force,
              target = upgrade["entity_to"],
              player = player,
            })
          end
          if entity.valid and entity.get_module_inventory() then
            robot_upgrade_modules(entity.get_module_inventory(), hashmap, entity)
          end
        end
      end
    end

local function update_blueprint_entities(stack, hashmap)
  if not (stack and stack.valid and stack.valid_for_read and
      stack.is_blueprint_setup()) then return end
  local entities = stack.get_blueprint_entities()
  if entities then
    for k, entity in pairs(entities) do
      local new_entity = hashmap[entity.name]
      if new_entity and new_entity.entity_to then
        entities[k].name = new_entity.entity_to
      end
      if entity.items then
        local new_items = {}
        for item, count in pairs(entity.items) do new_items[item] = count end
        for item, count in pairs(entity.items) do
          local new = hashmap[item]
          if new and new.item_to then
            if new_items[new.item_to] then
              new_items[new.item_to] = new_items[new.item_to] + count
            else
              new_items[new.item_to] = count
            end
            new_items[item] = new_items[item] - count
          end
        end
        for item, count in pairs(new_items) do
          if count == 0 then new_items[item] = nil end
        end
        entities[k].items = new_items
      end
    end
    stack.set_blueprint_entities(entities)
  end
  local tiles = stack.get_blueprint_tiles()
  if tiles then
    local tile_prototypes = game.tile_prototypes
    local items = game.item_prototypes
    for k, tile in pairs(tiles) do
      local prototype = tile_prototypes[tile.name]
      local items_to_place = prototype.items_to_place_this
      local item = nil
      if items_to_place then
        for _, item_stack in pairs(items_to_place) do
          item = hashmap[item_stack.name]
          if item and item.item_to then break end
        end
      end
      if item then
        local tile_item = items[item.item_to]
        if tile_item then
          local result = tile_item.place_as_tile_result
          if result then
            local new_tile = tile_prototypes[result.result.name]
            if new_tile and new_tile.can_be_part_of_blueprint then
              tiles[k].name = result.result.name
            end
          end
        end
      end
    end
    stack.set_blueprint_tiles(tiles)
  end
  local icons = stack.blueprint_icons
  for k, icon in pairs(icons) do
    local new = hashmap[icon.signal.name]
    if new and new.item_to then icons[k].signal.name = new.item_to end
  end
  stack.blueprint_icons = icons
  return true
end

upgrade_planner_entity_upgrade.upgrade_blueprint =
    function(event)
      local player = game.players[event.player_index]
      local stack = player.cursor_stack
      if not (stack.valid and stack.valid_for_read) then return end

      local config = global.current_config[player.index]
      if not config then return end
      local hashmap = get_hashmap(config)

      if stack.is_blueprint then
        if update_blueprint_entities(stack, hashmap) then
          player.print({"upgrade-planner.blueprint-upgrade-successful"})
        end
        return
      end

      if stack.is_blueprint_book then
        local inventory = stack.get_inventory(defines.inventory.item_main)
        local success = 0
        for k = 1, #inventory do
          if update_blueprint_entities(inventory[k], hashmap) then
            success = success + 1
          end
        end
        player.print({
          "upgrade-planner.blueprint-book-upgrade-successful",
          success,
        })
        return
      end
    end

return upgrade_planner_entity_upgrade
