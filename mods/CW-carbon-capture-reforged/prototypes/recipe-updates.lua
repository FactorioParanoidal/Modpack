--[[
1=Default
##					basic-circuit-board			brown		/basic-circuit-board.png
2=steel-plate		electronic-circuit			brown+		/basic-electronic-circuit-board.png
##iron-gear-wheel	circuit-board				white		/circuit-board.png
3=steel-plate		advanced-circuit 			white+		/electronic-circuit-board.png
4=aluminium-plate	advanced-circuit 			white+		/electronic-circuit-board.png
##brass-gear-wheel	superior-circuit-board		green		/superior-circuit-board.png
5=titanium-plate	processing-unit				green+		/electronic-logic-board.png
##					multi-layer-circuit-board	blue		/multi-layer-circuit-board.png
6=nitinol-alloy		advanced-processing-unit	blue+		/electronic-processing-board.png
##
--]]

--Bob's Plates

--Bob's Plates

--MK2
if data.raw.item["steel-gear-wheel"] then
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk2", {"steel-plate", 25})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk2", {"iron-gear-wheel", 25})
end

--MK3
if data.raw.item["steel-gear-wheel"] then
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk3", {"engine-unit", 5})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk3", {"steel-plate", 50})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk3", {"steel-gear-wheel", 25})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk3", {"steel-bearing", 25})
end

--MK4
if data.raw.item["aluminium-plate"] then
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk4", {"engine-unit", 24})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk4", {"aluminium-plate", 50})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk4", {"brass-gear-wheel", 50})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk4", {"steel-bearing", 50})
end

--MK5
if data.raw.item["titanium-plate"] then
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk5", {"titanium-plate", 50})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk5", {"titanium-gear-wheel", 50})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk5", {"titanium-bearing", 50})
end

--MK6
if data.raw.item["nitinol-alloy"] then
  bobmods.lib.recipe.replace_ingredient("air-filter-machine-mk6", "steel-plate", "nitinol-alloy")
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk6", {"nitinol-gear-wheel", 50})
  bobmods.lib.recipe.add_ingredient("air-filter-machine-mk6", {"nitinol-bearing", 50})
end

--##############################################################################################################################

--Bob's Electronics

--Bob's Electronics

--MK2
if data.raw.item["electronic-circuit"] then
  bobmods.lib.recipe.replace_ingredient("air-filter-machine-mk2", "advanced-circuit", "electronic-circuit")
end

--MK3
if data.raw.item["advanced-circuit"] then
  bobmods.lib.recipe.replace_ingredient("air-filter-machine-mk3", "processing-unit", "advanced-circuit")
end

--MK4
if data.raw.item["advanced-circuit"] then  
  bobmods.lib.recipe.replace_ingredient("air-filter-machine-mk4", "processing-unit", "advanced-circuit")
end

--MK5
if data.raw.item["processing-unit"] then  
  bobmods.lib.recipe.remove_ingredient("air-filter-machine-mk5", {"processing-unit", 50})
end

--MK6
if data.raw.item["advanced-processing-unit"] then
  bobmods.lib.recipe.replace_ingredient("air-filter-machine-mk6", "processing-unit", "advanced-processing-unit")
end
 
--##############################################################################################################################

--Tech Tree update

--Tech Tree update

--MK2
if data.raw.technology["automation-2"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk2", "automation-2")
end  --Assembling-2
if data.raw.technology["electronics"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk2", "electronics")
end  --Brown+/Resistor

--MK3
if data.raw.technology["automation-3"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk3", "automation-3")
end  --Assembling-3
if data.raw.technology["advanced-circuit"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk3", "advanced-circuit")
end  --White+/Transistor
--[[
if data.raw.technology["steel-processing"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk3", "steel-processing")
end  --Steel
]]
--MK4
if data.raw.technology["automation-4"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk4", "automation-4")
end  --Assembling-4
if data.raw.technology["advanced-circuit"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk4", "advanced-circuit")
end  --White+/Transistor
if data.raw.technology["aluminium-processing"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk4", "aluminium-processing")
end  --Aluminium
if data.raw.technology["zinc-processing"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk4", "zinc-processing")
end  --Zinc

--MK5
if data.raw.technology["automation-5"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk5", "automation-5")
end  --Assembling-5
if data.raw.technology["processing-unit"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk5", "processing-unit")
end  --Green+/IC
if data.raw.technology["titanium-processing"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk5", "titanium-processing")
end  --Titanium

--MK6
if data.raw.technology["automation-6"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk6", "automation-6")
end  --Assembling-6
if data.raw.technology["advanced-electronics-3"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk6", "advanced-electronics-3")
end  --Blue+/CPU
if data.raw.technology["nitinol-processing"] then
  bobmods.lib.tech.add_prerequisite("air-filtering-mk6", "nitinol-processing")
end  --Nitinol
--end Tech tree