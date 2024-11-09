data:extend({
--Item
   {
		type = "item",
		name = "hyper-lab",
		icon = "__BigLab__/graphics/icon/hyper-lab.png",
		icon_size = 64,
		--- flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "h[lab]",
		place_result = "hyper-lab",
		stack_size = 1
	},
--Recipe
	{
		type = "recipe",
		name = "hyper-lab",
		energy_required = 1000,
		enabled = false,
		ingredients =
		{
		  {"refined-concrete", 10000},
		  {"nitinol-alloy", 1000},
		  {"advanced-processing-unit", 500},
		  {"big-lab", 10},
		},
		result = "hyper-lab"
	},
--Entity
	{
		type = "lab",
		name = "hyper-lab",
		icon = "__BigLab__/graphics/icon/hyper-lab.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 5, result = "hyper-lab"},
		max_health = 5000,
		crafting_categories = {"chemistry"},
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		collision_box = {{-49, -39}, {49, 39}},
		selection_box = {{-50, -40}, {50, 40}},
		--light = {intensity = 0.75, size = 8, color = {r = 1.0, g = 1.0, b = 1.0}},
		on_animation = {
      layers =
      {
        {
          filename = "__BigLab__/graphics/lab/hyper-lab.png",
          width = 320,
          height = 320,
          frame_count = 1,
          line_length = 1,
		  scale = 10,
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
          filename = "__BigLab__/graphics/lab/hyper-lab.png",
          width = 320,
          height = 320,
          frame_count = 1,
		  scale = 10,
          shift = util.by_pixel(0, 1.5),
        }
      }
    },
		working_sound =
		{
		  sound =
		  {
			filename = "__base__/sound/lab.ogg",
			volume = 5 --0.7
		  },
		  apparent_volume = 1
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input"
		},
		energy_usage = "1GW",
		researching_speed = 128,
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
		  module_slots = 8,
		  max_entity_info_module_icons_per_row = 3,
		  max_entity_info_module_icon_rows = 1,
		  module_info_icon_shift = {0, 0.9}
		}
	},
})

if (mods['bobtech']) then 
data.raw["lab"]["hyper-lab"].inputs =
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