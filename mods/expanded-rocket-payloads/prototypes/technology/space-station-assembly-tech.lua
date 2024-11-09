data:extend({
    {
      type = "technology",
      name = "space-station-assembly",
      icon_size = 128,
      order = "y-a",    
      icon = "__expanded-rocket-payloads__/graphic/space-lab-128.png",
      effects =
      {
        {
          type = "laboratory-productivity",
          modifier = 0.25
        },
        {
            type = "laboratory-speed",
            modifier = 10
        },
      },
      prerequisites = {"extremely-advanced-rocket-payloads"},
      unit =
      {
        count = 400,
        ingredients =
        {
          {"station-science", 1},
        },
        time = 90
      },
    },
    {
        type = "technology",
        name = "orbital-ai-core",
        icon_size = 128,
        order = "y-a",         
        icon = "__expanded-rocket-payloads__/graphic/ai-lab-128.png",
        effects =
        {
          {
            type = "laboratory-productivity",
            modifier = 0.5
          },
          {
            type = "laboratory-speed",
            modifier = 10
          },
          {
            type = "worker-robot-storage",
            modifier = 100
          },
          {
            type = "worker-robot-speed",
            modifier = 5
          },
          {
            type = "mining-drill-productivity-bonus",
            modifier = 1
          },
          {
            type = "ammo-damage",
            ammo_category = "laser",
            modifier = 1
          },
          {
            type = "bulk-inserter-capacity-bonus",
            modifier = 50
          }
        },
        prerequisites = {"space-station-assembly"},
        unit =
        {
          count = 2500,
          ingredients =
          {
            {"station-science", 1},
          },
          time = 90
        },
      },
})