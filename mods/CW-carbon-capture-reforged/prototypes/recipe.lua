data:extend({
	{
		type = "recipe-category",
		name = "CW-air-filter"
	},
	{
		type = "recipe",
		name = "CW-air-filter-machine-1",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-machine-1.png",
		icon_size = 64,
		category = "crafting",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{"assembling-machine-2", 1},
			{"electronic-circuit", 5},
			{"steel-plate", 10},
			{"steel-pipe", 10}
		},
		result = "CW-air-filter-machine-1",
	},
	{
		type = "recipe",
		name = "CW-air-filter-machine-2",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-machine-2.png",
		icon_size = 64,
		category = "crafting",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"CW-air-filter-machine-1", 2},
			{"advanced-circuit", 10},
			{"invar-alloy", 10}
		},
		result = "CW-air-filter-machine-2",
	},
	{
		type = "recipe",
		name = "CW-air-filter-machine-3",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-machine-3.png",
		icon_size = 64,
		category = "crafting",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"CW-air-filter-machine-2", 2},
			{"advanced-circuit", 25},
			{"engine-unit", 10},
			{"aluminium-plate", 10},
		},
		result = "CW-air-filter-machine-3"
	},
	{
		type = "recipe",
		name = "CW-air-filter-machine-4",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-machine-4.png",
		icon_size = 64,
		category = "crafting",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"CW-air-filter-machine-3", 2},
			{"processing-unit", 10},
			{"titanium-plate", 25}
		},
		result = "CW-air-filter-machine-4"
	},
	{
		type = "recipe",
		name = "CW-air-filter-machine-5",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-machine-5.png",
		icon_size = 64,
		category = "crafting",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"CW-air-filter-machine-4", 2},
			{"processing-unit", 50},
			{"electric-engine-unit", 10},
			{"nitinol-alloy", 20}
		},
		result = "CW-air-filter-machine-5"
	},
	{
		type = "recipe",
		name = "CW-air-filter-machine-6",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-machine-6.png",
		icon_size = 64,
		category = "crafting",
		energy_required = 15,
		enabled = false,
		ingredients =
		{
			{"CW-air-filter-machine-5", 2},
			{"processing-unit", 200},
			{"copper-tungsten-alloy", 50},
			{"electric-engine-unit", 25}
		},
		result = "CW-air-filter-machine-6"
	},
	{
		type = "recipe",
		name = "CW-empty-air-filter",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/empty-air-filter.png",
		icon_size = 64,
		icon_mipmaps = 4,
		category = "crafting",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"steel-plate", 5}
		},
		result = "CW-empty-air-filter"
	},

	{
		type = "recipe",
		name = "CW-air-filter",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter.png",
		icon_size = 64,
		icon_mipmaps = 4,
		category = "crafting",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"coal", 10},
			{"CW-empty-air-filter", 1},
		},
		result = "CW-air-filter"
	},
	{
		type = "recipe",
		name = "CW-filter-air",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/filter-air.png",
		icon_size = 64,
		category = "CW-air-filter",
		energy_required = 100,
		enabled = true,
		hidden = true,
		ingredients =
		{
			{"CW-air-filter", 1},
		},
		result = "CW-used-air-filter"
	},
	{
		type = "recipe",
		name = "CW-air-filter-cleaning-1",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-cleaning.png",
		icon_size = 32,
		category = "crafting",
		energy_required = 5,
		enabled = false,
		--requester_paste_multiplier = 10,
		--overload_multiplier = 10,
		main_product = "CW-air-filter",
		ingredients =
		{
			{"CW-used-air-filter", 1},
			{"coal", 5},
			--{type="fluid", name="water", amount=1000},
		},
		results = 
		{
		 {name="CW-air-filter", amount=1, probability=0.9},
			--{"iron-ore",5},
			--{type="fluid", name="CW-polution-sludge", amount=1000},
		}
	},
	{
		type = "recipe",
		name = "CW-air-filter-cleaning-2",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-cleaning-2.png",
		icon_size = 32,
		category = "crafting",
		energy_required = 20,
		enabled = false,
		--requester_paste_multiplier = 10,
		--overload_multiplier = 10,
		main_product = "CW-air-filter",
		ingredients =
		{
			{"CW-used-air-filter", 5},
			{"coal", 20}
			--{"CW-used-air-filter", 100},
			--{type="fluid", name="water", amount=1000},
		},
		results = 
		{
			{name="CW-air-filter", amount=5, probability=0.95},
		}
	},
	{
		type = "recipe",
		name = "CW-air-filter-cleaning-3",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-cleaning-3.png",
		icon_size = 32,
		category = "chemistry",
		energy_required = 15,
		enabled = false,
		--requester_paste_multiplier = 10,
		--overload_multiplier = 10,
		main_product = "CW-air-filter",
		ingredients =
		{
			{type="item", name="CW-used-air-filter", amount=5},
			{type="fluid", name="water-purified", amount=100},
		},
		results =
		{
			{name="CW-air-filter", amount=5, probability=0.98},
			{type="fluid", name="water-yellow-waste", amount=80},
			--{"CW-empty-air-filter", 95},
			--{"iron-ore",5},
			--{type="fluid", name="CW-polution-sludge", amount=1000},
		}
	},
	{
		type = "recipe",
		name = "CW-air-filter-cleaning-4",
		icon = "__CW-carbon-capture-reforged__/graphics/icons/air-filter-cleaning-4.png",
		icon_size = 32,
		category = "chemistry",
		energy_required = 12,
		enabled = false,
		--requester_paste_multiplier = 10,
		--overload_multiplier = 10,
		main_product = "CW-air-filter",
		ingredients =
		{
			{type="item", name="CW-used-air-filter", amount=5},
			{type="fluid", name="steam", amount=150},
		},
		results = 
		{
			{name="CW-air-filter", amount=5, probability=0.99},
			{type="fluid", name="water-yellow-waste", amount=80},
			{type="fluid", name="thermal-water", amount=20}
		}
	
	}

})
