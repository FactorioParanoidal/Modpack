--Clear Science Pack Recipes
if mods.bobplates and mods.bobtech then
data.raw.recipe["automation-science-pack"].ingredients = {
    {"iron-gear-wheel",1},
    {"copper-plate",2}
}

data.raw.recipe["logistic-science-pack"].result_count = 2
data.raw.recipe["logistic-science-pack"].ingredients = {
    {"fast-inserter",1},
    {"small-electric-pole",1}
}

data.raw.recipe["chemical-science-pack"].ingredients = {
    {"advanced-circuit",4},
    --{"steel-axe",2},
    {"gold-plate",4},
    {"aluminium-plate",4}
}

data.raw.recipe["military-science-pack"].ingredients = {
    {"gunmetal-alloy",4},
    {"invar-alloy",3},
    {"grenade",1}
}

--[[
data.raw.recipe["logistic-science-pack"].ingredients = {
    --{"car", 1},
    {"express-transport-belt", 1},
    {"flying-robot-frame", 1},
    {"brass-chest", 1}
}
]]

data.raw.recipe["production-science-pack"].ingredients = {
    {"bob-pump-4",2},
    --{"cobalt-axe",1},
    {"processing-unit",4},
    {"ruby-5",2},
    {"sapphire-5",2}
}
data.raw.recipe["utility-science-pack"].energy_required = 28
data.raw.recipe["utility-science-pack"].result_count = 4
data.raw.recipe["utility-science-pack"].ingredients = {
    {"angels-wire-silver",30},
    --{"tungsten-pipe-to-ground",2},
    --{"electrum-alloy",8},
    --{"advanced-processing-unit",4},
    {"uranium-238",5},
    {"rubber",10},
    {"bob-mining-drill-4",1},
}

data.raw.recipe["rocket-control-unit"].ingredients = {
    {"advanced-processing-unit",1},
    {"productivity-module-2",1}
}
if mods.bobtech then
data.raw.recipe["lab-2"].ingredients = {
    {"turbo-bulk-inserter", 10},
    {"turbo-transport-belt", 10},
    {"processing-unit", 25},
    {"lab", 2}
}
end
if data.raw.recipe["automation-science-pack"].normal then
--Clear Science Pack Recipes
data.raw.recipe["automation-science-pack"].normal.ingredients = {
    {"iron-gear-wheel",1},
    {"copper-plate",2}
}

data.raw.recipe["logistic-science-pack"].normal.result_count = 2
data.raw.recipe["logistic-science-pack"].normal.ingredients = {
    {"fast-inserter",1},
    {"small-electric-pole",1}
}

data.raw.recipe["chemical-science-pack"].normal.ingredients = {
    {"advanced-circuit",4},
    --{"steel-axe",2},
    {"gold-plate",4},
    {"aluminium-plate",4}
}

data.raw.recipe["military-science-pack"].normal.ingredients = {
    {"gunmetal-alloy",4},
    {"invar-alloy",3},
    {"grenade",1}
}

--[[ data.raw.recipe["logistic-science-pack"].normal.ingredients = {
    --{"car", 1},
    {"express-transport-belt", 1},
    {"flying-robot-frame", 1},
    {"brass-chest", 1}
}
]]

data.raw.recipe["production-science-pack"].normal.ingredients = {
    {"bob-pump-4",2},
    --{"cobalt-axe",1},
    {"processing-unit",4},
    {"ruby-5",2},
    {"sapphire-5",2}
}
data.raw.recipe["utility-science-pack"].normal.energy_required = 28
data.raw.recipe["utility-science-pack"].normal.result_count = 4
data.raw.recipe["utility-science-pack"].normal.ingredients = {
    {"angels-wire-silver",30},
    {"tungsten-pipe-to-ground",2},
    {"electrum-alloy",8},
    {"advanced-processing-unit",4},
    {"uranium-238",5},
    {"rubber",10},
    --{"bob-mining-drill-4",1},
}
data.raw.recipe["rocket-control-unit"].ingredients = {
    {"advanced-processing-unit",1},
    {"productivity-module-2",1}
}
end
end
--Technology
--Make Lazy Bastard Possible
if mods["aai-industry"] then
  data.raw.technology["basic-automation"].unit = {count=1,ingredients={{"automation-science-pack",1}},time=60}
  data.raw.technology["basic-logistics"].unit = {count=10,ingredients={{"automation-science-pack",1}},time=30}
  data.raw.lab["burner-lab"].inputs = {"automation-science-pack"}
end

if mods["miniloader"] then
	data.raw.technology["basic-miniloader"].unit = {count=250,ingredients={{"automation-science-pack",1}},time=60}
	data.raw.technology["miniloader"].unit = {count=500,ingredients={{"automation-science-pack",1}},time=60}
	data.raw.technology["fast-miniloader"].unit = {count=1000,ingredients={{"automation-science-pack",1},{"logistic-science-pack", 1}},time=60}
	data.raw.technology["express-miniloader"].unit = {count=2000,ingredients={{"automation-science-pack",1},{"logistic-science-pack", 2},{"chemical-science-pack", 1}},time=60}
	data.raw.technology["turbo-miniloader"].unit = {count=3000,ingredients={{"automation-science-pack",1},{"logistic-science-pack", 2},{"chemical-science-pack", 1},{"advanced-logistic-science-pack", 1}},time=60}
	data.raw.technology["ultimate-miniloader"].unit = {count=5000,ingredients={{"automation-science-pack",1},{"logistic-science-pack", 3},{"chemical-science-pack", 1},{"production-science-pack", 1},{"advanced-logistic-science-pack", 2},{"utility-science-pack", 1}},time=60}
end

if mods.bobelectronics then
data.raw.technology["advanced-electronics-3"].unit =
{
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 100
}
end

--Require Lab Mk2 for High tech and Space science
if mods.angelsbioprocessing then
data.raw.lab["lab"].inputs = {"automation-science-pack","logistic-science-pack","chemical-science-pack","military-science-pack","utility-science-pack","production-science-pack","advanced-logistic-science-pack","token-bio"}
else
data.raw.lab["lab"].inputs = {"automation-science-pack","logistic-science-pack","chemical-science-pack","military-science-pack","utility-science-pack","production-science-pack","advanced-logistic-science-pack"}
end
if data.raw.lab["burner-lab"] then data.raw.lab["burner-lab"].energy_usage = "1500kW" end
data.raw.lab["lab"].energy_usage = "2500kW"
data.raw.lab["lab-2"].energy_usage = "5000kW"
data.raw.lab["lab-module"].energy_usage = "3500kW"
--data.raw.lab["big-lab"].energy_usage = "250MW"

--Reorder the dependancies of science packs
-- bobmods.lib.tech.add_recipe_unlock("processing-unit", "production-science-pack")
-- bobmods.lib.tech.add_recipe_unlock("advanced-electronics-3", "utility-science-pack")
-- bobmods.lib.tech.remove_recipe_unlock("processing-unit","utility-science-pack")
-- bobmods.lib.tech.remove_recipe_unlock("advanced-material-processing-2","production-science-pack")

-- data.raw.technology["advanced-research"].prerequisites = {"processing-unit","bob-logistics-4"}
-- bobmods.lib.tech.add_new_science_pack("advanced-research","production-science-pack",1)
-- bobmods.lib.tech.add_new_science_pack("advanced-research","logistic-science-pack",1)
-- data.raw.technology["advanced-electronics-3"].prerequisites = {"processing-unit","advanced-research"}

if mods.SpaceMod then
bobmods.lib.tech.add_new_science_pack("spaceship-command","military-science-pack",1)
bobmods.lib.tech.add_new_science_pack("ftl-theory-D","military-science-pack",1)
bobmods.lib.tech.add_new_science_pack("ftl-propulsion","military-science-pack",1)
end
