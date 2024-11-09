--Misc Changes and Fixes
data.raw.recipe["red-wire"].ingredients = {{"electronic-circuit", 1}}
data.raw.recipe["green-wire"].ingredients = {{"electronic-circuit", 1}}
--data.raw.item["beacon"].stack_size = 100
data.raw.recipe["lithium-ion-battery"].normal.energy_required = 5
data.raw.recipe["silver-zinc-battery"].normal.energy_required = 5

if mods["aai-industry"] then
    if not util then
    util = {}    
    end
    function util.allow_productivity(recipe_name)
        for _, prototype in pairs(data.raw["module"]) do
            if  prototype.limitation and string.find(prototype.name, "productivity", 1, true) then
                table.insert(prototype.limitation, recipe_name)
            end
        end
    end
    util.allow_productivity("motor")
    util.allow_productivity("electric-motor")
    --data.raw.item["vehicle-fuel"].stack_size = 50
    data.raw.recipe["flying-robot-frame"].normal.ingredients = 
    {
          {"electric-engine-unit", 2},
          {"battery", 2},
          {"electronic-circuit", 2},
          {"nickel-plate", 10},
    }
end
if mods.OmegaDrill then
--Omega Drill
data.raw.technology["omega-drill"].prerequisites = { "bob-logistics-4", "bob-drills-4"}
data.raw.technology["omega-drill"].unit = {
      count = 300,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"production-science-pack", 1},
	{"utility-science-pack", 1}
      },
      time = 30
}
data.raw["mining-drill"]["omega-drill"].module_specification = 
{
      module_slots = 10,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
}
data.raw.recipe["omega-drill"].ingredients = 
{
    {"electric-engine-unit",25},
    {"turbo-transport-belt",10},
    {"bob-mining-drill-4",25},
    {"advanced-processing-unit",25},
    {"tungsten-gear-wheel",20},
    {"nitinol-bearing",10}

}
end
data.raw.item["nuclear-fuel"].stack_size = 2

if mods.bobplates then
--Fix the darn items left in inv from crafting bearings
data.raw.recipe["steel-bearing-ball"].result_count = 8
--data.raw.recipe["cobalt-steel-bearing-ball"].result_count = 8
data.raw.recipe["titanium-bearing-ball"].result_count = 8
data.raw.recipe["nitinol-bearing-ball"].result_count = 8
data.raw.recipe["ceramic-bearing-ball"].result_count = 8
		--bobmods.lib.recipe.remove_ingredient("rocket-silo","processing-unit")
		--bobmods.lib.recipe.add_ingredient("rocket-silo",{"advanced-processing-unit",400})
--bobmods.lib.recipe.remove_ingredient("rocket-silo","concrete")
--bobmods.lib.recipe.add_ingredient("rocket-silo",{"refined-concrete",1000})
end
if mods["bobplates"] then
data.raw.technology["nitinol-processing"].unit.ingredients = {
	  {"automation-science-pack", 1},
	  {"logistic-science-pack", 1},
	  {"chemical-science-pack", 1},
          {"utility-science-pack", 1}}
end
--[[
data:extend({
  {
    type = "recipe",
    name = "ober-belt-immunity-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = 
    {{"turbo-transport-belt",20},{"exoskeleton-equipment",2}},
    result = "belt-immunity-equipment",   
  },
})
bobmods.lib.tech.add_recipe_unlock("logistics-3", "ober-belt-immunity-equipment")
data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].shape = {width=2,height=2,type="full"}
]]--