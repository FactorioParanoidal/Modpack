local small_db = table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])
local integration_patch_render_layer = "decorative"

small_db.name	= "ued-small-db"
small_db.icon	= "__underground-energy-distribution__/graphics/md-icon.png"

-- small_db.icon_size					= 1
small_db.drawing_box 				= {{-0.5,-0.5},{0.5,0.5}}
small_db.selection_box				= {{-0.5,-0.5},{0.5,0.5}}
small_db.map_generator_bounding_box	= {{-0.5,-0.5},{0.5,0.5}}
small_db.tile_height				= 1
small_db.tile_width					= 1

small_db.minable 						= {mining_time = 0.5,result = "ued-small-db"}
small_db.draw_copper_wires				= false
small_db.check_collision_with_entities 	= true
small_db.supply_area_distance 			= 3.5
small_db.maximum_wire_distance 			= 9
small_db.draw_circuit_wires				= settings.startup["ued-settings-show-circuit"].value

-- small_db.icon_mipmaps		= 1
small_db.integration_patch	= {
	layers = {{
		filename 		= "__underground-energy-distribution__/graphics/md-pole.png",
		priority 		= "low",
		width 			= 256,
		height 			= 256,
		scale 			= 0.122,
	},{
		filename 		= "__underground-energy-distribution__/graphics/pole-shadow.png",
		priority 		= "low",
		width 			= 256,
		height 			= 256,
		scale 			= 0.122,
		draw_as_shadow 	= true,
	}}
}
small_db.pictures = {
	layers = {{
		filename 		= "__underground-energy-distribution__/graphics/empty.png",
		priority 		= "low",
		width 			= 256,
		height 			= 256,
		scale 			= 0.122,
		direction_count = 1,
	}}
}

small_db.connection_points = {{
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

small_db.collision_mask					= {"doodad-layer"}
--small_db.collision_mask				= {"water-tile","colliding-with-tiles-only"}
--small_db.collision_box				= {{0,0},{0,0}}
small_db.integration_patch_render_layer = integration_patch_render_layer
--small_db.fast_replaceable_group 		= "medium-electric-pole"
small_db.next_upgrade = nil

data:extend({{
		type			= "item",
		name			= "ued-small-db",
		icon			= "__underground-energy-distribution__/graphics/md-icon.png",
		icon_size		= 64,
		subgroup		= "energy-pipe-distribution",
		order			= "a[energy]-b[medium-electric-pole]-b[ued-small-db]",
		place_result	= "ued-small-db",
		stack_size		= 50
	},{
		type			= "recipe",
		name			= "ued-small-db",
		enabled			= false,
		ingredients		= {
			{"medium-electric-pole", 1},
			{"electronic-circuit", 2},
			{"copper-plate", 10},
			{"steel-plate", 5}
		},
		result			= "ued-small-db"
	},
	small_db
})