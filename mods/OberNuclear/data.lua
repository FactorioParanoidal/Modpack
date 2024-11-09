--Changing Old Stuff
table.insert(data.raw.recipe["heat-exchanger"].ingredients,{"boiler",1})
table.insert(data.raw.recipe["steam-turbine"].ingredients,{"steam-engine",1})
data.raw.recipe["electric-furnace"].ingredients = {
    {"steel-furnace",1},
    {"advanced-circuit",5},
    {"steel-plate",4}
}
data.raw.technology["nuclear-fuel-reprocessing"].unit = 
{
    count = 500,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
	  },
    time = 30
}
data.raw.technology["uranium-ammo"].unit = 
{
    count = 300,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
	  },
    time = 30
}
data.raw.item["nuclear-fuel"].stack_size = 2
data.raw.recipe["uranium-fuel-cell"].result_count = 5

--Adding New Stuff
require('nuclear-furnace')
data:extend({
{
  type = "technology",
  name = "ober-nuclear-processing",
  icon = "__OberNuclear__/graphics/nuclear_processing.png",
  icon_size = 128,
  prerequisites =
  {
    "nuclear-power"
  },
  effects = {
    {
      type="unlock-recipe",
      recipe = "ober-nuclear-oil"
    },
    {
      type="unlock-recipe",
      recipe = "ober-nuclear-furnace"
    },
  },
  unit =
  {
    count = 1000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack",1},
    },
    time = 30
  },
  order = "c-a",
},
{
  type = "recipe",
  name = "ober-nuclear-oil",
  icon = "__OberNuclear__/graphics/high_temp_oil.png",
  icon_size = 128,	
  category = "oil-processing",
  subgroup = "fluid-recipes",
  energy_required = 5,
  enabled = false,
  ingredients = {
    {type="fluid",name="steam",amount=50,minimum_temperature=500},
    {type="fluid",name="crude-oil",amount=100},
  },
  results = {
    {type="fluid",name="heavy-oil",amount=10},
    {type="fluid",name="light-oil",amount=50},
    {type="fluid",name="petroleum-gas",amount=65},
  }, 
  order = "a[oil-processing]-d[oil-processing]"
}
})
function allow_productivity(recipe_name)
  for _, prototype in pairs(data.raw["module"]) do
    if prototype.limitation and string.find(prototype.name, "productivity", 1, true) then
      table.insert(prototype.limitation, recipe_name)
    end
  end
end
allow_productivity("ober-nuclear-oil")