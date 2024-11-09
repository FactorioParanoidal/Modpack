data:extend({
--###############################################################################################
-- Seeds from Water (BASIC)
{
    type = "recipe",
    name = "bi-seed-1",
    icon_size = 64,
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/tree_seed.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/fluid/water.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 200,
    ingredients = {
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "wood", amount = 20},
    },
    results = {{type = "item", name = "bi-seed", amount = 40}},
    enabled = false,
    show_amount_in_title = true,
    always_show_made_in = true,
    allow_decomposition = false,
    subgroup = "bio-bio-farm-fluid-1",
    order = "a[bi]-ssw-a1[bi-seed-1]",
    allow_as_intermediate = false,
},
--###############################################################################################
-- Seeds from Water & Ash
  {
    type = "recipe",
    name = "bi-seed-2",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/tree_seed.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/ash.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 150,
    ingredients = {
      {type = "fluid", name = "water", amount = 40},
      {type = "item", name = "wood", amount = 20},
      {type = "item", name = "bi-ash", amount = 10},
    },
    results = {{type = "item", name = "bi-seed", amount = 50}},
    show_amount_in_title = true,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    subgroup = "bio-bio-farm-fluid-1",
    order = "a[bi]-ssw-a1[bi-seed-2]",
    allow_as_intermediate = false,
  },
--###############################################################################################
-- Seeds from Water & fertilizer
  {
    type = "recipe",
    name = "bi-seed-3",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/tree_seed.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 100,
    ingredients = {
      {type = "fluid", name = "water", amount = 40},
      {type = "item", name = "wood", amount = 20},
      {type = "item", name = "fertilizer", amount = 10},
    },
    results = {{type = "item", name = "bi-seed", amount = 60}},
    show_amount_in_title = true,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    subgroup = "bio-bio-farm-fluid-1",
    order = "a[bi]-ssw-a1[bi-seed-3]",
    allow_as_intermediate = false,
    crafting_machine_tint = {
      primary = { r = 0.43, g = 0.73, b = 0.37, a = 0.60},
      secondary = { r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0}
    },
  },
--###############################################################################################
-- Seeds from Water & Adv-fertilizer
  {
    type = "recipe",
    name = "bi-seed-4",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/tree_seed.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer_advanced.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 50,
    ingredients = {
      {type = "item", name = "wood", amount = 20},
      {type = "item", name = "bi-adv-fertilizer", amount = 10},
      {type = "fluid", name = "water", amount = 40},
    },
    results = {{type = "item", name = "bi-seed", amount = 80}},
    show_amount_in_title = true,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    subgroup = "bio-bio-farm-fluid-1",
    order = "a[bi]-ssw-a1[bi-seed-4]",
    allow_as_intermediate = false,
    crafting_machine_tint = {
      primary = { r = 0.73, g = 0.37, b = 0.52, a = 0.60},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0}
    },
},
--###############################################################################################
-- Seedlings from Water (BASIC)
  {
    type = "recipe",
    name = "bi-seedling-1",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/seedling.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/fluid/water.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 400,
    ingredients = {
      {type = "item", name = "bi-seed", amount = 20},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {{type = "item", name = "seedling", amount = 40}},
    enabled = false,
    show_amount_in_title = true,
    always_show_made_in = true,
    allow_decomposition = true,
    subgroup = "bio-bio-farm-fluid-2",
    order = "b[bi]-ssw-b1[bi-Seedling_Mk1]",
  },
--###############################################################################################
-- Seedlings from Water & Ash
  {
    type = "recipe",
    name = "bi-seedling-2",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/seedling.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/ash.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 300,
    ingredients = {
      {type = "item", name = "bi-seed", amount = 25},
      {type = "item", name = "bi-ash", amount = 10},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {{type = "item", name = "seedling", amount = 60}},
    show_amount_in_title = true,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    subgroup = "bio-bio-farm-fluid-2",
    order = "b[bi]-ssw-b1[bi-Seedling_Mk2]",
    allow_as_intermediate = false,
  },
--###############################################################################################
-- Seedlings from Water & fertilizer
  {
    type = "recipe",
    name = "bi-seedling-3",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/seedling.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 200,
    ingredients = {
      {type = "item", name = "bi-seed", amount = 30},
      {type = "item", name = "fertilizer", amount = 10},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {{type = "item", name = "seedling", amount = 90}},
    show_amount_in_title = true,
    enabled = false,
    always_show_made_in = true,
    subgroup = "bio-bio-farm-fluid-2",
    order = "b[bi]-ssw-b1[bi-Seedling_Mk3]",
    allow_as_intermediate = false,
    crafting_machine_tint = {
      primary = {r = 0.43, g = 0.73, b = 0.37, a = 0.60},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0}
    },
},
--###############################################################################################
-- Seedlings from Water & Adv-fertilizer
  {
    type = "recipe",
    name = "bi-seedling-4",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/seedling.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer_advanced.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-greenhouse",
    energy_required = 100,
    ingredients = {
      {type = "item", name = "bi-seed", amount = 40},
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "bi-adv-fertilizer", amount = 10},
    },
    results = {{type = "item", name = "seedling", amount = 160}},
    show_amount_in_title = true,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    subgroup = "bio-bio-farm-fluid-2",
    order = "b[bi]-ssw-b1[bi-Seedling_Mk4]",
    allow_as_intermediate = false,
    crafting_machine_tint = {
      primary = {r = 0.73, g = 0.37, b = 0.52, a = 0.60},
      secondary = {r = 0 , g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0}
    },
},
--###############################################################################################
-- Raw Wood from Water (BASIC)
  {
    type = "recipe",
    name = "bi-logs-1",
    icons = 
    {
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/fluid/water.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-farm",
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    energy_required = 400,
    ingredients = {
      {type = "item", name = "seedling", amount = 20},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {
      {type = "item", name = "wood", amount = 40},
      {type = "item", name = "bi-woodpulp", amount = 80},
    },
    subgroup = "bio-bio-farm-fluid-3",
    order = "c[bi]-ssw-c1[raw-wood1]",
    allow_as_intermediate = false,
  },
--###############################################################################################
-- Raw Wood from Water & Ash
  {
    type = "recipe",
    name = "bi-logs-2",
    icons = 
    {
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/ash.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-farm",
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    energy_required = 360,
    ingredients = {
      {type = "item", name = "seedling", amount = 30},
      {type = "item", name = "bi-ash", amount = 10},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {
      {type = "item", name = "wood", amount = 75},
      {type = "item", name = "bi-woodpulp", amount = 150},
    },
    subgroup = "bio-bio-farm-fluid-3",
    order = "c[bi]-ssw-c1[raw-wood2]",
    allow_as_intermediate = false,
  },
--###############################################################################################
-- Raw Wood from Water & fertilizer
  {
    type = "recipe",
    name = "bi-logs-3",
    icons = 
    {
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-farm",
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    energy_required = 300,
    ingredients = {
      {type = "item", name = "seedling", amount = 45},
      {type = "item", name = "fertilizer", amount = 10},
      {type = "fluid", name = "water", amount = 100},
    },
    results = {
      {type = "item", name = "wood", amount = 135},
      {type = "item", name = "bi-woodpulp", amount = 270},
    },
    subgroup = "bio-bio-farm-fluid-3",
    order = "c[bi]-ssw-c1[raw-wood3]",
    allow_as_intermediate = false,
    crafting_machine_tint = {
      primary = {r = 0.43, g = 0.73, b = 0.37, a = 0.60},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0}
    },
},
--###############################################################################################
-- Raw Wood from adv-fertilizer
  {
    type = "recipe",
    name = "bi-logs-4",
    icons = 
    {
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer_advanced.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-farm",
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    energy_required = 100,
    ingredients = {
      {type = "item", name = "seedling", amount = 40},
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "bi-adv-fertilizer", amount = 5},
    },
    results = {
      {type = "item", name = "wood", amount = 160},
      {type = "item", name = "bi-woodpulp", amount = 320},
    },
    subgroup = "bio-bio-farm-fluid-3",
    order = "c[bi]-ssw-c1[raw-wood4]",
    allow_as_intermediate = false,
    crafting_machine_tint = {
      primary = {r = 0.73, g = 0.37, b = 0.52, a = 0.60},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g =0 , b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0}
    },
},
--###############################################################################################
-- Bio Greenhouse (ENTITY)
  {
    type = "recipe",
    name = "bi-bio-greenhouse",
    normal = {
      enabled = false,
      energy_required = 2.5,
      ingredients = {
        {"iron-stick", 10},
        {"stone-brick", 10},
        {"small-lamp", 5},
      },
      result = "bi-bio-greenhouse",
      result_count = 1,
      allow_as_intermediate = true,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = {
      enabled = false,
      energy_required = 4,
      ingredients = {
        {"iron-stick", 15},
        {"stone-brick", 15},
        {"small-lamp", 5},
      },
      result = "bi-bio-greenhouse",
      result_count = 1,
      allow_as_intermediate = true,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    subgroup = "bio-bio-farm-fluid-entity",
    order = "a[bi]",
    allow_as_intermediate = true,
    always_show_made_in = false,
    allow_decomposition = true,
  },
--###############################################################################################
-- Bio Farm (ENTITY)
  {
    type = "recipe",
    name = "bi-bio-farm",
    normal = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {"bi-bio-greenhouse", 4},
        {"stone-brick", 8}, -- Removed crushed stone, added stonebrick + wood
        {"wood", 12},
        {"copper-cable", 10},
      },
      result = "bi-bio-farm",
      result_count = 1,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = {
      enabled = false,
      energy_required = 7.5,
      ingredients = {
        {"bi-bio-greenhouse", 8},
        {"stone-brick", 16},
        {"wood", 24},
        {"copper-cable", 20},
      },
      result = "bi-bio-farm",
      result_count = 1,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    subgroup = "bio-bio-farm-fluid-entity",
    order = "b[bi]",
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true,
  },
--###############################################################################################
-- Woodpulp
  {
    type = "recipe",
    name = "bi-woodpulp",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/woodpulp.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-a[bi-1-woodpulp]",
    enabled = false,
    energy_required = 2,
    ingredients = {{"wood", 2}},
    result = "bi-woodpulp",
    result_count = 4,
    allow_as_intermediate = true,
    allow_intermediates = true,
    always_show_made_in = false,
    allow_decomposition = false,
},
--###############################################################################################
-- Resin recipe Pulp
  {
    type = "recipe",
    name = "bi-resin-pulp",
    icons = 
    {
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__reskins-bobs__/graphics/icons/plates/items/resin.png",
      icon_size = 64, scale = 0.25, shift = {-8, 8}}
    },
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-ba[bi-2-resin-2-pulp]",
    enabled = false,
    energy_required = 1,
    ingredients = {{type = "item", name = "bi-woodpulp", amount = 3}},
    result = "resin",
    result_count = 1,
    allow_as_intermediate = true,
    always_show_made_in = false,
    allow_decomposition = false,
},
--###############################################################################################
-- Wood from pulp
  {
    type = "recipe",
    name = "bi-wood-from-pulp",
    icons = 
    {
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__reskins-bobs__/graphics/icons/plates/items/resin.png",
      icon_size = 64, scale = 0.25, shift = {-8, 8}},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/woodpulp.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {8, 8}}
    },
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-c[bi-3-wood_from_pulp]",
    enabled = false,
    energy_required = 2.5,
    ingredients = {
       {type = "item", name = "bi-woodpulp", amount = 8},
       {type = "item", name = "resin", amount = 2},
    },
    result = "wood",
    result_count = 4,
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = false,
},
--###############################################################################################
-- Wood Fuel Brick
  {
    type = "recipe",
    name = "bi-wood-fuel-brick",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-bx[bi-4-woodbrick]",
    energy_required = 2,
    ingredients = {{"bi-woodpulp", 24}},
    result = "wood-bricks",
    result_count = 1,
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = false,
    allow_decomposition = true,
},
--###############################################################################################
-- ASH
  {
    type = "recipe",
    name = "bi-ash-1",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/ash.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-cb[bi-5-ash-1]",
    enabled = false,
    energy_required = 3,
    ingredients = {{"wood", 5}},
    result = "bi-ash",
    result_count = 5,
    allow_as_intermediate = true,
    always_show_made_in = false,
    allow_decomposition = true,
},
--###############################################################################################
-- ASH 2
  {
    type = "recipe",
    name = "bi-ash-2",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/ash.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/woodpulp.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-ca[bi-5-ash-2]",
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = false,
    allow_decomposition = true,
    energy_required = 2.5,
    ingredients = {{"bi-woodpulp", 12}},
    result = "bi-ash",
    result_count = 6,
},
--###############################################################################################
-- CHARCOAL 1
  {
    type = "recipe",
    name = "bi-charcoal-1",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/charcoal.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/woodpulp.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-d[bi-6-charcoal-1]",
    energy_required = 15,
    ingredients = {{"bi-woodpulp", 24}},
    result = "wood-charcoal",
    result_count = 5,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
},
--###############################################################################################
-- CHARCOAL 2
  {
    type = "recipe",
    name = "bi-charcoal-2",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/charcoal.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/wood.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-d[bi-6-charcoal-2]",
    category = "biofarm-mod-smelting",
    energy_required = 20,
    ingredients = {{"wood", 20}},
    result = "wood-charcoal",
    result_count = 8,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    allow_as_intermediate = false,
},
--###############################################################################################
-- COAL 1
  {
    type = "recipe",
    name = "bi-coal-1",
    icons = 
    {
      {icon = "__base__/graphics/icons/coal.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/charcoal.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-ea[bi-6-coal-1]",
    energy_required = 20,
    ingredients = {{"wood-charcoal", 10}},
    result = "coal",
    result_count = 12,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    allow_decomposition = true,
  },
--###############################################################################################
-- COAL 2
  {
    type = "recipe",
    name = "bi-coal-2",
    icons = 
    {
      {icon = "__base__/graphics/icons/coal.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/charcoal.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/signal/bi_signal_plus.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-eb[bi-6-coal-2]",
    energy_required = 20,
    ingredients = {{"wood-charcoal", 10}},
    result = "coal",
    result_count = 16,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    allow_decomposition = true,
  },
--###############################################################################################
-- Solid Fuel
  --[[{
    type = "recipe",
    name = "bi-solid-fuel",
    icons = 
    {
      {icon = "__base__/graphics/icons/solid-fuel.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/Fuel_Brick.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-fa[bi-7-solid_fuel]",
    category = "chemistry",
    energy_required = 2,
    ingredients = {{"wood-bricks", 3}},
    result = "solid-fuel",
    result_count = 2,
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = true,
    allow_decomposition = true,
},]]
--###############################################################################################
-- Pellet-Coke from Coal -- Used to be Coke-Coal
    {
    type = "recipe",
    name = "bi-coke-coal",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/pellet_coke.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/coal.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-g[bi-8-coke-coal]-1",
    energy_required = 20,
    ingredients = {{"coal", 12}},
    result = "pellet-coke",
    result_count = 2,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    allow_decomposition = true,
  },
--###############################################################################################
-- Pellet-Coke from Solid Fuel -- Used to be Coke-Coal
{
    type = "recipe",
    name = "bi-pellet-coke",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/pellet_coke.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/solid-fuel.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-smelting",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-g[bi-8-coke-coal]-3",
    energy_required = 6,
    ingredients = {{"solid-fuel", 5}},
    result = "pellet-coke",
    result_count = 3,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    allow_decomposition = true,
},
--###############################################################################################
-- CRUSHED STONE from stone --
  {
    type = "recipe",
    name = "bi-crushed-stone-1",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/crushed-stone.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/stone.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "biofarm-mod-crushing",
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-z[bi-9-stone-crushed-1]",
    energy_required = 1.5,
    ingredients = {{"stone", 1}},
    result = "stone-crushed",
    result_count = 2,
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = true,
    allow_decomposition = true,
  },
--###############################################################################################
-- COKERY (ENTITY)
  {
    type = "recipe",
    name = "bi-cokery",
    normal = {
      enabled = false,
      energy_required = 8,
      ingredients = {
        {"stone-furnace", 3},
        {"steel-plate", 10},
      },
      result = "bi-cokery",
      result_count = 1,
      allow_as_intermediate = false, 
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {"stone-furnace", 3},
        {"steel-plate", 12},
      },
      result = "bi-cokery",
      result_count = 1,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    subgroup = "bio-bio-farm-raw-entity",
    order = "a[bi]",
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true,
  },
--###############################################################################################
  -- STONE CRUSHER (ENTITY) --
  {
    type = "recipe",
    name = "bi-stone-crusher",
    normal = {
      enabled = false,
      energy_required = 3,
      ingredients = {
        {"iron-plate", 10},
        {"steel-plate", 10},
        {"iron-gear-wheel", 5},
      },
      result = "bi-stone-crusher",
      result_count = 1,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    expensive = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {"iron-plate", 12},
        {"steel-plate", 12},
        {"iron-gear-wheel", 8},
      },
      result = "bi-stone-crusher",
      result_count = 1,
      allow_as_intermediate = false,
      always_show_made_in = false,
      allow_decomposition = true,
    },
    subgroup = "bio-bio-farm-raw-entity",
    order = "b[bi]",
    allow_as_intermediate = false,
    always_show_made_in = false,
    allow_decomposition = true,
  },
--###############################################################################################
-- fertilizer- Sulfur
  {
    type = "recipe",
    name = "bi-fertilizer-1",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__base__/graphics/icons/sulfur.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "chemistry",
    energy_required = 5,
    ingredients = {
      {type = "item", name = "sulfur", amount = 1},
      {type = "fluid", name = "nitrogen", amount = 10},
      {type = "item", name = "bi-ash", amount = 10}
    },
    results = {{type = "item", name = "fertilizer", amount = 5}},
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = true,
    allow_decomposition = true,
    subgroup = "bio-bio-farm-intermediate-product",
    order = "b[bi-fertilizer]",
    crafting_machine_tint = {
      primary = util.color("5e9347"),
      secondary = util.color("72be51"),
      tertiary = util.color("63ae42"),
      quaternary = util.color("bfba21")
    },
},
--###############################################################################################
-- Advanced fertilizer 1
  {
    type = "recipe",
    name = "bi-adv-fertilizer-1",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer_advanced.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__reskins-bobs__/graphics/icons/enemies/artifacts/alien-artifact.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "chemistry",
    energy_required = 50,
    ingredients = {
      {type = "item", name = "fertilizer", amount = 25},
      {type = "item", name = "alien-artifact", amount = 5},
    },
    results = {{type = "item", name = "bi-adv-fertilizer", amount = 50}},
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = true,
    allow_decomposition = true,
    subgroup = "bio-bio-farm-intermediate-product",
    order = "b[bi-fertilizer]-b[bi-adv-fertilizer-1]",
    crafting_machine_tint = {
      primary = util.color("FF528E"),
      secondary = util.color("EB75BF"),
      tertiary = util.color("EB737C"),
      quaternary = util.color("FF7CF1")
    },
},
--###############################################################################################
-- Advanced fertilizer 2
  {
    type = "recipe",
    name = "bi-adv-fertilizer-2",
    icons = 
    {
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fertilizer_advanced.png",
      icon_size = 64, icon_mipmaps = 4},
      {icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/icons/fluid_biomass.png",
      icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}}
    },
    category = "chemistry",
    energy_required = 50,
    ingredients = {
      {type = "item", name = "fertilizer", amount = 20},
      {type = "fluid", name = "bi-biomass", amount = 10},
      {type = "item", name = "bi-woodpulp", amount = 10},
    },
    results = {
      {type = "item", name = "bi-adv-fertilizer", amount = 20}
    },
    enabled = false,
    allow_as_intermediate = true,
    always_show_made_in = true,
    allow_decomposition = true,
    subgroup = "bio-bio-farm-intermediate-product",
    order = "b[bi-fertilizer]-b[bi-adv-fertilizer-2]",
    crafting_machine_tint = {
      primary = util.color("FF528E"),
      secondary = util.color("EB75BF"),
      tertiary = util.color("EB737C"),
      quaternary = util.color("FF7CF1")
    },
},
--###############################################################################################
})

data:extend({
  {
    type = "recipe", --drd redone
    name = "bi-production-science-pack",
    enabled = false,
    energy_required = 21,
    ingredients = 
    {
      {"electric-furnace", 1},
      {"productivity-module", 1},
      {"efficiency-module", 1},
      {"speed-module", 1},
    },
    result_count = 2,
    result = "production-science-pack"
  },
})