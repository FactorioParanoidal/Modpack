require("prototypes.data-tables")
-- Plates (rolls)
for metal,properties in pairs(ASE.tables.coil_metals) do
  --pull unique properties
  if properties.ing_1 then
    ing_1 = properties.ing_1
    --adjust amount for tier 2 recipe
    ing_2 = table.deepcopy(ing_1)
  else
    ing_1 = {type = "fluid", name = "liquid-molten-"..metal, amount = 80}
    ing_2 = table.deepcopy(ing_1)
  end
  ing_2.amount = ing_2.amount*1.75 --140/80 7/4
  
  if metal == "gunmetal" then
    sgrp = "angels-alloys-casting"
  else
    sgrp = "angels-"..metal.."-casting"
  end
  --casting recipe
  data:extend({
    {
      type = "recipe",
      name = "angels-roll-"..metal.."-casting",
      category = "strand-casting",
      subgroup = sgrp,
      energy_required = 4,
      enabled = false,
      localised_name = {"recipe-name.casting", {"lookup."..metal}},
      icons = angelsmods.functions.add_number_icon_layer({
        {
          icon = "__angels-smelting-extended__/graphics/icons/roll-blank.png",
          tint = properties.tint,
          icon_size = 32
        }}, 1 , angelsmods.smelting.number_tint),
      ingredients = {
        ing_1,
        {type = "fluid", name = "water", amount = 10}
      },
      results =
      {
        {type = "item", name = "angels-roll-"..metal, amount = 2},
      },
      order = "g",
    },
    --converting recipe
    {
      type = "recipe",
      name = "angels-roll-"..metal.."-converting",
      category = "advanced-crafting",
      subgroup = sgrp,
      energy_required = 0.5,
      enabled = false,
      ingredients = {
        {type = "item", name = "angels-roll-"..metal, amount = 1}
      },
      results =
      {
        {type = "item", name = "angels-plate-"..metal, amount = 4},
      },
      icons = {
        {
          icon = "__angelssmelting__/graphics/icons/plate-"..metal..".png"
        },
        {
          icon = "__angels-smelting-extended__/graphics/icons/roll-blank.png",
          tint = properties.tint,
          scale = 0.4375,
          shift = {-10, -10}
        }
      },
      icon_size = 32,
      order = "j",
    },
    --Tier 2 Recipes (fast)
    {
      type = "recipe",
      name = "angels-roll-"..metal.."-casting-fast",
      category = "strand-casting",
      subgroup = sgrp,
      energy_required = 2,
      enabled = false,
      localised_name = {"recipe-name.casting", {"lookup."..metal}},
      ingredients = {
        ing_2,
        {type = "fluid", name = "liquid-coolant", amount = 40},
      },
      results =
      {
        {type = "item", name = "angels-roll-"..metal, amount = 4},
        {type = "fluid", name = "liquid-coolant-used", amount = 40, temperature = 300, catalyst_amount = 40}
      },
      icons = angelsmods.functions.add_number_icon_layer({
        {
          icon = "__angels-smelting-extended__/graphics/icons/roll-blank.png",
          tint = properties.tint,
          icon_size = 32
        }}, 2 , angelsmods.smelting.number_tint),
      order = "h",
    },
  })
  --add productivity to converting
  angelsmods.functions.allow_productivity("angels-roll-"..metal.."-converting")
end