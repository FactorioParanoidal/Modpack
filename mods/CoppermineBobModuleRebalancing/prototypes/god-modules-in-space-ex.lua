local enabled =
  settings.startup["coppermine-bob-module-god-modules-in-space-ex"].value and
  mods["SpaceMod"] and
  data.raw.technology["god-module-1"]
if enabled then
  local reduction = 1
  if settings.startup["coppermine-bob-module-exponential-modules"].value then
    reduction = 50
  end
  local recipes = { "ftl-drive", "command" }
  for _, product in pairs(recipes) do
    -- We replace either type of module so it should work regardless of whether
    -- the modules have already been tweaked by some other mod.
    local amount = 1
    for i, ingredient in pairs(data.raw.recipe[product].ingredients) do
      local item = bobmods.lib.item.basic_item(ingredient)
      local match_start = item.name:find("-module")
      if match_start then
        amount = math.ceil(item.amount / reduction)
      end
    end
    bobmods.lib.recipe.remove_ingredient(product, "productivity-module-3")
    bobmods.lib.recipe.remove_ingredient(product, "productivity-module-8")
    bobmods.lib.recipe.remove_ingredient(product, "efficiency-module-3")
    bobmods.lib.recipe.remove_ingredient(product, "effectivity-module-8")
    bobmods.lib.recipe.remove_ingredient(product, "speed-module-3")
    bobmods.lib.recipe.remove_ingredient(product, "speed-module-8")
    bobmods.lib.recipe.add_ingredient(product, {"god-module-5", amount})
  end

  bobmods.lib.tech.add_prerequisite("spaceship-command", "god-module-5")
  bobmods.lib.tech.add_prerequisite("ftl-propulsion", "god-module-5")
end
