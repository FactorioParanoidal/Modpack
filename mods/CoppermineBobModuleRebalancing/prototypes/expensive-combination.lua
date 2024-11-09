if settings.startup["coppermine-bob-module-expensive-module-combination"].value then

  data:extend({
    {
      type = "tool",
      name = "module-combining-case",
      icon = "__CoppermineBobModuleRebalancing__/graphics/icons/module-combining-case.png",
      icon_size = 32,
      subgroup = "module-intermediates",
      order = "c-0[module-combining-case]",
      stack_size = 100,
      durability = 1,
    },

    {
      type = "recipe",
      name = "module-combining-case",
      category = "electronics",
      energy_required = 10,
      enabled = false,
      ingredients =
      {
        {"module-case", 1},
        {"copper-tungsten-alloy", 1},
        {"silver-plate", 1},
        {"gunmetal-alloy", 1},
      },
      result = "module-combining-case",
    },

    {
      type = "item",
      name = "module-combining-solder",
      icon = "__CoppermineBobModuleRebalancing__/graphics/icons/module-combining-solder.png",
      icon_size = 32,
      subgroup = "module-intermediates",
      order = "c-d[module-combining-solder]",
      stack_size = 200,
      durability = 1,
    },

    {
      type = "recipe",
      name = "module-combining-solder",
      category = "electronics",
      energy_required = 2,
      enabled = false,
      ingredients =
      {
        {"solder", 4},
        {"gilded-copper-cable", 4},
        {"cobalt-steel-alloy", 1},
      },
      result = "module-combining-solder",
      result_count = 4,
    },

  })

  bobmods.lib.tech.add_recipe_unlock("module-merging", "module-combining-case")
  bobmods.lib.tech.add_recipe_unlock("module-merging", "module-combining-solder")
end
--upd by DrD

if data.raw.item["advanced-circuit"] then
  bobmods.lib.recipe.replace_ingredient("speed-module-3", "processing-unit", "advanced-circuit")
  bobmods.lib.recipe.replace_ingredient("efficiency-module-3", "processing-unit", "advanced-circuit")
  bobmods.lib.recipe.replace_ingredient("productivity-module-3", "processing-unit", "advanced-circuit")
  bobmods.lib.recipe.replace_ingredient("pollution-clean-module-3", "processing-unit", "advanced-circuit")
  bobmods.lib.recipe.replace_ingredient("pollution-create-module-3", "processing-unit", "advanced-circuit")
end
