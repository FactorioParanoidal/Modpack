local intermediatemulti = angelsmods.marathon.intermediatemulti

data:extend(
{
	-- Solder Plate
	{
		type = "recipe",
		name = "molten-solder-remelting",
		category = "induction-smelting",
		subgroup = "angels-solder-casting",
		energy_required = 6,
		enabled = false,
		normal =
		{
			enabled = false,
			energy_required = 6,
			ingredients ={{type="item", name="angels-solder", amount=4}},
			results={{type="fluid",name="liquid-molten-solder", amount=15}},
		},
		expensive =
		{
			enabled = false,
			energy_required = 6,
			ingredients ={{type="item", name="angels-solder", amount=5 * intermediatemulti}},
			results={{type="fluid",name="liquid-molten-solder", amount=20}},
		},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-solder.png",
			},
			{
				icon = "__angelsextended-remelting-fixed__/graphics/icons/remelting.png",
				tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
				scale = 0.32,
				shift = {-12, -12},
			}
		},
		icon_size = 64,
		order = "a]",
	},

	-- Molten Solder
	{
		type = "recipe",
		name = "molten-solder-alloy-mixing-1",
		category = "molten-alloy-mixing",
		subgroup = "aragas-solder-alloy-mixing",
		enabled = false,
		energy_required = 4,
		ingredients ={
			{type="fluid", name="liquid-molten-tin", amount=120},
			{type="fluid", name="liquid-molten-lead", amount=120},
		},
		results={{type="fluid", name="liquid-molten-solder", amount=240}},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-solder.png",
			},
			{
				icon = "__angelsextended-remelting-fixed__/graphics/icons/remelting.png",
				tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
				scale = 0.32,
				shift = {-12, -12},
			}
		},
		icon_size = 64,
		order = "aa",
	},
	{
		type = "recipe",
		name = "molten-solder-alloy-mixing-2",
		category = "molten-alloy-mixing",
		subgroup = "aragas-solder-alloy-mixing",
		enabled = false,
		energy_required = 4,
		ingredients ={
			{type="fluid", name="liquid-molten-tin", amount=120},
			{type="fluid", name="liquid-molten-zinc", amount=120},
		},
		results={{type="fluid", name="liquid-molten-solder", amount=240}},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-solder.png",
			},
			{
				icon = "__angelsextended-remelting-fixed__/graphics/icons/remelting.png",
				tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
				scale = 0.32,
				shift = {-12, -12},
			}
		},
		icon_size = 64,
		order = "ab",
	},
	{
		type = "recipe",
		name = "molten-solder-alloy-mixing-3",
		category = "molten-alloy-mixing",
		subgroup = "aragas-solder-alloy-mixing",
		enabled = false,
		energy_required = 4,
		ingredients ={
			{type="fluid", name="liquid-molten-tin", amount=120},
			{type="fluid", name="liquid-molten-copper", amount=120},
			{type="fluid", name="liquid-molten-silver", amount=120},
		},
		results={{type="fluid", name="liquid-molten-solder", amount=360}},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-solder.png",
			},
			{
				icon = "__angelsextended-remelting-fixed__/graphics/icons/remelting.png",
				tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
				scale = 0.32,
				shift = {-12, -12},
			}
		},
		icon_size = 64,
		order = "ac",
	},
}
)