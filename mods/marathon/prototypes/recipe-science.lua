data:extend({
  {
    type = "recipe",
    name = "lab",

    energy_required = 20,
    ingredients = {
      {"electronic-circuit", 25},
      {"iron-gear-wheel", 25},
      {"transport-belt", 20},
    },
    result = "lab",
  },
  {
    type = "recipe",
    name = "automation-science-pack",

    energy_required = 10,
    ingredients = {
      {"copper-plate", 40},
      {"iron-gear-wheel", 5},
    },
    result = "automation-science-pack",
  },
  {
    type = "recipe",
    name = "logistic-science-pack",

    energy_required = 15,
    ingredients = {
      {"inserter", 5},
      {"transport-belt", 5},
    },
    result = "logistic-science-pack",
  },
  {
    type = "recipe",
    name = "chemical-science-pack",
    enabled = false,

    energy_required = 30,
    ingredients = {
      {"battery", 5},
      {"advanced-circuit", 5},
      {"fast-inserter", 5},
      {"steel-plate", 5},
    },
    result = "chemical-science-pack",
  },
})
