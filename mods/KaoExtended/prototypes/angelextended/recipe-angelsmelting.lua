bobmods.lib.recipe.add_result("iron-ore-processing", (type="item", name="slag", amount=1, probability=0.5},)
bobmods.lib.recipe.add_result("copper-ore-processing", (type="item", name="slag", amount=1, probability=0.5},)
bobmods.lib.recipe.add_result("lead-ore-processing", (type="item", name="slag", amount=1, probability=0.5},)
bobmods.lib.recipe.add_result("tin-ore-processing", (type="item", name="slag", amount=1, probability=0.5},)

bobmods.lib.recipe.add_result("silica-ore-processing", (type="item", name="slag", amount=1, probability=0.3},)
bobmods.lib.recipe.add_result("nickel-ore-processing", (type="item", name="slag", amount=1, probability=0.3},)
bobmods.lib.recipe.add_result("aluminium-ore-processing", (type="item", name="slag", amount=1, probability=0.3},)
bobmods.lib.recipe.add_result("zinc-ore-processing", (type="item", name="slag", amount=1, probability=0.3},)

bobmods.lib.recipe.add_result("titanium-ore-processing", (type="item", name="slag", amount=1, probability=0.2},)
bobmods.lib.recipe.add_result("silver-ore-processing", (type="item", name="slag", amount=1, probability=0.2},)
bobmods.lib.recipe.add_result("gold-ore-processing", (type="item", name="slag", amount=1, probability=0.2},)
bobmods.lib.recipe.add_result("cobalt-ore-processing", (type="item", name="slag", amount=1, probability=0.2},)

bobmods.lib.recipe.add_result("tungsten-ore-processing", (type="item", name="slag", amount=1, probability=0.1},)

bobmods.lib.recipe.add_result("manganese-ore-processing", (type="item", name="slag", amount=1, probability=0.3},)
bobmods.lib.recipe.add_result("chrome-ore-processing", (type="item", name="slag", amount=1, probability=0.3},)
bobmods.lib.recipe.add_result("platinum-ore-processing", (type="item", name="slag", amount=1, probability=0.1},)

--[[
    {
    type = "recipe",
    name = "iron-ore-processing",
    category = "ore-processing",
	subgroup = "angels-iron",
    energy_required = 2,
	enabled = false,
    ingredients ={{"iron-ore", 4}},
    results=
    {
      {type="item", name="processed-iron", amount=2},
    },

data:extend({
  {
    type = "recipe",
    name = "copper-plate",
    category = "smelting",
 
	
    ingredients = {{ "copper-ore", 4}},
    result = "copper-plate",
    result_count = 2,
  },
  {
    type = "recipe",
    name = "iron-plate",
    category = "smelting",
    enabled = true,

    energy_required = 7,
    ingredients = {{"iron-ore", 4}},
    result = "iron-plate",
    result_count = 2,
  },
  --[[ {
    type = "recipe",
    name = "stone-brick",
    category = "smelting",

    energy_required = 7,
    ingredients = {{"stone", 5}},
    result = "stone-brick",
  }, ]]
  {
    type = "recipe",
    name = "steel-plate",
    category = "smelting",
    enabled = false,

    energy_required = 16,
    ingredients = {{"iron-plate", 8}},
    result = "steel-plate",
    result_count = 1,
  },
})

]]