local DLL = require("prototypes.globals")
local DLLFUNC = require("prototypes.functions")
require("__core__/lualib/circuit-connector-sprites")

-- electric large lamp

local circuits = circuit_connector_definitions.create_vector(
    universal_connector_template,
    {{ variation = 26, main_offset = util.by_pixel(0, 10), shadow_offset = util.by_pixel(0, 10), show_shadow = true }}
)

local signal_colours = data.raw.lamp["small-lamp"].signal_to_color_mapping
if not signal_colours then
    signal_colours = {
        {type="virtual", name="signal-red", color={r=1,g=0,b=0}},
        {type="virtual", name="signal-green", color={r=0,g=1,b=0}},
        {type="virtual", name="signal-blue", color={r=0,g=0,b=1}},
        {type="virtual", name="signal-yellow", color={r=1,g=1,b=0}},
        {type="virtual", name="signal-pink", color={r=1,g=0,b=1}},
        {type="virtual", name="signal-cyan", color={r=0,g=1,b=1}}
    }
end

local lamp = {
    circuit_connector_sprites = circuits.sprites,
    circuit_wire_connection_point = circuits.points,
    circuit_wire_max_distance = 9,
    collision_box = { {-0.6,-0.6}, {0.6,0.6} },
    selection_box = { {-1.0,-1.0}, {1.0,1.0} },
    tile_width = 2,
    tile_height = 2,
    corpse = "small-remnants",
    darkness_for_all_lamps_off = 0.3,
    darkness_for_all_lamps_on = 0.5,
    dying_explosion = "medium-explosion",
    energy_source = {
        type = "electric",
        usage_priority = "lamp"
    },
    energy_usage_per_tick = "20KW",
    fast_replaceable_group = "large-lamp",
    flags = {"placeable-neutral","player-creation"},
    glow_color_intensity = 1,
    glow_size = 12,
    glow_render_mode = "multiplicative",
    icon = string.format("%s/large-lamp.png", DLL.icon_path),
    icon_size = 64,
    icon_mipmaps = 4,
    light = {
        color = DLL.glow_colour,
        intensity = 0.75,
        size = 60,
        type = "oriented",
        picture = { filename = string.format("%s/light.png", DLL.entity_path), width = 256, height = 256, scale = 0.125 },
    },
    light_when_colored = {
        color = DLL.glow_colour,
        intensity = 0,
        size = 12,
    },
    max_health = 150,
    minable = {
        mining_time = 0.2,
        result = DLL.name,
    },
    mined_sound = {
        filename = "__base__/sound/deconstruct-bricks.ogg"
    },
    name = DLL.name,
    picture_off = {
        layers = {
            {
                axially_symmetrical = false,
                direction_count = 1,
                filename = string.format("%s/lr-large-lamp-base.png", DLL.entity_path),
                height = 64,
                hr_version = {
                    axially_symmetrical = false,
                    direction_count = 1,
                    filename = string.format("%s/hr-large-lamp-base.png", DLL.entity_path),
                    height = 128,
                    priority = "high",
                    scale = 0.5,
                    shift = {0,0},
                    width = 128,
                },
                priority = "high",
                shift = {0,0},
                width = 64
            },
            {
                axially_symmetrical = false,
                direction_count = 1,
                draw_as_shadow = true,
                filename = string.format("%s/lr-large-lamp-shadow.png", DLL.entity_path),
                height = 64,
                hr_version = {
                    axially_symmetrical = false,
                    direction_count = 1,
                    draw_as_shadow = true,
                    filename = string.format("%s/hr-large-lamp-shadow.png", DLL.entity_path),
                    height = 128,
                    priority = "high",
                    scale = 0.5,
                    shift = {0,0},
                    width = 128
                },
                priority = "high",
                shift = {0,0},
                width = 64
            }
        }
    },
    picture_on = {
        axially_symmetrical = false,
        direction_count = 1,
        filename = string.format("%s/lr-large-lamp-light.png", DLL.entity_path),
        height = 64,
        hr_version = {
            axially_symmetrical = false,
            direction_count = 1,
            filename = string.format("%s/hr-large-lamp-light.png", DLL.entity_path),
            blend_mode = "additive-soft",
            height = 128,
            priority = "high",
            scale = 0.5,
            shift = {0,0},
            tint = DLL.tint_colour,
            width = 128,
        },
        priority = "high",
        shift = {0,0},
        tint = DLL.tint_colour,
        width = 64,
    },
    resistances = {
        {
            type = "fire",
            percent = 50
        },
    },
    signal_to_color_mapping = signal_colours,
    type = "lamp",
    vehicle_impact_sound = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.65
    },
    squeak_behaviour = false,
}

data:extend({lamp})

-- copper lamp

local lamp = {
    name = DLL.copper_name,
    type = "assembling-machine",
    minable = {
        mining_time = 0.2,
        result = DLL.copper_name,
    },
    icon = string.format("%s/copper-lamp.png", DLL.icon_path),
    icon_size = 64,
    icon_mipmaps = 4,
    fast_replaceable_group = "large-lamp",
    next_upgrade = DLL.name,
    crafting_speed = 1,
    crafting_categories = {"lamp-burning"},
    fixed_recipe = DLL.copper_name.."-burning",
    dying_explosion = "medium-explosion",
    show_recipe_icon = false,
    show_recipe_icon_on_map = false,
    source_inventory_size = 1,
    result_inventory_size = 1,
    energy_source = {
        emissions_per_minute = 0.02,
        type = "burner",
        fuel_inventory_size = 1,
        burnt_inventory_size = 1,
        fuel_category = "chemical",
        light_flicker = {
            color = {0,0,0,0}, -- to remove default burner glow
        },
        render_no_power_icon = false, -- to be consistent with previous recipe-based behaviour
    },
    energy_usage = "9.6kW", -- 4MJ = 1 coal = 1 Factorio day
    max_health = 100,
    resistances = {
        {
            type = "fire",
            percent = 95
        },
    },
    corpse = "small-remnants",
    flags = {"placeable-player", "placeable-neutral", "player-creation"},
    collision_box = { {-0.6,-0.6}, {0.6,0.6} },
    selection_box = { {-1.0,-1.0}, {1.0,1.0} },
    tile_width = 2,
    tile_height = 2,
    animation = {
        layers = {
            DLLFUNC.get_layer("copper-lamp-base", nil, nil, nil, nil, nil, 128, 128, 0, 0, 128, 128, {0,0}),
            DLLFUNC.get_layer("copper-lamp-shadow", nil, nil, "shadow", nil, nil, 128, 128, 0, 0, 128, 128, {0,0}),
        }
    },
    working_visualisations = {
        {
            animation = DLLFUNC.get_layer("copper-lamp-working", 30, 6, "glow", nil, 1, 128, 128, 0, 0, 128, 128, {0,0}, "additive-soft"),
            light = {
                color = {1.0,0.75,0.5},
                intensity = 0.75,
                size = 60,
                type = "oriented",
                picture = { filename = string.format("%s/light.png", DLL.entity_path), width = 256, height = 256, scale = 0.125 },
            },
        }
    },
    working_sound = {
        sound = {
            filename = "__base__/sound/furnace.ogg",
            volume = 1.0
        }
    },
    open_sound = {
        filename = "__base__/sound/machine-open.ogg",
        volume = 0.75
    },
    close_sound = {
        filename = "__base__/sound/machine-close.ogg",
        volume = 0.75
    },
    mined_sound = {
        filename = "__base__/sound/deconstruct-bricks.ogg"
    },
    vehicle_impact_sound = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.65
    },
    squeak_behaviour = false,
}

data:extend({lamp})

-- floor lamp

lamp = table.deepcopy(data.raw.lamp[DLL.name])

lamp.name = DLL.floor_name
lamp.minable.result = DLL.floor_name
lamp.icon = string.format("%s/floor-lamp.png", DLL.icon_path)
lamp.light.intensity = 0.4
lamp.energy_usage_per_tick = "10KW"
lamp.circuit_connector_sprites = nil
lamp.circuit_wire_connection_point = nil
lamp.circuit_wire_max_distance = nil
lamp.collision_mask = {"object-layer","water-tile"}
lamp.picture_off = {
	axially_symmetrical = false,
	direction_count = 1,
	filename = string.format("%s/blank.png", DLL.entity_path),
	height = 1,
	width = 1,
	priority = "low",
}
lamp.integration_patch_layer = "floor-mechanics-under-corpse"
lamp.integration_patch = {
	axially_symmetrical = false,
	direction_count = 1,
	filename = string.format("%s/lr-floor-lamp-base.png", DLL.entity_path),
	height = 64,
	hr_version = {
		axially_symmetrical = false,
		direction_count = 1,
		filename = string.format("%s/hr-floor-lamp-base.png", DLL.entity_path),
		height = 128,
		priority = "high",
		scale = 0.5,
		shift = {0,0},
		width = 128,
	},
	priority = "high",
	shift = {0,0},
	width = 64
}
lamp.picture_on = {
    axially_symmetrical = false,
    direction_count = 1,
    filename = string.format("%s/lr-floor-lamp-light.png", DLL.entity_path),
    height = 64,
    hr_version = {
        axially_symmetrical = false,
        direction_count = 1,
        filename = string.format("%s/hr-floor-lamp-light.png", DLL.entity_path),
        blend_mode = "additive-soft",
        height = 128,
        priority = "high",
        scale = 0.5,
        shift = {0,0},
        tint = { r = 1.0, g = 1.0, b = 0.85 },
        width = 128,
    },
    priority = "high",
    shift = {0,0},
    tint = DLL.tint_colour,
    width = 64,
}

data:extend({lamp})
