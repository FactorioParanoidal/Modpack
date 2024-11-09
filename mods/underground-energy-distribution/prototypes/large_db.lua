local large_db = table.deepcopy(data.raw["electric-pole"]["substation"])
local integration_patch_render_layer = "decorative"

large_db.name	= "ued-large-db"
large_db.icon	= "__underground-energy-distribution__/graphics/sb-icon.png"

-- large_db.icon_size					= 3
large_db.drawing_box 				= {{-1.5,-1.5},{1.5,1.5}}
large_db.selection_box				= {{-1.5,-1.5},{1.5,1.5}}
large_db.map_generator_bounding_box = {{-1.5,-1.5},{1.5,1.5}}
large_db.tile_height				= 3
large_db.tile_width					= 3

large_db.minable 				        = {mining_time = 0.5, result = "ued-large-db"}
large_db.draw_copper_wires		        = false
large_db.check_collision_with_entities 	= true
large_db.supply_area_distance	        = 7.5
large_db.maximum_wire_distance	        = 18
large_db.draw_circuit_wires		        = settings.startup["ued-settings-show-circuit"].value

-- large_db.icon_mipmaps       = 1
large_db.integration_patch  = {
	layers = {{
		filename		= "__underground-energy-distribution__/graphics/sb-pole.png",
		priority		= "low",
		width			= 256,
		height			= 256,
		scale			= 0.3495,
	},{
		filename		= "__underground-energy-distribution__/graphics/pole-shadow.png",
		priority		= "low",
		width			= 256,
		height			= 256,
		scale			= 0.3495,
		draw_as_shadow 	= true,
	}}
}
large_db.pictures				= {
	layers = {{
		filename		= "__underground-energy-distribution__/graphics/empty.png",
		priority		= "low",
		width			= 256,
		height			= 256,
		scale			= 0.3495,
		direction_count = 1,
	}}
}

large_db.connection_points		= {{
	shadow = {
		copper	= util.by_pixel_hr(0, 0),
		red		= util.by_pixel_hr(0, 0),
		green	= util.by_pixel_hr(0, 0)
	},
	wire = {
		copper	= util.by_pixel_hr(0, 0),
		red		= util.by_pixel_hr(0, 0),
		green	= util.by_pixel_hr(0, 0)
	}
}}

large_db.collision_mask					= {"doodad-layer"}
--large_db.collision_mask 				= {"water-tile","colliding-with-tiles-only"}
--large_db.collision_box				= {{0,0},{0,0}}
large_db.integration_patch_render_layer = integration_patch_render_layer
--large_db.fast_replaceable_group 		= "substation-electric-pole"
large_db.next_upgrade = nil

data:extend({{
        type			= "item",
        name			= "ued-large-db",
        icon			= "__underground-energy-distribution__/graphics/sb-icon.png",
        icon_size		= 64,
        subgroup		= "energy-pipe-distribution",
        order			= "a[energy]-d[substation]-b[ued-large-db]",
        place_result	= "ued-large-db",
        stack_size		= 50
    },{
        type			= "recipe",
        name			= "ued-large-db",
        enabled			= false,
        ingredients		= {
            {"substation", 1},
            {"copper-plate", 20},
            {"steel-plate", 5}
        },
        result			= "ued-large-db"
    },
    large_db
})