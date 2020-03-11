data:extend({
--Item
   {
		type = "item",
		name = "big-lab",
		icon = "__BigLab__/graphics/icon/biglab.png",
		icon_size = 32,
		--- flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "h[lab]",
		place_result = "big-lab",
		stack_size = 1
	},
--Recipe
	{
		type = "recipe",
		name = "big-lab",
		energy_required = 20,
		enabled = "false",
		ingredients =
		{
		  {"processing-unit", 50},
		  {"lab-2", 30},
		},
		result = "big-lab"
	},
--Entity
	{
		type = "lab",
		name = "big-lab",
		icon = "__BigLab__/graphics/icon/biglab.png",
		icon_size = 32,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "big-lab"},
		max_health = 1500,
		crafting_categories = {"chemistry"},
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-8.5, -8.5}, {8.5, 8.5}},
		selection_box = {{-9, -9}, {9, 9}},
		light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
		on_animation = {
      layers =
      {
        {
          filename = "__BigLab__/graphics/lab/biglab.png",
          width = 320,
          height = 320,
          frame_count = 1,
          line_length = 1,
		  scale = 6,
          animation_speed = 0.01,
          shift = util.by_pixel(0, 1.5),
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__BigLab__/graphics/lab/biglab.png",
          width = 320,
          height = 320,
          frame_count = 1,
		  scale = 2,
          shift = util.by_pixel(0, 1.5),
        }
      }
    },
		working_sound =
		{
		  sound =
		  {
			filename = "__base__/sound/lab.ogg",
			volume = 0.7
		  },
		  apparent_volume = 1
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input"
		},
		energy_usage = "1000kW",
		researching_speed = 100,
		inputs =
		{
		  "automation-science-pack",
		  "logistic-science-pack",
		  "chemical-science-pack",
		  "military-science-pack",
		  "production-science-pack",
		  "utility-science-pack",
		  "space-science-pack"
		},
		module_specification =
		{
		  module_slots = 6,
		  max_entity_info_module_icons_per_row = 3,
		  max_entity_info_module_icon_rows = 1,
		  module_info_icon_shift = {0, 0.9}
		}
	},
})

 
if (mods['bobtech']) then 
data.raw["lab"]["big-lab"].inputs =
		{
		  "automation-science-pack",
		  "logistic-science-pack",
		  "chemical-science-pack",
		  "military-science-pack",
		  "production-science-pack",
		  "utility-science-pack",
		  "space-science-pack",
		  "advanced-logistic-science-pack",  --DrD
	---	  "transport-science-pack",
		  "science-pack-gold",
		  "alien-science-pack",
		  "alien-science-pack-blue",
		  "alien-science-pack-orange",
		  "alien-science-pack-purple",
		  "alien-science-pack-yellow",
		  "alien-science-pack-green",
		  "alien-science-pack-red"
		}
end


if (mods['SchallAlienLoot']) then 
data.raw["lab"]["big-lab"].inputs =
		{
		  "automation-science-pack",
		  "logistic-science-pack",
		  "chemical-science-pack",
		  "military-science-pack",
		  "production-science-pack",
		  "utility-science-pack",
		  "space-science-pack",
		  "alien-science-pack",
	---	  "logistic-science-pack",
	---	  "science-pack-gold",
	---	  "alien-science-pack",
	---	  "alien-science-pack-blue",
	---	  "alien-science-pack-orange",
	---	  "alien-science-pack-purple",
	---	  "alien-science-pack-yellow",
	---	  "alien-science-pack-green",
	---	  "alien-science-pack-red"
		}
end