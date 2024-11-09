data:extend({
  {
    type = "recipe",
    name = "duct-small",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 4 },
    },
    result = "duct-small",
    result_count = 1,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "duct-t-junction",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 8 },
    },
    result = "duct-t-junction",
    result_count = 1,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "duct-curve",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 8 },
    },
    result = "duct-curve",
    result_count = 1,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "duct-cross",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 8 },
    },
    result = "duct-cross",
    result_count = 1,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "duct-underground",
    energy_required = 6.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 60 },
    },
    result = "duct-underground",
    result_count = 2,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "non-return-duct",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 8 },
      { type = "item", name = "iron-gear-wheel", amount = 4 },
    },
    result = "non-return-duct",
    result_count = 1,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "duct-end-point-intake",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "engine-unit", amount = 6 },
      { type = "item", name = "pipe", amount = 6 },
      { type = "item", name = "steel-plate", amount = 6 },
    },
    result = "duct-end-point-intake",
    result_count = 1,
    category = "crafting",
  },
  {
    type = "recipe",
    name = "duct-end-point-outtake",
    energy_required = 2.0,
    enabled = false,
    ingredients = {
      { type = "item", name = "engine-unit", amount = 6 },
      { type = "item", name = "pipe", amount = 6 },
      { type = "item", name = "steel-plate", amount = 6 },
    },
    result = "duct-end-point-outtake",
    result_count = 1,
    category = "crafting",
  },
})

if not settings.startup["fmf-enable-duct-auto-join"].value then
  data:extend({
    {
      type = "recipe",
      name = "duct",
      energy_required = 2.0,
      enabled = false,
      ingredients = {
        { type = "item", name = "iron-plate", amount = 8 },
      },
      result = "duct",
      result_count = 1,
      category = "crafting",
    },
    {
      type = "recipe",
      name = "duct-long",
      energy_required = 2.0,
      enabled = false,
      ingredients = {
        { type = "item", name = "iron-plate", amount = 16 },
      },
      result = "duct-long",
      result_count = 1,
      category = "crafting",
    },
  })
end
