-- DISABLED DrD

data:extend(
{
  {
    type = "recipe",
    name = "bronze-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 16,
    ingredients =
    {
      {type="item", name="copper-plate", amount=5},
      {type="item", name="tin-plate", amount=3},
    },
    results = 
    {
      {type="item", name="bronze-alloy", amount=2} --DrD 5
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "brass-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 16,
    ingredients =
    {
      {type="item", name="copper-plate", amount=5},
      {type="item", name="zinc-plate", amount=3},
    },
    results = 
    {
      {type="item", name="brass-alloy", amount=2} --DrD 5
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "copper-tungsten-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 32,
    ingredients =
    {
      {type="item", name="copper-plate", amount=8},
      {type="item", name="powdered-tungsten", amount=5},
    },
    results = 
    {
      {type="item", name="copper-tungsten-alloy", amount=2} --DrD 5
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "tungsten-carbide",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 24,
    ingredients =
    {
      {type="item", name="carbon", amount=5},
      {type="item", name="tungsten-oxide", amount=5}, --DrD 1
    },
    results = 
    {
      {type="item", name="tungsten-carbide", amount=1} --DrD 2
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "tungsten-carbide-2",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 16,
    ingredients =
    {
      {type="item", name="carbon", amount=4},
      {type="item", name="powdered-tungsten", amount=4}, --DrD 1
    },
    results = 
    {
      {type="item", name="tungsten-carbide", amount=1} --DrD 2
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "gunmetal-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 32,
    ingredients =
    {
      {type="item", name="copper-plate", amount=8},
      {type="item", name="tin-plate", amount=2},
      {type="item", name="zinc-plate", amount=2},
    },
    results = 
    {
      {type="item", name="gunmetal-alloy", amount=4} --DrD 10
    },
    allow_decomposition = false
  },

  {
    type = "recipe",
    name = "invar-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 16,
    ingredients =
    {
      {type="item", name="nickel-plate", amount=4},
      {type="item", name="iron-plate", amount=6},
    },
    results = 
    {
      {type="item", name="invar-alloy", amount=2} --DrD 5
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "nitinol-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 32,
    ingredients =
    {
      {type="item", name="nickel-plate", amount=6},
      {type="item", name="titanium-plate", amount=4},
    },
    results = 
    {
      {type="item", name="nitinol-alloy", amount=2} --DrD 5
    },
    allow_decomposition = false
  },

  {
    type = "recipe",
    name = "cobalt-steel-alloy",
    enabled = false,
    category = "mixing-furnace",
    energy_required = 32,
    ingredients =
    {
      {type="item", name="steel-plate", amount=6},
      {type="item", name="cobalt-oxide", amount=3},
    },
    results = 
    {
      {type="item", name="cobalt-steel-alloy", amount=3} --DrD 10
    },
    allow_decomposition = false
  },
}
)


