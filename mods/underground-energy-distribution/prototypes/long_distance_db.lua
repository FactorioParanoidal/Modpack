local long_distance_db = table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])
local integration_patch_render_layer = "decorative"

long_distance_db.name	= "ued-long-distance-db"
long_distance_db.icon	= "__underground-energy-distribution__/graphics/bg-icon.png"

-- long_distance_db.icon_size					= 2
long_distance_db.drawing_box 				= {{-1,-1},{1,1}}
long_distance_db.selection_box				= {{-1,-1},{1,1}}
long_distance_db.map_generator_bounding_box = {{-1,-1},{1,1}}
long_distance_db.tile_height				= 2
long_distance_db.tile_width					= 2

long_distance_db.minable 						= {mining_time = 0.5, result = "ued-long-distance-db"}
long_distance_db.draw_copper_wires				= false
long_distance_db.check_collision_with_entities 	= true
long_distance_db.supply_area_distance 			= 2
long_distance_db.maximum_wire_distance 			= 30
long_distance_db.draw_circuit_wires				= settings.startup["ued-settings-show-circuit"].value

-- long_distance_db.icon_mipmaps		= 1
long_distance_db.integration_patch	= {
	layers = {{
		filename 		= "__underground-energy-distribution__/graphics/bg-pole.png",
		priority 		= "low",
		width 			= 256,
		height 			= 256,
		scale 			= 0.23,
	},{
		filename 		= "__underground-energy-distribution__/graphics/pole-shadow.png",
		priority 		= "low",
		width 			= 256,
		height 			= 256,
		scale 			= 0.23,
		draw_as_shadow 	= true,
	}}
}
long_distance_db.pictures = {
	layers = {{
		filename 		= "__underground-energy-distribution__/graphics/empty.png",
		priority 		= "low",
		width  			= 256,
		height 			= 256,
		scale  			= 0.23,
		direction_count = 1,
	}}
}

long_distance_db.connection_points = {{
	shadow = {
		copper 	= util.by_pixel_hr(0, 0),
		red 	= util.by_pixel_hr(0, 0),
		green 	= util.by_pixel_hr(0, 0)
	},
	wire = {
		copper 	= util.by_pixel_hr(0, 0),
		red 	= util.by_pixel_hr(0, 0),
		green 	= util.by_pixel_hr(0, 0)
	}
}}

long_distance_db.collision_mask 				= {"doodad-layer"}
--long_distance_db.collision_mask 				= {"water-tile","colliding-with-tiles-only"}
--long_distance_db.collision_box 				= {{0,0},{0,0}}
long_distance_db.integration_patch_render_layer = integration_patch_render_layer
--long_distance_db.fast_replaceable_group 		= "big-electric-pole"
long_distance_db.next_upgrade 					= nil

data:extend({{
		type			= "item",
		name			= "ued-long-distance-db",
		icon			= "__underground-energy-distribution__/graphics/bg-icon.png",
		icon_size		= 64,
		subgroup		= "energy-pipe-distribution",
		order			= "a[energy]-c[big-electric-pole]-b[ued-long-distance-db]",
		place_result	= "ued-long-distance-db",
		stack_size		= 50
	},{
		type			= "recipe",
		name			= "ued-long-distance-db",
		enabled			= false,
		ingredients		= {
			{"big-electric-pole", 1},
			{"electronic-circuit", 5},
			{"copper-plate", 15},
			{"steel-plate", 5}
		},
		result			= "ued-long-distance-db"
	},
	long_distance_db
})