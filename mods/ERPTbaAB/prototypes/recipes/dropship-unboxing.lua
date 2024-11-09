data:extend(
  {
    {
      type = "recipe",
      name = "random-dropship-unboxing",
      icons = mods["angelssmelting"] and
        {
          {icon = "__angelsrefining__/graphics/icons/sort-icon.png"},
          {icon = "__ERPTbaAB__/graphics/icons/random-dropship.png", scale = 0.5, shift = {8, 8}}
        } or
        {{icon = "__ERPTbaAB__/graphics/icons/random-dropship.png"}},
      icon_size = 32,
      category = mods["angelssmelting"] and "ore-sorting" or "satellite-crafting",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {"random-dropship", 1}
      },
      results = {
        {name = "iron-ore", amount = 3000, probability = 0.50},
        {name = "iron-ore", amount = 1000, probability = 0.30},
        {name = "iron-ore", amount = 4000, probability = 0.05},
        {name = "copper-ore", amount = 2000, probability = 0.35},
        {name = "copper-ore", amount = 5000, probability = 0.05},
        {name = "nickel-ore", amount = 3000, probability = 0.20},
        {name = "nickel-ore", amount = 5000, probability = 0.05},
        {name = "bauxite-ore", amount = 2000, probability = 0.25}, -- aluminium ore
        {name = "bauxite-ore", amount = 4000, probability = 0.05}, -- aluminium ore
        {name = "cobalt-ore", amount = 1000, probability = 0.10},
        {name = "cobalt-ore", amount = 3000, probability = 0.05},
        {name = "gold-ore", amount = 1500, probability = 0.15},
        {name = "gold-ore", amount = 3000, probability = 0.10},
        mods["angelssmelting"] and {name = "platinum-ore", amount = 500, probability = 0.10},
        mods["angelssmelting"] and {name = "platinum-ore", amount = 2500, probability = 0.02}
      },
      subgroup = "space-mining"
    }
  }
)

if mods["Clowns-AngelBob-Nuclear"] then
  table.insert(
    data.raw["recipe"]["random-dropship-unboxing"].results,
    {name = "osmium-ore", amount = 5, probability = 0.15}
  )
  table.insert(
    data.raw["recipe"]["random-dropship-unboxing"].results,
    {name = "magnesium-ore", amount = 10, probability = 0.20}
  )
end
