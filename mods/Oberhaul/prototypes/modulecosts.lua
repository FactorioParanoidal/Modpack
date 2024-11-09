--Beacon Changes
if data.raw.technology["pollution-clean-module"] then
for index=1,8,1 do
    data.raw.technology["pollution-clean-module-"..index].enabled = false
    data.raw.technology["pollution-create-module-"..index].enabled = false
    data.raw.recipe["pollution-clean-module-"..index].enabled = false
    data.raw.recipe["pollution-create-module-"..index].enabled = false
end
end

--Module Costs
data.raw.recipe["module-contact"].normal.result_count = 2
data.raw.recipe["module-processor-board"].normal.result_count = 1
data.raw.recipe["module-processor-board"].normal.energy_required = 5
data.raw.recipe["module-processor-board-2"].normal.result_count = 1
data.raw.recipe["module-processor-board-2"].normal.energy_required = 10
data.raw.recipe["module-processor-board-3"].normal.result_count = 1
data.raw.recipe["module-processor-board-3"].normal.energy_required = 15

data.raw.recipe["speed-processor"].normal.energy_required = 5
data.raw.recipe["speed-processor-2"].normal.energy_required = 10
data.raw.recipe["speed-processor-3"].normal.energy_required = 15

data.raw.recipe["effectivity-processor"].normal.energy_required = 5
data.raw.recipe["effectivity-processor-2"].normal.energy_required = 10
data.raw.recipe["effectivity-processor-3"].normal.energy_required = 15

data.raw.recipe["productivity-processor"].normal.energy_required = 5
data.raw.recipe["productivity-processor-2"].normal.energy_required = 10
data.raw.recipe["productivity-processor-3"].normal.energy_required = 15

--[[
if settings.startup["modules-use-circuits"].value then
for _, recipes in pairs({"speed-","productivity-","effectivity-"}) do
    for index=1,8,1 do
        bobmods.lib.recipe.replace_ingredient(recipes.."module-"..index,recipes.."processor-2","processing-unit")
        bobmods.lib.recipe.replace_ingredient(recipes.."module-"..index,recipes.."processor-3","advanced-processing-unit")
    end
end
end
]]
--Modules

	-- from DrD
	bobmods.lib.recipe.add_ingredient("speed-module-3",{"speed-processor-2",1})
	bobmods.lib.recipe.add_ingredient("speed-module-4",{"speed-processor-2",1})
	bobmods.lib.recipe.add_ingredient("speed-module-5",{"speed-processor-2",1})
	bobmods.lib.recipe.add_ingredient("speed-module-6",{"speed-processor-3",1})
	bobmods.lib.recipe.add_ingredient("speed-module-7",{"speed-processor-3",1})
	bobmods.lib.recipe.add_ingredient("speed-module-8",{"speed-processor-3",1})
	
	bobmods.lib.recipe.add_ingredient("productivity-module-3",{"productivity-processor-2",1})
	bobmods.lib.recipe.add_ingredient("productivity-module-4",{"productivity-processor-2",1})
	bobmods.lib.recipe.add_ingredient("productivity-module-5",{"productivity-processor-2",1})
	bobmods.lib.recipe.add_ingredient("productivity-module-6",{"productivity-processor-3",1})
	bobmods.lib.recipe.add_ingredient("productivity-module-7",{"productivity-processor-3",1})
	bobmods.lib.recipe.add_ingredient("productivity-module-8",{"productivity-processor-3",1}) 
	
	bobmods.lib.recipe.add_ingredient("efficiency-module-3",{"effectivity-processor-2",1})
	bobmods.lib.recipe.add_ingredient("effectivity-module-4",{"effectivity-processor-2",1})
	bobmods.lib.recipe.add_ingredient("effectivity-module-5",{"effectivity-processor-2",1})
	bobmods.lib.recipe.add_ingredient("effectivity-module-6",{"effectivity-processor-3",1})
	bobmods.lib.recipe.add_ingredient("effectivity-module-7",{"effectivity-processor-3",1})
	bobmods.lib.recipe.add_ingredient("effectivity-module-8",{"effectivity-processor-3",1})
	-- end from DrD

--[[
bobmods.lib.recipe.add_ingredient("speed-module-2",{"speed-module",1})
bobmods.lib.recipe.add_ingredient("speed-module-3",{"speed-module-2",1})
bobmods.lib.recipe.add_ingredient("speed-module-4",{"speed-module-3",1})
bobmods.lib.recipe.add_ingredient("speed-module-5",{"speed-module-4",1})
bobmods.lib.recipe.add_ingredient("speed-module-6",{"speed-module-5",1})
bobmods.lib.recipe.add_ingredient("speed-module-7",{"speed-module-6",1})
bobmods.lib.recipe.add_ingredient("speed-module-8",{"speed-module-7",1})

bobmods.lib.recipe.add_ingredient("productivity-module-2",{"productivity-module",1})
bobmods.lib.recipe.add_ingredient("productivity-module-3",{"productivity-module-2",1})
bobmods.lib.recipe.add_ingredient("productivity-module-4",{"productivity-module-3",1})
bobmods.lib.recipe.add_ingredient("productivity-module-5",{"productivity-module-4",1})
bobmods.lib.recipe.add_ingredient("productivity-module-6",{"productivity-module-5",1})
bobmods.lib.recipe.add_ingredient("productivity-module-7",{"productivity-module-6",1})
bobmods.lib.recipe.add_ingredient("productivity-module-8",{"productivity-module-7",1})

bobmods.lib.recipe.add_ingredient("efficiency-module-2",{"efficiency-module",1})
bobmods.lib.recipe.add_ingredient("efficiency-module-3",{"efficiency-module-2",1})
bobmods.lib.recipe.add_ingredient("effectivity-module-4",{"efficiency-module-3",1})
bobmods.lib.recipe.add_ingredient("effectivity-module-5",{"effectivity-module-4",1})
bobmods.lib.recipe.add_ingredient("effectivity-module-6",{"effectivity-module-5",1})
bobmods.lib.recipe.add_ingredient("effectivity-module-7",{"effectivity-module-6",1})
bobmods.lib.recipe.add_ingredient("effectivity-module-8",{"effectivity-module-7",1})
]]

bobmods.lib.recipe.add_ingredient("speed-module-3",{"module-contact",5})
bobmods.lib.recipe.add_ingredient("productivity-module-3",{"module-contact",5})
bobmods.lib.recipe.add_ingredient("efficiency-module-3",{"module-contact",5})

bobmods.lib.recipe.replace_ingredient("speed-module-5", "ruby-5", "emerald-5")
bobmods.lib.recipe.replace_ingredient("productivity-module-5", "ruby-5", "emerald-5")
bobmods.lib.recipe.replace_ingredient("effectivity-module-5", "ruby-5", "emerald-5")

bobmods.lib.recipe.replace_ingredient("speed-module-6", "emerald-5", "amethyst-5")
bobmods.lib.recipe.replace_ingredient("productivity-module-6", "emerald-5", "amethyst-5")
bobmods.lib.recipe.replace_ingredient("effectivity-module-6", "emerald-5", "amethyst-5")


data.raw.recipe["speed-module"].energy_required   = 10
data.raw.recipe["speed-module-2"].energy_required = 20
data.raw.recipe["speed-module-3"].energy_required = 30
data.raw.recipe["speed-module-4"].energy_required = 40
data.raw.recipe["speed-module-5"].energy_required = 60
data.raw.recipe["speed-module-6"].energy_required = 80
data.raw.recipe["speed-module-7"].energy_required = 120
data.raw.recipe["speed-module-8"].energy_required = 160

data.raw.recipe["productivity-module"].energy_required   = 10
data.raw.recipe["productivity-module-2"].energy_required = 20
data.raw.recipe["productivity-module-3"].energy_required = 30
data.raw.recipe["productivity-module-4"].energy_required = 40
data.raw.recipe["productivity-module-5"].energy_required = 60
data.raw.recipe["productivity-module-6"].energy_required = 80
data.raw.recipe["productivity-module-7"].energy_required = 120
data.raw.recipe["productivity-module-8"].energy_required = 160

data.raw.recipe["efficiency-module"].energy_required   = 10
data.raw.recipe["efficiency-module-2"].energy_required = 20
data.raw.recipe["efficiency-module-3"].energy_required = 30
data.raw.recipe["effectivity-module-4"].energy_required = 40
data.raw.recipe["effectivity-module-5"].energy_required = 60
data.raw.recipe["effectivity-module-6"].energy_required = 80
data.raw.recipe["effectivity-module-7"].energy_required = 120
data.raw.recipe["effectivity-module-8"].energy_required = 160
