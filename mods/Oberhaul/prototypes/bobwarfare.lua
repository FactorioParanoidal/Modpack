if mods.bobwarfare then
data.raw.technology["bob-ap-bullets"].enabled = false
data.raw.technology["bob-electric-bullets"].enabled = false
data.raw.technology["bob-he-bullets"].enabled = false
data.raw.technology["bob-flame-bullets"].enabled = false
data.raw.technology["bob-acid-bullets"].enabled = false
data.raw.technology["bob-poison-bullets"].enabled = false
--data.raw.technology["bob-shotgun-shells"].enabled = false
data.raw.technology["bob-shotgun-ap-shells"].enabled = false
data.raw.technology["bob-shotgun-electric-shells"].enabled = false
data.raw.technology["bob-shotgun-explosive-shells"].enabled = false
data.raw.technology["bob-shotgun-flame-shells"].enabled = false
data.raw.technology["bob-shotgun-acid-shells"].enabled = false
data.raw.technology["bob-shotgun-poison-shells"].enabled = false
data.raw.technology["bob-rocket"].enabled = false
data.raw.technology["bob-acid-rocket"].enabled = false
data.raw.technology["bob-flame-rocket"].enabled = false
data.raw.technology["bob-poison-rocket"].enabled = false
data.raw.technology["bob-piercing-rocket"].enabled = false
data.raw.technology["bob-electric-rocket"].enabled = false
data.raw.technology["bob-explosive-rocket"].enabled = false
bobmods.lib.recipe.add_ingredient("bob-power-armor-mk4",{"heavy-armor-2",1})
bobmods.lib.recipe.add_ingredient("bob-power-armor-mk5",{"heavy-armor-3",1})
data.raw.recipe["solar-panel-equipment-4"].ingredients = {
      {"solar-panel-equipment-3", 1},
      {"steel-plate", 2},
      {"advanced-processing-unit", 5},
      {"copper-cable", 5},
}
--Lowering Complexity Increasing Requirement
data.raw.recipe["bullet-casing"].hidden = true
data.raw.recipe["magazine"].hidden = true
data.raw.recipe["bullet-projectile"].hidden = true
data.raw.recipe["bullet"].hidden = true
data.raw.recipe["uranium-bullet-projectile"].hidden = true
data.raw.recipe["uranium-bullet"].hidden = true
--data.raw.recipe["shot"].hidden = true
data.raw.recipe["shotgun-shell-casing"].hidden = true
--data.raw.recipe["rocket-engine"].hidden = true

data.raw.recipe["bullet-magazine"].ingredients = {
    {"piercing-rounds-magazine",1},
    {"steel-plate",3},
    {"lead-plate",5},
    {"gunmetal-alloy",2},
    {"cordite",3}
}
data.raw.recipe["uranium-rounds-magazine"].ingredients = {
    {"bullet-magazine",1},
    {"uranium-238",2},
    {"cordite",3},
    {"titanium-bearing-ball",4}
}
data.raw.recipe["better-shotgun-shell"].ingredients = {
    {"piercing-shotgun-shell",1},
    {"steel-plate",3},
    {"lead-plate",5},
    {"gunmetal-alloy",2},
    {"cordite",3}
}
data.raw.recipe["shotgun-uranium-shell"].ingredients = {
    {"better-shotgun-shell",1},
    {"uranium-238",2},
    {"cordite",3},
    {"titanium-bearing-ball",4}
}
data.raw.technology["bob-bullets"].effects = {{type = "unlock-recipe", recipe = "bullet-magazine"}}
data.raw.technology["bob-shotgun-shells"].effects = {
      {
        type = "unlock-recipe",
        recipe = "shot"
      },
      {
        type = "unlock-recipe",
        recipe = "better-shotgun-shell"
      }}
data.raw.technology["uranium-ammo"].effects = {
      {
	type = "unlock-recipe",
	recipe = "uranium-rounds-magazine"
      },
      {
	type = "unlock-recipe",
	recipe = "shotgun-uranium-shell"
      }
}
data.raw.technology["uranium-ammo"].unit = 
{
      count = 200,
      ingredients = {
	  {"automation-science-pack", 1},
	  {"logistic-science-pack", 1},
	  {"chemical-science-pack", 1},
	  {"military-science-pack",1}
	  },
      time = 30
}
data.raw.technology["bob-power-armor-3"].unit.ingredients = {
	  {"automation-science-pack", 1},
	  {"logistic-science-pack", 1},
	  {"chemical-science-pack", 1},
          {"military-science-pack", 1},
          {"production-science-pack", 1}}

if mods.ShinyBobGFX then
data.raw["solar-panel-equipment"]["solar-panel-equipment"].sprite.filename = "__ShinyBobGFX__/graphics/icons/solar-panel-equipment-1.png"
data.raw["solar-panel-equipment"]["solar-panel-equipment-2"].sprite.filename = "__ShinyBobGFX__/graphics/icons/solar-panel-equipment-2.png"
data.raw["solar-panel-equipment"]["solar-panel-equipment-3"].sprite.filename = "__ShinyBobGFX__/graphics/icons/solar-panel-equipment-3.png"
data.raw["solar-panel-equipment"]["solar-panel-equipment-4"].sprite.filename = "__ShinyBobGFX__/graphics/icons/solar-panel-equipment-4.png"

--data.raw.technology["solar-panel-equipment"].icon_size = 128
data.raw.technology["solar-panel-equipment-2"].icon_size = 128
data.raw.technology["solar-panel-equipment-3"].icon_size = 128
data.raw.technology["solar-panel-equipment-4"].icon_size = 128

--data.raw.technology["solar-panel-equipment"].icon = "__Oberhaul__/graphics/solar-panel-equipment-1.png"
data.raw.technology["solar-panel-equipment-2"].icon = "__Oberhaul__/graphics/solar-panel-equipment-2.png"
data.raw.technology["solar-panel-equipment-3"].icon = "__Oberhaul__/graphics/solar-panel-equipment-3.png"
data.raw.technology["solar-panel-equipment-4"].icon = "__Oberhaul__/graphics/solar-panel-equipment-4.png"
end

data:extend({
  {
    type = "recipe",
    name = "ober-portable-solar",
    enabled = false,
    energy_required = 10,
    ingredients = 
    {{"solar-panel-equipment-4",16}},
    result = "fission-reactor-equipment",   
  }
})
bobmods.lib.tech.add_recipe_unlock("fission-reactor-equipment", "ober-portable-solar")
end
--[[
data.raw.technology["power-armor-2"].unit.ingredients = {
	  {"automation-science-pack", 1},
	  {"logistic-science-pack", 1},
	  {"chemical-science-pack", 1},
          {"military-science-pack", 1}}
]]