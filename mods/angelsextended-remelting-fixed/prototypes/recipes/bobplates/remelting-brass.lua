local intermediatemulti = angelsmods.marathon.intermediatemulti

data:extend(
{
	-- Brass Plate
	{
		type = "recipe",
		name = "molten-brass-remelting",
		category = "induction-smelting",
		subgroup = "angels-alloys-casting",
		-- Original Angel's Smelting does not add an expensive version to casting.
		-- Not sure why, is it applied to some other process earlier in production chain?
		normal =
		{
			enabled = false,
			energy_required = 6,
			ingredients ={{type="item", name="brass-alloy", amount=4}},
			results={{type="fluid",name="liquid-molten-brass", amount=35}},
		},
		expensive =
		{
			enabled = false,
			energy_required = 6,
			ingredients ={{type="item", name="brass-alloy", amount=5 * intermediatemulti}},
			results={{type="fluid",name="liquid-molten-brass", amount=40}},
		},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-brass.png",
			},
			{
				icon = "__angelsextended-remelting-fixed__/graphics/icons/remelting.png",
				tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
				scale = 0.32,
				shift = {-12, -12},
			}
		},
		icon_size = 64,
		order = "b]",
	},

	-- Molten Brass
	{
		type = "recipe",
		name = "molten-brass-alloy-mixing-1",
		category = "molten-alloy-mixing",
		subgroup = "aragas-brass-alloy-mixing",
		enabled = false,
		energy_required = 4,
		ingredients ={
			{type="fluid", name="liquid-molten-copper", amount=180},
			{type="fluid", name="liquid-molten-zinc", amount=60},
		},
		results={{type="fluid", name="liquid-molten-brass", amount=240}},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-brass.png",
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
		name = "molten-brass-alloy-mixing-2",
		category = "molten-alloy-mixing",
		subgroup = "aragas-brass-alloy-mixing",
		enabled = false,
		energy_required = 4,
		ingredients ={
			{type="fluid", name="liquid-molten-copper", amount=180},
			{type="fluid", name="liquid-molten-zinc", amount=120},
			{type="fluid", name="liquid-molten-tin", amount=60},
		},
		results={{type="fluid", name="liquid-molten-brass", amount=360}},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-brass.png",
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
		name = "molten-brass-alloy-mixing-3",
		category = "molten-alloy-mixing",
		subgroup = "aragas-brass-alloy-mixing",
		enabled = false,
		energy_required = 4,
		ingredients ={
			{type="fluid", name="liquid-molten-copper", amount=180},
			{type="fluid", name="liquid-molten-zinc", amount=120},
			{type="fluid", name="liquid-molten-lead", amount=60},
		},
		results={{type="fluid", name="liquid-molten-brass", amount=360}},
		icons = {
			{
				icon = "__angelssmelting__/graphics/icons/molten-brass.png",
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