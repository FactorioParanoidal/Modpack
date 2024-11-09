data:extend({
------------------------------------------------------------------------------------------------------------------------
	{
    type = "generator",
    name = "texugo-wind-turbine",
    icon = "__Texugo_windgenerator__/graphics/windw_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 4, result = "texugo-wind-turbine"},
    max_health = 100,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 0.3,
    fluid_usage_per_tick = 0.5,
    maximum_temperature = 100,
    resistances =
    {
      { type = "fire", percent = 20 },
	  {	type = "physical", percent = 20 },
      { type = "impact", percent = 30 }
    },
    fast_replaceable_group = "texugo-wind-turbine",
	collision_mask = { "item-layer", "object-layer", "water-tile"},
    collision_box = {{-2.1, -2.1}, {2.1, 2.1}},
	selection_box = {{-1, -1}, {1, 1}},
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      --pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        --{ type = "input-output", position = {0, 3} },
        --{ type = "input-output", position = {0, -3} },
      },
      production_type = "input-output",
      filter = "steam",
      minimum_temperature = 0.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
		horizontal_animation = {
			stripes =
				{
					{
						filename = "__Texugo_windgenerator__/graphics/wind1.png",
						width_in_frames = 4,
						height_in_frames = 5,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/wind2.png",
						width_in_frames = 4,
						height_in_frames = 5,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/wind3.png",
						width_in_frames = 4,
						height_in_frames = 5,
					},
				},
			width = 500,
			height = 350,
			scale = 0.7,
			frame_count = 44, --44
			--line_length = 6,
			shift = {2.2, -1.45}
		},
		vertical_animation ={
			stripes =
				{
					{
						filename = "__Texugo_windgenerator__/graphics/wind1.png",
						width_in_frames = 4,
						height_in_frames = 5,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/wind2.png",
						width_in_frames = 4,
						height_in_frames = 5,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/wind3.png",
						width_in_frames = 4,
						height_in_frames = 5,
					},
				},
			width = 500,
			height = 350,
			scale = 0.7,
			frame_count = 44, --44
			--line_length = 6,
			shift = {2.2, -1.45}
		},
        working_sound = {
            sound = {
                filename = "__base__/sound/train-wheels.ogg",
                volume = 0.6
            },
            match_speed_to_activity = true,
        },
        min_perceived_performance = 1.0,
        performance_to_sound_speedup = 0.2
    },
	
	------------------------------------------------------------pole1
	
	  {
    type = "electric-pole",
    name = "twt-electric-pole",
    icon = "__base__/graphics/icons/copper-cable.png",
	icon_size = 32,
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    max_health = 100,
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-1, -1}, {1, 1}},
	--collision_mask = {},
    maximum_wire_distance = 6,
    supply_area_distance = 1,
    pictures =
    {
      filename = "__Texugo_windgenerator__/graphics/nothing.png",
      priority = "low",
      width = 1,
      height = 1,
	  frame_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
	  shift = {0.75, 0},
    },
    connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {
 
        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      }

	},
    radius_visualisation_picture =
    {
      filename = "__Texugo_windgenerator__/graphics/nothing.png",
      width = 1,
      height = 1,
      priority = "low"
    },
  },
	
	
	
	
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	{
    type = "generator",
    name = "texugo-wind-turbine2",
    icon = "__Texugo_windgenerator__/graphics/winds_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 10, result = "texugo-wind-turbine2"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 3.2,
    fluid_usage_per_tick = 0.5,
    maximum_temperature = 100,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
	  {
		type = "physical",
		percent = 50
	  },
      {
        type = "impact",
        percent = 50
      }
    },
    fast_replaceable_group = "texugo-wind-turbine2",
	collision_mask = { "item-layer", "object-layer", "water-tile"},
    collision_box = {{-4, -4}, {4, 4}},
	selection_box = {{-2, -2}, {2, 2}},
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      --pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        --{ type = "input-output", position = {0, 3} },
        --{ type = "input-output", position = {0, -3} },
      },
      production_type = "input-output",
      filter = "steam",
      minimum_temperature = 0.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
		horizontal_animation = {
			stripes =
				{
					{
						filename = "__Texugo_windgenerator__/graphics/winds1.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/winds2.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/winds3.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/winds4.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
				},
			width = 650,
			height = 500,
			scale = 0.7,
			animation_speed = 2,
			frame_count = 44, --44
			--line_length = 6,
			shift = {3.2, -2.2}
			
		},
		vertical_animation = {
			stripes =
				{
					{
						filename = "__Texugo_windgenerator__/graphics/winds1.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/winds2.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/winds3.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/winds4.png",
						width_in_frames = 3,
						height_in_frames = 4,
					},
				},
			width = 650,
			height = 500,
			scale = 0.7,
			animation_speed = 2,
			frame_count = 44, --44
			--line_length = 6,
			shift = {3.2, -2.2}
		},
        working_sound = {
            sound = {
                filename = "__base__/sound/train-wheels.ogg",
                volume = 0.6
            },
            match_speed_to_activity = true,
        },
        min_perceived_performance = 1.0,
        performance_to_sound_speedup = 0.2
    },
		------------------------------------------------------------pole2
	
	  {
    type = "electric-pole",
    name = "twt-electric-pole2",
    icon = "__base__/graphics/icons/copper-cable.png",
	icon_size = 32,
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    max_health = 500,
    resistances =
	{
      {
        type = "fire",
        percent = 70
      },
	  {
		type = "physical",
		percent = 50
	  },
      {
        type = "impact",
        percent = 50
      }
    },
    collision_box = {{-2, -2}, {2, 2}},
	--collision_mask = {},
    maximum_wire_distance = 11,
    supply_area_distance = 1,
    pictures =
    {
      filename = "__Texugo_windgenerator__/graphics/nothing.png",
      priority = "low",
      width = 1,
      height = 1,
	  frame_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
	  shift = {0.75, 0},
    },
    connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {
 
        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      }

	},
    radius_visualisation_picture =
    {
      filename = "__Texugo_windgenerator__/graphics/nothing.png",
      width = 1,
      height = 1,
      priority = "low"
    },
  },
	
	
	
	
	-----------------------------------------------------------------------------------------------------------------------------
	
	
	
	{
    type = "generator",
    name = "texugo-wind-turbine3",
    icon = "__Texugo_windgenerator__/graphics/windh_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 30, result = "texugo-wind-turbine3"},
    max_health = 1500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 30.5,
    fluid_usage_per_tick = 0.5,
    maximum_temperature = 100,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
	  {
		type = "physical",
		percent = 50
	  },
      {
        type = "impact",
        percent = 50
      }
    },
    fast_replaceable_group = "texugo-wind-turbine3",
	collision_mask = { "item-layer", "object-layer", "water-tile"},
    collision_box = {{-7, -7}, {7, 7}},
	selection_box = {{-3, -3}, {3, 3}},
    fluid_box =
    {
      base_area = 1,
      height = 2,
      base_level = -1,
      --pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        --{ type = "input-output", position = {0, 3} },
        --{ type = "input-output", position = {0, -3} },
      },
      production_type = "input-output",
      filter = "steam",
      minimum_temperature = 0.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
		horizontal_animation = {
			stripes =
				{
					{
						filename = "__Texugo_windgenerator__/graphics/windh1.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh2.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh3.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh4.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh5.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh6.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh7.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh8.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
				},
			width = 800,
			height = 550,
			scale = 1.1,
			--animation_speed = 2,
			frame_count = 44, --44
			--line_length = 6,
			shift = {4.8, -4.25}
		},
		vertical_animation = {
			stripes =
				{
					{
						filename = "__Texugo_windgenerator__/graphics/windh1.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh2.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh3.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh4.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh5.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh6.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh7.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
					{
						filename = "__Texugo_windgenerator__/graphics/windh8.png",
						width_in_frames = 2,
						height_in_frames = 3,
					},
				},
			width = 800,
			height = 550,
			scale = 1.1,
			--animation_speed = 2,
			frame_count = 44, --44
			--line_length = 6,
			shift = {4.8, -4.25}
		},
        working_sound = {
            sound = {
                filename = "__base__/sound/train-wheels.ogg",
                volume = 0.6
            },
            match_speed_to_activity = true,
        },
        min_perceived_performance = 1.0,
        performance_to_sound_speedup = 0.2
    },
------------------------------------------------------------pole3
	
	  {
    type = "electric-pole",
    name = "twt-electric-pole3",
    icon = "__base__/graphics/icons/copper-cable.png",
	icon_size = 32,
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    max_health = 1,
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-2, -2}, {2, 2}},
	--collision_mask = {},
    maximum_wire_distance = 18,
    supply_area_distance = 1,
    pictures =
    {
      filename = "__Texugo_windgenerator__/graphics/nothing.png",
      priority = "low",
      width = 1,
      height = 1,
	  frame_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
	  shift = {0.75, 0},
    },
    connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {
 
        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      }

	},
    radius_visualisation_picture =
    {
      filename = "__Texugo_windgenerator__/graphics/nothing.png",
      width = 1,
      height = 1,
      priority = "low"
    },
  },
	
	
	
	------------------------------------------------------------------------------------------------------------------------
	--item
    {
		type = "item",
		name = "texugo-wind-turbine",
		icon = "__Texugo_windgenerator__/graphics/windw_icon.png",
		icon_size= 64,
		--flags = {"goes-to-quickbar"},
        group = "logistics",
		subgroup = "energy",
		order = "b[steam-power]-c[texugo-wind-turbine]",
		place_result = "texugo-wind-turbine",
		stack_size = 20
	},
	{
		type = "item",
		name = "texugo-wind-turbine2",
		icon = "__Texugo_windgenerator__/graphics/winds_icon.png",
		icon_size= 64,
		--flags = {"goes-to-quickbar"},
        group = "logistics",
		subgroup = "energy",
		order = "b[steam-power]-c[texugo-wind-turbine]",
		place_result = "texugo-wind-turbine2",
		stack_size = 5
	},
	{
		type = "item",
		name = "texugo-wind-turbine3",
		icon = "__Texugo_windgenerator__/graphics/windh_icon.png",
		icon_size= 64,
		--flags = {"goes-to-quickbar"},
        group = "logistics",
		subgroup = "energy",
		order = "b[steam-power]-c[texugo-wind-turbine]",
		place_result = "texugo-wind-turbine3",
		stack_size = 1
	},
	
	------poles
	-- {
		-- type = "item",
		-- name = "twt-electric-pole",
		-- icon = "__Texugo_windgenerator__/graphics/windh_icon.png",
		-- icon_size= 32,
		-- flags = {"goes-to-quickbar"},
        -- group = "logistics",
		-- subgroup = "energy",
		-- order = "b[steam-power]-c[texugo-wind-turbine]",
		-- place_result = "texugo-wind-turbine3",
		-- stack_size = 1
	-- },
	
	
	---------------recipe
    {
        type = "recipe",
        name = "texugo-wind-turbine",
        energy_required = 8,
        enabled = true,
        ingredients = {
            {"wood", 10},
			{"small-electric-pole", 4},
            {"copper-cable", 20},
            {"iron-stick", 20},
			{"iron-gear-wheel", 4},
        },
        result = "texugo-wind-turbine"
    },
	{
        type = "recipe",
        name = "texugo-wind-turbine2",
        energy_required = 30,
        enabled = false,
        ingredients = {
            --{"advanced-circuit", 25},
			{"big-electric-pole-2", 4},
			{"electronic-circuit", 10},
            --{"electric-engine-unit", 15},
            {"iron-gear-wheel", 50},
			--{"substation", 1},
            {"steel-plate", 150},
			{"stone-brick", 150},
        },
        result = "texugo-wind-turbine2"
    },
	{
        type = "recipe",
        name = "texugo-wind-turbine3",
        energy_required = 150,
        enabled = false,
        ingredients = {
			--{"processing-unit",25},
			{"advanced-circuit", 25},
            {"flying-robot-frame", 25},
            {"iron-gear-wheel", 100},
			{"substation", 10},
            {"steel-plate", 500},
			{"concrete", 500},
        },
        result = "texugo-wind-turbine3"
    },
	--technology
    -- {
        -- type = "technology",
        -- name = "texugo-wind-turbine",
        -- icon = "__Texugo_windgenerator__/graphics/windw_tec.png",
        -- icon_size = 128,
        -- prerequisites = {"engine"},
        -- effects = {
            -- {
                -- type = "unlock-recipe",
                -- recipe = "texugo-wind-turbine"
            -- }
        -- },
        -- unit = {
            -- count = 50,
            -- ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
            -- time = 10
        -- }
    -- },
	{
        type = "technology",
        name = "texugo-wind-turbine2",
        icon = "__Texugo_windgenerator__/graphics/winds_tec.png",
        icon_size = 128,
        prerequisites = {"advanced-material-processing","electric-pole-2"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "texugo-wind-turbine2"
            }
        },
        unit = {
            count = 200,
            ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
            time = 60
        }
    },
	{
        type = "technology",
        name = "texugo-wind-turbine3",
        icon = "__Texugo_windgenerator__/graphics/windh_tec.png",
        icon_size = 128,
        prerequisites = {"robotics", "processing-unit", "texugo-wind-turbine2"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "texugo-wind-turbine3"
            }
        },
        unit = {
            count = 500,
            ingredients = {{"automation-science-pack", 2}, {"logistic-science-pack", 2},{"chemical-science-pack", 2}},
            time = 60
        }
    }
})
