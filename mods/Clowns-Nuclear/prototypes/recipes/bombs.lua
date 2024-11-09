data:extend(
{
	{
		type = "recipe",
		name = "plutonium-atomic-bomb",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"processing-unit", 20},
			{"explosives", 10},
			{"plutonium-239", 10},
		},
		result = "atomic-bomb",
		icons =
		{
			{
				icon = "__base__/graphics/icons/atomic-bomb.png",
				icon_size=64
			},
			{
				icon = "__Clowns-Nuclear__/graphics/icons/plutonium-239.png",
				icon_size=32,
				scale = 0.4,
				shift = {-10, 10},
			},
		},
	},
	{
		type = "recipe",
		name = "thermonuclear-bomb",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			--Others added below
			{"atomic-bomb", 1}
		},
		result = "thermonuclear-bomb",
		icons =
		{
			{
				icon = "__Clowns-Nuclear__/graphics/icons/thermonuclear-bomb.png",
				icon_size = 32
			},
		},
	},
}
)

--ADD INGREDIENTS TO THERMONUCLEAR BOMB

if mods["bobmodules"] then
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"speed-module-6", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"productivity-module-6", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"effectivity-module-6", 3})
else
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"speed-module-3", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"productivity-module-3", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"efficiency-module-3", 3})
end

if data.raw.item["fusion-reactor-equipment-2"] then
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"fusion-reactor-equipment-2", 1})
else
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"fission-reactor-equipment", 1})
end

if data.raw.item["advanced-processing-unit"] then
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"advanced-processing-unit", 200})
else
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"processing-unit", 200})
end
