data:extend({
    {
        type = "recipe",
        name = "space-shuttle",
        category = "satellite-crafting",
        energy_required = 480,
        subgroup = "Space-Shuttles",
        enabled = false,
        ingredients = 
        {
            {"satellite-thruster", 20},
            {"shuttle-hull", 1},
            {"space-lab-payload", 1},
          },
        result = "space-shuttle",
    },
    {
        type = "recipe",
        name = "spy-shuttle",
        category = "satellite-crafting",
        energy_required = 480,
        enabled = false,
        subgroup = "Space-Shuttles",
        ingredients = 
        {
            {"satellite-thruster", 20},
            {"shuttle-hull", 1},
            {"telescope-components", 3},
          },
        result = "spy-shuttle",
    }
})