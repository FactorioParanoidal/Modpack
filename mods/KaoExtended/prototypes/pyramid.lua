--BOBS + VANILLA

bobmods.lib.recipe.add_new_ingredient ("submachine-gun", {type="gun", name="pistol", amount=2})

  bobmods.lib.recipe.remove_ingredient("bob-logistic-robot-2", {"logistic-robot"})
  bobmods.lib.recipe.remove_ingredient("bob-construction-robot-2", {"construction-robot"})
  bobmods.lib.recipe.remove_ingredient("bob-logistic-robot-3", {"bob-logistic-robot-2"})
  bobmods.lib.recipe.remove_ingredient("bob-construction-robot-3", {"bob-construction-robot-2"})
  bobmods.lib.recipe.remove_ingredient("bob-logistic-robot-4", {"bob-logistic-robot-3"})
  bobmods.lib.recipe.remove_ingredient("bob-construction-robot-4", {"bob-construction-robot-3"})
  bobmods.lib.recipe.add_ingredient("bob-logistic-robot-2", {"logistic-robot", 2})
  bobmods.lib.recipe.add_ingredient("bob-construction-robot-2", {"construction-robot", 2})
  bobmods.lib.recipe.add_ingredient("bob-logistic-robot-3", {"bob-logistic-robot-2", 2})
  bobmods.lib.recipe.add_ingredient("bob-construction-robot-3", {"bob-construction-robot-2", 2})
  bobmods.lib.recipe.add_ingredient("bob-logistic-robot-4", {"bob-logistic-robot-3", 2})
  bobmods.lib.recipe.add_ingredient("bob-construction-robot-4", {"bob-construction-robot-3", 2})

bobmods.lib.recipe.remove_ingredient ("radar-2", "radar")
bobmods.lib.recipe.add_new_ingredient ("radar-2", {type="item", name="radar", amount=2})
bobmods.lib.recipe.remove_ingredient ("radar-3", "radar-2")
bobmods.lib.recipe.add_new_ingredient ("radar-3", {type="item", name="radar-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("radar-4", "radar-3")
bobmods.lib.recipe.add_new_ingredient ("radar-4", {type="item", name="radar-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("radar-5", "radar-4")
bobmods.lib.recipe.add_new_ingredient ("radar-5", {type="item", name="radar-4", amount=2})

bobmods.lib.recipe.remove_ingredient ("storage-tank", "bob-small-inline-storage-tank")
bobmods.lib.recipe.add_new_ingredient ("storage-tank", {type="item", name="bob-small-inline-storage-tank", amount=4})
bobmods.lib.recipe.remove_ingredient ("storage-tank-2", "storage-tank")
bobmods.lib.recipe.add_new_ingredient ("storage-tank-2", {type="item", name="storage-tank", amount=2})
bobmods.lib.recipe.remove_ingredient ("storage-tank-3", "storage-tank-2")
bobmods.lib.recipe.add_new_ingredient ("storage-tank-3", {type="item", name="storage-tank-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("storage-tank-4", "storage-tank-3")
bobmods.lib.recipe.add_new_ingredient ("storage-tank-4", {type="item", name="storage-tank-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("bob-storage-tank-all-corners", "bob-small-storage-tank")
bobmods.lib.recipe.add_new_ingredient ("bob-storage-tank-all-corners", {type="item", name="bob-small-storage-tank", amount=4})
bobmods.lib.recipe.remove_ingredient ("bob-storage-tank-all-corners-2", "bob-storage-tank-all-corners")
bobmods.lib.recipe.add_new_ingredient ("bob-storage-tank-all-corners-2", {type="item", name="bob-storage-tank-all-corners", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-storage-tank-all-corners-3", "bob-storage-tank-all-corners-2")
bobmods.lib.recipe.add_new_ingredient ("bob-storage-tank-all-corners-3", {type="item", name="bob-storage-tank-all-corners-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-storage-tank-all-corners-4", "bob-storage-tank-all-corners-3")
bobmods.lib.recipe.add_new_ingredient ("bob-storage-tank-all-corners-4", {type="item", name="bob-storage-tank-all-corners-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("angels-storage-tank-3", "bob-small-inline-storage-tank")
bobmods.lib.recipe.add_new_ingredient ("angels-storage-tank-3", {type="item", name="bob-small-inline-storage-tank", amount=4})
bobmods.lib.recipe.remove_ingredient ("angels-storage-tank-2", "angels-storage-tank-3")
bobmods.lib.recipe.add_new_ingredient ("angels-storage-tank-2", {type="item", name="angels-storage-tank-3", amount=4})

bobmods.lib.recipe.remove_ingredient ("steam-engine-2", "steam-engine")
bobmods.lib.recipe.add_new_ingredient ("steam-engine-2", {type="item", name="steam-engine", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-engine-3", "steam-engine-2")
bobmods.lib.recipe.add_new_ingredient ("steam-engine-3", {type="item", name="steam-engine-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-engine-4", "steam-engine-3")
bobmods.lib.recipe.add_new_ingredient ("steam-engine-4", {type="item", name="steam-engine-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-engine-5", "steam-engine-4")
bobmods.lib.recipe.add_new_ingredient ("steam-engine-5", {type="item", name="steam-engine-4", amount=2})

bobmods.lib.recipe.remove_ingredient ("boiler-2", "boiler")
bobmods.lib.recipe.add_new_ingredient ("boiler-2", {type="item", name="boiler", amount=2})
bobmods.lib.recipe.remove_ingredient ("boiler-3", "boiler-2")
bobmods.lib.recipe.add_new_ingredient ("boiler-3", {type="item", name="boiler-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("boiler-4", "boiler-3")
bobmods.lib.recipe.add_new_ingredient ("boiler-4", {type="item", name="boiler-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("boiler-5", "boiler-4")
bobmods.lib.recipe.add_new_ingredient ("boiler-5", {type="item", name="boiler-4", amount=2})

bobmods.lib.recipe.remove_ingredient ("steam-turbine", "steam-engine-3")
bobmods.lib.recipe.add_new_ingredient ("steam-turbine", {type="item", name="steam-engine-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-turbine-2", "steam-turbine")
bobmods.lib.recipe.add_new_ingredient ("steam-turbine-2", {type="item", name="steam-turbine", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-turbine-3", "steam-turbine-2")
bobmods.lib.recipe.add_new_ingredient ("steam-turbine-3", {type="item", name="steam-turbine-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("assembling-machine-2", "assembling-machine")
bobmods.lib.recipe.add_new_ingredient ("assembling-machine-2", {type="item", name="assembling-machine", amount=2})
bobmods.lib.recipe.remove_ingredient ("assembling-machine-3", "assembling-machine-2")
bobmods.lib.recipe.add_new_ingredient ("assembling-machine-3", {type="item", name="assembling-machine-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("assembling-machine-4", "assembling-machine-3")
bobmods.lib.recipe.add_new_ingredient ("assembling-machine-4", {type="item", name="assembling-machine-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("assembling-machine-5", "assembling-machine-4")
bobmods.lib.recipe.add_new_ingredient ("assembling-machine-5", {type="item", name="assembling-machine-4", amount=2})
bobmods.lib.recipe.remove_ingredient ("assembling-machine-6", "assembling-machine-5")
bobmods.lib.recipe.add_new_ingredient ("assembling-machine-6", {type="item", name="assembling-machine-5", amount=2})

bobmods.lib.recipe.remove_ingredient ("electronics-machine-1", "iron-gear-wheel")
bobmods.lib.recipe.add_new_ingredient ("electronics-machine-1", {type="item", name="assembling-machine", amount=1})
bobmods.lib.recipe.remove_ingredient ("electronics-machine-2", "electronics-machine-1")
bobmods.lib.recipe.add_new_ingredient ("electronics-machine-2", {type="item", name="electronics-machine-1", amount=2})
bobmods.lib.recipe.remove_ingredient ("electronics-machine-3", "electronics-machine-2")
bobmods.lib.recipe.add_new_ingredient ("electronics-machine-3", {type="item", name="electronics-machine-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("nuclear-reactor-2", "nuclear-reactor")
bobmods.lib.recipe.add_new_ingredient ("nuclear-reactor-2", {type="item", name="nuclear-reactor", amount=2})
bobmods.lib.recipe.remove_ingredient ("nuclear-reactor-3", "nuclear-reactor-2")
bobmods.lib.recipe.add_new_ingredient ("nuclear-reactor-3", {type="item", name="nuclear-reactor-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("oil-refinery-2", "oil-refinery")
bobmods.lib.recipe.add_new_ingredient ("oil-refinery-2", {type="item", name="oil-refinery", amount=2})
bobmods.lib.recipe.remove_ingredient ("oil-refinery-3", "oil-refinery-2")
bobmods.lib.recipe.add_new_ingredient ("oil-refinery-3", {type="item", name="oil-refinery-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("oil-refinery-4", "oil-refinery-3")
bobmods.lib.recipe.add_new_ingredient ("oil-refinery-4", {type="item", name="oil-refinery-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("bob-pumpjack-1", "pumpjack")
bobmods.lib.recipe.add_new_ingredient ("bob-pumpjack-1", {type="item", name="pumpjack", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-pumpjack-2", "bob-pumpjack-1")
bobmods.lib.recipe.add_new_ingredient ("bob-pumpjack-2", {type="item", name="bob-pumpjack-1", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-pumpjack-3", "bob-pumpjack-2")
bobmods.lib.recipe.add_new_ingredient ("bob-pumpjack-3", {type="item", name="bob-pumpjack-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-pumpjack-4", "bob-pumpjack-3")
bobmods.lib.recipe.add_new_ingredient ("bob-pumpjack-4", {type="item", name="bob-pumpjack-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("electric-furnace-2", "electric-furnace")
bobmods.lib.recipe.add_new_ingredient ("electric-furnace-2", {type="item", name="electric-furnace", amount=2})
bobmods.lib.recipe.remove_ingredient ("electric-furnace-3", "electric-furnace-2")
bobmods.lib.recipe.add_new_ingredient ("electric-furnace-3", {type="item", name="electric-furnace-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("bob-mining-drill-1", "electric-mining-drill")
bobmods.lib.recipe.add_new_ingredient ("bob-mining-drill-1", {type="item", name="electric-mining-drill", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-mining-drill-2", "bob-mining-drill-1")
bobmods.lib.recipe.add_new_ingredient ("bob-mining-drill-2", {type="item", name="bob-mining-drill-1", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-mining-drill-3", "bob-mining-drill-2")
bobmods.lib.recipe.add_new_ingredient ("bob-mining-drill-3", {type="item", name="bob-mining-drill-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-mining-drill-4", "bob-mining-drill-3")
bobmods.lib.recipe.add_new_ingredient ("bob-mining-drill-4", {type="item", name="bob-mining-drill-3", amount=2})
--bobmods.lib.recipe.remove_ingredient ("bob-mining-drill-5", "bob-mining-drill-4")
--bobmods.lib.recipe.add_new_ingredient ("bob-mining-drill-5", {type="item", name="bob-mining-drill-4", amount=2})

bobmods.lib.recipe.remove_ingredient ("bob-area-mining-drill-1", "electric-mining-drill")
bobmods.lib.recipe.add_new_ingredient ("bob-area-mining-drill-1", {type="item", name="electric-mining-drill", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-area-mining-drill-2", "bob-area-mining-drill")
bobmods.lib.recipe.add_new_ingredient ("bob-area-mining-drill-2", {type="item", name="bob-area-mining-drill-1", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-area-mining-drill-3", "bob-area-mining-drill-2")
bobmods.lib.recipe.add_new_ingredient ("bob-area-mining-drill-3", {type="item", name="bob-area-mining-drill-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-area-mining-drill-4", "bob-area-mining-drill-3")
bobmods.lib.recipe.add_new_ingredient ("bob-area-mining-drill-4", {type="item", name="bob-area-mining-drill-3", amount=2})
--bobmods.lib.recipe.remove_ingredient ("bob-area-mining-drill-5", "bob-area-mining-drill-4")
--bobmods.lib.recipe.add_new_ingredient ("bob-area-mining-drill-5", {type="item", name="bob-area-mining-drill-4", amount=2})

bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-1", {type="item", name="laser-turret", amount=4})
bobmods.lib.recipe.remove_ingredient ("bob-plasma-turret-2", "bob-plasma-turret-1")
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-2", {type="item", name="bob-plasma-turret-1", amount=2})
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-2", {type="item", name="bob-laser-turret-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-plasma-turret-3", "bob-plasma-turret-2")
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-3", {type="item", name="bob-plasma-turret-2", amount=2})
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-3", {type="item", name="bob-laser-turret-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-plasma-turret-4", "bob-plasma-turret-3")
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-4", {type="item", name="bob-plasma-turret-3", amount=2})
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-4", {type="item", name="bob-laser-turret-4", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-plasma-turret-5", "bob-plasma-turret-4")
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-5", {type="item", name="bob-plasma-turret-4", amount=2})
bobmods.lib.recipe.add_new_ingredient ("bob-plasma-turret-5", {type="item", name="bob-laser-turret-5", amount=2})

bobmods.lib.recipe.remove_ingredient ("bob-laser-turret-2", "laser-turret")
bobmods.lib.recipe.add_new_ingredient ("bob-laser-turret-2", {type="item", name="laser-turret", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-laser-turret-3", "bob-laser-turret-2")
bobmods.lib.recipe.add_new_ingredient ("bob-laser-turret-3", {type="item", name="bob-laser-turret-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-laser-turret-4", "bob-laser-turret-3")
bobmods.lib.recipe.add_new_ingredient ("bob-laser-turret-4", {type="item", name="bob-laser-turret-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("bob-laser-turret-5", "bob-laser-turret-4")
bobmods.lib.recipe.add_new_ingredient ("bob-laser-turret-5", {type="item", name="bob-laser-turret-4", amount=2})

bobmods.lib.recipe.add_new_ingredient ("logistic-chest-passive-provider-2", {type="item", name="passive-provider-chest", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-passive-provider-3", {type="item", name="logistic-chest-passive-provider-2", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-active-provider-2", {type="item", name="active-provider-chest", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-active-provider-3", {type="item", name="logistic-chest-active-provider-2", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-buffer-2", {type="item", name="buffer-chest", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-buffer-3", {type="item", name="logistic-chest-buffer-2", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-requester-2", {type="item", name="requester-chest", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-requester-3", {type="item", name="logistic-chest-requester-2", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-storage-2", {type="item", name="storage-chest", amount=1})
bobmods.lib.recipe.add_new_ingredient ("logistic-chest-storage-3", {type="item", name="logistic-chest-storage-2", amount=1})

--ANGELS

bobmods.lib.recipe.remove_ingredient ("liquifier-2", "liquifier")
bobmods.lib.recipe.add_new_ingredient ("liquifier-2", {type="item", name="liquifier", amount=2})
bobmods.lib.recipe.remove_ingredient ("liquifier-3", "liquifier-2")
bobmods.lib.recipe.add_new_ingredient ("liquifier-3", {type="item", name="liquifier-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("liquifier-4", "liquifier-3")
bobmods.lib.recipe.add_new_ingredient ("liquifier-4", {type="item", name="liquifier-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("ore-crusher-2", "ore-crusher")
bobmods.lib.recipe.add_new_ingredient ("ore-crusher-2", {type="item", name="ore-crusher", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-crusher-3", "ore-crusher-2")
bobmods.lib.recipe.add_new_ingredient ("ore-crusher-3", {type="item", name="ore-crusher-2", amount=2})
if data.raw.item["ore-crusher-4"] then
bobmods.lib.recipe.remove_ingredient ("ore-crusher-4", "ore-crusher-3")
bobmods.lib.recipe.add_new_ingredient ("ore-crusher-4", {type="item", name="ore-crusher-3", amount=2})
end

bobmods.lib.recipe.remove_ingredient ("ore-sorting-facility-2", "ore-sorting-facility")
bobmods.lib.recipe.add_new_ingredient ("ore-sorting-facility-2", {type="item", name="ore-sorting-facility", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-sorting-facility-3", "ore-sorting-facility-2")
bobmods.lib.recipe.add_new_ingredient ("ore-sorting-facility-3", {type="item", name="ore-sorting-facility-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-sorting-facility-4", "ore-sorting-facility-3")
bobmods.lib.recipe.add_new_ingredient ("ore-sorting-facility-4", {type="item", name="ore-sorting-facility-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("ore-floatation-cell-2", "ore-floatation-cell")
bobmods.lib.recipe.add_new_ingredient ("ore-floatation-cell-2", {type="item", name="ore-floatation-cell", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-floatation-cell-3", "ore-floatation-cell-2")
bobmods.lib.recipe.add_new_ingredient ("ore-floatation-cell-3", {type="item", name="ore-floatation-cell-2", amount=2})
if data.raw.item["ore-floatation-cell-4"] then
bobmods.lib.recipe.remove_ingredient ("ore-floatation-cell-4", "ore-floatation-cell-3")
bobmods.lib.recipe.add_new_ingredient ("ore-floatation-cell-4", {type="item", name="ore-floatation-cell-3", amount=2})
end

bobmods.lib.recipe.remove_ingredient ("ore-leaching-plant-2", "ore-leaching-plant")
bobmods.lib.recipe.add_new_ingredient ("ore-leaching-plant-2", {type="item", name="ore-leaching-plant", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-leaching-plant-3", "ore-leaching-plant-2")
bobmods.lib.recipe.add_new_ingredient ("ore-leaching-plant-3", {type="item", name="ore-leaching-plant-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-leaching-plant-4", "ore-leaching-plant-3")
bobmods.lib.recipe.add_new_ingredient ("ore-leaching-plant-4", {type="item", name="ore-leaching-plant-3", amount=2})
if data.raw.item["ore-leaching-plant-5"] then
bobmods.lib.recipe.remove_ingredient ("ore-leaching-plant-5", "ore-leaching-plant-4")
bobmods.lib.recipe.add_new_ingredient ("ore-leaching-plant-5", {type="item", name="ore-leaching-plant-4", amount=2})
end


bobmods.lib.recipe.remove_ingredient ("ore-refinery-2", "ore-refinery")
bobmods.lib.recipe.add_new_ingredient ("ore-refinery-2", {type="item", name="ore-refinery", amount=2})
if data.raw.item["ore-refinery-3"] then
bobmods.lib.recipe.remove_ingredient ("ore-refinery-3", "ore-refinery-2")
bobmods.lib.recipe.add_new_ingredient ("ore-refinery-3", {type="item", name="ore-refinery-2", amount=2})
end


bobmods.lib.recipe.remove_ingredient ("filtration-unit-2", "filtration-unit")
bobmods.lib.recipe.add_new_ingredient ("filtration-unit-2", {type="item", name="filtration-unit", amount=2})
if data.raw.item["filtration-unit-3"] then
bobmods.lib.recipe.remove_ingredient ("filtration-unit-3", "filtration-unit-2")
bobmods.lib.recipe.add_new_ingredient ("filtration-unit-3", {type="item", name="filtration-unit-2", amount=2})
end

bobmods.lib.recipe.remove_ingredient ("crystallizer-2", "crystallizer")
bobmods.lib.recipe.add_new_ingredient ("crystallizer-2", {type="item", name="crystallizer", amount=2})
if data.raw.item["crystallizer-3"] then
bobmods.lib.recipe.remove_ingredient ("crystallizer-3", "crystallizer-2")
bobmods.lib.recipe.add_new_ingredient ("crystallizer-3", {type="item", name="crystallizer-2", amount=2})
end

bobmods.lib.recipe.remove_ingredient ("algae-farm-2", "algae-farm")
bobmods.lib.recipe.add_new_ingredient ("algae-farm-2", {type="item", name="algae-farm", amount=2})
bobmods.lib.recipe.remove_ingredient ("algae-farm-3", "algae-farm-2")
bobmods.lib.recipe.add_new_ingredient ("algae-farm-3", {type="item", name="algae-farm-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("hydro-plant-2", "hydro-plant")
bobmods.lib.recipe.add_new_ingredient ("hydro-plant-2", {type="item", name="hydro-plant", amount=2})
bobmods.lib.recipe.remove_ingredient ("hydro-plant-3", "hydro-plant-2")
bobmods.lib.recipe.add_new_ingredient ("hydro-plant-3", {type="item", name="hydro-plant-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("salination-plant-2", "salination-plant")
bobmods.lib.recipe.add_new_ingredient ("salination-plant-2", {type="item", name="salination-plant", amount=2})

bobmods.lib.recipe.remove_ingredient ("washing-plant-2", "washing-plant")
bobmods.lib.recipe.add_new_ingredient ("washing-plant-2", {type="item", name="washing-plant", amount=2})
if data.raw.item["washing-plant-3"] then
bobmods.lib.recipe.remove_ingredient ("washing-plant-3", "washing-plant-2")
bobmods.lib.recipe.add_new_ingredient ("washing-plant-3", {type="item", name="washing-plant-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("washing-plant-4", "washing-plant-3")
bobmods.lib.recipe.add_new_ingredient ("washing-plant-4", {type="item", name="washing-plant-3", amount=2})
end

bobmods.lib.recipe.remove_ingredient ("angels-electric-boiler-2", "angels-electric-boiler")
bobmods.lib.recipe.add_new_ingredient ("angels-electric-boiler-2", {type="item", name="angels-electric-boiler", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-electric-boiler-3", "angels-electric-boiler-2")
bobmods.lib.recipe.add_new_ingredient ("angels-electric-boiler-3", {type="item", name="angels-electric-boiler-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("ore-powderizer-2", "ore-powderizer")
bobmods.lib.recipe.add_new_ingredient ("ore-powderizer-2", {type="item", name="ore-powderizer", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-powderizer-3", "ore-powderizer-2")
bobmods.lib.recipe.add_new_ingredient ("ore-powderizer-3", {type="item", name="ore-powderizer-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("electro-whinning-cell-2", "electro-whinning-cell")
bobmods.lib.recipe.add_new_ingredient ("electro-whinning-cell-2", {type="item", name="electro-whinning-cell", amount=2})
bobmods.lib.recipe.remove_ingredient ("electro-whinning-cell-3", "electro-whinning-cell-2")
bobmods.lib.recipe.add_new_ingredient ("electro-whinning-cell-3", {type="item", name="electro-whinning-cell-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("ore-processing-machine-2", "ore-processing-machine")
bobmods.lib.recipe.add_new_ingredient ("ore-processing-machine-2", {type="item", name="ore-processing-machine", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-processing-machine-3", "ore-processing-machine-2")
bobmods.lib.recipe.add_new_ingredient ("ore-processing-machine-3", {type="item", name="ore-processing-machine-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("ore-processing-machine-4", "ore-processing-machine-3")
bobmods.lib.recipe.add_new_ingredient ("ore-processing-machine-4", {type="item", name="ore-processing-machine-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("pellet-press-2", "pellet-press")
bobmods.lib.recipe.add_new_ingredient ("pellet-press-2", {type="item", name="pellet-press", amount=2})
bobmods.lib.recipe.remove_ingredient ("pellet-press-3", "pellet-press-2")
bobmods.lib.recipe.add_new_ingredient ("pellet-press-3", {type="item", name="pellet-press-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("pellet-press-4", "pellet-press-3")
bobmods.lib.recipe.add_new_ingredient ("pellet-press-4", {type="item", name="pellet-press-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("powder-mixer-2", "powder-mixer")
bobmods.lib.recipe.add_new_ingredient ("powder-mixer-2", {type="item", name="powder-mixer", amount=2})
bobmods.lib.recipe.remove_ingredient ("powder-mixer-3", "powder-mixer-2")
bobmods.lib.recipe.add_new_ingredient ("powder-mixer-3", {type="item", name="powder-mixer-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("powder-mixer-4", "powder-mixer-3")
bobmods.lib.recipe.add_new_ingredient ("powder-mixer-4", {type="item", name="powder-mixer-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("blast-furnace-2", "blast-furnace")
bobmods.lib.recipe.add_new_ingredient ("blast-furnace-2", {type="item", name="blast-furnace", amount=2})
bobmods.lib.recipe.remove_ingredient ("blast-furnace-3", "blast-furnace-2")
bobmods.lib.recipe.add_new_ingredient ("blast-furnace-3", {type="item", name="blast-furnace-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("blast-furnace-4", "blast-furnace-3")
bobmods.lib.recipe.add_new_ingredient ("blast-furnace-4", {type="item", name="blast-furnace-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("angels-chemical-furnace-2", "angels-chemical-furnace")
bobmods.lib.recipe.add_new_ingredient ("angels-chemical-furnace-2", {type="item", name="angels-chemical-furnace", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-chemical-furnace-3", "angels-chemical-furnace-2")
bobmods.lib.recipe.add_new_ingredient ("angels-chemical-furnace-3", {type="item", name="angels-chemical-furnace-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-chemical-furnace-4", "angels-chemical-furnace-3")
bobmods.lib.recipe.add_new_ingredient ("angels-chemical-furnace-4", {type="item", name="angels-chemical-furnace-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("induction-furnace-2", "induction-furnace")
bobmods.lib.recipe.add_new_ingredient ("induction-furnace-2", {type="item", name="induction-furnace", amount=2})
bobmods.lib.recipe.remove_ingredient ("induction-furnace-3", "induction-furnace-2")
bobmods.lib.recipe.add_new_ingredient ("induction-furnace-3", {type="item", name="induction-furnace-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("induction-furnace-4", "induction-furnace-3")
bobmods.lib.recipe.add_new_ingredient ("induction-furnace-4", {type="item", name="induction-furnace-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("casting-machine-2", "casting-machine")
bobmods.lib.recipe.add_new_ingredient ("casting-machine-2", {type="item", name="casting-machine", amount=2})
bobmods.lib.recipe.remove_ingredient ("casting-machine-3", "casting-machine-2")
bobmods.lib.recipe.add_new_ingredient ("casting-machine-3", {type="item", name="casting-machine-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("casting-machine-4", "casting-machine-3")
bobmods.lib.recipe.add_new_ingredient ("casting-machine-4", {type="item", name="casting-machine-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("strand-casting-machine-2", "strand-casting-machine")
bobmods.lib.recipe.add_new_ingredient ("strand-casting-machine-2", {type="item", name="strand-casting-machine", amount=2})
bobmods.lib.recipe.remove_ingredient ("strand-casting-machine-3", "strand-casting-machine-2")
bobmods.lib.recipe.add_new_ingredient ("strand-casting-machine-3", {type="item", name="strand-casting-machine-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("strand-casting-machine-4", "strand-casting-machine-3")
bobmods.lib.recipe.add_new_ingredient ("strand-casting-machine-4", {type="item", name="strand-casting-machine-3", amount=2})

--bobmods.lib.recipe.remove_ingredient ("sintering-oven-2", "sintering-oven")
--bobmods.lib.recipe.add_new_ingredient ("sintering-oven-2", {type="item", name="sintering-oven", amount=2})
--bobmods.lib.recipe.remove_ingredient ("sintering-oven-3", "sintering-oven-2")
--bobmods.lib.recipe.add_new_ingredient ("sintering-oven-3", {type="item", name="sintering-oven-2", amount=2})
--bobmods.lib.recipe.remove_ingredient ("sintering-oven-4", "sintering-oven-3")
--bobmods.lib.recipe.add_new_ingredient ("sintering-oven-4", {type="item", name="sintering-oven-3", amount=2})
bobmods.lib.recipe.remove_ingredient ("sintering-oven-5", "sintering-oven-4")
bobmods.lib.recipe.add_new_ingredient ("sintering-oven-5", {type="item", name="sintering-oven-4", amount=2})

bobmods.lib.recipe.remove_ingredient ("angels-electrolyser-2", "angels-electrolyser")
bobmods.lib.recipe.add_new_ingredient ("angels-electrolyser-2", {type="item", name="angels-electrolyser", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-electrolyser-3", "angels-electrolyser-2")
bobmods.lib.recipe.add_new_ingredient ("angels-electrolyser-3", {type="item", name="angels-electrolyser-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-electrolyser-4", "angels-electrolyser-3")
bobmods.lib.recipe.add_new_ingredient ("angels-electrolyser-4", {type="item", name="angels-electrolyser-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("angels-air-filter-2", "angels-air-filter")
bobmods.lib.recipe.add_new_ingredient ("angels-air-filter-2", {type="item", name="angels-air-filter", amount=2})

bobmods.lib.recipe.remove_ingredient ("separator-2", "separator")
bobmods.lib.recipe.add_new_ingredient ("separator-2", {type="item", name="separator", amount=2})
bobmods.lib.recipe.remove_ingredient ("separator-3", "separator-2")
bobmods.lib.recipe.add_new_ingredient ("separator-3", {type="item", name="separator-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("separator-4", "separator-3")
bobmods.lib.recipe.add_new_ingredient ("separator-4", {type="item", name="separator-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("gas-refinery-small-2", "gas-refinery-small")
bobmods.lib.recipe.add_new_ingredient ("gas-refinery-small-2", {type="item", name="gas-refinery-small", amount=2})
bobmods.lib.recipe.remove_ingredient ("gas-refinery-small-3", "gas-refinery-small-2")
bobmods.lib.recipe.add_new_ingredient ("gas-refinery-small-3", {type="item", name="gas-refinery-small-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("gas-refinery-small-4", "gas-refinery-small-3")
bobmods.lib.recipe.add_new_ingredient ("gas-refinery-small-4", {type="item", name="gas-refinery-small-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("gas-refinery-2", "gas-refinery")
bobmods.lib.recipe.add_new_ingredient ("gas-refinery-2", {type="item", name="gas-refinery", amount=2})
bobmods.lib.recipe.remove_ingredient ("gas-refinery-3", "gas-refinery-2")
bobmods.lib.recipe.add_new_ingredient ("gas-refinery-3", {type="item", name="gas-refinery-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("gas-refinery-4", "gas-refinery-3")
bobmods.lib.recipe.add_new_ingredient ("gas-refinery-4", {type="item", name="gas-refinery-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("steam-cracker-2", "steam-cracker")
bobmods.lib.recipe.add_new_ingredient ("steam-cracker-2", {type="item", name="steam-cracker", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-cracker-3", "steam-cracker-2")
bobmods.lib.recipe.add_new_ingredient ("steam-cracker-3", {type="item", name="steam-cracker-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("steam-cracker-4", "steam-cracker-3")
bobmods.lib.recipe.add_new_ingredient ("steam-cracker-4", {type="item", name="steam-cracker-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("advanced-chemical-plant-2", "advanced-chemical-plant")
bobmods.lib.recipe.add_new_ingredient ("advanced-chemical-plant-2", {type="item", name="advanced-chemical-plant", amount=2})

bobmods.lib.recipe.remove_ingredient ("angels-chemical-plant-2", "angels-chemical-plant")
bobmods.lib.recipe.add_new_ingredient ("angels-chemical-plant-2", {type="item", name="angels-chemical-plant", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-chemical-plant-3", "angels-chemical-plant-2")
bobmods.lib.recipe.add_new_ingredient ("angels-chemical-plant-3", {type="item", name="angels-chemical-plant-2", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-chemical-plant-4", "angels-chemical-plant-3")
bobmods.lib.recipe.add_new_ingredient ("angels-chemical-plant-4", {type="item", name="angels-chemical-plant-3", amount=2})

bobmods.lib.recipe.remove_ingredient ("angels-electric-boiler-2", "angels-electric-boiler")
bobmods.lib.recipe.add_new_ingredient ("angels-electric-boiler-2", {type="item", name="angels-electric-boiler", amount=2})
bobmods.lib.recipe.remove_ingredient ("angels-electric-boiler-3", "angels-electric-boiler-2")
bobmods.lib.recipe.add_new_ingredient ("angels-electric-boiler-3", {type="item", name="angels-electric-boiler-2", amount=2})

bobmods.lib.recipe.remove_ingredient ("sluicer-2", "sluicer")
bobmods.lib.recipe.add_new_ingredient ("sluicer-2", {type="item", name="sluicer", amount=2})

bobmods.lib.recipe.add_new_ingredient ("memory-unit", {type="item", name="warehouse-basic", amount=2})
bobmods.lib.tech.add_prerequisite ("memory-unit", "tungsten-alloy-processing")
bobmods.lib.recipe.remove_ingredient ("fluid-memory-unit", "warehouse-research")
bobmods.lib.recipe.add_new_ingredient ("fluid-memory-unit", {type="item", name="angels-storage-tank-1", amount=2})
bobmods.lib.tech.add_prerequisite ("fluid-memory-storage", "gas-processing")

bobmods.lib.recipe.add_new_ingredient ("large-accumulator", {type="item", name="electronic-circuit", amount=4})

bobmods.lib.recipe.add_new_ingredient ("heavy-armor-2", {type="item", name="heavy-armor", amount=1})
bobmods.lib.recipe.add_new_ingredient ("heavy-armor-3", {type="item", name="heavy-armor-2", amount=1})

--[[
if data.raw.car["schall-tank-l"] then
bobmods.lib.recipe.remove_ingredient ("bob-tank-2", "tank")
bobmods.lib.recipe.add_new_ingredient ("bob-tank-2", {type="car", name="schall-tank-l", amount=1})
end
]]--

--[[
bobmods.lib.recipe.remove_ingredient ("centrifuge-mk2", "centrifuge")
bobmods.lib.recipe.add_new_ingredient ("centrifuge-mk2", {type="item", name="centrifuge", amount=2})
bobmods.lib.recipe.remove_ingredient ("centrifuge-mk3", "centrifuge-mk2")
bobmods.lib.recipe.add_new_ingredient ("centrifuge-mk3", {type="item", name="centrifuge-mk2", amount=2})
]]--