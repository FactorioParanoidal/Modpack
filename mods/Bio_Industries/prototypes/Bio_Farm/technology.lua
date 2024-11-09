local ICONPATH = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/"

data:extend({
--###############################################################################################
--[[{
    type = "technology",
    name = "bi-tech-bio-farming",
    icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/bi-tech-bio-farming-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-seed-1"},
      {type = "unlock-recipe", recipe = "bi-seedling-1"},
      {type = "unlock-recipe", recipe = "bi-logs-1"},
      {type = "unlock-recipe", recipe = "bi-bio-greenhouse"},
      {type = "unlock-recipe", recipe = "bi-bio-farm"},
      {type = "unlock-recipe", recipe = "bi-woodpulp"},
      {type = "unlock-recipe", recipe = "bi-resin-pulp"},
      {type = "unlock-recipe", recipe = "bi-wood-from-pulp"},
    },
    prerequisites = { "lamp"},
    unit = 
    {
      count = 25,
      ingredients = {{"automation-science-pack", 1}},
      time = 20
    },
},]]
-------------------------------------------------------------------------------------------------
--замена
{
  type = "technology",
  name = "bi-tech-bio-farming",
  icon_size = 256, icon_mipmaps = 4,
  icon = ICONPATH .. "bi-tech-bio-farming-1.png",
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-bio-greenhouse"},
    {type = "unlock-recipe", recipe = "bi-seed-1"},
    {type = "unlock-recipe", recipe = "bi-seedling-1"},
  },
  order = "[bio-farming]-a-[bio-farming-1]",
  prerequisites = {"automation",  "lamp"},
  unit = 
  {
    count = 10,
    ingredients = {{"automation-science-pack", 1}},
    time = 20
  },
},
--###############################################################################################
--[[{
    type = "technology",
    name = "bi-tech-coal-processing-1",
    localised_name = {"technology-name.bi-tech-coal-processing-1"},
    localised_description = {"technology-description.bi-tech-coal-processing-1"},
    icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/bi-tech-coal-processing-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-charcoal-1"},
      {type = "unlock-recipe", recipe = "bi-charcoal-2"},
      {type = "unlock-recipe", recipe = "bi-ash-2"},
      {type = "unlock-recipe", recipe = "bi-ash-1"},
      {type = "unlock-recipe", recipe = "bi-wood-fuel-brick"},
      {type = "unlock-recipe", recipe = "bi-seed-2"},
      {type = "unlock-recipe", recipe = "bi-seedling-2"},
      {type = "unlock-recipe", recipe = "bi-logs-2"},
      {type = "unlock-recipe", recipe = "bi-cokery"},
    },
    prerequisites = {"advanced-material-processing"},
    unit = 
    {
      count = 150,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1}},
      time = 30
    },
},]]
-------------------------------------------------------------------------------------------------
--замена
{
    type = "technology",
    name = "bi-tech-coal-processing-1",
    localised_name = {"technology-name.bi-tech-coal-processing-1"},
    localised_description = {"technology-description.bi-tech-coal-processing-1"},
    icon = ICONPATH .. "bi-tech-coal-processing-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-charcoal-1"},
      {type = "unlock-recipe", recipe = "bi-charcoal-2"},
      {type = "unlock-recipe", recipe = "bi-wood-fuel-brick"},
    },
    order = "[bi-coal-processing]-[bi-coal-processing-1]",
    prerequisites = {"advanced-material-processing", "bi-tech-ash"},
    unit = {
      count = 100,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
  },
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-coal-processing-2",
    localised_name = {"technology-name.bi-tech-coal-processing-2"},
    localised_description = {"technology-description.bi-tech-coal-processing-2"},
    icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/bi-tech-coal-processing-2.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-coal-1"},
      {type = "unlock-recipe", recipe = "bi-pellet-coke"},
      --{type = "unlock-recipe", recipe = "bi-solid-fuel"},
    },
    prerequisites = {"bi-tech-coal-processing-1", "chemical-science-pack"},
    unit = 
    {
      count = 150,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},},
      time = 35
    },
},
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-coal-processing-3",
    localised_name = {"technology-name.bi-tech-coal-processing-3"},
    localised_description = {"technology-description.bi-tech-coal-processing-3"},
    icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/bi-tech-coal-processing-3.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-coal-2"},
      {type = "unlock-recipe", recipe = "bi-coke-coal"},
    },
    prerequisites = {"bi-tech-coal-processing-2", "production-science-pack"},
    unit = 
    {
      count = 250,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},},
      time = 40
    },
},
--###############################################################################################
--[[{
    type = "technology",
    name = "bi-tech-fertilizer",
    icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/bi-tech-fertilizer.png",
    icon_size = 256, icon_mipmaps = 4,
  effects = 
    {
      {type = "unlock-recipe", recipe = "bi-liquid-air"},
      --{type = "unlock-recipe", recipe = "bi-nitrogen"},
      {type = "unlock-recipe", recipe = "bi-fertilizer-1"},
      {type = "unlock-recipe", recipe = "bi-seed-3"},
      {type = "unlock-recipe", recipe = "bi-seedling-3"},
      {type = "unlock-recipe", recipe = "bi-logs-3"},
      {type = "unlock-recipe", recipe = "bi-bio-garden"},
      {type = "unlock-recipe", recipe = "bi-purified-air-1"},
    },
    prerequisites = {"fluid-handling", "bi-tech-bio-farming"},
    unit = 
    {
      count = 250,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
      time = 30
    }
},]]
-------------------------------------------------------------------------------------------------
--замена
{
  type = "technology",
  name = "bi-tech-fertilizer",
  icon = ICONPATH .. "bi-tech-fertilizer.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    --{type = "unlock-recipe", recipe = "bi-liquid-air"},
    --{type = "unlock-recipe", recipe = "bi-nitrogen"},
    {type = "unlock-recipe", recipe = "bi-fertilizer-1"},
  },
  order = "[bi-fertilizer]-a-[fertilizer]",
  prerequisites = {"sulfur-processing", "bi-tech-ash"},
  unit = 
  {
    count = 100,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1}
    },
    time = 30
  }
},
--###############################################################################################
--[[{
      type = "technology",
      name = "bi-tech-advanced-biotechnology",
      icon = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/bi-tech-advanced-fertilizers.png",
      icon_size = 256, icon_mipmaps = 4,
      effects = 
      {
        {type = "unlock-recipe", recipe = "bi-seed-4"},
        {type = "unlock-recipe", recipe = "bi-seedling-4"},
        {type = "unlock-recipe", recipe = "bi-logs-4"},
        {type = "unlock-recipe", recipe = "bi-adv-fertilizer-2"},
        {type = "unlock-recipe", recipe = "bi-bio-reactor"},
        {type = "unlock-recipe", recipe = "bi-biomass-1"},
        {type = "unlock-recipe", recipe = "bi-purified-air-2"},
      },
      prerequisites = {"bi-tech-fertilizer"},
      unit = 
      {
        count = 200,
        ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},},
        time = 30
      }
},]]
-------------------------------------------------------------------------------------------------
--замена
{
  type = "technology",
  --name = "bi-tech-advanced-fertilizer",
  name = "bi-tech-advanced-biotechnology",
  icon = ICONPATH .. "bi-tech-advanced-fertilizers.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-adv-fertilizer-1"},
    {type = "unlock-recipe", recipe = "bi-adv-fertilizer-2"},
    --{type = "unlock-recipe", recipe = "bi-sulfur"},
  },
  order = "[bi-fertilizer]-b-[advanced-fertilizer]",
  prerequisites = {"bi-tech-biomass"},
  unit = {
    count = 225,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
}
})