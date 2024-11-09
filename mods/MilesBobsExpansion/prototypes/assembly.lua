require "util"
data:extend( 
{
  {
    type = "item",
    name = "assembling-machine-7",
    icon = "__MilesBobsExpansion__/graphics/icons/assembling-machine-7.png",
    icon_size = 64,
    subgroup = "bob-assembly-machine",
    order = "c[assembling-machine-7]",
    place_result = "assembling-machine-7",
    stack_size = 10
  },

  {
    type = "assembling-machine",
    name = "assembling-machine-7",
    icon = "__MilesBobsExpansion__/graphics/icons/assembling-machine-7.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player","player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = "assembling-machine-7"},
    max_health = 800,
    corpse = "big-remnants",
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
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-8",
    animation =
    {
      layers =
      {
        {
		filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-7.png",
          priority = "high",
          width = 192,
          height = 256,
          frame_count = 60,
          line_length = 10,
		  animation_speed = 0.125,
          --shift = util.by_pixel(0, -0.5),
          shift = util.by_pixel(0, -15),
		  scale = 0.55
        },
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 4,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 0.2
    },
    energy_usage = "1000kW",
	ingredient_count = 20,
    module_specification =
    {
      module_slots = 7,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },

  {
    type = "recipe",
    name = "assembling-machine-7",
    enabled = false,
    ingredients =
    {
      {"assembling-machine-6", 2},
      {"brass-gear-wheel", 250},
	    {"speed-module-5", 10},
    },
    result = "assembling-machine-7"
  },

  {
    type = "technology",
    name = "automation-7",
    icon = "__MilesBobsExpansion__/graphics/technology/assembling-machine-7.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-7"
      }
    },
    prerequisites = {"automation-6"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 100
    },
    upgrade = true,
  },

  {
    type = "recipe",
    name = "assembling-machine-8",
    enabled = false,
    ingredients =
    {
      {"assembling-machine-7", 2},
      {"cobalt-steel-gear-wheel", 500},
      {"speed-module-6", 10},
    },
    result = "assembling-machine-8"
  },

  {
    type = "technology",
    name = "automation-8",
    icon = "__MilesBobsExpansion__/graphics/technology/assembling-machine-8.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-8"
      }
    },
    prerequisites = {"automation-7"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 150
	  },
	upgrade = true,
  },

  {
    type = "recipe",
    name = "assembling-machine-9",
    enabled = false,
    ingredients =
    {
      {"assembling-machine-8", 2},
  	  {"speed-module-7", 5},
    },
    result = "assembling-machine-9"
  },

  {
    type = "technology",
    name = "automation-9",
    icon = "__MilesBobsExpansion__/graphics/technology/assembling-machine-9.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-9"
      }
    },
    prerequisites = {"automation-8"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 2},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 2},
      },
      time = 200
	  },
	upgrade = true,
  },
--[[
  {
    type = "recipe",
    name = "assembling-machine-10",
    enabled = false,
    ingredients =
    {
      {"assembling-machine-9", 1},
      {"processing-unit", 30},
      {"steel-plate", 40},
      {"iron-plate", 80},
      {"iron-gear-wheel", 60},
	  {"speed-module-8", 5},
    },
    result = "assembling-machine-10"
  },

  {
    type = "technology",
    name = "automation-10",
    icon = "__base__/graphics/technology/automation.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-10"
      }
    },
    prerequisites = {"automation-9"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 250
	  },
	upgrade = true,
  },
  ]]--
 
 {
    type = "item",
    name = "assembling-machine-8",
    icon = "__MilesBobsExpansion__/graphics/icons/assembling-machine-8.png",
    icon_size = 64,
    subgroup = "bob-assembly-machine",
    order = "c[assembling-machine-8]",
    place_result = "assembling-machine-8",
    stack_size = 10
  },
 
    {
    type = "assembling-machine",
    name = "assembling-machine-8",
    icon = "__MilesBobsExpansion__/graphics/icons/assembling-machine-8.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player","player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = "assembling-machine-8"},
    max_health = 900,
    corpse = "big-remnants",
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
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    next_upgrade = "assembling-machine-9",
    animation =
    {
      layers =
      {
        {
		filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-8.png",
          priority = "high",
          width = 192,
          height = 256,
          frame_count = 60,
          line_length = 10,
		  animation_speed = 0.125,
          --shift = util.by_pixel(0, -0.5),
          shift = util.by_pixel(0, -15),
		  scale = 0.55
        },
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 4.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 0.2
    },
    energy_usage = "1500kW",
	ingredient_count = 20,
    module_specification =
    {
      module_slots = 8,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  
 
 {
    type = "item",
    name = "assembling-machine-9",
    icon = "__MilesBobsExpansion__/graphics/icons/assembling-machine-9.png",
    icon_size = 64,
    subgroup = "bob-assembly-machine",
    order = "c[assembling-machine-9]",
    place_result = "assembling-machine-9",
    stack_size = 10
  },
 
    {
    type = "assembling-machine",
    name = "assembling-machine-9",
    icon = "__MilesBobsExpansion__/graphics/icons/assembling-machine-9.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player","player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = "assembling-machine-9"},
    max_health = 1000,
    corpse = "big-remnants",
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
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    --next_upgrade = "assembling-machine-9",
    animation =
    {
      layers =
      {
        {
		filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-9.png",
          priority = "high",
          width = 192,
          height = 256,
          frame_count = 60,
          line_length = 10,
		  animation_speed = 0.125,
          --shift = util.by_pixel(0, -0.5),
          shift = util.by_pixel(0, -15),
		  scale = 0.55
        },
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 0.2
    },
    energy_usage = "2000kW",
	ingredient_count = 20,
    module_specification =
    {
      module_slots = 9,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
  
}
)
--[[
		local new_assembler=table.deepcopy(data.raw["assembling-machine"]["assembling-machine-7"])
		new_assembler.name="assembling-machine-8"
		new_assembler.icon="__MilesBobsExpansion__/graphics/icons/assembling-machine-8.png"
		new_assembler.crafting_speed="4.50"
		--new_assembler.animation.layers.filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-8.png"
		new_assembler.order="c[assembling-machine-8]"
		--new_assembler.animation.layers[2].tint ={r = 243/255, g = 136/255, b = 213/255}
		new_assembler.energy_usage="1500kW"
		new_assembler.minable={hardness = 0.2, mining_time = 0.5, result = "assembling-machine-8"}
		new_assembler.module_specification.module_slots="8"
		data:extend{new_assembler}
		
		local new_assembleritem=table.deepcopy(data.raw["item"]["assembling-machine-7"])
        new_assembleritem.name="assembling-machine-8"
		new_assembleritem.place_result="assembling-machine-8"
        new_assembler.order="c[assembling-machine-8]"		
		new_assembleritem.icon="__MilesBobsExpansion__/graphics/icons/assembling-machine-8.png"
		data:extend{new_assembleritem}


		
		local new_assembler=table.deepcopy(data.raw["assembling-machine"]["assembling-machine-7"])
		new_assembler.name="assembling-machine-9"
		new_assembler.icon="__MilesBobsExpansion__/graphics/icons/assembling-machine-9.png"
		--new_assembler.animation.layers.filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-9.png"
		new_assembler.crafting_speed="5"
		new_assembler.order="c[assembling-machine-9]"
		--new_assembler.animation.layers[2].tint={r = 0.9, g = 0.7, b = 0.0}
		new_assembler.energy_usage="2000kW"
		new_assembler.minable={hardness = 0.2, mining_time = 0.5, result = "assembling-machine-9"}
		new_assembler.module_specification.module_slots="9"
		data:extend{new_assembler}
		
		local new_assembleritem=table.deepcopy(data.raw["item"]["assembling-machine-7"])
        new_assembleritem.name="assembling-machine-9"
		new_assembleritem.place_result="assembling-machine-9"
		new_assembler.order="c[assembling-machine-9]"
		new_assembleritem.icon="__MilesBobsExpansion__/graphics/icons/assembling-machine-9.png"
		data:extend{new_assembleritem}
]]--	
		
--[[
		
		local new_assembler=table.deepcopy(data.raw["assembling-machine"]["assembling-machine-7"])
		new_assembler.name="assembling-machine-10"
		new_assembler.icon="__MilesBobsExpansion__/graphics/icons/assembling-machine-10.png"
		new_assembler.crafting_speed="5.00"
		new_assembler.order="c[x-assembling-machine-9+1]"
		--new_assembler.animation.layers[2].tint={r = 1.0, g = 1.0, b = 1.0}
		new_assembler.energy_usage="2000kW"
		new_assembler.minable={hardness = 0.2, mining_time = 0.5, result = "assembling-machine-10"}
		new_assembler.module_specification.module_slots="10"
		data:extend{new_assembler}
		
		local new_assembleritem=table.deepcopy(data.raw["item"]["assembling-machine-7"])
        new_assembleritem.name="assembling-machine-10"
		new_assembleritem.place_result="assembling-machine-10"
    	new_assembleritem.order="c[assembling-machine-9+1]"
		new_assembleritem.icon="__MilesBobsExpansion__/graphics/icons/assembling-machine-10.png"
		data:extend{new_assembleritem}


 data.raw["assembling-machine"]["assembling-machine-8"]["animation"] = {
            layers =
	{
        {
		filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-8.png",
          priority = "high",
          width = 192,
          height = 256,
          frame_count = 60,
          line_length = 10,
		  animation_speed = 0.125,
          --shift = util.by_pixel(0, -0.5),
          shift = util.by_pixel(0, -15),
		  scale = 0.55
        }
    }
}
 data.raw["assembling-machine"]["assembling-machine-9"]["animation"] = {
            layers =
	{
        {
		filename = "__MilesBobsExpansion__/graphics/assembling-machine/assembling-machine-9.png",
          priority = "high",
          width = 192,
          height = 256,
          frame_count = 60,
          line_length = 10,
		  animation_speed = 0.125,
          --shift = util.by_pixel(0, -0.5),
          shift = util.by_pixel(0, -15),
		  scale = 0.55
        }
    }
}

		]]--