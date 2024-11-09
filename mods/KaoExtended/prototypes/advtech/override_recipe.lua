if not KaoExtended then KaoExtended = {} end
if not KaoExtended.item then KaoExtended.item = {} end
if not KaoExtended.recipe then KaoExtended.recipe = {} end

data.raw["recipe"]["electronic-circuit"].enabled = false


if kaoextended.settingsoveride == true then
	data.raw["recipe"]["automation-science-pack"].ingredients =
	    {
			{"iron-gear-wheel",3},
			{"copper-plate", 10},
			{"sci-component-1", 3},
	    }
	data.raw["recipe"]["logistic-science-pack"].enabled = false
	data.raw["recipe"]["logistic-science-pack"].ingredients =
		{
			{"inserter", 2},
			{"transport-belt", 7},
			{"sci-component-2", 3},
			{"bronze-alloy", 7},
		}
	data.raw["recipe"]["chemical-science-pack"].ingredients =
	    {
		    {"advanced-circuit", 1},
			{"engine-unit", 1},
			{"electric-mining-drill", 1},
	        {"steel-plate", 7},
			{"sci-component-3", 3},
	    }
	data.raw["recipe"]["military-science-pack"].ingredients =
	    {
		    {"piercing-rounds-magazine", 1},
			{"grenade", 1},
			{"gun-turret", 1},
			{"sci-component-m", 3},
	    }
	data.raw["recipe"]["advanced-logistic-science-pack"].ingredients =
	    {   {"fast-inserter", 1},
			--{"express-transport-belt", 10}, --moved to sci-component-l
			{"flying-robot-frame", 1},
			{"brass-chest", 1},
			{"sci-component-l", 3},
	    }
	data.raw["recipe"]["production-science-pack"].ingredients =
	    {
			{"assembling-machine-1", 1},
			{"electric-furnace", 1},
			{"basic-structure-components", 1},
			{"sci-component-5", 3},
	    }

	data.raw["recipe"]["utility-science-pack"].ingredients =
		{
		    {"processing-unit", 5},
	        {"express-transport-belt", 10},
			{"lithium-ion-battery", 10},
			{"uranium-238", 5},
			{"sci-component-4", 3},
			{"rubber",10},
			{"advsci-component-4", 3},
		}
	data.raw["recipe"]["utility-science-pack"].energy_required = 28
	data.raw["recipe"]["utility-science-pack"].result_count = 4
	
	data:extend
	({
	  {
	    type = "recipe",
	    name = "science-pack-gold",
	    enabled = false,
  	    energy_required = 30,
  	    ingredients =
  	    {
          {"automation-science-pack", 1},
	      {"logistic-science-pack", 1},
	      {"chemical-science-pack", 1},
	      {"military-science-pack", 1},
	      {"sci-component-o", 3},
	    },
	    result = "science-pack-gold"
	  },
	})
	
	
	KaoExtended.recipe.addtorecipe("oil-boiler", {"oil-steam-boiler", 2})
	
	KaoExtended.recipe.addtorecipe("basic-circuit-board", {"condensator", 2})
	
	--KaoExtended.recipe.addtorecipe("electronic-circuit", {"simple-io", 1})
	--KaoExtended.recipe.addtorecipe("electronic-circuit", {"condensator", 15})
	
	KaoExtended.recipe.addtorecipe("advanced-circuit", {"standart-io", 2})
	--KaoExtended.recipe.addtorecipe("advanced-circuit", {"condensator", 15})
	KaoExtended.recipe.addtorecipe("advanced-circuit", {"condensator2", 8})
	
	
	KaoExtended.recipe.addtorecipe("processing-unit", {"advanced-io", 2})
	KaoExtended.recipe.addtorecipe("processing-unit", {"condensator", 75})
	KaoExtended.recipe.addtorecipe("processing-unit", {"condensator2", 25})
	KaoExtended.recipe.addtorecipe("processing-unit", {"condensator3", 15})
	
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"advanced-io", 2})
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"predictive-io", 2})
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"condensator", 92})
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"condensator2", 40})
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"condensator3", 28})	
	
	--KaoExtended.recipe.addtorecipe("module-processor-board", {"advsci-component-4", 1})
	KaoExtended.recipe.addtorecipe("module-processor-board", {"condensator", 12})
	
	KaoExtended.recipe.addtorecipe("module-processor-board-2", {"condensator", 8})
	KaoExtended.recipe.addtorecipe("module-processor-board-2", {"condensator2", 10})
	
	KaoExtended.recipe.addtorecipe("module-processor-board-3", {"condensator2", 10})	
	KaoExtended.recipe.addtorecipe("module-processor-board-3", {"condensator3", 16})	
	
	KaoExtended.recipe.addtorecipe("speed-processor", {"condensator", 8})
	KaoExtended.recipe.addtorecipe("speed-processor-2", {"condensator-2", 8})
	KaoExtended.recipe.addtorecipe("speed-processor-3", {"condensator-3", 8})	

	KaoExtended.recipe.addtorecipe("effectivity-processor", {"condensator", 8})
	KaoExtended.recipe.addtorecipe("effectivity-processor-2", {"condensator-2", 8})
	KaoExtended.recipe.addtorecipe("effectivity-processor-3", {"condensator-3", 8})		
	
	KaoExtended.recipe.addtorecipe("productivity-processor", {"condensator", 8})
	KaoExtended.recipe.addtorecipe("productivity-processor-2", {"condensator-2", 8})
	KaoExtended.recipe.addtorecipe("productivity-processor-3", {"condensator-3", 8})		
	
	KaoExtended.recipe.addtorecipe("transport-belt", {"basic-transport-belt", 2})
	
  -- modules

  KaoExtended.recipe.addtorecipe("speed-module-8",{"predictive-io",1})
  KaoExtended.recipe.addtorecipe("productivity-module-8",{"predictive-io",1})
  KaoExtended.recipe.addtorecipe("effectivity-module-8",{"predictive-io",1})
	
  KaoExtended.recipe.addtorecipe("god-module-1", {"intelligent-io", 1})
  KaoExtended.recipe.addtorecipe("god-module-2", {"intelligent-io", 2})
  KaoExtended.recipe.addtorecipe("god-module-3", {"intelligent-io", 3})	
  KaoExtended.recipe.addtorecipe("god-module-4", {"intelligent-io", 4})
  KaoExtended.recipe.addtorecipe("god-module-5", {"intelligent-io", 5})



else
	KaoExtended.recipe.addtorecipe("automation-science-pack", {"sci-component-1", 3})
	KaoExtended.recipe.addtorecipe("logistic-science-pack", {"sci-component-2", 3})
	KaoExtended.recipe.addtorecipe("chemical-science-pack", {"sci-component-3", 3})
	
	KaoExtended.recipe.addtorecipe("military-science-pack", {"sci-component-m", 3})
	KaoExtended.recipe.addtorecipe("logistic-science-pack", {"sci-component-l", 3})
	KaoExtended.recipe.addtorecipe("production-science-pack",{"sci-component-5", 3})
	KaoExtended.recipe.addtorecipe("utility-science-pack", {"sci-component-4", 3})
	KaoExtended.recipe.addtorecipe("utility-science-pack", {"advsci-component-4", 3})
	
	KaoExtended.recipe.addtorecipe("module-processor-board", {"advsci-component-4", 1})
	
	KaoExtended.recipe.addtorecipe("basic-circuit-board", {"condensator", 4})
	KaoExtended.recipe.addtorecipe("module-processor-board", {"advsci-component-4", 1})
	
	--KaoExtended.recipe.addtorecipe("electronic-circuit", {"simple-io", 1})
	--KaoExtended.recipe.addtorecipe("electronic-circuit", {"condensator", 15})
	
	KaoExtended.recipe.addtorecipe("advanced-circuit", {"standart-io", 2})
	KaoExtended.recipe.addtorecipe("advanced-circuit", {"condensator", 25})
	KaoExtended.recipe.addtorecipe("advanced-circuit", {"condensator2", 5})
	
	KaoExtended.recipe.addtorecipe("processing-unit", {"advanced-io", 3})
	KaoExtended.recipe.addtorecipe("processing-unit", {"condensator2", 15})
	KaoExtended.recipe.addtorecipe("processing-unit", {"condensator3", 25})
	
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"predictive-io", 3})
	KaoExtended.recipe.addtorecipe("advanced-processing-unit", {"condensator3", 32})
	
	KaoExtended.recipe.addtorecipe("module-processor-board", {"condensator", 12})
	
	--[[
	KaoExtended.recipe.addtorecipe("steel-chest", {"iron-chest", 2})
	KaoExtended.recipe.addtorecipe("brass-chest", {"steel-chest", 2})	
	KaoExtended.recipe.addtorecipe("titanium-chest", {"brass-chest", 2})
	]]--
	
end