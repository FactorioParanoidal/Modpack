local a = false
data:extend({
	{ type = "recipe",
    name = "sci-component-1",
    category = "crafting",
	enabled = true,
	energy_required = 5,
    ingredients =
    {
		{"stone", 3},
		{"coal", 2},
    },
    result = "sci-component-1",
	result_count = 1
  },
  { type = "recipe",
    name = "sci-component-2",
    category = "crafting",
	enabled = false,
	energy_required = 7.5,
    ingredients =
    {
		{"sci-component-1" ,2},
		{"lead-plate", 12},
		{"tin-plate", 5},
		{"simple-io", 1},
    },
    result = "sci-component-2",
	result_count = 2
  },
  { type = "recipe",
    name = "sci-component-3",
    category = "crafting",
	enabled = false,
	energy_required = 15,
    ingredients =
    {
		{"sci-component-2" ,2},
		{"silver-plate", 14},
		{"nickel-plate", 7},
		{"aluminium-plate", 5},
		{"advsci-component-3", 2},
    },
    result = "sci-component-3",
	result_count = 2
  },
  { type = "recipe",
    name = "sci-component-4",
    category = "crafting",
	enabled = false,
	energy_required = 22,
    ingredients =
    {
		{"sci-component-1" ,10},
		{"sci-component-2", 5},
		{"sci-component-3", 2},
		
		{"cobalt-steel-alloy", 9},
		{"invar-alloy", 6},
		{"gold-plate", 10},
		{"titanium-plate", 12},
		{"tungsten-plate", 8},
    },
    result = "sci-component-4",
	result_count = 2
  },
  { type = "recipe",
    name = "sci-component-m",
    category = "crafting",
	enabled = false,
	energy_required = 12,
    ingredients =
    {
		{"sci-component-1" ,2},
		{"sci-component-2", 2},
		{"steel-plate", 5},
    },
    result = "sci-component-m",
	result_count = 2
  },
  { type = "recipe",
    name = "sci-component-l",
    category = "crafting",
	enabled = false,
	energy_required = 12,
    ingredients =
    {
		{"sci-component-1" ,3},
		{"sci-component-2", 3},
		{"transport-belt", 5},
		{"fast-transport-belt", 5},
		{"express-transport-belt", 5}, -- added at 017
    },
    result = "sci-component-l",
	result_count = 2
  },
  { type = "recipe",
    name = "sci-component-5",
    category = "crafting",
	enabled = false,
	energy_required = 12,
    ingredients =
    {
		{"sci-component-1", 4},
		{"sci-component-2", 4},
		{"assembling-machine-2", 1},
		{"electric-engine-unit", 4},
    },
    result = "sci-component-5",
	result_count = 2
  },
  { type = "recipe",
    name = "advsci-component-3",
    category = "crafting",
	enabled = false,
	energy_required = 10,
    ingredients =
    {
		{"bronze-alloy", 1},
		{"brass-alloy", 1},
		{"nickel-plate", 2},
		{"glass", 2}
    },
    result = "advsci-component-3",
	result_count = 1
  },
  { type = "recipe",
    name = "advsci-component-4",
	energy_required = 22,
    category = "crafting",
	enabled = false,
    ingredients =
    {
		{"zinc-plate", 7},
		{"silver-plate", 2},
		{"gold-plate", 3}
    },
    result = "advsci-component-4",
	result_count = 1
  },
  { type = "recipe",
    name = "simple-io",
    category = "electronics-machine",
	enabled = false,
	energy_required = 15,
    ingredients =
    {
		{"electronic-circuit", 2},
		{"basic-electronic-components", 10},
		{"condensator", 24},
		{"copper-cable", 6},
		{"solder", 6}
    },
    result = "simple-io",
	result_count = 1
  },
  { type = "recipe",
    name = "standart-io",
    category = "electronics-machine",
	enabled = false,
	energy_required = 30,
    ingredients =
    {
		{"basic-electronic-components", 48},
		{"electronic-components", 18},
		{"condensator", 20},
		{"condensator2", 6},
		{"simple-io", 3},
		{"tinned-copper-cable", 8},
		{"solder", 12}
    },
    result = "standart-io",
	result_count = 1
  },
  { type = "recipe",
    name = "advanced-io",
    category = "electronics-machine",
	enabled = false,
	energy_required = 45,
    ingredients =
    {
		{"basic-electronic-components", 20},
		{"electronic-components", 40},
		{"condensator2", 16},
	    {"intergrated-electronics", 15},
		{"simple-io", 6},
		{"standart-io", 6},
		{"insulated-cable", 12},
		{"solder", 18}
    },
    result = "advanced-io",
	result_count = 1
  },
  { type = "recipe",
    name = "predictive-io",
    category = "electronics-machine",
	enabled = false,
	energy_required = 60,
    ingredients =
    {
		{"basic-electronic-components", 28},
		{"electronic-components", 52},
	    {"intergrated-electronics", 24},
	    {"processing-electronics", 4},
		{"condensator2", 8},
		{"condensator3", 14},
		{"simple-io", 12},
		{"standart-io", 10},
		{"advanced-io", 8},
		{"gilded-copper-cable", 18},
		{"solder", 24}
    },
    result = "predictive-io",
	result_count = 1
  },
  { type = "recipe",
    name = "intelligent-io",
    category = "electronics-machine",
	enabled = false,
	energy_required = 75,
    ingredients =
    {
		{"alien-artifact", 1},
		{"basic-electronic-components", 36},
		{"electronic-components", 40},
	    {"intergrated-electronics", 32},
	    {"processing-electronics", 16},
		{"condensator3", 32},
		{"speed-processor-3", 8},
		{"effectivity-processor-3", 8},
		{"productivity-processor-3", 8},
		{"simple-io", 16},
		{"standart-io", 16},
		{"advanced-io", 16},
		{"predictive-io", 4},
		{"gilded-copper-cable", 40},
		{"solder", 30}
    },
    result = "intelligent-io",
	result_count = 1
  },
  { type = "recipe",
    name = "condensator",
    category = "electronics-machine",
    enabled = true,
    energy_required = 3,
    ingredients =
    {
		{"iron-plate", 2},
		{"copper-cable", 1},
	        
    },
    result = "condensator",
	result_count = 3
  },
  { type = "recipe",
    name = "condensator2",
    category = "electronics-machine",
	enabled = false,
	energy_required = 6,
    ingredients =
    {
		{"condensator", 2},
		{"tinned-copper-cable", 2},
		{type="fluid", name = "liquid-sulfuric-acid", amount = 10},
	        
    },
    result = "condensator2",
	result_count = 2
  },
  { type = "recipe",
    name = "condensator3",
    category = "electronics-machine",
	enabled = false,
	energy_required = 6,
    ingredients =
    {
		{"condensator2", 1},
		{"aluminium-plate", 1},
		{"resin", 1},
    },
    result = "condensator3",
	result_count = 1
  },
})

data:extend(
    {
        {
            type = "recipe",
            name = "barrel-recycling",
            category = "smelting",
            enabled = true,
            hidden = true,
            energy_required = 5,
            ingredients = {{"barrel", 5}},
            results = {{"steel-plate", 4}}
        }
    }
)

if
  data.raw.item["alien-artifact"] and
  data.raw.item["alien-artifact-blue"] and
  data.raw.item["alien-artifact-orange"] and
  data.raw.item["alien-artifact-purple"] and
  data.raw.item["alien-artifact-yellow"] and
  data.raw.item["alien-artifact-green"] and
  data.raw.item["alien-artifact-red"]
then
data:extend({

{ type = "recipe",
    name = "sci-component-o",
    category = "crafting",
	enabled = false,
	energy_required = 15,
    ingredients =
    {
		{"sci-component-1" ,4},
		{"sci-component-2", 4},
		{"alien-artifact", 5},
		{"alien-artifact-blue", 2},
		{"alien-artifact-orange", 2},
		{"alien-artifact-purple", 2},
		{"alien-artifact-yellow", 2},
		{"alien-artifact-green", 2},
		{"alien-artifact-red", 2},
		
    },
    result = "sci-component-o",
	result_count = 2
  },
    
})
else
data:extend({

{ type = "recipe",
    name = "sci-component-o",
    category = "crafting",
	enabled = false,
	energy_required = 12,
    ingredients =
    {
		{"sci-component-1" ,4},
		{"sci-component-2", 4},
		{"alien-artifact", 10},
		
    },
    result = "sci-component-o",
	result_count = 2
  },
    
})

end
data:extend(
{
--IRON GEAR CASTING
  {
    type = "recipe",
    name = "angels-iron-gear-wheel-stack-casting",
    category = "strand-casting",
    subgroup = "angels-iron-casting",
    normal =
    {
      enabled = false,
      energy_required = 4,
      ingredients ={
        {type="fluid", name="liquid-molten-iron", amount=80},
        {type="fluid", name="water", amount=40},
      },
      results={{type="item", name="angels-iron-gear-wheel-stack", amount=2}},
    },
    expensive =
    {
      enabled = false,
      energy_required = 4,
      ingredients ={
        {type="fluid", name="liquid-molten-iron", amount=100},
        {type="fluid", name="water", amount=40},
      },
      results={{type="item", name="angels-iron-gear-wheel-stack", amount=2}},
    },
    icons = {
      {
        icon = "__KaoExtended__/graphics/smelting/iron-gear-wheel-stack.png",
		icon_size = 64,
      },
      {
        icon = "__KaoExtended__/graphics/num_1-64.png",
		icon_size = 64,
        tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
        scale = 0.2,
        shift = {-12, -12},
      }
    },
    icon_size = 64,
    order = "g",
  },
  {
    type = "recipe",
    name = "angels-iron-gear-wheel-stack-casting-fast",
    category = "strand-casting",
    subgroup = "angels-iron-casting",
    normal =
    {
      enabled = false,
      energy_required = 2,
      ingredients ={
        {type="fluid", name="liquid-molten-iron", amount=140},
        {type="fluid", name="liquid-coolant", amount=40, maximum_temperature = 50},
      },
      results={
        {type="item", name="angels-iron-gear-wheel-stack", amount=4},
        {type="fluid", name="liquid-coolant-used", amount=40, temperature = 300},
      },
      main_product = "angels-iron-gear-wheel-stack",
    },
    expensive =
    {
      enabled = false,
      energy_required = 2,
      ingredients ={
        {type="fluid", name="liquid-molten-iron", amount=180 },
        {type="fluid", name="liquid-coolant", amount=40, maximum_temperature = 50},
      },
      results={
        {type="item", name="angels-iron-gear-wheel-stack", amount=4},
        {type="fluid", name="liquid-coolant-used", amount=40, temperature = 300},
      },
      main_product = "angels-iron-gear-wheel-stack",
    },
    icons = {
      {
        icon = "__KaoExtended__/graphics/smelting/iron-gear-wheel-stack.png",
		icon_size = 64,
      },
      {
        icon = "__KaoExtended__/graphics/num_2-64.png",
		icon_size = 64,
        tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
        scale = 0.2,
        shift = {-12, -12},
      }
    },
    icon_size = 64,
    order = "h",
  },
--STEEL GEAR CASTING
  {
    type = "recipe",
    name = "angels-steel-gear-wheel-stack-casting",
    category = "strand-casting",
    subgroup = "angels-steel-casting",
    normal =
    {
      enabled = false,
      energy_required = 4,
      ingredients ={
        {type="fluid", name="liquid-molten-steel", amount=80},
        {type="fluid", name="water", amount=40},
      },
      results={{type="item", name="angels-steel-gear-wheel-stack", amount=2}},
    },
    expensive =
    {
      enabled = false,
      energy_required = 4,
      ingredients ={
        {type="fluid", name="liquid-molten-steel", amount=100},
        {type="fluid", name="water", amount=40},
      },
      results={{type="item", name="angels-steel-gear-wheel-stack", amount=2}},
    },
    icons = {
      {
        icon = "__KaoExtended__/graphics/smelting/steel-gear-wheel-stack.png",
		icon_size = 64,
      },
      {
        icon = "__KaoExtended__/graphics/num_1-64.png",
		icon_size = 64,
        tint = {r = 0, g = 1, b = 0, a = 0.2},
        scale = 0.2,
        shift = {-12, -12},
      }
    },
    icon_size = 64,
    order = "g",
  },
  {
    type = "recipe",
    name = "angels-steel-gear-wheel-stack-casting-fast",
    category = "strand-casting",
    subgroup = "angels-steel-casting",
    normal =
    {
      enabled = false,
      energy_required = 2,
      ingredients ={
        {type="fluid", name="liquid-molten-steel", amount=140},
        {type="fluid", name="liquid-coolant", amount=40, maximum_temperature = 50},
      },
      results={
        {type="item", name="angels-steel-gear-wheel-stack", amount=4},
        {type="fluid", name="liquid-coolant-used", amount=40, temperature = 300},
      },
      main_product = "angels-steel-gear-wheel-stack",
    },
    expensive =
    {
      enabled = false,
      energy_required = 2,
      ingredients ={
        {type="fluid", name="liquid-molten-steel", amount=180},
        {type="fluid", name="liquid-coolant", amount=40, maximum_temperature = 50},
      },
      results={
        {type="item", name="angels-steel-gear-wheel-stack", amount=4},
        {type="fluid", name="liquid-coolant-used", amount=40, temperature = 300},
      },
      main_product = "angels-steel-gear-wheel-stack",
    },
    icons = {
      {
        icon = "__KaoExtended__/graphics/smelting/steel-gear-wheel-stack.png",
		icon_size = 64,
      },
      {
        icon = "__KaoExtended__/graphics/num_2-64.png",
		icon_size = 64,
        tint = {r = 1, g = 1, b = 1, a = 0.8},
        scale = 0.2,
        shift = {-12, -12},
      }
    },
    icon_size = 64,
    order = "h",
  },  
--GEAR STACK PROCESSING (converting)
  
{
    type = "recipe",
    name = "angels-iron-gear-wheel-stack-converting",
    category = "advanced-crafting",
    subgroup = "angels-iron-casting",
    energy_required = 0.5,
    allow_decomposition = false,
    enabled = false,
    ingredients ={
      {type="item", name="angels-iron-gear-wheel-stack", amount=1},
    },
    results=
    {
      {type="item", name="iron-gear-wheel", amount=5},
    },
    icons = {
      {
        icon = data.raw.item["iron-gear-wheel"].icon,
		icon_size = data.raw.item["iron-gear-wheel"].iconsize,
      },
      {
        icon = "__KaoExtended__/graphics/smelting/iron-gear-wheel-stack.png",
		icon_size = 64,
        scale = 0.2,
        shift = { -12, -12},
      }
    },
    icon_size = 64,
    order = "j",
  },
    {
    type = "recipe",
    name = "angels-steel-gear-wheel-stack-converting",
    category = "advanced-crafting",
	subgroup = "angels-steel-casting",
    energy_required = 0.5,
	enabled = false,
	allow_decomposition = false,
    ingredients ={
      {type="item", name="angels-steel-gear-wheel-stack", amount=1},
	},
    results=
    {
      {type="item", name="steel-gear-wheel", amount=5},
    },
	icons = {
		{
			icon = "__bobicons__/graphics/icons/bobplates/steel-gear-wheel-64.png",
			icon_size = 64,
		},
		{
			icon = "__KaoExtended__/graphics/smelting/steel-gear-wheel-stack.png",
			icon_size = 64,
			scale = 0.2,
			shift = { -12, -12},
		}
	},	
	icon_size = 64,
    order = "kc",
    },
}
)