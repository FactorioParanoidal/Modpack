local recipe = data.raw.recipe
local technology = data.raw.technology

local function add_delivery(material)
  local delivery = util.table.deepcopy(recipe["iron-delivery"])
  delivery.name = material .. "-delivery"
  delivery.result = material

  data:extend({delivery})
end

local refurbish_chance = settings.startup["ERPTbaAB-refurbish-chance"].value

recipe["advanced-assembler"].ingredients = {
  {"assembling-machine-6", 50},
  {"advanced-processing-unit", 200},
  -- {concrete, 400},
  {"nitinol-alloy", 200},
  -- {stack_inserter, 10},
  {"titanium-plate", 400}
}

recipe["autonomous-space-mining-drone"].ingredients = {
  {"assembling-machine-6", 100},
  -- {"bob-mining-drill-4", 1000},
  {"rocket-fuel", 200},
  {"radioisotope-thermoelectric-generator", 100},
  {"satellite-bus", 30},
  {"satellite-communications", 1},
  {"satellite-flight-computer", 50},
  {"satellite-radar", 10},
  {"satellite-thruster", 10}
  -- {"bulk-inserter", 100}
}

recipe["ground-auto-fabricator"].ingredients = {{"ground-fabricator-component", 10}}

recipe["ground-telescope"].ingredients = {
  -- {"concrete", 1000},
  {"electric-engine-unit", 1000},
  {"nitinol-alloy", 1000},
  {"processing-unit", 500},
  {"telescope-components", 1},
  {"titanium-plate", 1000},
  {"tungsten-pipe", 1000}
}

recipe["orbital-fabricator-component"].ingredients = {
  {"advanced-assembler", 100},
  -- {"angel-chemical-plant-4", 100},
  {"autonomous-space-mining-drone", 10},
  -- {"centrifuge", 250},
  {"electric-furnace-3", 500},
  {"oil-refinery-4", 50},
  {"satellite-bus", 200},
  {"satellite-communications", 500},
  {"satellite-flight-computer", 250}
  -- {"bulk-inserter", 500},
}

recipe["radioisotope-thermoelectric-generator"].ingredients = {
  {"insulated-cable", 500},
  {"rocket-control-unit", 100},
  {"titanium-plate", 100},
  {"uranium-fuel-cell", 100}
}

recipe["refurbish-fabricator-shuttle"].ingredients = {
  {type = "fluid", name = "water", amount = 20000},
  {"landed-fabricator-shuttle", 1},
  {"orbital-fabricator-component", 1},
  {"rocket-fuel", 2000}
  -- {"stone-brick", 5000}
}
recipe["refurbish-fabricator-shuttle"].results = {
  {
    name = "fabricator-shuttle",
    amount = 1,
    probability = settings.startup["ERPTbaAB-refurbish-not-guaranteed"].value and refurbish_chance or 1
  },
  {"ground-fabricator-component", 1}
}

recipe["refurbish-mining-shuttle"].ingredients = {
  {type = "fluid", name = "water", amount = 20000},
  {"landed-mining-shuttle", 1},
  {"rocket-fuel", 2000}
  -- {"stone-brick", 2000}
}

recipe["refurbish-mining-shuttle"].results = {
  {
    name = "mining-shuttle",
    amount = 1,
    probability = settings.startup["ERPTbaAB-refurbish-not-guaranteed"].value and refurbish_chance or 1
  },
  {"random-dropship", 20000}
}

recipe["refurbish-space-shuttle"].ingredients = {
  {type = "fluid", name = "water", amount = 20000},
  {"landed-shuttle", 1},
  {"rocket-fuel", 1000},
  {"space-lab-payload", 1}
  -- {"stone-brick", 500}
}

recipe["refurbish-space-shuttle"].results = {
  {"station-science", 2},
  {
    name = "space-shuttle",
    amount = 1,
    probability = settings.startup["ERPTbaAB-refurbish-not-guaranteed"].value and refurbish_chance or 1
  }
}

recipe["refurbish-spy-shuttle"].ingredients = {
  {type = "fluid", name = "water", amount = 20000},
  {"landed-spy-shuttle", 1},
  {"rocket-fuel", 1000}
  -- {"stone-brick", 1000},
}
recipe["refurbish-spy-shuttle"].results = {
  {
    name = "spy-shuttle",
    amount = 1,
    probability = settings.startup["ERPTbaAB-refurbish-not-guaranteed"].value and refurbish_chance or 1
  },
  {"planetary-data", 2}
}

recipe["satellite-battery"].ingredients = {
  {"insulated-cable", 100},
  {"large-accumulator-3", 150},
  {"rocket-control-unit", 10},
  {"power-switch", 1}
}

recipe["satellite-bus"].ingredients = {
  {"electric-engine-unit", 50},
  {"gilded-copper-cable", 1000},
  {"low-density-structure", 200}
}

recipe["satellite-communications"].ingredients = {
  -- {"beacon-3", 5},
  -- {"bob-roboport-4", 5},
  {"electric-engine-unit", 10},
  {"low-density-structure", 20},
  {"rocket-control-unit", 10}
}

recipe["satellite-flight-computer"].ingredients = {
  {"advanced-processing-unit", 300},
  {"green-wire", 500},
  {"red-wire", 500},
  {"rocket-control-unit", 100}
}

recipe["satellite-radar"].ingredients = {
  {"electric-engine-unit", 10},
  {"low-density-structure", 20},
  -- {"radar-5", 100},
  {"rocket-control-unit", 30}
}

recipe["satellite-solar-array"].ingredients = {
  {"electric-engine-unit", 10},
  {"gilded-copper-cable", 400},
  {"insulated-cable", 500},
  {"low-density-structure", 10},
  {"power-switch", 1},
  {"solar-panel-3", 10}
}

recipe["satellite-thruster"].ingredients = {
  -- {"electric-engine-unit", 100},
  -- {"engine-unit", 100},
  {"low-density-structure", 50},
  {"rocket-control-unit", 10},
  {"rocket-fuel", 200}
}

recipe["shuttle-hull-recipe"].ingredients = {
  {"satellite-battery", 40},
  {"satellite-bus", 70},
  {"satellite-communications", 20},
  {"satellite-flight-computer", 50},
  {"satellite-radar", 30},
  {"satellite-solar-array", 50},
  {"plastic-bar", 10000}
  -- {"stone-brick", 50000}
}

recipe["space-lab-payload"].ingredients = {
  -- {"lab-2", 200},
  {"satellite-bus", 1},
  {"satellite-battery", 1},
  {"satellite-communications", 1},
  {"satellite-flight-computer", 1},
  {"satellite-solar-array", 1}
}

recipe["telescope-components"].ingredients = {
  {"electric-engine-unit", 50},
  -- {"lab-2", 100},
  {"low-density-structure", 100},
  -- {"radar-5", 2000},
  {"satellite-flight-computer", 10}
  -- {stone-brick, 10000},
}

bobmods.lib.tech.add_recipe_unlock("asteroid-mining", "random-dropship-unboxing")

bobmods.lib.tech.remove_recipe_unlock("asteroid-mining", "copper-dropship-unboxing")
bobmods.lib.tech.remove_recipe_unlock("asteroid-mining", "iron-dropship-unboxing")

data.raw["assembling-machine"]["advanced-assembler"].crafting_categories = {"satellite-crafting"}
data.raw["assembling-machine"]["ground-auto-fabricator"].energy_usage = "1GW"

add_delivery("aluminium-plate")
add_delivery("titanium-plate")

bobmods.lib.tech.add_recipe_unlock("orbital-autonomous-fabricators", "aluminium-plate-delivery")
bobmods.lib.tech.add_recipe_unlock("orbital-autonomous-fabricators", "titanium-plate-delivery")

recipe["aluminium-plate-delivery"].order = "b1"
recipe["copper-delivery"].order = "b2"
recipe["iron-delivery"].order = "b3"
recipe["steel-delivery"].order = "b4"
recipe["stone-delivery"].order = "b5"
recipe["titanium-plate-delivery"].order = "b6"
recipe["uranium-delivery"].order = "b7"

if mods["angelspetrochem"] and settings.startup["ERPTbaAB-use-petrochem-buildings"].value then
  table.insert(recipe["orbital-fabricator-component"].ingredients, {"angels-chemical-plant-4", 100})
else
  table.insert(recipe["orbital-fabricator-component"].ingredients, {"chemical-plant-4", 10})
end

if mods["angelsrefining"] and settings.startup["ERPTbaAB-give-refining-ores"].value then
  recipe["random-dropship-unboxing"].results = {
    {name = "angels-ore1", amount = 30, probability = 0.50},
    {name = "angels-ore1", amount = 10, probability = 0.30},
    {name = "angels-ore1", amount = 40, probability = 0.05},
    {name = "angels-ore3", amount = 20, probability = 0.35},
    {name = "angels-ore3", amount = 50, probability = 0.05},
    {name = "angels-ore6", amount = 30, probability = 0.20},
    {name = "angels-ore6", amount = 50, probability = 0.05},
    {name = "angels-ore5", amount = 20, probability = 0.25},
    {name = "angels-ore5", amount = 40, probability = 0.05},
    {name = "angels-ore4", amount = 10, probability = 0.10},
    {name = "angels-ore4", amount = 30, probability = 0.05},
    {name = "angels-ore2", amount = 15, probability = 0.15},
    {name = "angels-ore2", amount = 30, probability = 0.01},
    mods["angelssmelting"] and {name = "platinum-ore", amount = 1, probability = 0.01},
    mods["angelssmelting"] and {name = "platinum-ore", amount = 5, probability = 0.001}
  }
end

if mods["bobinserters"] and settings.startup["ERPTbaAB-use-bobinserters"].value then
  table.insert(recipe["advanced-assembler"].ingredients, {"express-bulk-inserter", 10})
  table.insert(recipe["autonomous-space-mining-drone"].ingredients, {"express-stack-filter-inserter", 100})
  table.insert(recipe["orbital-fabricator-component"].ingredients, {"express-stack-filter-inserter", 500})
else
  table.insert(recipe["advanced-assembler"].ingredients, {"bulk-inserter", 10})
  table.insert(recipe["autonomous-space-mining-drone"].ingredients, {"bulk-inserter", 100})
  table.insert(recipe["orbital-fabricator-component"].ingredients, {"bulk-inserter", 500})
end

if mods["boblogistics"] and not settings.startup["bobmods-logistics-disableroboports"].value then
  table.insert(recipe["satellite-communications"].ingredients, {"bob-roboport-4", 5})
else
  table.insert(recipe["satellite-communications"].ingredients, {"bob-robochest-4", 4})
  table.insert(recipe["satellite-communications"].ingredients, {"bob-logistic-zone-expander-4", 4})
  table.insert(recipe["satellite-communications"].ingredients, {"bob-robo-charge-port-large-4", 3})
end

if mods["bobmodules"] then
  table.insert(recipe["satellite-communications"].ingredients, {"beacon-3", 5})
else
  table.insert(recipe["satellite-communications"].ingredients, {"beacon", 15})
end

if mods["bobrevamp"] and settings.startup["ERPTbaAB-use-heat-shield-tile"].value then
  table.insert(recipe["shuttle-hull-recipe"].ingredients, {"heat-shield-tile", 25000})
  table.insert(recipe["refurbish-fabricator-shuttle"].ingredients, {"heat-shield-tile", 2500})
  table.insert(recipe["refurbish-mining-shuttle"].ingredients, {"heat-shield-tile", 1000})
  table.insert(recipe["refurbish-space-shuttle"].ingredients, {"heat-shield-tile", 250})
  table.insert(recipe["refurbish-spy-shuttle"].ingredients, {"heat-shield-tile", 500})
else
  table.insert(recipe["shuttle-hull-recipe"].ingredients, {"stone-brick", 50000})
  table.insert(recipe["refurbish-mining-shuttle"].ingredients, {"stone-brick", 2000})
  table.insert(recipe["refurbish-space-shuttle"].ingredients, {"stone-brick", 500})
  table.insert(recipe["refurbish-spy-shuttle"].ingredients, {"stone-brick", 1000})
end

if mods["bobtech"] and not mods["Sandros-fixes"] then
  local lab = data.raw["lab"]
  if lab["lab-2"] then
    table.insert(lab["lab-2"].inputs, "planetary-data")
    table.insert(lab["lab-2"].inputs, "station-science")
  end

  table.insert(recipe["space-lab-payload"].ingredients, {"lab-2", 200})
  table.insert(recipe["telescope-components"].ingredients, {"lab-2", 100})
else
  table.insert(recipe["space-lab-payload"].ingredients, {"lab", 200})
  table.insert(recipe["telescope-components"].ingredients, {"lab", 100})
end

if mods["bobwarfare"] and recipe["radar-5"] then
  table.insert(recipe["satellite-radar"].ingredients, {"radar-5", 100})
  table.insert(recipe["telescope-components"].ingredients, {"radar-5", 2000})
else
  table.insert(recipe["satellite-radar"].ingredients, {"radar", 100})
  table.insert(recipe["telescope-components"].ingredients, {"radar", 2000})
end

if mods["bobvehicleequipment"] then
  table.insert(recipe["satellite-thruster"].ingredients, {"vehicle-motor", 5})
else
  table.insert(recipe["satellite-thruster"].ingredients, {"engine-unit", 150})
  table.insert(recipe["satellite-thruster"].ingredients, {"electric-engine-unit", 150})
end

if mods["Clowns-AngelBob-Nuclear"] then
  local thorium = util.table.deepcopy(recipe["radioisotope-thermoelectric-generator"])
  thorium.name = "radioisotope-thermoelectric-generator-thorium"
  thorium.ingredients = {
    {"thorium-fuel-cell", 100},
    {"insulated-cable", 500},
    {"rocket-control-unit", 100},
    {"titanium-plate", 100}
  }

  data:extend({thorium})

  table.insert(
    technology["extremely-advanced-material-processing"].effects,
    {type = "unlock-recipe", recipe = "radioisotope-thermoelectric-generator-thorium"}
  )
end

if mods["Clowns-Processing"] then
  table.insert(recipe["orbital-fabricator-component"].ingredients, {"centrifuge-mk3", 250})
else
  table.insert(recipe["orbital-fabricator-component"].ingredients, {"centrifuge", 250})
end

if mods["extendedangels"] and settings.startup["ERPTbaAB-use-titanium-concrete"].value then
  table.insert(recipe["advanced-assembler"].ingredients, {"titanium-concrete-brick", 400})
  table.insert(recipe["ground-telescope"].ingredients, {"titanium-concrete-brick", 1000})
  table.insert(recipe["telescope-components"].ingredients, {"titanium-concrete-brick", 10000})
elseif mods["angelssmelting"] and mods["angelspetrochem"] then
  table.insert(recipe["advanced-assembler"].ingredients, {"reinforced-concrete-brick", 400})
  table.insert(recipe["ground-telescope"].ingredients, {"reinforced-concrete-brick", 1000})
  table.insert(recipe["telescope-components"].ingredients, {"reinforced-concrete-brick", 10000})
else
  table.insert(recipe["advanced-assembler"].ingredients, {"refined-concrete", 400})
  table.insert(recipe["ground-telescope"].ingredients, {"refined-concrete", 1000})
  table.insert(recipe["telescope-components"].ingredients, {"refined-concrete", 10000})
end

if mods["MoreScience"] then
  table.insert(data.raw["lab"]["lab"].inputs, "planetary-data")
  table.insert(data.raw["lab"]["lab"].inputs, "station-science")
  table.insert(data.raw["lab"]["lab-mk2"].inputs, "planetary-data")
  table.insert(data.raw["lab"]["lab-mk2"].inputs, "station-science")
end

if mods["Orbital Ion Cannon"] then
  bobmods.lib.tech.add_prerequisite("orbital-ion-cannon", "robot-global-positioning-system-1")
  bobmods.lib.tech.remove_prerequisite("orbital-ion-cannon", "rocket-silo")

  technology["auto-targeting"].unit.count = 25000
  technology["orbital-ion-cannon"].unit.count = 20000
end

if mods["pyhightech"] then
  add_delivery("rare-earth-ore")
  bobmods.lib.tech.add_recipe_unlock("orbital-autonomous-fabricators", "rare-earth-ore")
  recipe["rare-earth-ore-delivery"].order = "b51"
end

-- SeaBlock has no mining drills and I couldn't activate them
if mods["SeaBlock"] then
  table.insert(recipe["autonomous-space-mining-drone"].ingredients, {"electric-mining-drill", 1000})
else
  table.insert(recipe["autonomous-space-mining-drone"].ingredients, {"bob-mining-drill-4", 1000})
end

if mods["SpaceMod"] and settings.startup["ERPTbaAB-integrate-spacex"].value then
  bobmods.lib.tech.add_prerequisite("fusion-reactor", "orbital-assembler-power-problem")
  bobmods.lib.tech.add_prerequisite("orbital-ai-core", "ftl-propulsion")
  bobmods.lib.tech.add_prerequisite("orbital-autonomous-fabricators", "space-station-assembly")
  bobmods.lib.tech.add_prerequisite("space-assembly", "space-assembler-theory")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "astrometrics")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "fuel-cells")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "fusion-reactor")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "habitation")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "life-support-systems")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "protection-fields")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "space-casings")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "space-thrusters")
  bobmods.lib.tech.add_prerequisite("space-station-assembly", "spaceship-command")
  bobmods.lib.tech.add_prerequisite("spy-shuttle", "space-telescope")

  bobmods.lib.tech.remove_prerequisite("space-assembly", "rocket-silo")
  bobmods.lib.tech.remove_prerequisite("space-station-assembly", "extremely-advanced-rocket-payloads")

  table.insert(technology["space-assembly"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["space-assembly"].unit.ingredients, {"utility-science-pack", 1})
  table.insert(technology["space-casings"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["space-casings"].unit.ingredients, {"utility-science-pack", 1})
  table.insert(technology["space-construction"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["space-construction"].unit.ingredients, {"utility-science-pack", 1})
  table.insert(technology["protection-fields"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["fusion-reactor"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["space-thrusters"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["space-thrusters"].unit.ingredients, {"utility-science-pack", 1})
  table.insert(technology["fuel-cells"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["habitation"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["life-support-systems"].unit.ingredients, {"space-science-pack", 1})
  table.insert(technology["spaceship-command"].unit.ingredients, {"space-science-pack", 1})

  if mods["angelsbioprocessing"] then
    -- log(serpent.block(recipe["life-support"]))
    -- log(serpent.block(recipe["temperate-5-seed"]))
    if recipe["life-support"].ingredients == nil then
      table.insert(recipe["life-support"].normal.ingredients, {"desert-5-seed", 50})
      table.insert(recipe["life-support"].normal.ingredients, {"swamp-5-seed", 50})
      table.insert(recipe["life-support"].normal.ingredients, {"temperate-5-seed", 50})
      table.insert(recipe["life-support"].expensive.ingredients, {"desert-5-seed", 100})
      table.insert(recipe["life-support"].expensive.ingredients, {"swamp-5-seed", 100})
      table.insert(recipe["life-support"].expensive.ingredients, {"temperate-5-seed", 100})
    else
      table.insert(recipe["life-support"].ingredients, {"desert-5-seed", 50})
      table.insert(recipe["life-support"].ingredients, {"swamp-5-seed", 50})
      table.insert(recipe["life-support"].ingredients, {"temperate-5-seed", 50})
    end
  end

  if mods["bobrevamp"] and settings.startup["ERPTbaAB-use-heat-shield-tile"].value then
    local productionCost = settings.startup["SpaceX-production"].value
    if productionCost == nil then
      productionCost = 1
    end
    recipe["hull-component"].ingredients = {
      {"low-density-structure", 250 * productionCost},
      {"heat-shield-tile", 100 * productionCost}
    }
  end
end

if mods["tater_spacestation"] then
  bobmods.lib.tech.add_prerequisite("planet-to-space-transportation", "space-station-assembly")
  bobmods.lib.tech.remove_prerequisite("planet-to-space-transportation", "rocket-silo")
  bobmods.lib.tech.replace_prerequisite("space-automation", "automation-3", "automation-6")

  table.insert(technology["planet-to-space-transportation"].unit.ingredients, {"logistic-science-pack", 1})
  table.insert(technology["space-automation"].unit.ingredients, {"utility-science-pack", 1})
  table.insert(technology["space-automation"].unit.ingredients, {"logistic-science-pack", 1})
  table.insert(technology["space-automation"].unit.ingredients, {"military-science-pack", 1})
  table.insert(technology["space-automation"].unit.ingredients, {"space-science-pack", 1})

  technology["planet-to-space-transportation"].unit.count = 200000
  technology["space-automation"].unit.count = 200000

  recipe["space-assembling-machine"].ingredients = {
    {"advanced-processing-unit", 200},
    {"assembling-machine-6", 5},
    {"low-density-structure", 10},
    {"nitinol-alloy", 200},
    {"titanium-plate", 400}
    -- {concrete, 400}
    -- {stack_inserter, 10}
  }
  recipe["space-elevator"].ingredients = {
    {"advanced-processing-unit", 200},
    {"electric-engine-unit", 100},
    {"low-density-structure", 1000},
    {"nitinol-alloy", 200},
    {"satellite", 4},
    {"titanium-plate", 400}
  }
  recipe["space-energy-input"].ingredients = {
    {"advanced-processing-unit", 100},
    {"large-accumulator-3", 10},
    {"low-density-structure", 100},
    {"titanium-plate", 200}
  }
  recipe["space-energy-output"].ingredients = {
    {"advanced-processing-unit", 100},
    {"large-accumulator-3", 5},
    {"low-density-structure", 100},
    {"titanium-plate", 200}
  }
  recipe["space-station-tile"].result_count = 5

  if mods["bobinserters"] and settings.startup["ERPTbaAB-use-bobinserters"].value then
    table.insert(recipe["space-assembling-machine"].ingredients, {"express-bulk-inserter", 10})
  else
    table.insert(recipe["space-assembling-machine"].ingredients, {"bulk-inserter", 10})
  end

  if mods["extendedangels"] and settings.startup["ERPTbaAB-use-titanium-concrete"].value then
    table.insert(recipe["space-assembling-machine"].ingredients, {"titanium-concrete-brick", 400})
  elseif mods["angelsrefining"] and mods["angelspetrochem"] then
    table.insert(recipe["space-assembling-machine"].ingredients, {"reinforced-concrete-brick", 400})
  else
    table.insert(recipe["space-assembling-machine"].ingredients, {"refined-concrete", 400})
  end
end
