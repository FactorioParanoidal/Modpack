if not bobmods.modules then bobmods.modules = {} end

local productionCost = settings.startup["SpaceX-production"].value
if productionCost == nil then
	productionCost = 1
end

data:extend({
    {
    type = "recipe",
    name = "protection-field-goopless",
    enabled = false,
	energy_required = 100,
    ingredients =
    {
	  {"energy-shield-mk3-equipment", 1000 * productionCost},
	  {"advanced-processing-unit", 3500 * productionCost},
	  {"effectivity-module-4", 400 * productionCost},
	  {"productivity-module-4", 400 * productionCost},
	  {"effectivity-module-6", 200 * productionCost},
	  {"productivity-module-6", 200 * productionCost},
	  {"effectivity-module-8", 100 * productionCost},
	  {"productivity-module-8", 100 * productionCost},	  
    },
    result = "protection-field"
  }
}) 

if bobmods.modules.EnableGodModules == true then
  -- assembly-robot
  bobmods.lib.recipe.replace_ingredient ("assembly-robot", "speed-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("assembly-robot", "efficiency-module-3", "god-module-5")  
  bobmods.lib.recipe.replace_ingredient ("assembly-robot", "construction-robot", "bob-construction-robot-4")    
--  data.raw.recipe["assembly-robot"].ingredients = {{"god-module-5",2},{"bob-construction-robot-4",5},{"low-density-structure",5}}
  -- space-thruster
  bobmods.lib.recipe.replace_ingredient ("space-thruster", "speed-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("space-thruster", "pipe", "titanium-pipe")  
  bobmods.lib.recipe.replace_ingredient ("space-thruster", "processing-unit", "advanced-processing-unit")  
--  data.raw.recipe["space-thruster"].ingredients = {{"god-module-5",50},{"titanium-pipe",100},{"advanced-processing-unit",100},{"electric-engine-unit", 100},{"low-density-structure",100}}
  -- life-support
  bobmods.lib.recipe.replace_ingredient ("life-support", "productivity-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("life-support", "pipe", "titanium-pipe")  
  bobmods.lib.recipe.replace_ingredient ("life-support", "processing-unit", "advanced-processing-unit")   
--  data.raw.recipe["life-support"].ingredients = {{"god-module-5",50},{"titanium-pipe",200},{"advanced-processing-unit",100},{"low-density-structure",100}}
  -- command
  bobmods.lib.recipe.replace_ingredient ("command", "speed-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("command", "efficiency-module-3", "god-module-5")  
  bobmods.lib.recipe.replace_ingredient ("command", "productivity-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("command", "processing-unit", "advanced-processing-unit")   
--  data.raw.recipe["command"].ingredients = {{"god-module-5",150},{"advanced-processing-unit",100},{"plastic-bar", 200},{"low-density-structure",100}}
  -- astrometrics
  bobmods.lib.recipe.replace_ingredient ("astrometrics", "speed-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("astrometrics", "processing-unit", "advanced-processing-unit") 
--  data.raw.recipe["astrometrics"].ingredients = {{"god-module-5",50},{"advanced-processing-unit",300},{"low-density-structure",100}}
  -- ftl-drive
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "speed-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "efficiency-module-3", "god-module-5")  
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "productivity-module-3", "god-module-5")
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "processing-unit", "advanced-processing-unit")    
--  data.raw.recipe["ftl-drive"].ingredients = {{"god-module-5",1500},{"advanced-processing-unit",500},{"low-density-structure",100}}
else
  -- assembly-robot
  bobmods.lib.recipe.replace_ingredient ("assembly-robot", "speed-module-3", "speed-module-8")
  bobmods.lib.recipe.replace_ingredient ("assembly-robot", "efficiency-module-3", "effectivity-module-8")  
  bobmods.lib.recipe.replace_ingredient ("assembly-robot", "construction-robot", "bob-construction-robot-4")  
  -- space-thruster
  bobmods.lib.recipe.replace_ingredient ("space-thruster", "speed-module-3", "speed-module-8")
  bobmods.lib.recipe.replace_ingredient ("space-thruster", "pipe", "titanium-pipe")  
  bobmods.lib.recipe.replace_ingredient ("space-thruster", "processing-unit", "advanced-processing-unit")   
  
  
--  data.raw.recipe["space-thruster"].ingredients = {{"speed-module-8",50},{"titanium-pipe",100},{"advanced-processing-unit",100},{"electric-engine-unit", 100},{"low-density-structure",100}}
  -- life-support
  bobmods.lib.recipe.replace_ingredient ("life-support", "productivity-module-3", "productivity-module-8")
  bobmods.lib.recipe.replace_ingredient ("life-support", "pipe", "titanium-pipe")  
  bobmods.lib.recipe.replace_ingredient ("life-support", "processing-unit", "advanced-processing-unit") 

--  data.raw.recipe["life-support"].ingredients = {{"productivity-module-8",50},{"titanium-pipe",200},{"advanced-processing-unit",100},{"low-density-structure",100}}
  -- command
  bobmods.lib.recipe.replace_ingredient ("command", "speed-module-3", "speed-module-8")
  bobmods.lib.recipe.replace_ingredient ("command", "efficiency-module-3", "effectivity-module-8")  
  bobmods.lib.recipe.replace_ingredient ("command", "productivity-module-3", "productivity-module-8")
  bobmods.lib.recipe.replace_ingredient ("command", "processing-unit", "advanced-processing-unit") 
  
--  data.raw.recipe["command"].ingredients = {{"speed-module-8",50},{"effectivity-module-8",50},{"productivity-module-8", 50},{"advanced-processing-unit",100},{"plastic-bar", 200},{"low-density-structure",100}}
  -- astrometrics
  bobmods.lib.recipe.replace_ingredient ("astrometrics", "speed-module-3", "speed-module-8")
  bobmods.lib.recipe.replace_ingredient ("astrometrics", "processing-unit", "advanced-processing-unit")   
  
--  data.raw.recipe["astrometrics"].ingredients = {{"speed-module-8",50},{"advanced-processing-unit",300},{"low-density-structure",100}}
  -- ftl-drive
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "speed-module-3", "speed-module-8")
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "efficiency-module-3", "effectivity-module-8")  
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "productivity-module-3", "productivity-module-8")
  bobmods.lib.recipe.replace_ingredient ("ftl-drive", "processing-unit", "advanced-processing-unit")   
--  data.raw.recipe["ftl-drive"].ingredients = {{"speed-module-8",500},{"effectivity-module-8",500},{"productivity-module-8", 500},{"advanced-processing-unit",500},{"low-density-structure",100}}
end

-- drydock-assembly
  bobmods.lib.recipe.replace_ingredient ("drydock-assembly", "solar-panel", "solar-panel-large-3")  
  bobmods.lib.recipe.replace_ingredient ("drydock-assembly", "roboport", "bob-roboport-4")
  bobmods.lib.recipe.replace_ingredient ("drydock-assembly", "processing-unit", "advanced-processing-unit")   
-- data.raw.recipe["drydock-assembly"].ingredients = {{"assembly-robot",50},{"bob-roboport-4",10},{"advanced-processing-unit",200},{"solar-panel-large-3",200},{"low-density-structure", 100}}
  -- fusion-reactor
  bobmods.lib.recipe.replace_ingredient ("fusion-reactor", "fission-reactor-equipment", "fusion-reactor-equipment-4")    
--data.raw.recipe["fusion-reactor"].ingredients = {{"fusion-reactor-equipment-4",100}}
  -- hull-component
  bobmods.lib.recipe.replace_ingredient ("hull-component", "steel-plate", "titanium-plate")   
--data.raw.recipe["hull-component"].ingredients = {{"low-density-structure", 250},{"titanium-plate", 100}}
  -- protection-field
  bobmods.lib.recipe.replace_ingredient ("protection-field", "energy-shield-mk2-equipment", "energy-shield-mk6-equipment")   
-- data.raw.recipe["protection-field"].ingredients = {{"energy-shield-mk6-equipment",100}}
  -- fuel-cell
  bobmods.lib.recipe.replace_ingredient ("fuel-cell", "steel-plate", "titanium-plate")
  bobmods.lib.recipe.replace_ingredient ("fuel-cell", "processing-unit", "advanced-processing-unit")   
-- data.raw.recipe["fuel-cell"].ingredients = {{"low-density-structure", 100},{"titanium-plate", 100},{"rocket-fuel", 500},{"advanced-processing-unit",100}}
  -- habitation
  bobmods.lib.recipe.replace_ingredient ("habitation", "steel-plate", "titanium-plate")
  bobmods.lib.recipe.replace_ingredient ("habitation", "processing-unit", "advanced-processing-unit")    
-- data.raw.recipe["habitation"].ingredients = {{"low-density-structure", 100},{"titanium-plate", 100},{"plastic-bar", 500},{"advanced-processing-unit",100}}
  -- low-density-structure
  bobmods.lib.recipe.replace_ingredient ("low-density-structure", "steel-plate", "titanium-plate")
  bobmods.lib.recipe.replace_ingredient ("low-density-structure", "copper-plate", "nitinol-alloy")   
-- data.raw.recipe["low-density-structure"].ingredients = {{"titanium-plate", 30},{"plastic-bar", 5},{"nitinol-alloy",5}}
  -- satellite
  bobmods.lib.recipe.replace_ingredient ("satellite", "accumulator", "large-accumulator-3")  
  bobmods.lib.recipe.replace_ingredient ("satellite", "solar-panel", "solar-panel-large-3")
  bobmods.lib.recipe.replace_ingredient ("satellite", "processing-unit", "advanced-processing-unit")  
  bobmods.lib.recipe.replace_ingredient ("satellite", "radar", "radar-5")  

 
