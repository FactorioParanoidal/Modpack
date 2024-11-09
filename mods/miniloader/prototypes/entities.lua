local empty_sheet = {
  filename = "__core__/graphics/empty.png",
  priority = "very-low",
  width = 1,
  height = 1,
  frame_count = 1,
}

data:extend{
  {
    name = "miniloader-target-chest",
    type = "container",
    flags = {"player-creation"},
    collision_box = {{-0.1,-0.1},{0.1,0.1}},
    collision_mask = {},
    inventory_size = 0,
    picture = empty_sheet,
  },
}

local function create_loaders(prefix, base_underground_name, tint)
  local loader_name = prefix .. "miniloader"
  local filter_loader_name = prefix .. "filter-miniloader"
  local name = loader_name .. "-loader"

  local entity = util.table.deepcopy(data.raw["underground-belt"][base_underground_name])
  entity.type = "loader-1x1"
  entity.name = name
  entity.icons = nil
  entity.flags = {"player-creation"}
  entity.localised_name = {"entity-name." .. loader_name}
  entity.minable = nil
  entity.collision_box = {{-0.3, -0.3}, {0.3, 0.3}}
  entity.collision_mask = {"transport-belt-layer"}
  entity.selection_box = {{0, 0}, {0, 0}}
  entity.filter_count = 0
  entity.fast_replaceable_group = "loader"
  entity.structure = {
    direction_in = {
      sheets = {
        -- Base
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-base.png",				
          width = 96,
          height = 96,
          y = 0,
          hr_version = {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-base.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 0
          }
        },
        -- Mask
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-mask.png",			
          width = 96,
          height = 96,
          y = 0,
          tint = tint,
          hr_version = {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-mask.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 0,
            tint = tint,
          }
        },
        -- Shadow
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-shadow.png",			
          draw_as_shadow = true,
          width = 96,
          height = 96,
          y = 0,
          hr_version = {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-shadow.png",
            draw_as_shadow = true,
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 0,
          }
        }
      }
    },
    direction_out = {
      sheets = {
        -- Base
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-base.png",			
          width = 96,
          height = 96,
          y = 96,
          hr_version = {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-base.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192
          }
        },
        -- Mask
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-mask.png",			
          width = 96,
          height = 96,
          y = 96,
          tint = tint,
          hr_version = {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-mask.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192,
            tint = tint
          }
        },
        -- Shadow
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-shadow.png",			
          width = 96,
          height = 96,
          y = 96,
          draw_as_shadow = true,
          hr_version = {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-shadow.png",
            height = 192,
            priority = "extra-high",
            scale = 0.5,
            width = 192,
            y = 192,
            draw_as_shadow = true,
          }
        }
      }
    },
    back_patch = {
      sheet = {
        filename = "__miniloader__/graphics/entity/miniloader-structure-back-patch.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        hr_version = {
          filename = "__miniloader__/graphics/entity/hr-miniloader-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    },
    front_patch = {
      sheet = {
        filename = "__miniloader__/graphics/entity/miniloader-structure-front-patch.png",
        priority = "extra-high",
        width = 96,
        height = 96,
        hr_version = {
          filename = "__miniloader__/graphics/entity/hr-miniloader-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  }
  entity.container_distance = 0
  entity.belt_length = 0.6
  entity.next_upgrade = nil

  local filter_entity = util.table.deepcopy(entity)
  filter_entity.name = filter_loader_name .. "-loader"
  filter_entity.structure.direction_in.sheets[1].filename = "__miniloader__/graphics/entity/miniloader-filter-structure-base.png"
  filter_entity.structure.direction_in.sheets[1].hr_version.filename = "__miniloader__/graphics/entity/hr-miniloader-filter-structure-base.png"
  filter_entity.structure.direction_out.sheets[1].filename = "__miniloader__/graphics/entity/miniloader-filter-structure-base.png"
  filter_entity.structure.direction_out.sheets[1].hr_version.filename = "__miniloader__/graphics/entity/hr-miniloader-filter-structure-base.png"
  filter_entity.structure.front_patch.sheet.filename = "__miniloader__/graphics/entity/miniloader-filter-structure-front-patch.png"
  filter_entity.structure.front_patch.sheet.hr_version.filename = "__miniloader__/graphics/entity/hr-miniloader-filter-structure-front-patch.png"
  filter_entity.filter_count = 5

  data:extend{
    entity,
    filter_entity,
  }
end

local connector_definitions = circuit_connector_definitions.create_vector(
  universal_connector_template,
  {
    { variation = 24, main_offset = util.by_pixel(-17, 0), shadow_offset = util.by_pixel(10, -0.5), show_shadow = false },
    { variation = 24, main_offset = util.by_pixel(-14, 0), shadow_offset = util.by_pixel(5, -5), show_shadow = false },
    { variation = 24, main_offset = util.by_pixel(-17, 0), shadow_offset = util.by_pixel(-2.5, 6), show_shadow = false },
    { variation = 31, main_offset = util.by_pixel(14, 0), shadow_offset = util.by_pixel(5, -5), show_shadow = false },
  }
)

local function create_inserters(prefix, next_prefix, base_underground_name, tint)
  local loader_name = prefix .. "miniloader"
  local name = loader_name .. "-inserter"
  local next_upgrade = next_prefix and next_prefix .. "miniloader-inserter"
  local filter_loader_name = prefix .. "filter-miniloader"
  local filter_name = filter_loader_name .. "-inserter"
  local filter_next_upgrade = next_prefix and next_prefix .. "filter-miniloader-inserter"
  local base_entity = data.raw["underground-belt"][base_underground_name]
  local rounded_items_per_second = math.floor(base_entity.speed * 480 * 100 + 0.5) / 100
  local description = {"",
    "[font=default-semibold][color=255,230,192]", {"description.belt-speed"}, ":[/color][/font] ",
    rounded_items_per_second, " ", {"description.belt-items"}, {"per-second-suffix"}}

  local loader_inserter = {
    type = "inserter",
    name = name,
    -- this name and icon appear in the power usage UI
    localised_name = {"entity-name." .. loader_name},
    localised_description = description,
    icons = {
      {
        icon = "__miniloader__/graphics/item/icon-base.png",
        icon_size = 64,
      },
      {
        icon = "__miniloader__/graphics/item/icon-mask.png",
        icon_size = 64,
        tint = tint,
      },
    },
    minable = { mining_time = 0.1, result = loader_name },
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = {"floor-layer", "object-layer", "water-tile", space_collision_layer},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_priority = 50,
    allow_custom_vectors = true,
    energy_per_movement = ".0000001J",
    energy_per_rotation = ".0000001J",
    energy_source = {
      type = "void",
    },
    extension_speed = 1,
    rotation_speed = 0.5,
    fast_replaceable_group = "miniloader-inserter",
    pickup_position = {0, 0},
    insert_position = {0, 0},
    draw_held_item = false,
    draw_inserter_arrow = false,
    platform_picture = {
      sheets = {
        -- Base
        {
          filename = "__miniloader__/graphics/entity/miniloader-inserter-base.png",
          width    = 96,
          height   = 96,
          y        = 96,
          hr_version = 
          {
            filename = "__miniloader__/graphics/entity/hr-miniloader-inserter-base.png",
            height   = 192,
            priority = "extra-high",
            scale    = 0.5,
            width    = 192,
            y        = 192
          }
        },
        -- Mask
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-mask.png",
          width    = 96,
          height   = 96,
          y        = 96,
          tint	 = tint,
          hr_version = 
          {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-mask.png",
            height   = 192,
            priority = "extra-high",
            scale    = 0.5,
            width    = 192,
            y        = 192,
            tint     = tint
          }
        },
        -- Shadow
        {
          filename = "__miniloader__/graphics/entity/miniloader-structure-shadow.png",
          width    = 96,
          height   = 96,
          y        = 96,
          draw_as_shadow = true,
          hr_version = 
          {
            filename = "__miniloader__/graphics/entity/hr-miniloader-structure-shadow.png",
            height   = 192,
            priority = "extra-high",
            scale    = 0.5,
            width    = 192,
            y        = 192,
            draw_as_shadow = true,
          }
        }
      }
    },
    hand_base_picture = empty_sheet,
    hand_open_picture = empty_sheet,
    hand_closed_picture = empty_sheet,
    circuit_wire_connection_points = connector_definitions.points,
    circuit_connector_sprites = connector_definitions.sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    next_upgrade = next_upgrade,
  }

  --Space Exploration
  if (prefix == "space-") or (prefix == "deep-space-") then
    loader_inserter.collision_mask = {"floor-layer", "item-layer", "object-layer", "water-tile"}
  end

  if settings.startup["miniloader-energy-usage"].value then
    loader_inserter.energy_per_movement = "2kJ"
    loader_inserter.energy_per_rotation = "2kJ"
    loader_inserter.energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    }
  end

  for _,k in ipairs{"flags", "max_health", "resistances", "vehicle_impact_sound"} do
    loader_inserter[k] = base_entity[k]
  end

  local filter_loader_inserter = util.table.deepcopy(loader_inserter)
  filter_loader_inserter.name = filter_name
  filter_loader_inserter.localised_name = {"entity-name." .. filter_loader_name}
  filter_loader_inserter.icons[1].icon = "__miniloader__/graphics/item/filter-icon-base.png"
  filter_loader_inserter.platform_picture.sheets[1].filename = "__miniloader__/graphics/entity/miniloader-filter-inserter-base.png"
  filter_loader_inserter.platform_picture.sheets[1].hr_version.filename = "__miniloader__/graphics/entity/hr-miniloader-filter-inserter-base.png"
  filter_loader_inserter.minable.result = filter_loader_name
  filter_loader_inserter.filter_count = 5
  filter_loader_inserter.next_upgrade = filter_next_upgrade

  if settings.startup["miniloader-enable-standard"].value then
    data:extend{loader_inserter}
  end
  if settings.startup["miniloader-enable-filter"].value then
    data:extend{filter_loader_inserter}
  end
end

return {
  create_loaders = create_loaders,
  create_inserters = create_inserters,
}