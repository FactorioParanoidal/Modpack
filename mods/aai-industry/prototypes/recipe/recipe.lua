local util = require("data-util")
--[[
data:extend({{
    type = "recipe",
    name = "stone-tablet",
    category = "crafting",
    energy_required = 0.5,
    ingredients =
    {
      {type="item", name="stone-brick", amount=1}
    },
    results= { {type="item", name="stone-tablet", amount=4} },
}})
util.allow_productivity("stone-tablet")
]]

data:extend({{
    type = "recipe",
    name = "motor",
    category = "crafting",
    normal = {
      energy_required = 1,
      ingredients = {
        {type="item", name="iron-plate", amount=6},
        {type="item", name="iron-gear-wheel", amount=4}
      },
      results= { {type="item", name="motor", amount=1} },
    },
    expensive = {
      energy_required = 1,
      ingredients = {
        {type="item", name="iron-plate", amount=10},
        {type="item", name="iron-gear-wheel", amount=6}
      },
      results= { {type="item", name="motor", amount=1} },
    }
}})
util.allow_productivity("motor")

data:extend({{
    type = "recipe",
    name = "electric-motor",
    category = "crafting",
    normal = {
      enabled = true,
      energy_required = 1.5,
      ingredients = {
        {type="item", name="motor", amount=1},
        {type="item", name="copper-cable", amount=4}
      },
      results= { {type="item", name="electric-motor", amount=1} },
    },
    expensive = {
      enabled = true,
      energy_required = 1.5,
      ingredients = {
        {type="item", name="motor", amount=1},
        {type="item", name="copper-cable", amount=6}
      },
      results= { {type="item", name="electric-motor", amount=1} },
    }
}})
util.allow_productivity("electric-motor")

--[[
data:extend({{
    type = "recipe",
    name = "small-iron-electric-pole",
    category = "crafting",
    energy_required = 0.25,
    normal = {
      enabled = false,
      ingredients =
      {
        {"iron-plate", 1},
        {"copper-cable", 1}
      },
      results= { {type="item", name="small-iron-electric-pole", amount=1}, },
    },
    expensive = {
      enabled = false,
      ingredients =
      {
        {"iron-plate", 1},
        {"copper-cable", 1}
      },
      results= { {type="item", name="small-iron-electric-pole", amount=1}, },
    },
}})
]]

--[[
data:extend({{
    type = "recipe",
    name = "concrete-wall",
    category = "crafting",
    enabled = false,
    energy_required = 1,
    normal = {
      ingredients =
      {
        { "stone-wall", 1 },
        { "concrete", 12 }
      },
      results= { {type="item", name="concrete-wall", amount=1}, },
    },
    expensive = {
      ingredients =
      {
        { "stone-wall", 1 },
        { "concrete", 12 }
      },
      results= { {type="item", name="concrete-wall", amount=1}, },
    },
}})

data:extend({{
    type = "recipe",
    name = "steel-wall",
    category = "crafting",
    enabled = false,
    energy_required = 2,
    normal = {
      ingredients =
      {
        { "concrete-wall", 1 },
        { "steel-plate", 5 }
      },
      results= { {type="item", name="steel-wall", amount=1}, },
    },
    expensive = {
      ingredients =
      {
        { "concrete-wall", 1 },
        { "steel-plate", 10 }
      },
      results= { {type="item", name="steel-wall", amount=1}, },
    },
}})

]]

data:extend({{
    type = "recipe",
    name = "burner-lab",
    category = "crafting",
    enabled = true,
    energy_required = 5,
    normal = {
      ingredients =
      {
        {type="item", name="motor", amount=10},
        {type="item", name="copper-plate", amount=50},
        {type="item", name="stone-brick", amount=10},
      },
      results= { {type="item", name="burner-lab", amount=1}, },
    },
    expensive = {
      ingredients =
      {
        {type="item", name="motor", amount=20},
        {type="item", name="copper-plate", amount=75},
        {type="item", name="stone-brick", amount=20},
      },
      results= { {type="item", name="burner-lab", amount=1}, },
    },
}})

data:extend({{
    type = "recipe",
    name = "burner-turbine",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type="item", name="electric-motor", amount=8},
        {type="item", name="iron-gear-wheel", amount=10},
        {type="item", name="stone-furnace", amount=2},
      },
      results= { {type="item", name="burner-turbine", amount=1}, },
    },
    expensive = {
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type="item", name="electric-motor", amount=16},
        {type="item", name="iron-gear-wheel", amount=20},
        {type="item", name="stone-furnace", amount=2},
      },
      results= { {type="item", name="burner-turbine", amount=1}, },
    },
}})

data:extend({{
    type = "recipe",
    name = "burner-assembling-machine",
    category = "crafting",
    normal = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {type="item", name="iron-plate", amount=24},
        {type="item", name="stone-brick", amount=10},
        {type="item", name="motor", amount=4},
      },
      results= { {type="item", name="burner-assembling-machine", amount=1} },
    },
    expensive = {
      enabled = false,
      energy_required = 5,
      ingredients = {
        {type="item", name="iron-plate", amount=40},
        {type="item", name="stone-brick", amount=20},
        {type="item", name="motor", amount=8},
      },
      results= { {type="item", name="burner-assembling-machine", amount=1} },
    }
  },
})
