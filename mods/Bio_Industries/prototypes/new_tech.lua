local ICONPATH = "__zzzparanoidal__/graphics/Bio_Industries_graphics/graphics/technology/"

--добавляем новые технологии
data:extend({
{
    type = "technology",
    name = "bi-tech-bio-farming-2",
    localised_name = {"technology-name.bi-tech-bio-farming-2"},
    localised_description = {"technology-description.bi-tech-bio-farming-2"},
    icon = ICONPATH .. "bi-tech-bio-farming-2.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
    {type = "unlock-recipe", recipe = "bi-seed-2"},
    {type = "unlock-recipe", recipe = "bi-seedling-2"},
    {type = "unlock-recipe", recipe = "bi-logs-2"},
    },
    order = "[bio-farming]-a-[bio-farming-2]",
    prerequisites = {"bi-tech-ash"},
    unit = 
    {
      count = 50,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30,
    },
},
-------------------------------------------------------------------------------------------------
{
    type = "technology",
    name = "bi-tech-bio-farming-3",
    localised_name = {"technology-name.bi-tech-bio-farming-3"},
    localised_description = {"technology-description.bi-tech-bio-farming-3"},
    icon = ICONPATH .. "bi-tech-bio-farming-3.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
        {type = "unlock-recipe", recipe = "bi-seed-3"},
        {type = "unlock-recipe", recipe = "bi-seedling-3"},
        {type = "unlock-recipe", recipe = "bi-logs-3"},
    },
    order = "[bio-farming]-a-[bio-farming-3]",
    prerequisites = {"bi-tech-bio-farming-2", "bi-tech-fertilizer"},
    unit = {
      count = 100,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 30,
    },
},
-------------------------------------------------------------------------------------------------
{
    type = "technology",
    name = "bi-tech-bio-farming-4",
    localised_name = {"technology-name.bi-tech-bio-farming-4"},
    localised_description = {"technology-description.bi-tech-bio-farming-4"},
    icon = ICONPATH .. "bi-tech-bio-farming-4.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-seed-4"},
      {type = "unlock-recipe", recipe = "bi-seedling-4"},
      {type = "unlock-recipe", recipe = "bi-logs-4"},
    },
    order = "[bio-farming]-a-[bio-farming-4]",
    prerequisites = {"bi-tech-bio-farming-3", "bi-tech-advanced-biotechnology"},
    unit = {
      count = 100,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30,
    },
},
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-timber",
    icon = ICONPATH .. "bi-tech-timber.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-bio-farm"},
      {type = "unlock-recipe", recipe = "bi-logs-1"},
      {type = "unlock-recipe", recipe = "bi-woodpulp"},
    },
    order = "[bio-farming]-b-[timber]",
    --~ prerequisites = {"bi-tech-bio-farming-1", "bi-tech-stone-crushing-1"},
    prerequisites = {"ore-crushing", "bi-tech-bio-farming"},
    unit = {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 20,
    },
},
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-ash",
    icon = ICONPATH .. "bi-tech-ash.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-cokery"},
      {type = "unlock-recipe", recipe = "bi-ash-1"},
      {type = "unlock-recipe", recipe = "bi-ash-2"},
    },
    prerequisites = {"bi-tech-timber", "steel-processing"},
    --prerequisites = {"bi-tech-timber"},
    order = "[bio-farming]-c-[ash]",
    unit = 
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}},
      time = 30,
    },
},
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-biomass",
    icon = ICONPATH .. "bi-tech-biomass.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-bio-reactor"},
      {type = "unlock-recipe", recipe = "bi-biomass-1"},
    },
    order = "[bi-biomass]-a-[biomass]",
    prerequisites = {"chemical-science-pack", "bi-tech-fertilizer"},
    unit = {
      count = 100,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30,
    },
},
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-biomass-reprocessing-1",
    localised_name = {"technology-name.bi-tech-biomass-reprocessing-1"},
    localised_description = {"technology-description.bi-tech-biomass-reprocessing-1"},
    icon = ICONPATH .. "bi-tech-biomass-reprocessing-1.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-biomass-2"},
    },
    order = "[bi-bio-fuel]-[biomass]-a-[biomass-reprocessing-1]",
    prerequisites = {"bi-tech-biomass"},
    unit = {
      count = 250,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30,
    },
},
-------------------------------------------------------------------------------------------------
{
    type = "technology",
    name = "bi-tech-biomass-reprocessing-2",
    localised_name = {"technology-name.bi-tech-biomass-reprocessing-2"},
    localised_description = {"technology-description.bi-tech-biomass-reprocessing-2"},
    icon = ICONPATH .. "bi-tech-biomass-reprocessing-2.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-biomass-3"},
    },
    order = "[bi-bio-fuel]-[biomass]-a-[biomass-reprocessing-2]",
    prerequisites = {"bi-tech-biomass-reprocessing-1"},
    unit = {
      count = 175,
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 30,
    },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-biomass-conversion",
  icon = ICONPATH .. "bi-tech-biomass-conversion.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-biomass-conversion-1"},
    {type = "unlock-recipe", recipe = "bi-biomass-conversion-2"},
    {type = "unlock-recipe", recipe = "bi-biomass-conversion-3"},
    {type = "unlock-recipe", recipe = "bi-biomass-conversion-4"},
  },
  order = "[bi-bio-fuel]-[biomass]-b-[biomass-conversion]",
  prerequisites = {"bi-tech-biomass", "lubricant"},
  unit = {
    count = 300,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-cellulose-1",
  localised_name = {"technology-name.bi-tech-cellulose-1"},
  localised_description = {"technology-description.bi-tech-cellulose-1"},
  icon = ICONPATH .. "bi-tech-cellulose-1.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-cellulose-1"},
    {type = "unlock-recipe", recipe = "bi-sulfur-angels"},
  },
  order = "[bi-bio-fuel]-[cellulose-1]",
  --~ prerequisites = {"bi-tech-biomass", "sulfur-processing"},
  prerequisites = {"bi-tech-biomass"},
  unit = {
    count = 250,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-cellulose-2",
  localised_name = {"technology-name.bi-tech-cellulose-2"},
  localised_description = {"technology-description.bi-tech-cellulose-2"},
  icon = ICONPATH .. "bi-tech-cellulose-2.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-cellulose-2"},
    {type = "unlock-recipe", recipe = "bi-plastic-2"},
    {type = "unlock-recipe", recipe = "bi-battery"},
  },
  order = "[bi-bio-fuel]-[cellulose-2]",
  --~ prerequisites = {"bi-tech-cellulose-1", "plastics", "battery"},
  prerequisites = {"bi-tech-cellulose-1", "battery"},
  unit = {
    count = 250,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-organic-plastic",
  icon = ICONPATH .. "bi-tech-bio-plastics.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    --{type = "unlock-recipe", recipe = "bi-biomass-conversion-5"},
    {type = "unlock-recipe", recipe = "bi-plastic-1"},
  },
  -- prerequisites = {"bi-tech-cellulose-1", "advanced-oil-processing", "plastics"},
  order = "[bi-bio-fuel]-[plastics]",
  prerequisites = {"bi-tech-cellulose-1", "advanced-oil-processing"},
  unit = {
    count = 175,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-bio-boiler",
  icon = ICONPATH .. "bi-tech-bio-boiler.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-bio-boiler"},
  },
  order = "[bi-bio-boiler]",
  prerequisites = {"steam-power", "concrete", "chemical-science-pack"},
  unit = {
    count = 100,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-garden-1",
  localised_name = {"technology-name.bi-tech-garden-1"},
  localised_description = {"technology-description.bi-tech-garden-1"},
  icon = ICONPATH .. "bi-tech-garden-1.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
    {
      {type = "unlock-recipe", recipe = "bi-bio-garden"},
      {type = "unlock-recipe", recipe = "bi-purified-air-0"}
    },
  order = "[bi-bio-garden]-a-[garden-1]",
  prerequisites = {"concrete"},
  unit = {
    count = 50,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 30,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-garden-2",
  localised_name = {"technology-name.bi-tech-garden-2"},
  localised_description = {"technology-description.bi-tech-garden-2"},
  icon = ICONPATH .. "bi-tech-garden-2.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-bio-garden-large"}},
  order = "[bi-bio-garden]-a-[garden-2]",
  prerequisites = {"bi-tech-garden-1", "angels-stone-smelting-2"},
  unit = {
    count = 200,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-garden-3",
  localised_name = {"technology-name.bi-tech-garden-3"},
  localised_description = {"technology-description.bi-tech-garden-3"},
  icon = ICONPATH .. "bi-tech-garden-3.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-bio-garden-huge"}},
  order = "[bi-bio-garden]-a-[garden-3]",
  prerequisites = {"bi-tech-garden-2", "angels-stone-smelting-4"},
  unit = {
    count = 270,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
name = "bi-tech-depollution-1",
localised_name = {"technology-name.bi-tech-depollution-1"},
localised_description = {"technology-description.bi-tech-depollution-1"},
icon = ICONPATH .. "bi-tech-depollution-1.png",
icon_size = 256, icon_mipmaps = 4,
effects = {{type = "unlock-recipe", recipe = "bi-purified-air-1"}},
order = "[bi-bio-garden]-b-[depollution-1]",
prerequisites = {"bi-tech-garden-1"},
unit = {
  count = 100,
  ingredients = 
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
  },
  time = 30,
},
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-depollution-2",
  localised_name = {"technology-name.bi-tech-depollution-2"},
  localised_description = {"technology-description.bi-tech-depollution-2"},
  icon = ICONPATH .. "bi-tech-depollution-2.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-purified-air-2"}},
  order = "[bi-bio-garden]-b-[depollution-3]",
  prerequisites = {"bi-tech-depollution-1", "bi-tech-advanced-biotechnology"},
  unit = {
    count = 100,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-electric-energy-super-accumulators",
  icon = ICONPATH .. "bi-tech-electric-energy-super-accumulators.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-bio-accumulator"}},
  order = "[bi-solar-additions]-a-[distribution]-a-[accumulator]",
  prerequisites = {"electric-energy-accumulators", "electric-energy-distribution-2"},
  unit = {
    count = 250,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-steamsolar-combination",
  icon = ICONPATH .. "bi-tech-steamsolar-combination.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe",recipe = "bi-solar-boiler-hidden-panel"}},
  order = "[bi-solar-additions]-b-[production]-a-[solar-boiler]",
  prerequisites = {"solar-energy", "fluid-handling", "angels-electric-boiler"},
  unit = {
    count = 150,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 30,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-super-solar-panels",
  icon = ICONPATH .. "bi-tech-super-solar-panels.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-bio-solar-farm"}},
  order = "[bi-solar-additions]-b-[production]-b-[solar-farm]",
  prerequisites = {"bob-solar-energy-3"},
  unit = {
    count = 200,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-huge-substation",
  icon = ICONPATH .. "bi-tech-huge-substation.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-large-substation"}},
  order = "[bi-solar-additions]-a-[distribution]-b-[substation]",
  prerequisites = {"electric-substation-4"},
  unit = {
    count = 325,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-stone-crushing-1",
  localised_name = {"technology-name.bi-tech-stone-crushing-1"},
  localised_description = {"technology-description.bi-tech-stone-crushing-1"},
  icon = ICONPATH .. "bi-tech-stone-crushing-1.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = 
  {
    {type = "unlock-recipe", recipe = "bi-stone-crusher"},
    {type = "unlock-recipe", recipe = "bi-crushed-stone-1"},
    {type = "unlock-recipe", recipe = "bi-sand"},
  },
  order = "[bi-stone-crushing]-a-[bi-stone-crushing-1]",
  prerequisites = {"steel-processing"},
  unit = {
    count = 75,
    ingredients = {{"automation-science-pack", 1}},
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-wooden-storage-1",
  localised_name = {"technology-name.bi-tech-wooden-storage-1"},
  localised_description = {"technology-description.bi-tech-wooden-storage-1"},
  icon = ICONPATH .. "bi-tech-wooden-storage-1.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-wooden-chest-large"}},
  order = "[wooden-storage]-a-[wooden-storage-1]",
  prerequisites = {"logistics"},
  unit = {
    count = 10,
    ingredients = {{"automation-science-pack", 1}},
    time = 10,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-wooden-storage-2",
  localised_name = {"technology-name.bi-tech-wooden-storage-2"},
  localised_description = {"technology-description.bi-tech-wooden-storage-2"},
  icon = ICONPATH .. "bi-tech-wooden-storage-2.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-wooden-chest-huge"}},
  order = "[wooden-storage]-a-[wooden-storage-2]",
  prerequisites = {"bi-tech-wooden-storage-1", "logistics-2"},
  unit = {
    count = 30,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 20,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-wooden-storage-3",
  localised_name = {"technology-name.bi-tech-wooden-storage-3"},
  localised_description = {"technology-description.bi-tech-wooden-storage-3"},
  icon = ICONPATH .. "bi-tech-wooden-storage-3.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-wooden-chest-giga"}},
  order = "[wooden-storage]-a-[wooden-storage-3]",
  prerequisites = {"bi-tech-wooden-storage-2", "logistics-3", "concrete"},
  unit = {
    count = 50,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
-- Large poles
{
  type = "technology",
  name = "bi-tech-wooden-pole-1",
  localised_name = {"technology-name.bi-tech-wooden-pole-1"},
  localised_description = {"technology-description.bi-tech-wooden-pole-1"},
  icon = ICONPATH .. "bi-tech-wooden-pole-1.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-wooden-pole-big"}},
  order = "[wooden-pole]-a-[wooden-pole-1]",
  prerequisites = { "lamp"},
  unit = 
  {
    count = 10,
    ingredients = {{"automation-science-pack", 1}},
    time = 10,
  },
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-wooden-pole-2",
  localised_name = {"technology-name.bi-tech-wooden-pole-2"},
  localised_description = {"technology-description.bi-tech-wooden-pole-2"},
  icon = ICONPATH .. "bi-tech-wooden-pole-2.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-wooden-pole-huge"}},
  order = "[wooden-pole]-a-[wooden-pole-2]",
  prerequisites = {"electric-energy-distribution-2", "bi-tech-wooden-pole-1"},
  unit = {
    count = 50,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  },
},
--###############################################################################################
{
  type = "technology",
  name = "bi-tech-darts-1",
  localised_name = {"technology-name.bi-tech-darts-1"},
  localised_description = {"technology-description.bi-tech-darts-1"},
  icon = ICONPATH .. "bi-tech-darts-1.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-dart-magazine-standard"}},
  order = "[bio-ammo]-aa-[darts-1]",
  prerequisites = {"military"},
  unit = {
    count = 50,
    ingredients = {{"automation-science-pack", 1}},
    time = 30,
  }
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-darts-2",
  localised_name = {"technology-name.bi-tech-darts-2"},
  localised_description = {"technology-description.bi-tech-darts-2"},
  icon = ICONPATH .. "bi-tech-darts-2.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-dart-magazine-enhanced"}},
  order = "[bio-ammo]-aa-[darts-2]",
  prerequisites = {"bi-tech-darts-1", "plastics"},
  unit = {
    count = 225,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 30,
  }
},
-------------------------------------------------------------------------------------------------
{
  type = "technology",
  name = "bi-tech-darts-3",
  localised_name = {"technology-name.bi-tech-darts-3"},
  localised_description = {"technology-description.bi-tech-darts-3"},
  icon = ICONPATH .. "bi-tech-darts-3.png",
  icon_size = 256, icon_mipmaps = 4,
  effects = {{type = "unlock-recipe", recipe = "bi-dart-magazine-poison"}},
  order = "[bio-ammo]-aa-[darts-3]",
  prerequisites = {"bi-tech-darts-2", "military-3"},
  unit = {
    count = 120,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"military-science-pack", 1},
      {"chemical-science-pack", 1},
    },
    time = 30,
  }
},
--###############################################################################################
{
    type = "technology",
    name = "bi-tech-resin-extraction",
    icon = ICONPATH .. "bi-tech-resin-extraction.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = 
    {
      {type = "unlock-recipe", recipe = "bi-resin-pulp"},
      --{type = "unlock-recipe", recipe = "bi-resin-wood"},
      {type = "unlock-recipe", recipe = "bi-wood-from-pulp"},
    },
    order = "[bi-rubber]-a-[resin-extraction]",
    prerequisites = {"bi-tech-timber"},
    unit = 
    {
      count = 15,
      ingredients = {{"automation-science-pack", 1}},
      time = 20,
    },
},
})