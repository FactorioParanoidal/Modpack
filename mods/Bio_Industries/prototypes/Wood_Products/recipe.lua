data:extend({
-- Big Electric Pole
  {
    type = "recipe",
    name = "bi-wooden-pole-big",
    localised_name = {"entity-name.bi-wooden-pole-big"},
    localised_description = {"entity-description.bi-wooden-pole-big"},
    normal = 
    {
      enabled = false,
      ingredients = 
      {
        {"wood", 5},
        {"small-electric-pole", 2},
      },
      result = "bi-wooden-pole-big",
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = 
    {
      enabled = false,
      ingredients = 
      {
        {"wood", 10},
        {"small-electric-pole", 4},
      },
      result = "bi-wooden-pole-big",
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true, 
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-b[small-electric-pole]",
},
--###############################################################################################
-- Huge Wooden Pole
  {
    type = "recipe",
    name = "bi-wooden-pole-huge",
    localised_name = {"entity-name.bi-wooden-pole-huge"},
    localised_description = {"entity-description.bi-wooden-pole-huge"},
    normal = 
    {
      enabled = false,
      ingredients = 
      {
        {"wood", 5},
        {"concrete", 100},
        {"bi-wooden-pole-big", 6},
      },
      result = "bi-wooden-pole-huge",
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = 
    {
      enabled = false,
      ingredients = 
      {
        {"wood", 10},
        {"concrete", 150},
        {"bi-wooden-pole-big", 10},
      },
      result = "bi-wooden-pole-huge",
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true, 
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-d[big-electric-pole]",
},
--###############################################################################################
-- Wooden Fence
  {
    type = "recipe",
    name = "bi-wooden-fence",
    localised_name = {"entity-name.bi-wooden-fence"},
    localised_description = {"entity-description.bi-wooden-fence"},
    normal = 
    {
      enabled = true,
      ingredients = {{"wood", 2}},
      result = "bi-wooden-fence",
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = 
    {
      enabled = true,
      ingredients = {{"wood", 4}},
      result = "bi-wooden-fence",
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true, 
    subgroup = "defensive-structure",
},
--###############################################################################################
-- Wood Pipe
  {
    type = "recipe",
    name = "bi-wood-pipe",
    localised_name = {"entity-name.bi-wood-pipe"},
    localised_description = {"entity-description.bi-wood-pipe"},
    normal = 
    {
      energy_required = 1,
      enabled = true,
      ingredients = 
      {
        {"copper-plate", 1},
        {"wood", 8}
      },
      result = "bi-wood-pipe",
      result_count = 4,
      requester_paste_multiplier = 15,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = 
    {
      energy_required = 2,
      enabled = true,
      ingredients = 
      {
        {"copper-plate", 1},
        {"wood", 12}
      },
      result = "bi-wood-pipe",
      result_count = 4,
      requester_paste_multiplier = 15,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true, 
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-1a[pipe]",
},
--###############################################################################################
-- Wood Pipe to Ground
  {
    type = "recipe",
    name = "bi-wood-pipe-to-ground",
    localised_name = {"entity-name.bi-wood-pipe-to-ground"},
    localised_description = {"entity-description.bi-wood-pipe-to-ground"},
    normal = 
    {
      energy_required = 2,
      enabled = true,
      ingredients = 
      {
        {"copper-plate", 4},
        {"bi-wood-pipe", 5}
      },
      result = "bi-wood-pipe-to-ground",
      result_count = 2,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = 
    {
      energy_required = 4,
      enabled = true,
      ingredients = 
      {
        {"copper-plate", 5},
        {"bi-wood-pipe", 6}
      },
      result = "bi-wood-pipe-to-ground",
      result_count = 2,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true, 
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-1b[pipe-to-ground]",
},
})