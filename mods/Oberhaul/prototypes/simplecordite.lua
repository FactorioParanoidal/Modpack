--Changing Bullet Complexity Back
data.raw.recipe["sulfuric-nitric-acid"].hidden = true
data.raw.recipe["liquid-glycerol"].ingredients = {{type="fluid", name="liquid-fuel-oil", amount=100}}
data.raw.recipe["gun-cotton"].ingredients = {{type="item", name="wood", amount=1}}

--[[
data:extend(
{ 
  {
    type = "recipe",
    name = "nitroglycerin",
    category = "chemistry",
	subgroup = "petrochem-solids-2",	--DrD
    enabled = false,
    energy_required = 1.5,
    ingredients =
    {
      {type="fluid", name="liquid-glycerol", amount=10},
      {type="fluid", name="liquid-sulfuric-acid", amount=30},
    },
    results=
    {
      {type="fluid", name="nitroglycerin", amount=10},
    },
    subgroup = "fluid",
    icon = "__bobwarfare__/graphics/icons/nitroglycerin.png",
    icon_size = 32,
    order = "d"
  },
})
]]--