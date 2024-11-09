--[[bobmods.lib.recipe.add_result("iron-ore-processing", (type="item", name="slag", amount=1, probability=0.5,))
bobmods.lib.recipe.add_result("copper-ore-processing", (type="item", name="slag", amount=1, probability=0.5,))
bobmods.lib.recipe.add_result("lead-ore-processing", (type="item", name="slag", amount=1, probability=0.5,))
bobmods.lib.recipe.add_result("tin-ore-processing", (type="item", name="slag", amount=1, probability=0.5,))

bobmods.lib.recipe.add_result("silica-ore-processing", (type="item", name="slag", amount=1, probability=0.3,))
bobmods.lib.recipe.add_result("nickel-ore-processing", (type="item", name="slag", amount=1, probability=0.3,))
bobmods.lib.recipe.add_result("aluminium-ore-processing", (type="item", name="slag", amount=1, probability=0.3,))
bobmods.lib.recipe.add_result("zinc-ore-processing", (type="item", name="slag", amount=1, probability=0.3,))

bobmods.lib.recipe.add_result("titanium-ore-processing", (type="item", name="slag", amount=1, probability=0.2,))
bobmods.lib.recipe.add_result("silver-ore-processing", (type="item", name="slag", amount=1, probability=0.2,))
bobmods.lib.recipe.add_result("gold-ore-processing", (type="item", name="slag", amount=1, probability=0.2,))
bobmods.lib.recipe.add_result("cobalt-ore-processing", (type="item", name="slag", amount=1, probability=0.2,))

bobmods.lib.recipe.add_result("tungsten-ore-processing", (type="item", name="slag", amount=1, probability=0.1,))

bobmods.lib.recipe.add_result("manganese-ore-processing", (type="item", name="slag", amount=1, probability=0.3,))
bobmods.lib.recipe.add_result("chrome-ore-processing", (type="item", name="slag", amount=1, probability=0.3,))
bobmods.lib.recipe.add_result("platinum-ore-processing", (type="item", name="slag", amount=1, probability=0.1,))

]]
data:extend(
--marathon.update_recipe("iron-ore-processing",
  {
    type = "recipe",
    name = "iron-ore-processing",
    category = "ore-processing",
    subgroup = "angels-iron",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
      {"iron-ore", 4}
    },
    results =
    {
      {type="item", name="processed-iron", amount=2},
	  {type="item", name="slag", amount=1, probability=0.5}, --DrD
    },
	icon = "__angelssmelting__/graphics/icons/processed-iron.png", --DrD
	icon_size = 32,
    order = "aa",
    }
)

