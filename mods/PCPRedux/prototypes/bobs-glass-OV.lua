if data.raw.item["glass"] then
  data:extend(
  {
    {
      type = "recipe",
      name = "pmma-glass",
      category = "chemistry",
      subgroup = "petrochem-solids",
      energy_required = 2,
      enabled = false,
      ingredients ={
        {type="item", name="solid-pmma", amount=1},
      },
      results={
        {type="item", name="glass", amount=10},
      },
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-glass"),
      --icon = "",
      order = "c[glass]-b[pmma-glass]",
    },
    {
      type = "recipe",
      name = "pc-glass",
      category = "chemistry",
      subgroup = "petrochem-solids",
      energy_required = 2,
      enabled = false,
      ingredients ={
        {type="item", name="solid-pc", amount=1},
      },
      results={
        {type="item", name="glass", amount=2},--1
      },
      --icon = "",
      order = "c[glass]-a[pc-glass]",
    },
    crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-glass"),
  })
  	angelsmods.functions.allow_productivity("pc-glass")
  	angelsmods.functions.allow_productivity("pmma-glass")
  	angelsmods.functions.OV.add_unlock("plastic-pmma", "pmma-glass")
  	angelsmods.functions.OV.add_unlock("plastic-pc", "pc-glass")
end
