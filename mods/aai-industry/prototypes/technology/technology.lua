local util = require("data-util")

data.raw.technology["logistics"].unit.count = 20
data.raw.technology["logistics"].prerequisites = {"basic-logistics"}

data.raw.technology["automation"].unit.count = 100
data.raw.technology["automation"].prerequisites = {"basic-automation", "electricity"}

data.raw.technology["automation-2"].prerequisites = {"automation"}
data.raw.technology["automation-2"].unit.count = 150

data.raw.technology[ "lamp"].prerequisites = {"electricity"}
data.raw.technology["gun-turret"].prerequisites = {"basic-automation", "military"}

data.raw.technology["logistics"].unit.count = 10

data.raw.technology["fluid-handling"].prerequisites = {"basic-fluid-handling", "steel-processing"}

data.raw.technology["oil-processing"].prerequisites = {"automation", "fluid-handling"}

data.raw.technology["thermal-water-extraction"].ingredients = --drd
		{ {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
		}

-- effects are added in technology-update
data:extend{
    {
        type = "technology",
        name = "basic-automation",
        icon = "__aai-industry__/graphics/technology/automation-0.png",
        icon_size = 128,
        order = "a",
        unit = {
            count = 10,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "basic-logistics",
        icon = "__aai-industry__/graphics/technology/logistics-0.png",
        icon_size = 128,
        order = "a",
        unit = {
            count = 10,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "electricity", 
        icon = "__aai-industry__/graphics/technology/electricity.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"basic-automation"},
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "filter-inserters",
        icon = "__aai-industry__/graphics/technology/filter-inserters.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"automation-2", "electronics"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "radar",
        icon = "__aai-industry__/graphics/technology/radar.png",
        icon_size = 128,
        order = "a",
        prerequisites = { "lamp"},
        unit = {
            count = 40,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "basic-fluid-handling",
        icon = "__base__/graphics/technology/fluid-handling.png",
        icon_size = 256,
        order = "a",
        prerequisites = {"electricity"},
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "steam-power",
        icon = "__aai-industry__/graphics/technology/steam-power.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"basic-fluid-handling"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "electric-lab",
        icon = "__aai-industry__/graphics/technology/electric-lab.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"electricity",  "lamp"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "electric-mining",
        icon = "__aai-industry__/graphics/technology/electric-mining.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"electricity"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
    {
        type = "technology",
        name = "bi-dart-turret",
        icon = "__aai-industry__/graphics/technology/bi-dart-turret.png",
        icon_size = 128,
        order = "a",
		effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bi-dart-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "bi-dart-magazine-basic"
      },
      {
        type = "unlock-recipe",
        recipe = "bi-dart-rifle"
      },
    },
        unit = {
            count = 1,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 30
        },
    },
	--[[
    {
        type = "technology",
        name = "concrete-walls",
        icon = "__base__/graphics/technology/stone-walls.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"stone-wall", "concrete"},
        unit = {
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            },
            time = 20
        },
    },
    {
        type = "technology",
        name = "steel-walls",
        icon = "__base__/graphics/technology/stone-walls.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"concrete-walls", "military-3"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 2},
            },
            time = 30
        },
    },
	
	
	
    {
        type = "technology",
        name = "fuel-processing",
        icon = "__aai-industry__/graphics/technology/fuel-processing.png",
        icon_size = 128,
        order = "a",
        prerequisites = {"electricity"},
        unit = {
            count = 20,
            ingredients = {
                {"automation-science-pack", 1},
            },
            time = 10
        },
    },
	
	]]
}
