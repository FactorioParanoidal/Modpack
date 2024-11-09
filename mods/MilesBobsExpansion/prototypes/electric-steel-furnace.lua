require "util"
data:extend(
{
  {
    type = "item",
    name = "electric-steel-furnace",
    icon = "__MilesBobsExpansion__/graphics/icons/electric-steel-furnace.png",
    icon_size = 32,
	subgroup = "smelting-machine",
    order = "bd",
    place_result = "electric-steel-furnace",
    stack_size = 50
	},
	{
    type = "furnace",
    name = "electric-steel-furnace",
      animation = {
        layers = {
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
            frame_count = 1,
            height = 87,
            hr_version = {
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
              frame_count = 1,
              height = 174,
              priority = "high",
              scale = 0.5,
              shift = {
                -0.0390625,
                0.0625
              },
              width = 171
            },
            priority = "high",
            shift = {
              -0.046875,
              0.046875
            },
            width = 85
          },
          {
            draw_as_shadow = true,
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
            frame_count = 1,
            height = 43,
            hr_version = {
              draw_as_shadow = true,
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
              frame_count = 1,
              height = 85,
              priority = "high",
              scale = 0.5,
              shift = {
                1.2265625,
                0.3515625
              },
              width = 277
            },
            priority = "high",
            shift = {
              1.234375,
              0.359375
            },
            width = 139
          }
        }
      },
      collision_box = {
        {
          -0.7,
          -0.7
        },
        {
          0.7,
          0.7
        }
      },
      corpse = "medium-remnants",
      crafting_categories = {
        "smelting"
      },
      crafting_speed = 1,
      dying_explosion = "medium-explosion",
      energy_source = {
        emissions = 0.05,
        type = "electric",
        usage_priority = "secondary-input"
      },
      energy_usage = "100kW",
      fast_replaceable_group = "furnace",
      flags = {
        "placeable-neutral",
        "placeable-player",
        "player-creation"
      },
      icon = "__base__/graphics/icons/steel-furnace.png",
      icon_size = 32,
      max_health = 300,
      minable = {
        mining_time = 1,
        result = "electric-steel-furnace"
      },
      name = "electric-steel-furnace",
      resistances = {
        {
          percent = 100,
          type = "fire"
        }
      },
      result_inventory_size = 1,
      selection_box = {
        {
          -0.8,
          -1
        },
        {
          0.8,
          1
        }
      },
      source_inventory_size = 1,
      type = "furnace",
      vehicle_impact_sound = {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.65
      },
      working_sound = {
        sound = {
          filename = "__base__/sound/furnace.ogg"
        }
      },
      working_visualisations = {
        {
          animation = {
            axially_symmetrical = false,
            direction_count = 1,
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
            frame_count = 48,
            height = 40,
            hr_version = {
              axially_symmetrical = false,
              direction_count = 1,
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
              frame_count = 48,
              height = 81,
              line_length = 8,
              priority = "high",
              scale = 0.5,
              shift = {
                -0.0234375,
                0.1796875
              },
              width = 57
            },
            line_length = 8,
            priority = "high",
            shift = {
              -0.015625,
              0.1875
            },
            width = 29
          },
          east_position = {
            0,
            0
          },
          light = {
            color = {
              b = 1,
              g = 1,
              r = 1
            },
            intensity = 1,
            size = 1
          },
          north_position = {
            0,
            0
          },
          south_position = {
            0,
            0
          },
          west_position = {
            0,
            0
          }
        },
        {
          animation = {
            blend_mode = "additive",
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
            frame_count = 1,
            height = 43,
            priority = "high",
            shift = {
              0.03125,
              0.640625
            },
            width = 60
          },
          east_position = {
            0,
            0
          },
          effect = "flicker",
          north_position = {
            0,
            0
          },
          south_position = {
            0,
            0
          },
          west_position = {
            0,
            0
          }
        },
        {
          animation = {
            axially_symmetrical = false,
            blend_mode = "additive",
            direction_count = 1,
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
            frame_count = 1,
            height = 74,
	     hr_version =
		  {
		    filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
		    priority = "high",
		    line_length = 1,
		    width = 128,
		    height = 150,
		    frame_count = 1,
		    direction_count = 1,
		    shift = util.by_pixel(0, -5),
		    blend_mode = "additive",
		    scale = 0.5,
		  },
            line_length = 8,
            priority = "high",
            shift = {
              0,
              -0.140625
            },
            width = 64
          },
          east_position = {
            0,
            0
          },
          effect = "flicker",
          north_position = {
            0,
            0
          },
          south_position = {
            0,
            0
          },
          west_position = {
            0,
            0
          }
        }
      }
    },
	
	
   {
    type = "recipe",
    name = "electric-steel-furnace",
    enabled = false,
    ingredients =
    {
      {"steel-furnace", 1},
      {"electronic-circuit", 5},
      {"steel-plate", 10},
      {"iron-gear-wheel", 10},
    },
    result = "electric-steel-furnace"
   },

  
   {
    type = "technology",
    name = "electric-steel-furnace",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-steel-furnace"
      }
    },
    prerequisites =
    {
      "electronics-machine-1",
      "advanced-material-processing"
    },
    unit =
    {
      count = 100,
      time = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
    },
    upgrade = true,
  },
 }
)
