--Only hand craft resin
data:extend({
{
    type = "recipe-category",
    name = "crafting-handonly"
},

    {
      type = "recipe",
      name = "coke-purification-3",
      category = "liquifying",
      subgroup = "petrochem-coal",
      energy_required = 2,
      enabled = false,
    ingredients ={
		{type="item", name="solid-coke", amount=2}, --DrD ???
		{type="fluid", name="gas-carbon-dioxide", amount=40},
	},
    results=
    {
		{type="item", name="solid-carbon", amount=3},
    },
    icons = {
        {
          icon = "__angelspetrochem__/graphics/icons/solid-carbon.png"
        },
        {
          icon = "__angelsrefining__/graphics/icons/num_3.png",
          tint = angelsmods.petrochem.number_tint,
          scale = 0.32,
          shift = {-12, -12}
        }
      },
      icon_size = 32,
      order = "d[coke-purification]",
      crafting_machine_tint = {
        primary = {r = 1, g = 0.5, b = 0.5, a = 0},
        secondary = {r = 1, g = 0.5, b = 0.5, a = 0},
        tertiary = {r = 167 / 255, g = 75 / 255, b = 5 / 255, a = 0 / 255}
      }
    },

{
		type = "recipe",
		name = "gas-nitrogen-monoxide-2",
		category = "chemistry",
		subgroup = "petrochem-nitrogen",
		energy_required = 2,
		enabled = false,
		ingredients ={
			{type="fluid", name="gas-ammonia", amount=60},
			{type="fluid", name="gas-oxygen", amount=40},
		},
		results=
		{
			{type="fluid", name="gas-nitrogen-monoxide", amount=10},
		},
		icons = angelsmods.functions.create_gas_recipe_icon(
		{
			{"__angelspetrochem__/graphics/icons/molecules/nitric-oxide.png", 72}
		},
		"NOO"
		),
		--icon = "__angelspetrochem__/graphics/icons/nitrogen-03.png",
		--icon_size = 32,
		order = "c[gas-nitrogen-dioxide]",
	},

{
    type = "technology",
    name = "angels-coal-processing-2",
    icons = angelsmods.functions.create_gas_tech_icon({{067, 067, 067}, {056, 056, 056}, {045, 045, 045}}),
    icon_size = 128,
    prerequisites =
    {
      "angels-coal-processing",
      "angels-advanced-chemistry-1",
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "coke-purification-2"
      },
      {
        type = "unlock-recipe",
        recipe = "carbon-separation-1"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-coke-sulfur"
      },
	  {
        type = "unlock-recipe",
        recipe = "coke-purification-3"  --DrD
	  },
    },
    unit =
    {
      count = 50,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 15
    },
    order = "c-a"
  },


})

--if data.raw.recipe["gas-nitrogen-monoxide"] then
--data.raw.recipe["gas-nitrogen-monoxide"].icon = "__angelspetrochem__/graphics/icons/nitrogen-03-2.png"
--end


data.raw.recipe["bob-resin-wood"].category = "crafting-handonly"
data.raw.recipe["bob-resin-wood"].result_count = 1
data.raw.recipe["bob-resin-wood"].ingredients = {{"wood",1}}
data.raw.recipe["bob-resin-wood"].energy_required = 4
table.insert(data.raw.character.character.crafting_categories, "crafting-handonly")

--Remove smelting resin to rubber
--data.raw.recipe["bob-rubber"].hidden = true --drd
data.raw.recipe["bob-rubber"].energy_required = 12
data.raw.recipe["bob-rubber"].ingredients[1] = {name = "resin", type = "item", amount = 40}