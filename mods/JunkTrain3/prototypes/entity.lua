
empty_loco_wheel =
{
	priority = "very-low",
	width = 1,
	height = 1,
	direction_count = 1,
	filenames =
	{"__JunkTrain3__/graphics/nothing.png",},
	line_length = 1,
	lines_per_file = 1,
}

scrap_rail_pictures_internal = function(elems)
  local keys = {{"straight_rail", "horizontal", 64, 128, 0, 0, true},
                {"straight_rail", "vertical", 128, 64, 0, 0, true},
                {"straight_rail", "diagonal-left-top", 96, 96, 0.5, 0.5, true},
                {"straight_rail", "diagonal-right-top", 96, 96, -0.5, 0.5, true},
                {"straight_rail", "diagonal-right-bottom", 96, 96, -0.5, -0.5, true},
                {"straight_rail", "diagonal-left-bottom", 96, 96, 0.5, -0.5, true},
                {"curved_rail", "vertical-left-top", 192, 288, 0.5, 0.5},
                {"curved_rail", "vertical-right-top", 192, 288, -0.5, 0.5},
                {"curved_rail", "vertical-right-bottom", 192, 288, -0.5, -0.5},
                {"curved_rail", "vertical-left-bottom", 192, 288, 0.5, -0.5},
                {"curved_rail" ,"horizontal-left-top", 288, 192, 0.5, 0.5},
                {"curved_rail" ,"horizontal-right-top", 288, 192, -0.5, 0.5},
                {"curved_rail" ,"horizontal-right-bottom", 288, 192, -0.5, -0.5},
                {"curved_rail" ,"horizontal-left-bottom", 288, 192, 0.5, -0.5}}
  local res = {}
  for _ , key in ipairs(keys) do
    part = {}
    dashkey = key[1]:gsub("_", "-")
    for _ , elem in ipairs(elems) do
      part[elem[1]] = { sheet = {
        filename = string.format("__JunkTrain3__/graphics/entity/%s/%s-%s-%s.png", dashkey, dashkey, key[2], elem[2]),
        priority = "extra-high",
        flags = elem.mipmap and { "icon" },
        width = key[3],
        height = key[4],
        shift = {key[5], key[6]},
        variation_count = (key[7] and elem.variations) or 1,
        hr_version = {
          filename = string.format("__JunkTrain3__/graphics/entity/%s/hr-%s-%s-%s.png", dashkey, dashkey, key[2], elem[2]),
          priority = "extra-high",
          flags = elem.mipmap and { "icon" },
          width = key[3]*2,
          height = key[4]*2,
          shift = {key[5], key[6]},
          scale = 0.5,
          variation_count = (key[7] and elem.variations) or 1,
          }
        }
      }
    end
    dashkey2 = key[2]:gsub("-", "_")
    res[key[1] .. "_" .. dashkey2] = part
  end
    res["rail_endings"] = {
   sheets =
   {
     {
       filename = "__JunkTrain3__/graphics/entity/rail-endings/rail-endings-background.png",
       priority = "high",
       width = 128,
       height = 128,
       hr_version = {
         filename = "__JunkTrain3__/graphics/entity/rail-endings/hr-rail-endings-background.png",
         priority = "high",
         width = 256,
         height = 256,
         scale = 0.5
       }
     },
     {

       filename = "__JunkTrain3__/graphics/entity/rail-endings/rail-endings-metals.png",
       priority = "high",
       flags = { "icon" },
       width = 128,
       height = 128,
       hr_version = {
         filename = "__JunkTrain3__/graphics/entity/rail-endings/hr-rail-endings-metals.png",
         priority = "high",
         flags = { "icon" },
         width = 256,
         height = 256,
         scale = 0.5
       }
     }
   }   

 }
  return res
end


scrap_rail_pictures = function()
  return scrap_rail_pictures_internal({{"metals", "metals", mipmap = true},
                                 {"backplates", "backplates", mipmap = true},
                                 {"ties", "ties", variations = 3},
                                 {"stone_path", "stone-path", variations = 3},
                                 {"stone_path_background", "stone-path-background", variations = 3}})
end


data:extend({
    --[[{
        type = "locomotive",
        name = "JunkTrain",
        icon = "__JunkTrain3__/graphics/junk-train-icon.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
        minable = {mining_time = 1, result = "JunkTrain"},
        mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
        max_health = 100,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
		connection_distance = 3,
		joint_distance = 4,
		collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
		selection_box = {lefttop={-1, -3}, rightbottom={1, 3}},
		vertical_selection_shift = -0.5,
        drawing_box = {{-1, -4}, {1, 3}},
        weight = 50000, --drd 2500
        max_speed = 0.3,
		wheels = empty_loco_wheel,
        max_power = "3000kW", --drd 300
        reversing_power_modifier = 0.8,
        braking_force = 10, --drd 20
        friction_force = 0.50,
        -- this is a percentage of current speed that will be subtracted
        air_resistance = 0.01,   --drd 0.03 0.0075
        energy_per_hit_point = 5,
        resistances =
        {
            {
                type = "fire",
                decrease = 3,
                percent = 10
            },
        },
        burner =
    {
      fuel_category = "chemical",
      effectivity = 0.5,    --drd 0.6
      fuel_inventory_size = 3, --drd 2
      smoke =
      {
        {
          name = "train-smoke",
          deviation = {0.3, 0.3},
          frequency = 150,
          position = {0, 0},
          starting_frame = 0,
          starting_frame_deviation = 20,
          height = 2,
          height_deviation = 0.5,
          starting_vertical_speed = 0.1,
          starting_vertical_speed_deviation = 0.1,
        }
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
                    priority = "medium",
                    scale = 2,
                    width = 200,
                    height = 200
                },
                shift = {-0.6, -16},
                size = 2,
                intensity = 0.6
            },
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture =
                {
                    filename = "__core__/graphics/light-cone.png",
                    priority = "medium",
                    scale = 2,
                    width = 200,
                    height = 200
                },
                shift = {0.6, -16},
                size = 2,
                intensity = 0.6
            }
        },
        back_light = rolling_stock_back_light(),
        stand_by_light = rolling_stock_stand_by_light(),
        color = {r = 0.07, g = 0.92, b = 0, a = 0.5},
        pictures =
        {
			
            layers =
            {
                
                {
                    priority = "very-low",
                    width = 256,
                    height = 256,
                    direction_count = 128,
                    filenames =
                    {
                        "__JunkTrain3__/graphics/loco1.png",
						"__JunkTrain3__/graphics/loco2.png",
                    },
                    line_length = 8,
                    lines_per_file = 8,
                    shift = {0.4, -1.125}
                }
            }
        },
        rail_category = "regular",
        stop_trigger =
        {
            -- left side
         
            -- right side
      {
        type = "create-trivial-smoke",
        repeat_count = 125,
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
        repeat_count = 125,
        smoke_name = "smoke-train-stop",
        initial_height = 0,
        -- smoke goes to the right
        speed = {0.03, 0},
        speed_multiplier = 0.75,
        speed_multiplier_deviation = 1.1,
        offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
      },
            {
                type = "play-sound",
                sound =
                {
                    {
                        filename = "__base__/sound/train-breaks.ogg",
                        volume = 0.6
                    },
                }
            },
        },
        drive_over_tie_trigger = drive_over_tie(),
        tie_distance = 50,
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/train-engine.ogg",
                volume = 0.4
            },
            match_speed_to_activity = true,
        },
        open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
        close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
        sound_minimum_speed = 0.5;
    },]]
  {
    type = "legacy-straight-rail",
    name = "straight-scrap-rail",
    icon = "__JunkTrain3__/graphics/icons/rail.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "scrap-rail"},
    max_health = 10,
    corpse = "legacy-straight-rail-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 10
      }
    },
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    rail_category = "regular",
    pictures = scrap_rail_pictures(),
  },
  {
    type = "legacy-curved-rail",
    name = "curved-scrap-rail",
    icon = "__JunkTrain3__/graphics/icons/curved-rail.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    minable = {mining_time = 0.2, result = "scrap-rail", count = 4},
    max_health = 20,
    corpse = "legacy-curved-rail-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 10
      }
    },
    collision_box = {{-0.85, -0.75}, {0.85, 1.6}},
    secondary_collision_box = {{-0.80, -2.38}, {0.80, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
	
    rail_category = "regular",
    pictures = scrap_rail_pictures(),
    placeable_by = { item="scrap-rail", count = 4}
  },
  --[[{
    type = "cargo-wagon",
    name = "ScrapTrailer",
    icon = "__JunkTrain3__/graphics/junk-wagon-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
    inventory_size = 8,
    minable = {mining_time = 1, result = "ScrapTrailer"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
    max_health = 6,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
	connection_distance = 3,
		joint_distance = 4,
	collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
	selection_box = {{-0.7, -2.7}, {1, 3.2}},	
	vertical_selection_shift = -0.796875,
    weight = 8000, --drd 1500
    max_speed = 0.5,
	wheels = empty_loco_wheel,
    braking_force = 3,
    friction_force = 0.50,
    air_resistance = 0.004,
    energy_per_hit_point = 5,
	rail_category = "regular",
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
    },
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
    pictures =
    {
      layers =
            {
                
                {
                    priority = "very-low",
                    width = 256,
                    height = 256,
                    direction_count = 64,
					back_equals_front = true,
                    filenames =
                    {
                        "__JunkTrain3__/graphics/cargo-wagon.png",
                    },
                    line_length = 8,
                    lines_per_file = 8,
                    shift = {0.42, -1.125}
                }
            }
    }
	},]]


  {
    type = "train-stop",
    name = "train-stop-scrap",
    icon = "__base__/graphics/icons/train-stop.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    minable = {mining_time = 1, result = "train-stop-scrap"},
    max_health = 250,
    corpse = "medium-remnants",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
    drawing_boxes =
    {
      north = {{-3,-2.5}, {0.8, 1.25}},
      east = {{-1.75, -4.25},{1.625, 0.5}},
      south = {{-0.8125, -3.625},{2.75, 0.4375}},
      west = {{-1.75, -1.6875},{2.0625, 2.75}},
    },
    tile_width = 2,
    tile_height = 2,
    animation_ticks_per_frame = 20,
    rail_overlay_animations = make_4way_animation_from_spritesheet(
    {
      filename = "__base__/graphics/entity/train-stop/train-stop-ground.png",
      width = 194,
      height = 189,
      direction_count = 4,
      shift = util.by_pixel(0, -0.5),
        hr_version = {
          filename = "__base__/graphics/entity/train-stop/hr-train-stop-ground.png",
          width = 386,
          height = 377,
          direction_count = 4,
          shift = util.by_pixel(0, -0.75),
          scale = 0.5
      }
    }),

    animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-bottom.png",
        width = 71,
        height = 146,
        direction_count = 4,
        shift = util.by_pixel(-0.5, -27),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-bottom.png",
            width = 140,
            height = 291,
            direction_count = 4,
            shift = util.by_pixel(-0.5, -26.75),
            scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-shadow.png",
        width = 361,
        height = 304,
        direction_count = 4,
        shift = util.by_pixel(-7.5, 18),
        draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-shadow.png",
            width = 720,
            height = 607,
            direction_count = 4,
            shift = util.by_pixel(-7.5, 17.75),
            draw_as_shadow = true,
            scale = 0.5
          }
      },
    }}),

    top_animations = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top.png",
        width = 156,
        height = 153,
        direction_count = 4,
        shift = util.by_pixel(0, -50.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-top.png",
            width = 311,
            height = 305,
            direction_count = 4,
            shift = util.by_pixel(0, -50.75),
            scale = 0.5
          }
      },
      {
        filename = "__base__/graphics/entity/train-stop/train-stop-top-mask.png",
        width = 154,
        height = 148,
        direction_count = 4,
        apply_runtime_tint = true,
        shift = util.by_pixel(0, -49),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-top-mask.png",
            width = 306,
            height = 295,
            direction_count = 4,
            apply_runtime_tint = true,
            shift = util.by_pixel(-0.25, -48.75),
            scale = 0.5
          }
      }
    }}),

    light1 =
    {
      light = {intensity = 0.5, size = 3, color = {r = 1.0, g = 1.0, b = 1.0}},
      picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-light-1.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-70.5, -44.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-light-1.png",
            width = 17,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-70.75, -44.25),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-light-1.png",
          width = 3,
          height = 9,
          frame_count = 1,
          shift = util.by_pixel(34.5, 19.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 19.5),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-light-1.png",
          width = 8,
          height = 2,
          frame_count = 1,
          shift = util.by_pixel(70, -95),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-light-1.png",
            width = 16,
            height = 4,
            frame_count = 1,
            shift = util.by_pixel(70, -95),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-light-1.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-30.5, -112),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(-30.5, -112),
            scale = 0.5
            }
        },
      },
      red_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-red-light-1.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-70.5, -44.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-red-light-1.png",
            width = 17,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-70.75, -44.25),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-red-light-1.png",
          width = 3,
          height = 9,
          frame_count = 1,
          shift = util.by_pixel(34.5, 19.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-red-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 19.5),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-red-light-1.png",
          width = 8,
          height = 2,
          frame_count = 1,
          shift = util.by_pixel(70, -95),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-red-light-1.png",
            width = 16,
            height = 4,
            frame_count = 1,
            shift = util.by_pixel(70, -95),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-red-light-1.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-30.5, -112),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-red-light-1.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(-30.5, -112),
            scale = 0.5
            }
        },
      }
    },

    light2 =
    {
      light = {intensity = 0.5, size = 3, color = {r = 1.0, g = 1.0, b = 1.0}},
      picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-light-2.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-57.5, -43.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-light-2.png",
            width = 16,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-57.5, -43.75),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-light-2.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(34.5, 10),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-light-2.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 10),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-light-2.png",
          width = 8,
          height = 3,
          frame_count = 1,
          shift = util.by_pixel(57, -94.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-light-2.png",
            width = 16,
            height = 5,
            frame_count = 1,
            shift = util.by_pixel(57, -94.75),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-light-2.png",
          width = 4,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-31, -103),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-light-2.png",
            width = 7,
            height = 15,
            frame_count = 1,
            shift = util.by_pixel(-30.75, -102.75),
            scale = 0.5
            }
        },
      },
      red_picture =
      {
        north =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-north-red-light-2.png",
          width = 9,
          height = 5,
          frame_count = 1,
          shift = util.by_pixel(-57.5, -43.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-north-red-light-2.png",
            width = 16,
            height = 9,
            frame_count = 1,
            shift = util.by_pixel(-57.5, -43.75),
            scale = 0.5
            }
        },
        west =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-east-red-light-2.png",
          width = 3,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(34.5, 10),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-east-red-light-2.png",
            width = 6,
            height = 16,
            frame_count = 1,
            shift = util.by_pixel(34.5, 10),
            scale = 0.5
            }
        },
        south =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-south-red-light-2.png",
          width = 8,
          height = 3,
          frame_count = 1,
          shift = util.by_pixel(57, -94.5),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-south-red-light-2.png",
            width = 16,
            height = 5,
            frame_count = 1,
            shift = util.by_pixel(57, -94.75),
            scale = 0.5
            }
        },
        east =
        {
          filename = "__base__/graphics/entity/train-stop/train-stop-west-red-light-2.png",
          width = 4,
          height = 8,
          frame_count = 1,
          shift = util.by_pixel(-31, -103),
          hr_version = {
            filename = "__base__/graphics/entity/train-stop/hr-train-stop-west-red-light-2.png",
            width = 7,
            height = 15,
            frame_count = 1,
            shift = util.by_pixel(-30.75, -102.75),
            scale = 0.5
            }
        },
      }
    },

    color={r=0.95,  g=0.85, b=0.1, a=0.5},

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/train-stop.ogg", volume = 0.8 }
    },
  },
  {
    type = "rail-signal",
    name = "rail-signal-scrap",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.5, result = "rail-signal-scrap"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation =
    {
      filename = "__base__/graphics/entity/rail-signal/rail-signal.png",
      priority = "high",
      width = 96,
      height = 96,
      frame_count = 3,
      direction_count = 8,
      hr_version = {
        filename = "__base__/graphics/entity/rail-signal/hr-rail-signal.png",
        priority = "high",
        width = 192,
        height = 192,
        frame_count = 3,
        direction_count = 8,
        scale = 0.5
      }
    },
    rail_piece =
    {
      filename = "__base__/graphics/entity/rail-signal/rail-signal-metal.png",
      line_length = 10,
      width = 96,
      height = 96,
      frame_count = 10,
      axially_symmetrical = false,
      hr_version = {
        filename = "__base__/graphics/entity/rail-signal/hr-rail-signal-metal.png",
        line_length = 10,
        width = 192,
        height = 192,
        frame_count = 10,
        axially_symmetrical = false,
        scale = 0.5
      }
    },
    green_light = {intensity = 0.2, size = 4, color={g=1}},
    orange_light = {intensity = 0.2, size = 4, color={r=1, g=0.5}},
    red_light = {intensity = 0.2, size = 4, color={r=1}},

    --circuit_wire_connection_points = circuit_connector_definitions["rail-signal"].points,
    --circuit_connector_sprites = circuit_connector_definitions["rail-signal"].sprites,
    --circuit_wire_max_distance = default_circuit_wire_max_distance,

    --circuit_wire_max_distance = 9,
    --default_red_output_signal = {type = "virtual", name = "signal-red"},
    --default_orange_output_signal = {type = "virtual", name = "signal-yellow"},
    --default_green_output_signal = {type = "virtual", name = "signal-green"}
  },
  {
    type = "rail-chain-signal",
    name = "rail-chain-signal-scrap",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "filter-directions", "fast-replaceable-no-build-while-moving"},
    fast_replaceable_group = "rail-signal",
    minable = {mining_time = 0.5, result = "rail-chain-signal-scrap"},
    max_health = 100,
    corpse = "small-remnants",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation =
    {
      filename = "__base__/graphics/entity/rail-chain-signal/rail-chain-signal.png",
      priority = "high",
      line_length = 5,
      width = 160,
      height = 160,
      frame_count = 5,
      axially_symmetrical = false,
      direction_count = 8,
      hr_version = {
        filename = "__base__/graphics/entity/rail-chain-signal/hr-rail-chain-signal.png",
        priority = "high",
        line_length = 5,
        width = 320,
        height = 320,
        frame_count = 5,
        axially_symmetrical = false,
        direction_count = 8,
        scale = 0.5
      }
    },
    rail_piece =
    {
      filename = "__base__/graphics/entity/rail-chain-signal/rail-chain-signal-metal.png",
      line_length = 10,
      width = 192,
      height = 192,
      frame_count = 10,
      axially_symmetrical = false,
      hr_version = {
        filename = "__base__/graphics/entity/rail-chain-signal/hr-rail-chain-signal-metal.png",
        line_length = 10,
        width = 384,
        height = 384,
        frame_count = 10,
        axially_symmetrical = false,
        scale = 0.5
      }
    },
    selection_box_offsets =
    {
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0},
      {0, 0}
    },
    green_light = {intensity = 0.3, size = 4, color={r=0.592157, g=1, b=0.117647}},
    orange_light = {intensity = 0.3, size = 4, color={r=0.815686, g=0.670588, b=0.431373}},
    red_light = {intensity = 0.3, size = 4, color={r=0.784314, g=0.431373, b=0.431373}},
    blue_light = {intensity = 0.3, size = 4, color={r=0.431373, g=0.694118, b=0.623529}},
  },

})