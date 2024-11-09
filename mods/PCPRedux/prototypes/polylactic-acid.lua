---Lactic acid (PLA bioplastic), bacterial fermentation of fermentation base
---then process lactic acid to PLA-check path for this... pretty sure esterification, meaning water extraction will be big, needs to be done under a low pH (suggest acid synthesis).
--
--[[THINGS TO ADD:
bacterial-growth-seed - may look at puffer options here, ideally i would like an alien orb, but a puffer should work well (this whole process relies on the bioprocessing mod anyway)
fermentation broth needs to contain ammonia, possibly do an intermediate step

]]
--Recipe
--Bacterial-fermentation
--this process works best with wheaton due to the need for soil in that crop, primdeadadelion leaves excess compost :(
if data.raw.item["temperate-garden"] then
  data:extend(
    {
    {
      type = "item",
      name = "bacterial-growth-seed",
      icon="__PCPRedux__/graphics/icons/bacterial-mother-2.png",
      icon_size = 64,
      subgroup="bio-processor-fermentation",
      order = "a[bacterial-growth-seed]",
      stack_size = 20
    },
    {
      type = "recipe",
      name = "Bacterial-Anerobic-Fermentation",
      category = "chemistry",
      subgroup = "bio-processor-fermentation",
      enabled = false,
      energy_required = 4,
      ingredients ={
        {type="fluid", name="liquid-fermentation-raw", amount=100},
        {type="item", name="bacterial-growth-seed",amount=1},
      },
      results=
      {
        {type="fluid", name="liquid-lactic-acid", amount=200},
        {type="item", name="solid-compost", amount=1},
      },
      order = "h",
      icons =angelsmods.functions.create_liquid_recipe_icon({"liquid-lactic-acid"},"COH"),--generate_fluid_recipe_icons("lactic_acid","coh","liq"),
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-lactic-acid"),
    },
    {
      type = "recipe",
      name = "lactic-acid-esterification",
      category = "chemistry",
      subgroup = "bio-plastic",
      enabled = false,
      energy_required = 3,
      ingredients ={
        {type="fluid", name="liquid-lactic-acid", amount=200},
        {type="fluid", name="gas-sulfur-dioxide",amount=100},
      },
      results={
        {type="fluid", name="liquid-plastic", amount=50},
        {type="fluid", name="liquid-sulfuric-acid",amount=100},
      },
      order = "g",
      icons = {
        {
          icon = "__PCPRedux__/graphics/icons/poly-lactic-acid-plastic.png",
        },
      },
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-plastic"),
      icon_size = 32,
    },
    {
      type="recipe",
      name="bacterial-growth-seed-cultivation",
      category="chemistry",
      subgroup="bio-processor-fermentation",
      enabled=false,
      emergy_required=100,
      ingredients={
        {type="fluid", name="liquid-fermentation-raw", amount=5000},
        {type="item",name="solid-compost",amount=5},
      },
      results={
        {type="item", name="bacterial-growth-seed",amount=1},
      },
      order="c",
      icons= {
        {
          icon="__PCPRedux__/graphics/icons/bacterial-mother-1.png",
          icon_size=64,
        },
      },
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-fermentation-raw"),
      icon_size=32,
    },
    {
      type="recipe",
      name="bacterial-growth-seed-cultivation-2",
      category="chemistry",
      subgroup="bio-processor-fermentation",
      enabled=false,
      emergy_required=20,
      ingredients={
        {type="fluid", name="liquid-fermentation-raw", amount=100},
        --added in 0.0.29 at 200 to offset dropping lactic acid requirement drop
        --dropped requirement from 200-100 in 0.0.30
        {type="fluid", name="liquid-sulfuric-acid",amount=300},
        --initially 500, dropped to 400 in 0.0.29 to offset the loss
        --dropped to 300 in 0.0.30, still a large loss overall
        {type="fluid", name="liquid-lactic-acid", amount=80},
        --initially 200, dropped to 100 in 0.0.29 to remove the no-return cycle
        -- dropped to 80 in 0.0.30 to improve ratio and keep focus on sulfuric acid
        {type="item", name="bacterial-growth-seed",amount=10},
      },
      results={
        {type="item", name="bacterial-growth-seed",amount=12},
        --initially 11, increased to 12 in 0.0.29
      },
      order="c",
      icons= {
        {
          icon="__PCPRedux__/graphics/icons/bacterial-mother-2.png",
          icon_size=64,
        },
      },
      crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("bacterial-growth-seed" or "liquid-lactic-acid"),
      icon_size=32,
    },
    {
      type = "technology",
      name = "bioplastic-pla",
      icon = "__angelsbioprocessing__/graphics/technology/press-tech.png",
      icon_size = 128,
      prerequisites =
      {
        "bio-plastic-2",
      },
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "lactic-acid-esterification"
        },
        {
          type = "unlock-recipe",
          recipe = "Bacterial-Anerobic-Fermentation"
        },
        {
          type = "unlock-recipe",
          recipe = "bacterial-growth-seed-cultivation-2"
        },
        {
          type = "unlock-recipe",
          recipe = "bacterial-growth-seed-cultivation"
        },
      },
      unit =
      {
        count = 75,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          --{"alien-science-pack", 1}
        },
        time = 30
      },
    },
  })
end