data:extend({
	{
		type = "technology",
		name = name_tech_bet,
		icon = graphics_path..name_tech_bet..".png",
		icon_size = 256, icon_mipmaps = 4,
		effects = {
			{type = "unlock-recipe", recipe = name_locomotive},
			{type = "unlock-recipe", recipe = name_chg1},
			{type = "unlock-recipe", recipe = name_fuel1.."-empty"},
			{type = "unlock-recipe", recipe = name_fuel1.."-full"},
		},
		prerequisites = {"railway", "electric-engine"},
		unit = {
			count = 100,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 30
		},
		order = "g-j-a"
	},
	{
		type = "technology",
		name = name_tech_chg2,
		icon = graphics_path..name_tech_chg2.."-tech.png",
		icon_size = 128,
		effects = {
			{type = "unlock-recipe", recipe = name_chg2},
		},
		prerequisites = {name_tech_bet, "speed-module"},
		unit = {
			count = 150,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 30
		},
		upgrade = true,
		order = "g-j-c-2"
	},
	{
		type = "technology",
		name = name_tech_chg3,
		icon = graphics_path..name_tech_chg3.."-tech.png",
		icon_size = 128,
		effects = {
			{type = "unlock-recipe", recipe = name_chg3},
		},
		prerequisites = {name_tech_chg2, "speed-module-2"},
		unit = {
			count = 200,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 30
		},
		upgrade = true,
		order = "g-j-c-3"
	},
	{
		type = "technology",
		name = name_tech_chg_tertiary,
		icon = graphics_path..name_tech_chg_tertiary.."-tech.png",
		icon_size = 128,
		effects = {
			{type = "unlock-recipe", recipe = name_chg1t},
			{type = "unlock-recipe", recipe = name_chg2t},
			{type = "unlock-recipe", recipe = name_chg3t},
		},
		prerequisites = {name_tech_chg3, "electric-energy-distribution-2"},
		unit = {
			count = 200,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 45
		},
		order = "g-j-c-4"
	},
	{
		type = "technology",
		name = name_tech_fuel2,
		icon = graphics_path..name_tech_fuel2.."-tech.png",
		icon_size = 128, icon_mipmaps = 4,
		effects = {
			{type = "unlock-recipe", recipe = name_fuel2.."-empty"},
			{type = "unlock-recipe", recipe = name_fuel2.."-full"},
		},
		prerequisites = {name_tech_bet, "processing-unit"},
		unit = {
			count = 300,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 30
		},
		upgrade = true,
		order = "i-j-b-2"
	},
	{
		type = "technology",
		name = name_tech_fuel3,
		icon = graphics_path..name_tech_fuel3.."-tech.png",
		icon_size = 128, icon_mipmaps = 4,
		effects = {
			{type = "unlock-recipe", recipe = name_fuel3.."-empty"},
			{type = "unlock-recipe", recipe = name_fuel3.."-full"},
		},
		prerequisites = {name_tech_fuel2, "low-density-structure"},
		unit = {
			count = 300,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 45
		},
		upgrade = true,
		order = "i-j-b-3"
	},
	{
		type = "technology",
		name = name_tech_fuel4,
		icon = graphics_path..name_tech_fuel4.."-tech.png",
		icon_size = 128, icon_mipmaps = 4,
		effects = {
			{type = "unlock-recipe", recipe = name_fuel4.."-empty"},
			{type = "unlock-recipe", recipe = name_fuel4.."-full"},
		},
		prerequisites = {name_tech_fuel3, "efficiency-module-3"},
		unit = {
			count = 300,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1},
			},
			time = 60
		},
		upgrade = true,
		order = "i-j-b-4"
	},
})

if settings.startup[setting_recycling].value then
	data:extend({{
		type = "technology",
		name = name_tech_recycling,
		icon = graphics_path..name_tech_recycling.."-tech.png",
		icon_size = 128, icon_mipmaps = 4,
		effects = {
			{type = "unlock-recipe", recipe = name_fuel1.."-recycling"},
			{type = "unlock-recipe", recipe = name_fuel2.."-recycling"},
			{type = "unlock-recipe", recipe = name_fuel3.."-recycling"},
			{type = "unlock-recipe", recipe = name_fuel4.."-recycling"},
		},
		prerequisites = {name_tech_bet},
		unit = {
			count = 300,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
			},
			time = 30
		},
		order = "g-j-b"
	}})
end
