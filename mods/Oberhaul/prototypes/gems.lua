if data.raw.recipe["sort-gem-ore"] then
data.raw.recipe["sort-gem-ore"].hidden = true
end
if mods.bobores then
if mods.angelsrefining then
data:extend({
{
    type = "recipe",
    name = "ober-liquify-ruby",
    energy_required = 1,
    ingredients = {{"ruby-ore",1}},
    results = {{"crystal-dust",5}},
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/crystal-dust.png",
        scale = 1,
		},
		{
			icon = "__bobores__/graphics/icons/ruby-ore.png",
			scale = 0.5,
			shift = { -9, -9},
		}
	},
	icon_size = 32,	
    subgroup = "bob-gems-ore",
    order = "a-0",
    category = "ore-sorting",
    enabled = false,
},
{
    type = "recipe",
    name = "ober-liquify-sapphire",
    energy_required = 1,
    ingredients = {{"sapphire-ore",1}},
    results = {{"crystal-dust",5}},
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/crystal-dust.png",
        scale = 1,
		},
		{
			icon = "__bobores__/graphics/icons/sapphire-ore.png",
			scale = 0.5,
			shift = { -9, -9},
		}
	},
	icon_size = 32,	
    subgroup = "bob-gems-ore",
    order = "b-0",
    category = "ore-sorting",
    enabled = false,
},
{
    type = "recipe",
    name = "ober-liquify-emerald",
    energy_required = 1,
    ingredients = {{"emerald-ore",1}},
    results = {{"crystal-dust",5}},
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/crystal-dust.png",
        scale = 1,
		},
		{
			icon = "__bobores__/graphics/icons/emerald-ore.png",
			scale = 0.5,
			shift = { -9, -9},
		}
	},
	icon_size = 32,	
    subgroup = "bob-gems-ore",
    order = "c-0",
    category = "ore-sorting",
    enabled = false,
},
{
    type = "recipe",
    name = "ober-liquify-amethyst",
    energy_required = 1,
    ingredients = {{"amethyst-ore",1}},
    results = {{"crystal-dust",5}},
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/crystal-dust.png",
        scale = 1,
		},
		{
			icon = "__bobores__/graphics/icons/amethyst-ore.png",
			scale = 0.5,
			shift = { -9, -9},
		}
	},
	icon_size = 32,	
    subgroup = "bob-gems-ore",
    order = "d-0",
    category = "ore-sorting",
    enabled = false,
},
{
    type = "recipe",
    name = "ober-liquify-topaz",
    energy_required = 1,
    ingredients = {{"topaz-ore",1}},
    results = {{"crystal-dust",5}},
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/crystal-dust.png",
        scale = 1,
		},
		{
			icon = "__bobores__/graphics/icons/topaz-ore.png",
			scale = 0.5,
			shift = { -9, -9},
		}
	},
	icon_size = 32,	
    subgroup = "bob-gems-ore",
    order = "e-0",
    category = "ore-sorting",
    enabled = false,
},
{
    type = "recipe",
    name = "ober-liquify-diamond",
    energy_required = 1,
    ingredients = {{"diamond-ore",1}},
    results = {{"crystal-dust",5}},
    icons = {
        {
        icon = "__angelsrefining__/graphics/icons/crystal-dust.png",
        scale = 1,
		},
		{
			icon = "__bobores__/graphics/icons/diamond-ore.png",
			scale = 0.5,
			shift = { -9, -9},
		}
	},
	icon_size = 32,	
    subgroup = "bob-gems-ore",
    order = "f-0",
    category = "ore-sorting",
    enabled = false,
},
})
bobmods.lib.tech.add_recipe_unlock("geode-processing-2", "ober-liquify-ruby")
bobmods.lib.tech.add_recipe_unlock("geode-processing-2", "ober-liquify-sapphire")  
bobmods.lib.tech.add_recipe_unlock("geode-processing-2", "ober-liquify-emerald")  
bobmods.lib.tech.add_recipe_unlock("geode-processing-2", "ober-liquify-amethyst")  
bobmods.lib.tech.add_recipe_unlock("geode-processing-2", "ober-liquify-topaz")  
bobmods.lib.tech.add_recipe_unlock("geode-processing-2", "ober-liquify-diamond")     
end 
end