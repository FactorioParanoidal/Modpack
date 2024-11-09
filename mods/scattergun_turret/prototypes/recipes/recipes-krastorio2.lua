function W93_UpdateRecipesKrastorio2()
	data.raw["recipe"]["scattergun-turret"].ingredients = {{"automation-core", 3}, {"stone-brick", 10}, {"iron-gear-wheel", 10}}
	data.raw["recipe"]["w93-modular-turret-base"].ingredients = {{"concrete", 30},{"steel-plate", 8},{"engine-unit", 1}}
	data.raw["recipe"]["w93-modular-gun-lcannon"].ingredients = {{"copper-plate", 5},{"steel-plate", 4}, {"electronic-components", 5},{"iron-gear-wheel", 4}}
	data.raw["recipe"]["w93-modular-gun-hcannon"].ingredients = {{"low-density-structure", 2},{"rare-metals", 10}, {"advanced-circuit", 2}, {type="fluid", name="lubricant", amount=50}
}
	data.raw["recipe"]["w93-modular-gun-plaser"].ingredients = {{"plastic-bar", 10},{"iron-stick", 8}, {"electronic-circuit", 5}, {"speed-module", 1}, {"battery", 10}, {"quartz", 15}}
	data.raw["recipe"]["w93-modular-gun-tlaser"].ingredients = {{"plastic-bar", 8}, {"steel-plate", 2}, {"processing-unit", 2}, {"lithium-sulfur-battery", 10}, {"imersite-crystal", 5}, {"efficiency-module", 1}}
	data.raw["recipe"]["w93-modular-gun-beam"].ingredients = {{"uranium-fuel-cell", 1},{"small-lamp",1},{"low-density-structure", 1},{"poison-capsule", 1}, {"processing-unit", 2},{"lithium-sulfur-battery", 8}}
	data.raw["recipe"]["w93-uranium-shotgun-shell"].ingredients = {{"shotgun-shell", 1}, {"uranium-238", 2}}
	data.raw["recipe"]["w93-uranium-shotgun-shell"].energy_required = 6
end