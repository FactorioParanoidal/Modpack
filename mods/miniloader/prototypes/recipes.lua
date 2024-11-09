require "util"

local ingredient_sets = {
  -- base
  -- 105 I, 27 C
  ["miniloader"] = {
    {
      {"underground-belt", 1},
      {"forging-steel", 2},
      {"mechanism-1", 1},
    },
    {
      {"underground-belt", 1},
      {"steel-plate", 8},
      {"fast-inserter", 6},
    },
  },
  -- 358 I, 128 C, 89 O
  ["fast-miniloader"] = {
    {
      {"miniloader", 1},
      {"fast-underground-belt", 1},
      {"gear-2", 2},
    },
    {
      {"miniloader", 1},
      {"fast-underground-belt", 1},
      {"bulk-inserter", 4},
    },
  },
  -- 628 I, 384 C, 174 O
  ["express-miniloader"] = {
    {
      {"expedited-miniloader", 1},
      {"express-underground-belt", 1},
      {"forging-stainless", 2},
    },
    {
      {"fast-miniloader", 1},
      {"express-underground-belt", 1},
      {"bulk-inserter", 2},
    },
  },

  ["chute-miniloader"] = {
    {
      {"iron-plate", 4}
    },
  },

  -- boblogistics
  ["basic-miniloader"] = {
    {
      {"basic-underground-belt", 1},
      {"burner-inserter", 12},
    },
  },
  ["turbo-miniloader"] = {
    {
      {"express-miniloader", 1},
      {"turbo-underground-belt", 1},
      {"express-bulk-inserter", 4},
    },
  },
  ["ultimate-miniloader"] = {
    {
      {"turbo-miniloader", 1},
      {"ultimate-underground-belt", 1},
      {"express-bulk-inserter", 2},
    },
  },

  -- FactorioExtended-Plus-Transport
  ["rapid-mk1-miniloader"] = {
    {
      {"express-miniloader", 1},
      {"rapid-transport-belt-to-ground-mk1", 1},
      {"bulk-inserter-mk2", 4},
    },
  },
  ["rapid-mk2-miniloader"] = {
    {
      {"rapid-mk1-miniloader", 1},
      {"rapid-transport-belt-to-ground-mk2", 1},
      {"bulk-inserter-mk2", 2},
    },
  },

  -- Krastorio
  ["k-miniloader"] = {
    {
      {"express-miniloader", 1},
      {"k-underground-belt", 1},
      {"bulk-inserter", 2},
    },
  },

  -- Krastorio2
  ["kr-advanced-miniloader"] = {
    {
      {"express-miniloader", 1},
      {"kr-advanced-underground-belt", 1},
      {"bulk-inserter", 2},
    },
  },
  ["kr-superior-miniloader"] = {
    {
      {"kr-advanced-miniloader", 1},
      {"kr-superior-underground-belt", 1},
      {"kr-superior-inserter", 2},
    },
  },

  -- UltimateBelts
  ["ub-ultra-fast-miniloader"] = {
    {
      {"express-miniloader", 1},
      {"ultra-fast-underground-belt", 1},
      {"bulk-inserter", 6},
    },
  },
  ["ub-extreme-fast-miniloader"] = {
    {
      {"ub-ultra-fast-miniloader", 1},
      {"extreme-fast-underground-belt", 1},
      {"bulk-inserter", 6},
    },
  },
  ["ub-ultra-express-miniloader"] = {
    {
      {"ub-extreme-fast-miniloader", 1},
      {"ultra-express-underground-belt", 1},
      {"bulk-inserter", 6},
    },
  },
  ["ub-extreme-express-miniloader"] = {
    {
      {"ub-ultra-express-miniloader", 1},
      {"extreme-express-underground-belt", 1},
      {"bulk-inserter", 6},
    },
  },
  ["ub-ultimate-miniloader"] = {
    {
      {"ub-extreme-express-miniloader", 1},
      {"original-ultimate-underground-belt", 1},
      {"bulk-inserter", 6},
    },
  },

  -- xander-mod
  ["expedited-miniloader"] = {
    {
      {"fast-miniloader", 1},
      {"expedited-underground-belt", 1},
      {"mechanism-2", 1},
    },
  },

  -- space-exploration
  ["space-miniloader"] = {
    {
      {"se-space-underground-belt", 1},
      {"bulk-inserter", 4},
    },
  },
  ["deep-space-miniloader"] = {
    {
      {"se-deep-space-underground-belt-black", 1},
      {"bulk-inserter", 6},
    },
  },

  -- Random Factorio Things
  ["nuclear-miniloader"] = {
    {
      {"nuclear-underground-belt", 1},
      {"express-miniloader", 1},
      {"nuclear-bulk-inserter", 4}
    }  
  },
  ["plutonium-miniloader"] = {
    {
      {"plutonium-underground-belt", 1},
      {"nuclear-miniloader", 1},
      {"plutonium-bulk-inserter", 4}
    }
  }
}

if data.raw["inserter"]["turbo-inserter"] then
  -- boblogistics inserter overhaul support
  ingredient_sets["miniloader"][2][3] = {"inserter", 8}
  ingredient_sets["fast-miniloader"][2][3] = {"long-handed-inserter", 8}
  ingredient_sets["express-miniloader"][2][3] = {"fast-inserter", 6}
  ingredient_sets["turbo-miniloader"][1][3] = {"turbo-inserter", 6}
  ingredient_sets["ultimate-miniloader"][1][3] = {"express-inserter", 6}
end

local previous_miniloader = {
  ["fast-"] = "",
  ["express-"] = "fast-",

  -- boblogistics
  ["turbo-"] = "express-",
  ["ultimate-"] = "turbo-",

  -- FactorioExtended-Plus-Transport
  ["rapid-mk1-"] = "express-",
  ["rapid-mk2-"] = "rapid-mk1-",

  -- Krastorio
  ["k-"] = "express-",

  -- Krastorio2
  ["kr-advanced-"] = "express-",
  ["kr-superior-"] = "kr-advanced-",

  -- UltimateBelts
  ["ub-ultra-fast-"] = "express-",
  ["ub-extreme-fast-"] = "ub-ultra-fast-",
  ["ub-ultra-express-"] = "ub-extreme-fast-",
  ["ub-extreme-express-"] = "ub-ultra-express-",
  ["ub-ultimate-"] = "ub-extreme-express-",

  -- xander-mod
  ["expedited-"] = "fast-",

  -- Random Factorio Things
  ["nuclear-"] = "express-",
  ["plutonium"] = "nuclear-"
}

if data.raw["transport-belt"]["basic-transport-belt"] then
  table.insert(ingredient_sets["miniloader"][2], 1, {"basic-miniloader", 1})
  previous_miniloader[""] = "basic-"
end

if data.raw.item["expedited-transport-belt"] then
  previous_miniloader["express-"] = "expedited-"
end

local filter_inserters = {
  ["fast-inserter"] = "fast-inserter",
  ["bulk-inserter"] = "bulk-inserter",
  ["express-bulk-inserter"] = "express-stack-filter-inserter",

  -- boblogistics overhaul
  ["inserter"] = "yellow-filter-inserter",
  ["long-handed-inserter"] = "red-filter-inserter",
  ["turbo-inserter"] = "turbo-filter-inserter",
  ["express-inserter"] = "express-filter-inserter",

  -- FactorioExtended-Plus-Transport
  ["bulk-inserter-mk2"] = "stack-filter-inserter-mk2",

  -- Krastorio2
  ["kr-superior-inserter"] = "kr-superior-filter-inserter",

  -- Random Factorio Things
  ["nuclear-bulk-inserter"] = "nuclear-stack-filter-inserter",
  ["plutonium-bulk-inserter"] = "nuclear-stack-filter-inserter"
}

-- apply recipe changes due to settings
local should_require_previous = true
if settings.startup["bobmods-logistics-beltrequireprevious"] then
  should_require_previous = settings.startup["bobmods-logistics-beltrequireprevious"].value
end
local should_double_recipes = settings.startup["miniloader-double-recipes"].value

for _, sets in pairs(ingredient_sets) do
  for _, set in pairs(sets) do
    if not should_require_previous and set[1][1]:find("miniloader$") then
      table.remove(set, 1)
    end
    if should_double_recipes then
      for _, ingredient in pairs(set) do
        ingredient[2] = ingredient[2] * 2
      end
    end
  end
end

local function select_ingredient_set(sets)
  for _, set in ipairs(sets) do
    local valid = true
    for _, ingredient in pairs(set) do
      if valid
      and not ingredient[1]:find("miniloader")
      and not data.raw.item[ingredient[1]] then
        valid = false
      end
    end
    if valid then
      return set
    end
  end
end

local function create_recipes(prefix)
  local name = prefix .. "miniloader"
  local filter_name = prefix .. "filter-miniloader"

  local recipe = {
    type = "recipe",
    name = name,
    enabled = false,
    energy_required = 1,
    ingredients = select_ingredient_set(ingredient_sets[name]),
    results = {{name, should_double_recipes and 2 or 1}},
  }

  local filter_recipe = util.table.deepcopy(recipe)
  filter_recipe.name = filter_name
  if previous_miniloader[prefix] and data.raw.item[previous_miniloader[prefix] .. "filter-miniloader"] then
    filter_recipe.ingredients[1][1] = previous_miniloader[prefix] .. "filter-miniloader"
  end
  local inserter_index, inserter_name
  for i, ingredient in pairs(recipe.ingredients) do
    if ingredient[1]:find("inserter") then
      inserter_index = i
      inserter_name = ingredient[1]
    end
  end
  filter_recipe.results[1][1] = filter_name
  if inserter_name and filter_inserters[inserter_name] then
    filter_recipe.ingredients[inserter_index][1] = filter_inserters[inserter_name]
  else
    filter_recipe = nil
  end

  if settings.startup["miniloader-enable-standard"].value then
    data:extend{recipe}
  end
  if filter_recipe and settings.startup["miniloader-enable-filter"].value then
    data:extend{filter_recipe}
  end
end

return {
  create_recipes = create_recipes,
}
