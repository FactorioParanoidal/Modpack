data:extend({
    {
        type = "technology",
        name = "JunkTrain_tech",
        icon = "__JunkTrain3__/graphics/tech-icon.png",
        icon_size = 128,
        effects = 
        {
   		{
				type = "unlock-recipe",
				recipe = "scrap-rail"
		},
            {
                type = "unlock-recipe",
                recipe = "JunkTrain"
            },
            {
                type = "unlock-recipe",
                recipe = "ScrapTrailer"
            }
        },    
        prerequisites = {"automation"},
        unit =
        {
          count = 20,
          ingredients =
          {
            {"automation-science-pack", 1},
          },
          time = 20
        },
        order = "c-g-b-a"
    },
   {
    type = "technology",
    name = "automated-scrap-rail-transportation",
    icon = "__base__/graphics/technology/automated-rail-transportation.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects =
    {
	    {
                type = "unlock-recipe",
                recipe = "train-stop-scrap"
            },
	    {
                type = "unlock-recipe",
                recipe = "rail-signal-scrap"
            },
	    {
                type = "unlock-recipe",
                recipe = "rail-chain-signal-scrap"
            }
    },
    prerequisites = {"JunkTrain_tech", "lamp"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 30
    },
    order = "c-g-b",
  }
})