data:extend({
	{
		type = "recipe",
		name = "w93-radar-turret",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-radar", 1}},
    		results = {{type="item", name="w93-radar-turret", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/radar-turret.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-radar-turret2",
		enabled = false,
		energy_required = 5,
		ingredients = {{"w93-modular-turret2-base", 1}, {"w93-modular-gun-radar2", 1}},
    		results = {{type="item", name="w93-radar-turret2", amount=1}},
		icon = "__scattergun_turret__/graphics/icons/radar-turret2.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-radar",
		enabled = false,
		energy_required = 10,
		ingredients = {{"copper-plate", 10},{"efficiency-module-2", 1},{"iron-gear-wheel", 10}},
		result = "w93-modular-gun-radar",
		icon = "__scattergun_turret__/graphics/icons/modular-gun-radar.png",
    		icon_size = 64,
	},
	{
		type = "recipe",
		name = "w93-modular-gun-radar2",
		enabled = false,
		energy_required = 10,
		ingredients = {{"copper-plate", 15},{"iron-stick",20},{"speed-module-2", 1},{"iron-gear-wheel", 5}},
		result = "w93-modular-gun-radar2",
		icon = "__scattergun_turret__/graphics/icons/modular-gun-radar2.png",
    		icon_size = 64,
	}
})

for k, v in pairs(data.raw.module) do
	if v.name:find("productivity%-module") and v.limitation then
		table.insert(v.limitation, "w93-modular-gun-radar")
		table.insert(v.limitation, "w93-modular-gun-radar2")
	end
end