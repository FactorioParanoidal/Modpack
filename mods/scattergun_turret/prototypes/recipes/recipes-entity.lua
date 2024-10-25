local MP = 5 --drd

data:extend({
	{
		type = "recipe",
		name = "scattergun-turret",
		enabled = false,
		energy_required = 20,
		ingredients = {{"stone-brick", 10*MP},{"iron-plate", 10*MP},{"copper-plate", 15*MP},{"iron-gear-wheel", 10*MP}},
    		results = {{type="item", name="scattergun-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/scattergun-turret.png",
    		icon_size = 32,
	},
	{
		type = "recipe",
		name = "w93-hmg-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-hmg", 1}},
    		results = {{type="item", name="w93-hmg-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/hmg-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-hmg-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-hmg", 1}},
    		results = {{type="item", name="w93-hmg-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/hmg-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-gatling-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-gatling", 1}},
    		results = {{type="item", name="w93-gatling-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/gatling-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-gatling-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-gatling", 1}},
    		results = {{type="item", name="w93-gatling-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/gatling-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-lcannon-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-lcannon", 1}},
    		results = {{type="item", name="w93-lcannon-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/lcannon-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-lcannon-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-lcannon", 1}},
    		results = {{type="item", name="w93-lcannon-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/lcannon-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-dcannon-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-dcannon", 1}},
    		results = {{type="item", name="w93-dcannon-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/dcannon-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-dcannon-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-dcannon", 1}},
    		results = {{type="item", name="w93-dcannon-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/dcannon-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-hcannon-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-hcannon", 1}},
    		results = {{type="item", name="w93-hcannon-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/hcannon-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-hcannon-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-hcannon", 1}},
    		results = {{type="item", name="w93-hcannon-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/hcannon-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-rocket-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-rocket", 1}},
    		results = {{type="item", name="w93-rocket-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/rocket-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-rocket-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-rocket", 1}},
    		results = {{type="item", name="w93-rocket-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/rocket-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-plaser-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-plaser", 1}},
    		results = {{type="item", name="w93-plaser-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/plaser-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-plaser-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-plaser", 1}},
    		results = {{type="item", name="w93-plaser-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/plaser-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-tlaser-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-tlaser", 1}},
    		results = {{type="item", name="w93-tlaser-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/tlaser-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-tlaser-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-tlaser", 1}},
    		results = {{type="item", name="w93-tlaser-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/tlaser-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-beam-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret-base", 1}, {"w93-modular-gun-beam", 1}},
    		results = {{type="item", name="w93-beam-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/beam-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-beam-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-beam", 1}},
    		results = {{type="item", name="w93-beam-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/beam-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-turret-base",
		enabled = false,
		energy_required = 10,
		ingredients = 	{{"stone-brick", 10*MP},{"steel-plate", 8*MP},{"engine-unit", 1*MP},
						{"gun-turret", 1} --drd
						},
    		results = {{type="item", name="w93-modular-turret-base", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-turret-base.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-turret2-base",
		enabled = false,
		energy_required = 10,
		ingredients = {{"concrete", 15*MP},{"plastic-bar", 16*MP},{"electric-engine-unit", 2*MP},
						{"w93-modular-turret-base", 1},{"electronic-circuit", 2*MP}}, --drd
    		results = {{type="item", name="w93-modular-turret2-base", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-turret2-base.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-hmg",
		enabled = false,
		energy_required = 10,
		ingredients = {{"iron-plate", 6},{"electronic-circuit", 3},{"iron-gear-wheel", 3}},
    		results = {{type="item", name="w93-modular-gun-hmg", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-hmg.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-gatling",
		enabled = false,
		energy_required = 10,
		ingredients = {{"iron-stick", 12},{"copper-plate", 8},{"advanced-circuit", 2},{"electric-engine-unit", 1}},
    		results = {{type="item", name="w93-modular-gun-gatling", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-gatling.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-lcannon",
		enabled = false,
		energy_required = 10,
		ingredients = {{"copper-plate", 5},{"steel-plate", 4}, {"advanced-circuit", 1},{"iron-gear-wheel", 4}},
    		results = {{type="item", name="w93-modular-gun-lcannon", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-lcannon.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-dcannon",
		enabled = false,
		energy_required = 10,
		ingredients = {{"w93-modular-gun-lcannon", 2},{"speed-module", 1}},
    		results = {{type="item", name="w93-modular-gun-dcannon", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-dcannon.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-hcannon",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 10,
		ingredients = {{"low-density-structure", 2},{"steel-plate", 5}, {"advanced-circuit", 2}, {type="fluid", name="lubricant", amount=50}
},
    		results = {{type="item", name="w93-modular-gun-hcannon", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-hcannon.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-rocket",
		enabled = false,
		energy_required = 10,
		ingredients = {{"steel-plate", 5},{"advanced-circuit", 2},{"rocket-launcher", 2}},
    		results = {{type="item", name="w93-modular-gun-rocket", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-rocket.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-plaser",
		enabled = false,
		energy_required = 10,
		ingredients = {{"plastic-bar", 10},{"iron-stick", 8}, {"electronic-circuit", 5}, {"speed-module", 1},{"battery", 10}},
    		results = {{type="item", name="w93-modular-gun-plaser", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-plaser.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-tlaser",
		enabled = false,
		energy_required = 10,
		ingredients = {{"plastic-bar", 8},{"steel-plate", 2}, {"processing-unit", 2}, {"battery", 10}, {"efficiency-module", 1}},
    		results = {{type="item", name="w93-modular-gun-tlaser", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-tlaser.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-beam",
		enabled = false,
		energy_required = 10,
		ingredients = {{"uranium-fuel-cell", 1},{"small-lamp",1},{"low-density-structure", 1},{"poison-capsule", 1}, {"processing-unit", 2},{"battery", 8}},
    		results = {{type="item", name="w93-modular-gun-beam", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/modular-gun-beam.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-turret-light-cannon-shells",
		enabled = false,
		energy_required = 8,
		ingredients = {{"copper-plate", 6}, {"steel-plate", 3}},
		result = "w93-turret-light-cannon-shells",
		icon = "__scattergun_turret__/graphics/icons/turret-light-cannon-shells.png",
    		icon_size = 64,
		icon_mipmaps = 4,
	}
})

for k, v in pairs(data.raw.module) do
	if v.name:find("productivity%-module") and v.limitation then
		table.insert(v.limitation, "w93-modular-turret-base")
		table.insert(v.limitation, "w93-modular-turret2-base")
		table.insert(v.limitation, "w93-modular-gun-hmg")
		table.insert(v.limitation, "w93-modular-gun-gatling")
		table.insert(v.limitation, "w93-modular-gun-lcannon")
		table.insert(v.limitation, "w93-modular-gun-dcannon")
		table.insert(v.limitation, "w93-modular-gun-hcannon")
		table.insert(v.limitation, "w93-modular-gun-rocket")
		table.insert(v.limitation, "w93-modular-gun-tlaser")
		table.insert(v.limitation, "w93-modular-gun-beam")
	end
end