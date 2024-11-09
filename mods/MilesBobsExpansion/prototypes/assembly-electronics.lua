require "util"

local new_assembler=table.deepcopy(data.raw["assembling-machine"]["electronics-machine-3"])
		new_assembler.name="electronics-machine-4"
		data:extend{new_assembler}
local new_assembler=table.deepcopy(data.raw["assembling-machine"]["electronics-machine-3"])
		new_assembler.name="electronics-machine-5"
		data:extend{new_assembler}

data:extend(
{
  {
    type = "item",
    name = "electronics-machine-4",
    icon = "__MilesBobsExpansion__/graphics/icons/electronics-machine-4.png",
    icon_size = 64,
    subgroup = "bob-assembly-machine",
    order = "d[electronics-machine-4]",
    place_result = "electronics-machine-4",
    stack_size = 50
  },

  {
    type = "assembling-machine",
    name = "electronics-machine-4",
    icon = "__MilesBobsExpansion__/graphics/icons/electronics-machine-4.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electronics-machine-4"},
    max_health = 600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0.5, -1.5} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    fast_replaceable_group = "assembling-machine",
	next_upgrade = "electronics-machine-5",
	animation =
    {
      layers =
      {
        {
          filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-2.png",
          priority = "high",
          width = 108,
          height = 110,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4 *2/3),
          scale = 2/3,
          hr_version =
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/hr-assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4 *2/3),
            scale = 1/3
          }
        },
        {
          filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-mask.png",
          priority = "high",
          width = 142,
          height = 113,
          repeat_count = 32,
          shift = {0.84 *2/3, -0.09 *2/3},
          scale = 2/3,
          tint = {r = 0.7, g = 0.2, b = 0.1},
        },
        {
          filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-2-shadow.png",
          priority = "high",
          width = 98,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12 *2/3, 5 *2/3),
          scale = 2/3,
          hr_version =
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/hr-assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12 *2/3, 4.75 *2/3),
            scale = 1/3
          }
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"electronics", "electronics-machine"},
    crafting_speed = 6,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.0005
    },
    energy_usage = "1000kW",
    ingredient_count = 16,
    module_specification =
    {
      module_slots = 7,
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },


  {
    type = "recipe",
    name = "electronics-machine-4",
    enabled = false,
    ingredients =
    {
      {"electronics-machine-3", 4},
      {"nitinol-gear-wheel", 100},
	  {"speed-module-4", 5},
    },
    result = "electronics-machine-4"
  },

  {
    type = "technology",
    name = "electronics-machine-4",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electronics-machine-4"
      }
    },
    prerequisites =
    {
      "electronics-machine-3",
      "processing-unit"
    },
    unit =
    {
      count = 250,
      time = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1}
      },
    },
    upgrade = true,
  },
    {
    type = "recipe",
    name = "electronics-machine-5",
    enabled = false,
    ingredients =
    {
      {"electronics-machine-4", 4},
      {"gilded-copper-cable", 500},
	  {"speed-module-6", 5},
    },
    result = "electronics-machine-5"
  },

  {
    type = "technology",
    name = "electronics-machine-5",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electronics-machine-5"
      }
    },
    prerequisites =
    {
      "electronics-machine-4",
      "processing-unit"
    },
    unit =
    {
      count = 500,
      time = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 2},
        {"production-science-pack", 1},
        {"space-science-pack", 1}
      },
    },
    upgrade = true,
  },
}
)
--                             == electronics-machine-5 ==
data:extend(
{
  {
    type = "item",
    name = "electronics-machine-5",
    icon = "__MilesBobsExpansion__/graphics/icons/electronics-machine-5.png",
    icon_size = 64,
    subgroup = "bob-assembly-machine",
    order = "d[electronics-machine-5]",
    place_result = "electronics-machine-5",
    stack_size = 50
  },

  {
    type = "assembling-machine",
    name = "electronics-machine-5",
    icon = "__MilesBobsExpansion__/graphics/icons/electronics-machine-5.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "electronics-machine-5"},
    max_health = 600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0.5, -1.5} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    fast_replaceable_group = "assembling-machine",
	next_upgrade = "electronics-machine-5",
	animation =
    {
      layers =
      {
        {
          filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-2.png",
          priority = "high",
          width = 108,
          height = 110,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4 *2/3),
          scale = 2/3,
          hr_version =
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/hr-assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4 *2/3),
            scale = 1/3
          }
        },
        {
          filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-mask.png",
          priority = "high",
          width = 142,
          height = 113,
          repeat_count = 32,
          shift = {0.84 *2/3, -0.09 *2/3},
          scale = 2/3,
          tint = {r = 0.7, g = 0.2, b = 0.1},
        },
        {
          filename = "__bobassembly__/graphics/entity/assembling-machine/assembling-machine-2-shadow.png",
          priority = "high",
          width = 98,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12 *2/3, 5 *2/3),
          scale = 2/3,
          hr_version =
          {
            filename = "__bobassembly__/graphics/entity/assembling-machine/hr-assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12 *2/3, 4.75 *2/3),
            scale = 1/3
          }
        }
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"electronics", "electronics-machine"},
    crafting_speed = 8,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.0003
    },
    energy_usage = "1500kW",
    ingredient_count = 20,
    module_specification =
    {
      module_slots = 8,
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },


  {
    type = "recipe",
    name = "electronics-machine-5",
    enabled = false,
    ingredients =
    {
      {"electronics-machine-4", 4},
      {"nitinol-gear-wheel", 100},
	  {"speed-module-6", 5},
    },
    result = "electronics-machine-4"
  },

  {
    type = "technology",
    name = "electronics-machine-5",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electronics-machine-5"
      }
    },
    prerequisites =
    {
      "electronics-machine-4",
      "processing-unit"
    },
    unit =
    {
      count = 250,
      time = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1}
      },
    },
    upgrade = true,
  },
    {
    type = "recipe",
    name = "electronics-machine-5",
    enabled = false,
    ingredients =
    {
      {"electronics-machine-4", 4},
      {"gilded-copper-cable", 500},
	  {"speed-module-6", 5},
    },
    result = "electronics-machine-5"
  },

  {
    type = "technology",
    name = "electronics-machine-5",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electronics-machine-5"
      }
    },
    prerequisites =
    {
      "electronics-machine-4",
      "processing-unit"
    },
    unit =
    {
      count = 500,
      time = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 2},
        {"production-science-pack", 1},
        {"space-science-pack", 1}
      },
    },
    upgrade = true,
  },
}
)
data.raw["assembling-machine"]["electronics-machine-4"].animation.layers[2].tint={r = 1, g = 0.5, b = 0.2}
data.raw["assembling-machine"]["electronics-machine-5"].animation.layers[2].tint={r = 1, g = 1, b = 1}
--[[
		local new_assembler=table.deepcopy(data.raw["assembling-machine"]["electronics-machine-4"])
		new_assembler.name="electronics-machine-5"
		new_assembler.icon="__MilesBobsExpansion__/graphics/icons/electronics-machine-5.png"
		new_assembler.crafting_speed="8.0"
		new_assembler.order="d[electronics-machine-5]"
		new_assembler.animation.layers[2].tint={r = 1.0, g = 1.0, b = 1.0}
		new_assembler.energy_usage="1500kW"
		new_assembler.energy_source={type = "electric", usage_priority = "secondary-input", emissions = 0.0003}
		new_assembler.minable={hardness = 0.2, mining_time = 0.5, result = "electronics-machine-5"}
		new_assembler.module_specification.module_slots="8"
		data:extend{new_assembler}
		
		local new_assembleritem=table.deepcopy(data.raw["item"]["electronics-machine-4"])
        new_assembleritem.name="electronics-machine-5"
		new_assembleritem.place_result="electronics-machine-5"		
		new_assembleritem.icon="__MilesBobsExpansion__/graphics/icons/electronics-machine-5.png"
		data:extend{new_assembleritem}
]]--