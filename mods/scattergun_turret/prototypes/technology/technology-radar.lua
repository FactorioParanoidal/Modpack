function W93_UpdateTechRadar()

data:extend({
	{
		type = "technology",
		name = "w93-modular-turrets-radar",
		icon = "__scattergun_turret__/graphics/technology/modular-turret-radar-tech.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "w93-modular-gun-radar"
			},
			{
				type = "unlock-recipe",
				recipe = "w93-radar-turret"
			},
			{
				type = "unlock-recipe",
				recipe = "w93-modular-gun-radar2"
			},
			{
				type = "unlock-recipe",
				recipe = "w93-radar-turret2"
			},
		},
		prerequisites =
		{
			"w93-modular-turrets2",
			"efficiency-module-2",
			"speed-module-2",
			"utility-science-pack",
		},
		unit =
		{
			count = 75,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
				{"utility-science-pack",1},
			},
			time = 60
		},
		order = "e-a-c"
	}
})

end