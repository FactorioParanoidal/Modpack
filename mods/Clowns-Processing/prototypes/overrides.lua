--[[OPTIONAL REMOVE BOB'S BULLETS
if settings.startup["bob-bullet-override"].value and mods["bobwarfare"] then
	--DO THINGS SOME DAY :o
end]]--

--REPLACE URANIUM-238 WITH DEPLETED URANIUM FOR MILITARY APPLICATIONS

if settings.startup["depleted-uranium"].value then
	if data.raw.recipe["shotgun-uranium-shell"] and data.raw.item["cordite"] then
		data.raw.recipe["shotgun-uranium-shell"].ingredients =
		{
			{"shotgun-shell-casing", 1},
			{"clowns-plate-depleted-uranium", 1},
			{"cordite", 1}
		}
	end
	if data.raw.recipe["uranium-bullet-projectile"] then
		data.raw.recipe["uranium-bullet-projectile"].ingredients =
		{
			{"copper-plate", 1},
			{"clowns-plate-depleted-uranium", 1}
		}
	end
	data.raw.recipe["uranium-cannon-shell"].ingredients =
	{
		{"cannon-shell", 1},
		{"clowns-plate-depleted-uranium", 1}
	}
	data.raw.recipe["explosive-uranium-cannon-shell"].ingredients =
	{
		{"explosive-cannon-shell", 1},
		{"clowns-plate-depleted-uranium", 1}
	}
end

--OPTIONAL SPACEMOD CLEANUP

if mods["SpaceMod"] then
	data.raw.item["assembly-robot"].subgroup = "spacex"
	data.raw.item["drydock-assembly"].subgroup = "spacex"
	data.raw.item["drydock-structural"].subgroup = "spacex"
	data.raw.item["fusion-reactor"].subgroup = "spacex"
	data.raw.item["hull-component"].subgroup = "spacex"
	data.raw.item["protection-field"].subgroup = "spacex"
	data.raw.item["space-thruster"].subgroup = "spacex"
	data.raw.item["fuel-cell"].subgroup = "spacex"
	data.raw.item["habitation"].subgroup = "spacex"
	data.raw.item["life-support"].subgroup = "spacex"
	data.raw.item["command"].subgroup = "spacex"
	data.raw.item["astrometrics"].subgroup = "spacex"
	data.raw.item["command"].subgroup = "spacex"
	data.raw.item["ftl-drive"].subgroup = "spacex"
end
--centrifuge updates
if settings.startup["MCP_enable_centrifuges"].value then
	data.raw.item["centrifuge"].localised_name={"centrifuge","MK1"}
	data.raw.item["centrifuge"].order = "a-a"
	data.raw["assembling-machine"]["centrifuge"].fast_replaceable_group = "centrifuge"
end

--[[if settings.startup["gem-cleanup"].value == true and data.raw["item-group"]["bob-gems"] then
	data.raw["item-subgroup"]["bob-gems-ore"].group = "bob-resource-products"
	data.raw["item-subgroup"]["bob-gems-raw"].group = "bob-resource-products"
	data.raw["item-subgroup"]["bob-gems-cut"].group = "bob-resource-products"
	data.raw["item-subgroup"]["bob-gems-polished"].group = "bob-resource-products"
end
]]
if settings.startup["fluid-cleanup"].value == true and data.raw["item-group"]["bob-fluid-products"] then
	data.raw["item-subgroup"]["bob-fluid"].group = "bob-resource-products"
	if data.raw["item-subgroup"]["bob-fluid-electrolysis"] then
		data.raw["item-subgroup"]["bob-fluid-electrolysis"].group = "bob-resource-products"
	end
	if data.raw["item-subgroup"]["bob-fluid-pump"] then
		data.raw["item-subgroup"]["bob-fluid-pump"].group = "bob-resource-products"
	end
end

if settings.startup["equipment-group"].value then
	data.raw.armor["light-armor"].subgroup = "armor"
	data.raw.armor["heavy-armor"].subgroup = "armor"
	data.raw.armor["modular-armor"].subgroup = "armor"
	data.raw.armor["power-armor"].subgroup = "armor"
	data.raw.armor["power-armor-mk2"].subgroup = "armor"

	data.raw.item["battery-equipment"].subgroup = "batteries"
	data.raw.item["battery-mk2-equipment"].subgroup = "batteries"

	data.raw.item["solar-panel-equipment"].subgroup = "power"

	data.raw.item["fission-reactor-equipment"].subgroup = "power"

	data.raw.item["night-vision-equipment"].subgroup = "misc1"

	data.raw.item["exoskeleton-equipment"].subgroup = "misc1"

	data.raw.item["personal-roboport-equipment"].subgroup = "misc1"
	data.raw.item["personal-roboport-mk2-equipment"].subgroup = "misc1"

	data.raw.item["energy-shield-equipment"].subgroup = "shields"
	data.raw.item["energy-shield-mk2-equipment"].subgroup = "shields"

	data.raw.item["personal-laser-defense-equipment"].subgroup = "personal-laser-defences"

	data.raw.item["discharge-defense-equipment"].subgroup = "misc1"
	data.raw.capsule["discharge-defense-remote"].subgroup = "misc1"
	data.raw.item["belt-immunity-equipment"].subgroup = "shields"

	if mods["bobequipment"] then
		data.raw.item["battery-mk3-equipment"].subgroup = "batteries"
		data.raw.item["battery-mk4-equipment"].subgroup = "batteries"
		data.raw.item["battery-mk5-equipment"].subgroup = "batteries"
		data.raw.item["battery-mk6-equipment"].subgroup = "batteries"

		data.raw.item["energy-shield-mk3-equipment"].subgroup = "shields"
		data.raw.item["energy-shield-mk4-equipment"].subgroup = "shields"
		data.raw.item["energy-shield-mk5-equipment"].subgroup = "shields"
		data.raw.item["energy-shield-mk6-equipment"].subgroup = "shields"

		data.raw.item["solar-panel-equipment-2"].subgroup = "power"
		data.raw.item["solar-panel-equipment-3"].subgroup = "power"
		data.raw.item["solar-panel-equipment-4"].subgroup = "power"

		data.raw.item["fusion-reactor-equipment-2"].subgroup = "power"
		data.raw.item["fusion-reactor-equipment-3"].subgroup = "power"
		data.raw.item["fusion-reactor-equipment-4"].subgroup = "power"

		data.raw.item["night-vision-equipment-2"].subgroup = "misc1"
		data.raw.item["night-vision-equipment-3"].subgroup = "misc1"

		data.raw.item["exoskeleton-equipment-2"].subgroup = "misc1"
		data.raw.item["exoskeleton-equipment-3"].subgroup = "misc1"

		data.raw.item["personal-laser-defense-equipment-2"].subgroup = "personal-laser-defences"
		data.raw.item["personal-laser-defense-equipment-3"].subgroup = "personal-laser-defences"
		data.raw.item["personal-laser-defense-equipment-4"].subgroup = "personal-laser-defences"
		data.raw.item["personal-laser-defense-equipment-5"].subgroup = "personal-laser-defences"
		data.raw.item["personal-laser-defense-equipment-6"].subgroup = "personal-laser-defences"

	end

	if mods["bobvehicleequipment"] then
		data.raw.item["vehicle-battery-1"].subgroup = "vehicle-batteries"
		data.raw.item["vehicle-battery-2"].subgroup = "vehicle-batteries"
		data.raw.item["vehicle-battery-3"].subgroup = "vehicle-batteries"
		data.raw.item["vehicle-battery-4"].subgroup = "vehicle-batteries"
		data.raw.item["vehicle-battery-5"].subgroup = "vehicle-batteries"
		data.raw.item["vehicle-battery-6"].subgroup = "vehicle-batteries"

		data.raw.item["vehicle-shield-1"].subgroup = "vehicle-shields"
		data.raw.item["vehicle-shield-2"].subgroup = "vehicle-shields"
		data.raw.item["vehicle-shield-3"].subgroup = "vehicle-shields"
		data.raw.item["vehicle-shield-4"].subgroup = "vehicle-shields"
		data.raw.item["vehicle-shield-5"].subgroup = "vehicle-shields"
		data.raw.item["vehicle-shield-6"].subgroup = "vehicle-shields"

		data.raw.item["vehicle-solar-panel-1"].subgroup = "vehicle-power1"
		data.raw.item["vehicle-solar-panel-2"].subgroup = "vehicle-power1"
		data.raw.item["vehicle-solar-panel-3"].subgroup = "vehicle-power1"
		data.raw.item["vehicle-solar-panel-4"].subgroup = "vehicle-power1"
		data.raw.item["vehicle-solar-panel-5"].subgroup = "vehicle-power1"
		data.raw.item["vehicle-solar-panel-6"].subgroup = "vehicle-power1"

		data.raw.item["vehicle-fusion-cell-1"].subgroup = "vehicle-power2"
		data.raw.item["vehicle-fusion-cell-2"].subgroup = "vehicle-power2"
		data.raw.item["vehicle-fusion-cell-3"].subgroup = "vehicle-power2"
		data.raw.item["vehicle-fusion-cell-4"].subgroup = "vehicle-power2"
		data.raw.item["vehicle-fusion-cell-5"].subgroup = "vehicle-power2"
		data.raw.item["vehicle-fusion-cell-6"].subgroup = "vehicle-power2"

		data.raw.item["vehicle-fusion-reactor-1"].subgroup = "vehicle-power3"
		data.raw.item["vehicle-fusion-reactor-2"].subgroup = "vehicle-power3"
		data.raw.item["vehicle-fusion-reactor-3"].subgroup = "vehicle-power3"
		data.raw.item["vehicle-fusion-reactor-4"].subgroup = "vehicle-power3"
		data.raw.item["vehicle-fusion-reactor-5"].subgroup = "vehicle-power3"
		data.raw.item["vehicle-fusion-reactor-6"].subgroup = "vehicle-power3"

		data.raw.item["vehicle-laser-defense-1"].subgroup = "vehicle-personal-laser-defences"
		data.raw.item["vehicle-laser-defense-2"].subgroup = "vehicle-personal-laser-defences"
		data.raw.item["vehicle-laser-defense-3"].subgroup = "vehicle-personal-laser-defences"
		data.raw.item["vehicle-laser-defense-4"].subgroup = "vehicle-personal-laser-defences"
		data.raw.item["vehicle-laser-defense-5"].subgroup = "vehicle-personal-laser-defences"
		data.raw.item["vehicle-laser-defense-6"].subgroup = "vehicle-personal-laser-defences"

		data.raw.item["vehicle-big-turret-1"].subgroup = "vehicle-plasma-cannons"
		data.raw.item["vehicle-big-turret-2"].subgroup = "vehicle-plasma-cannons"
		data.raw.item["vehicle-big-turret-3"].subgroup = "vehicle-plasma-cannons"
		data.raw.item["vehicle-big-turret-4"].subgroup = "vehicle-plasma-cannons"
		data.raw.item["vehicle-big-turret-5"].subgroup = "vehicle-plasma-cannons"
		data.raw.item["vehicle-big-turret-6"].subgroup = "vehicle-plasma-cannons"
		data.raw.item["vehicle-big-turret-1"].subgroup = "vehicle-plasma-cannons"

		data.raw.item["vehicle-roboport"].subgroup = "vehicle-misc1"
		data.raw.item["vehicle-roboport-2"].subgroup = "vehicle-misc1"
		data.raw.item["vehicle-motor"].subgroup = "vehicle-misc1"
		data.raw.item["vehicle-engine"].subgroup = "vehicle-misc1"
	end
else
	--move armours back out to combat
	data.raw["item-subgroup"]["armor"].group = "combat"
	data.raw["item-subgroup"]["armor"].order = "a[armor]-a[all]"
end
--update aluminium
if angelsmods.trigger.smelting_products["aluminium"].plate then
	data.raw.recipe["molten-aluminium-smelting-3"].order = "i[liquid-molten-aluminium]-d"
	data.raw.recipe["molten-aluminium-smelting-3"].icons = angelsmods.functions.add_number_icon_layer(
		angelsmods.functions.get_object_icons("liquid-molten-aluminium"),
		4, angelsmods.smelting.number_tint)
end
--update titanium sponge
if angelsmods.trigger.smelting_products["titanium"].plate then
	data.raw.recipe["liquid-titanium-tetrachloride-smelting"].icons = angelsmods.functions.add_number_icon_layer(
		{{icon = "__angelssmelting__/graphics/icons/sponge-titanium.png",	icon_size = 32}},
		1, angelsmods.smelting.number_tint)
	data.raw.recipe["sponge-magnesium-titanium-smelting"].icons = angelsmods.functions.add_number_icon_layer(
		{{icon = "__angelssmelting__/graphics/icons/sponge-titanium.png",	icon_size = 32}},
		2, angelsmods.smelting.number_tint)
end