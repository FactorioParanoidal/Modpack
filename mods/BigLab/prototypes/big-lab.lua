data:extend({
--Item
   {
		type = "item",
		name = "big-lab",
		icon = "__BigLab__/graphics/icon/big-lab.png",
		icon_size = 64,
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
		enabled = false,
		ingredients =
		{
		  {"concrete", 5000},
		  {"titanium-plate", 1000},
		  {"processing-unit", 500},
		  {"lab-2", 30},
		},
		result = "big-lab"
	},
--Entity
	{
		type = "lab",
		name = "big-lab",
		icon = "__BigLab__/graphics/icon/big-lab.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 5, result = "big-lab"},
		max_health = 1500,
		crafting_categories = {"chemistry"},
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		collision_box = {{-9.5, -7.5}, {9.5, 7.5}},
		selection_box = {{-10, -8}, {10, 8}},
		--light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
		on_animation = {
      layers =
      {
        {
          filename = "__BigLab__/graphics/lab/big-lab.png",
          width = 320,
          height = 320,
          frame_count = 1,
          line_length = 1,
		  scale = 2,
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
          filename = "__BigLab__/graphics/lab/big-lab.png",
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
			volume = 2 --0.7
		  },
		  apparent_volume = 1
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input"
		},
		energy_usage = "250MW",
		researching_speed = 50,
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