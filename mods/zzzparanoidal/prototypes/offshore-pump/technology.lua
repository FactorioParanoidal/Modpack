data:extend(
{
  {
    type = "technology",
	name = "offshore-mk2-pump",
	icon_size = 256,
	icon_mipmaps = 4,
	icon = "__zzzparanoidal__/graphics/technology/offshore-pump-2.png",
	prerequisites = {"fluid-handling", "advanced-circuit"},
	effects ={{type = "unlock-recipe", recipe = "offshore-mk2-pump"}},
	unit =
	{
		count = 50,
		ingredients =
		{
			{name="automation-science-pack", amount = 1},
			{name="logistic-science-pack", amount = 1}
		},
		time = 30
	},
	order = "d-a-a"
  },
  {
	    type = "technology",
		name = "offshore-mk3-pump",
		icon_size = 256,
		icon_mipmaps = 4,
		icon = "__zzzparanoidal__/graphics/technology/offshore-pump-3.png",
		prerequisites = {"offshore-pump-2", "advanced-circuit"},
		effects ={{type = "unlock-recipe", recipe = "offshore-mk3-pump"}},
		unit =
		{
			count = 75,
			ingredients =
			{
				{name="automation-science-pack", amount = 1},
				{name="logistic-science-pack", amount = 1},
				{name="chemical-science-pack", amount = 1}
			},
			time = 30
		},
		order = "d-a-a"
 },
 {
	type = "technology",
	name = "offshore-mk4-pump",
	icon_size = 256,
	icon_mipmaps = 4,
	icon = "__zzzparanoidal__/graphics/technology/offshore-pump-4.png",
	prerequisites = {"offshore-pump-3", "advanced-circuit"},
	effects ={{type = "unlock-recipe", recipe = "offshore-mk4-pump"}},
	unit =
	{
		count = 75,
		ingredients =
		{
			{name="automation-science-pack", amount = 1},
			{name="logistic-science-pack", amount = 1},
			{name="chemical-science-pack", amount = 1}
		},
		time = 30
	},
	order = "d-a-a"
}
})