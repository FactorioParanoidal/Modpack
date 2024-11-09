if mods["JunkTrain3"] then
--создаем новый локомотив
data:extend({
	{
		type = "locomotive",
		name = "yir_usl",
		icon = "__zzzparanoidal__/graphics/train/t0/usl_icon.png",
        icon_size = 64,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
		minable = {mining_time = 1, result = "JunkTrain"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 1000,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
		selection_box = {{-0.7, -1.6}, {1, 1.2}},
		weight = 1000,
		max_speed = 0.25,
		max_power = "200kW",
		reversing_power_modifier = 0.5,
		braking_force = 10,
		friction_force = 0.5,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.005,
		vertical_selection_shift = -0.5,
		connection_distance = 2.2,
        joint_distance = 1.1,
		energy_per_hit_point = 5,
        tie_distance = 50,
		resistances =
		{
			{type = "physical", decrease = 30, percent = 50 },
			{type = "impact",decrease = 50,percent = 60},
		},
    burner =
    {
        fuel_category = "chemical",
        effectivity = 0.5, --1
        fuel_inventory_size = 3,
        smoke =
        {
            {
                name = "train-smoke",
                deviation = {0.3, 0.3},
                frequency = 100,
                position = {0, 0.5},
                starting_frame = 0,
                starting_frame_deviation = 60,
                height = 2,
                height_deviation = 0.5,
                starting_vertical_speed = 0.2,
                starting_vertical_speed_deviation = 0.1,
            }
        }
    },	
    pictures =
    {
        priority = "very-low",
        width = 256, height = 256, direction_count = 128, line_length = 8, lines_per_file = 8,
        filenames =
        {
            "__zzzparanoidal__/graphics/train/t0/usl_sheet-0.png",
            "__zzzparanoidal__/graphics/train/t0/usl_sheet-1.png",
        },
        scale = 1,			
        shift = {0, -0.625}
    },
    wheels = {
        priority = "very-low",
        width = 1,
        height = 1,
        direction_count = 1,
        filenames =
        {"__JunkTrain3__/graphics/nothing.png",},
        line_length = 1,
        lines_per_file = 1,
    },    
    rail_category = "regular",
    stop_trigger =
    {
        -- left side
        {
            type = "create-trivial-smoke",
            repeat_count = 75,
            smoke_name = "smoke-train-stop",
            initial_height = 0,
            -- smoke goes to the left
            speed = {-0.03, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 1.1,
            offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
        },
        -- right side
        {
            type = "create-trivial-smoke",
            repeat_count = 75,
            smoke_name = "smoke-train-stop",
            initial_height = 0,
            -- smoke goes to the right
            speed = {0.03, 0},
            speed_multiplier = 0.75,
            speed_multiplier_deviation = 1.1,
            offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
        },
-------------------------------------------------------------------------------------------------
--замена
        {
            type = "play-sound",
            sound = {filename = "__base__/sound/train-breaks.ogg", volume = 0.3} 
        },
        {
            type = "play-sound",
            sound = {
                {filename = "__base__/sound/train-brake-screech.ogg", volume = 0.3},
                {filename = "__base__/sound/train-brake-screech-1.ogg", volume = 0.3}
            }
        }
    },
working_sound =
{
    sound = {filename = "__zzzparanoidal__/graphics/train/train-engine.ogg", volume = 0.4},
    match_speed_to_activity = true, max_sounds_per_type = 2
},
open_sound = {filename = "__base__/sound/train-door-open.ogg", volume = 0.5},
close_sound = {filename = "__base__/sound/train-door-close.ogg", volume = 0.4},
vehicle_impact_sound = 
{
    {filename = "__base__/sound/car-metal-impact-2.ogg", volume = 0.5},
    {filename = "__base__/sound/car-metal-impact-3.ogg", volume = 0.5},
    {filename = "__base__/sound/car-metal-impact-4.ogg", volume = 0.5},
    {filename = "__base__/sound/car-metal-impact-5.ogg", volume = 0.5},
    {filename = "__base__/sound/car-metal-impact-6.ogg", volume = 0.5},
},
drive_over_tie_trigger = 
{
    type = "play-sound",
    sound =
    {
      {filename = "__base__/sound/train-tie-1.ogg", volume = 0.4},
      {filename = "__base__/sound/train-tie-2.ogg", volume = 0.4},
      {filename = "__base__/sound/train-tie-3.ogg", volume = 0.4},
      {filename = "__base__/sound/train-tie-4.ogg", volume = 0.4},
      {filename = "__base__/sound/train-tie-5.ogg", volume = 0.4},
      {filename = "__base__/sound/train-tie-6.ogg", volume = 0.4}
    }
}, 
front_light =
{
  {
    type = "oriented",
    minimum_darkness = 0.3,
    picture =
    {
      filename = "__core__/graphics/light-cone.png",
      priority = "extra-high",
      flags = { "light" },
      scale = 2,
      width = 200,
      height = 200
    },
    shift = {0, -14},
    size = 2,
    intensity = 0.6,
    color = {r = 1.0, g = 0.9, b = 0.9}
  },
},
-------------------------------------------------------------------------------------------------
--пропущенные
allow_manual_color = false,
sound_minimum_speed = 0.1,
sound_scaling_ratio = 0.35,
minimap_representation =
{
  filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png",
  flags = {"icon"},
  size = {20, 40},
  scale = 0.4
},
selected_minimap_representation =
{
  filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png",
  flags = {"icon"},
  size = {20, 40},
  scale = 0.4
},
drawing_box = {{-2, -2}, {2, 2}},
alert_icon_shift = {0, -1},
back_light = {
    {
      minimum_darkness = 0.3,
      color = { r = 1, g = 0.1, b = 0.05, a = 0 },
      shift = {-0.6, 1.75},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = { r = 1, g = 0.1, b = 0.05, a = 0 },
      shift = {0.6, 1.75},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    }
  },
},
--###############################################################################################
--создаем новый вагон
{
    type = "cargo-wagon",
    name = "yir_us_cargo",
    icon = "__zzzparanoidal__/graphics/train/t0/usw_icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    inventory_size = 10,
    minable = {mining_time = 1, result = "ScrapTrailer"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 400,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -1.5}, {0.6, 1.1}},
    selection_box = {{-0.7, -1.6}, {1, 1.2}},
    weight = 500,
    max_speed = 0.5,
    braking_force = 2,
    friction_force = 0.0015,
    air_resistance = 0.002,
    connection_distance = 2.2,
    joint_distance = 1.1,
    energy_per_hit_point = 5,    
    resistances =
    {
        {type = "physical", decrease = 30, percent = 50 },
        {type = "impact",decrease = 50,percent = 60},
        {type = "acid",decrease = 10,percent = 20}
    },
    vertical_selection_shift = -0.5,
    pictures =
    {
        priority = "very-low",
        width = 256, height = 256, direction_count = 64, line_length = 8, lines_per_file = 8,
        filenames = {"__zzzparanoidal__/graphics/train/t0/usw_sheet.png",},
        scale = 1,			
        back_equals_front = true,
        shift = {0, -0.625}			
    },
    horizontal_doors =
    {
        layers =
        {
            {
                filename = "__zzzparanoidal__/graphics/train/t0/usw_we.png",
                line_length = 1,
                width = 256,
                height = 256,
                frame_count = 1,
                shift = {0, -0.625},
            }
        }
    },
    vertical_doors =
    {
        layers =
        {
            {
                filename = "__zzzparanoidal__/graphics/train/t0/usw_ns.png",
                line_length = 1,
                width = 256,
                height = 256,
                frame_count = 1,
                shift = {0, -0.625},
            }
        }
    },		
    wheels = {
        priority = "very-low",
        width = 1,
        height = 1,
        direction_count = 1,
        filenames =
        {"__JunkTrain3__/graphics/nothing.png",},
        line_length = 1,
        lines_per_file = 1,
    },
    rail_category = "regular",
    tie_distance = 50,
    crash_trigger = crash_trigger(),
-------------------------------------------------------------------------------------------------
--замена
drive_over_tie_trigger = 
{
    type = "play-sound",
    sound =
    {
      {filename = "__base__/sound/train-tie-1.ogg", volume = 0.6},
      {filename = "__base__/sound/train-tie-2.ogg", volume = 0.6},
      {filename = "__base__/sound/train-tie-3.ogg", volume = 0.6},
      {filename = "__base__/sound/train-tie-4.ogg", volume = 0.6},
      {filename = "__base__/sound/train-tie-5.ogg", volume = 0.6},
      {filename = "__base__/sound/train-tie-6.ogg", volume = 0.6}
    }
}, 
working_sound =
{
    sound = {filename = "__zzzparanoidal__/graphics/train/train-wheels.ogg", volume = 0.6},
    match_speed_to_activity = true, max_sounds_per_type = 2
},
-------------------------------------------------------------------------------------------------
--пропущенные
back_light = {
    {
      minimum_darkness = 0.3,
      color = { r = 1, g = 0.1, b = 0.05, a = 0 },
      shift = {-0.6, 1.75},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    },
    {
      minimum_darkness = 0.3,
      color = { r = 1, g = 0.1, b = 0.05, a = 0 },
      shift = {0.6, 1.75},
      size = 2,
      intensity = 0.6,
      add_perspective = true
    }
  },
  minimap_representation =
  {
    filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-minimap-representation.png",
    flags = {"icon"},
    size = {20, 40},
    scale = 0.4
  },
  selected_minimap_representation =
  {
    filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-selected-minimap-representation.png",
    flags = {"icon"},
    size = {20, 40},
    scale = 0.4
  },
  open_sound = { filename = "__base__/sound/cargo-wagon-open.ogg", volume=0.55 },
  close_sound = { filename = "__base__/sound/cargo-wagon-close.ogg", volume = 0.55 },
  sound_minimum_speed = 1,
  allow_manual_color = false,
  vehicle_impact_sound = 
  {
      {filename = "__base__/sound/car-metal-impact-2.ogg", volume = 0.5},
      {filename = "__base__/sound/car-metal-impact-3.ogg", volume = 0.5},
      {filename = "__base__/sound/car-metal-impact-4.ogg", volume = 0.5},
      {filename = "__base__/sound/car-metal-impact-5.ogg", volume = 0.5},
      {filename = "__base__/sound/car-metal-impact-6.ogg", volume = 0.5},
  },
},
})
--###############################################################################################
--меняем иконки у итемов
data.raw.item.JunkTrain.icon = "__zzzparanoidal__/graphics/train/t0/usl_icon.png"
data.raw.item.JunkTrain.icon_size = 64
data.raw.item.JunkTrain.place_result = "yir_usl"
-------------------------------------------------------------------------------------------------
data.raw.item.ScrapTrailer.icon = "__zzzparanoidal__/graphics/train/t0/usw_icon.png"
data.raw.item.ScrapTrailer.icon_size = 64
data.raw.item.ScrapTrailer.place_result = "yir_us_cargo"
-------------------------------------------------------------------------------------------------
--меняем рецепт локомотива мк0
data.raw.recipe.JunkTrain.ingredients =
{			
	{type = "item", name = "motor" , amount = 5},
	{type = "item", name = "iron-gear-wheel" , amount = 10},
	{type = "item", name = "iron-stick" , amount = 6},
	{type = "item", name = "wood" , amount = 20},
}
-------------------------------------------------------------------------------------------------
--меняем рецепт вагона мк0
data.raw.recipe.ScrapTrailer.ingredients = 
{			
	{type = "item", name = "iron-chest" , amount = 1},
    {type = "item", name = "iron-plate" , amount = 10},
	{type = "item", name = "iron-stick" , amount = 4},
	{type = "item", name = "wood" , amount = 20},
}
-------------------------------------------------------------------------------------------------
--меняем рецепт примитивных рельс
data.raw.recipe["scrap-rail"].ingredients = 
{   
    {name = "stone-crushed", type = "item", amount = 10},
    {name = "iron-stick", type = "item", amount = 2},
    {name = "wood", type = "item", amount = 10},
    {name = "steel-plate", type = "item", amount = 2},
}
-------------------------------------------------------------------------------------------------
--переносим итемы и рецепты
data.raw["recipe"]["JunkTrain"].subgroup = "bob-locomotive"
data.raw["recipe"]["JunkTrain"].order = "a1"
data.raw.item["JunkTrain"].subgroup = "bob-locomotive"
data.raw.item["JunkTrain"].order = "a1"

data.raw["recipe"]["ScrapTrailer"].subgroup = "bob-cargo-wagon"
data.raw["recipe"]["ScrapTrailer"].order = "a1"
data.raw.item["ScrapTrailer"].subgroup = "bob-cargo-wagon"
data.raw.item["ScrapTrailer"].order = "a1"

data.raw["recipe"]["rail-signal-scrap"].subgroup = "transport-rail-other"
data.raw["recipe"]["rail-signal-scrap"].order = "a"
data.raw.item["rail-signal-scrap"].subgroup = "transport-rail-other"
data.raw.item["rail-signal-scrap"].order = "a"

data.raw["recipe"]["rail-chain-signal-scrap"].subgroup = "transport-rail-other"
data.raw["recipe"]["rail-chain-signal-scrap"].order = "b"
data.raw.item["rail-chain-signal-scrap"].subgroup = "transport-rail-other"
data.raw.item["rail-chain-signal-scrap"].order = "b"

data.raw["recipe"]["train-stop-scrap"].subgroup = "transport-rail-other"
data.raw["recipe"]["train-stop-scrap"].order = "c"
data.raw.item["train-stop-scrap"].subgroup = "transport-rail-other"
data.raw.item["train-stop-scrap"].order = "c"

--жд дороги
data.raw["recipe"]["scrap-rail"].subgroup = "transport-rail"
data.raw["recipe"]["scrap-rail"].order = "a"
data.raw["rail-planner"]["scrap-rail"].subgroup = "transport-rail"
data.raw["rail-planner"]["scrap-rail"].order = "a"
-------------------------------------------------------------------------------------------------
--меняем иконку техи
data.raw.technology.JunkTrain_tech.icon = "__zzzparanoidal__/graphics/train/t0/usl_icon.png"
data.raw.technology.JunkTrain_tech.icon_size = 64
-------------------------------------------------------------------------------------------------
--поправляем рельсы
data.raw["legacy-straight-rail"]["straight-scrap-rail"].max_health = 50
data.raw["legacy-straight-rail"]["straight-scrap-rail"].resistances = nil

data.raw["legacy-curved-rail"]["curved-scrap-rail"].max_health = 100
data.raw["legacy-curved-rail"]["curved-scrap-rail"].resistances = nil
-------------------------------------------------------------------------------------------------
--делаем возможность обновления рельс и светофоров штатным путем
data.raw["legacy-straight-rail"]["straight-scrap-rail"].next_upgrade = "legacy-straight-rail"
data.raw["legacy-curved-rail"]["curved-scrap-rail"].next_upgrade = "legacy-curved-rail"

data.raw["legacy-straight-rail"]["straight-scrap-rail"].fast_replaceable_group = "rail"
data.raw["legacy-curved-rail"]["curved-scrap-rail"].fast_replaceable_group = "rail"

data.raw["legacy-straight-rail"]["legacy-straight-rail"].fast_replaceable_group = "rail"
data.raw["legacy-curved-rail"]["legacy-curved-rail"].fast_replaceable_group = "rail"

data.raw["legacy-straight-rail"]["straight-scrap-rail"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
data.raw["legacy-curved-rail"]["curved-scrap-rail"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}

data.raw["legacy-straight-rail"]["legacy-straight-rail"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
data.raw["legacy-curved-rail"]["legacy-curved-rail"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}

data.raw["rail-signal"]["rail-signal-scrap"].next_upgrade = "rail-signal"
data.raw["rail-chain-signal"]["rail-chain-signal-scrap"].next_upgrade = "rail-chain-signal"
data.raw["train-stop"]["train-stop-scrap"].next_upgrade = "train-stop"

data.raw["rail-signal"]["rail-signal-scrap"].fast_replaceable_group = "rail-signal"
data.raw["rail-chain-signal"]["rail-chain-signal-scrap"].fast_replaceable_group = "rail-signal"
data.raw["train-stop"]["train-stop-scrap"].fast_replaceable_group = "rail-stop"

data.raw["rail-signal"]["rail-signal"].fast_replaceable_group = "rail-signal"
data.raw["rail-chain-signal"]["rail-chain-signal"].fast_replaceable_group = "rail-signal"
data.raw["train-stop"]["train-stop"].fast_replaceable_group = "rail-stop"

data.raw["rail-signal"]["rail-signal-scrap"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
data.raw["rail-chain-signal"]["rail-chain-signal-scrap"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
data.raw["train-stop"]["train-stop-scrap"].collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-14"}

data.raw["rail-signal"]["rail-signal"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
data.raw["rail-chain-signal"]["rail-chain-signal"].collision_mask = {"item-layer", "object-layer", "rail-layer", "floor-layer", "water-tile"}
data.raw["train-stop"]["train-stop"].collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile", "layer-14"}
-------------------------------------------------------------------------------------------------
--подкручиваем рецепт стандартных рельс
bobmods.lib.recipe.set_ingredient("rail", {"stone-crushed", 10})
-------------------------------------------------------------------------------------------------
--переставляем рецепты рельс в технологиях
--bobmods.lib.tech.remove_recipe_unlock("railway", "bi-rail-wood")
bobmods.lib.tech.add_recipe_unlock("railway", "rail")
bobmods.lib.tech.remove_recipe_unlock("bob-railway-2", "rail")
-------------------------------------------------------------------------------------------------
--добавляем рецепты обновления примитивов в технологию
bobmods.lib.tech.add_recipe_unlock("railway", "scrap-rail-to-rail")
bobmods.lib.tech.add_recipe_unlock("automated-rail-transportation", "rail-signal-scrap-to-rail-signal")
bobmods.lib.tech.add_recipe_unlock("automated-rail-transportation", "rail-chain-signal-scrap-to-rail-chain-signal")
bobmods.lib.tech.add_recipe_unlock("automated-rail-transportation", "train-stop-scrap-to-train-stop")
-------------------------------------------------------------------------------------------------
--подкрашиваем примитивы
--иконки итемов
data.raw.item["rail-signal-scrap"].icons = {{icon = "__base__/graphics/icons/rail-signal.png", icon_size = 64, icon_mipmaps = 4, tint = {r=170, g=130, b=1}}}
data.raw.item["rail-chain-signal-scrap"].icons = {{icon = "__base__/graphics/icons/rail-chain-signal.png", icon_size = 64, icon_mipmaps = 4, tint = {r=170, g=130, b=1}}}
data.raw.item["train-stop-scrap"].icons = {{icon = "__base__/graphics/icons/train-stop.png", icon_size = 64, icon_mipmaps = 4, tint = {r=170, g=130, b=1}}}
--энтити
data.raw["rail-signal"]["rail-signal-scrap"].icons = {{icon = "__base__/graphics/icons/rail-signal.png", icon_size = 64, icon_mipmaps = 4, tint = {r=170, g=130, b=1}}}
data.raw["rail-signal"]["rail-signal-scrap"].animation.tint = {r=170, g=130, b=1}
data.raw["rail-signal"]["rail-signal-scrap"].animation.hr_version.tint = {r=170, g=130, b=1}

data.raw["rail-chain-signal"]["rail-chain-signal-scrap"].icons = {{icon = "__base__/graphics/icons/rail-chain-signal.png", icon_size = 64, icon_mipmaps = 4, tint = {r=170, g=130, b=1}}}
data.raw["rail-chain-signal"]["rail-chain-signal-scrap"].animation.tint = {r=170, g=130, b=1}
data.raw["rail-chain-signal"]["rail-chain-signal-scrap"].animation.hr_version.tint = {r=170, g=130, b=1}

data.raw["train-stop"]["train-stop-scrap"].icons = {{icon = "__base__/graphics/icons/train-stop.png", icon_size = 64, icon_mipmaps = 4, tint = {r=170, g=130, b=1}}}

data.raw["train-stop"]["train-stop-scrap"].animations.north.layers[1].hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-bottom.png"
data.raw["train-stop"]["train-stop-scrap"].animations.east.layers[1].hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-bottom.png"
data.raw["train-stop"]["train-stop-scrap"].animations.south.layers[1].hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-bottom.png"
data.raw["train-stop"]["train-stop-scrap"].animations.west.layers[1].hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-bottom.png"

data.raw["train-stop"]["train-stop-scrap"].animations.north.layers[1].filename = "__zzzparanoidal__/graphics/train/train-stop-bottom.png"
data.raw["train-stop"]["train-stop-scrap"].animations.east.layers[1].filename = "__zzzparanoidal__/graphics/train/train-stop-bottom.png"
data.raw["train-stop"]["train-stop-scrap"].animations.south.layers[1].filename = "__zzzparanoidal__/graphics/train/train-stop-bottom.png"
data.raw["train-stop"]["train-stop-scrap"].animations.west.layers[1].filename = "__zzzparanoidal__/graphics/train/train-stop-bottom.png"

data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.north.hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-ground.png"
data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.east.hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-ground.png"
data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.south.hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-ground.png"
data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.west.hr_version.filename = "__zzzparanoidal__/graphics/train/hr-train-stop-ground.png"

data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.north.filename = "__zzzparanoidal__/graphics/train/train-stop-ground.png"
data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.east.filename = "__zzzparanoidal__/graphics/train/train-stop-ground.png"
data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.south.filename = "__zzzparanoidal__/graphics/train/train-stop-ground.png"
data.raw["train-stop"]["train-stop-scrap"].rail_overlay_animations.west.filename = "__zzzparanoidal__/graphics/train/train-stop-ground.png"

end