data:extend({
    {
        type = "technology",
        name = "bulk-inserter-research-1",
        icon_size = 128,
        order = "y-a",    
        icon = "__base__/graphics/technology/bulk-inserter.png",
        effects =
        {
          {
            type = "bulk-inserter-capacity-bonus",
            modifier = 2
          }
        },
        prerequisites = {"autonomous-space-mining-drones"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"station-science", 1},
          },
          time = 120
        },
        max_level = "4",
        upgrade = true,
    },  
    {
      type = "technology",
      name = "bulk-inserter-research-5",
      icon_size = 128,
      order = "y-a",    
      icon = "__base__/graphics/technology/bulk-inserter.png",
      effects =
      {
        {
          type = "bulk-inserter-capacity-bonus",
          modifier = 2
        }
      },
      prerequisites = {"bulk-inserter-research-1"},
      unit =
      {
        count_formula = "L",
        ingredients =
        {
          {"station-science", 1},
        },
        time = 120
      },
      max_level = "9",
      upgrade = true,
    },  
    {
      type = "technology",
      name = "bulk-inserter-research-10",
      icon_size = 128,
      order = "y-a",    
      icon = "__base__/graphics/technology/bulk-inserter.png",
      effects =
      {
        {
          type = "bulk-inserter-capacity-bonus",
          modifier = 2
        }
      },
      prerequisites = {"bulk-inserter-research-5"},
      unit =
      {
        count_formula = "L",
        ingredients =
        {
          {"station-science", 1},
        },
        time = 240
      },
      max_level = "14",
      upgrade = true,
    },  
    {
      type = "technology",
      name = "bulk-inserter-research-15",
      icon_size = 128,
      order = "y-a",    
      icon = "__base__/graphics/technology/bulk-inserter.png",
      effects =
      {
        {
          type = "bulk-inserter-capacity-bonus",
          modifier = 2
        }
      },
      prerequisites = {"bulk-inserter-research-10"},
      unit =
      {
        count_formula = "2(L-7)",
        ingredients =
        {
          {"station-science", 1},
        },
        time = 240
      },
      max_level = "infinite",
      upgrade = true,
    },  
})