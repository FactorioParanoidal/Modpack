--[[ Copyright (c) 2018 Optera
 * Part of Re-Stack
 *
 * See LICENSE.md in the project directory for license information.
--]]


local get_energy_value = require("__flib__.data-util").get_energy_value

-- Barrel stack and capacity
-- filled barrels are auto generated from fluids in base\data-updates.lua
local barrel_stack_size = settings.startup["ReStack-barrel-stack"].value
local barrel_capacity = settings.startup["ReStack-barrel-fill"].value
local empty_barrels = {
  ["barrel"] = true,  -- base
  ["gas-canister"] = true,  -- BobPlates
  ["empty-canister"] = true,  -- BobPlates
  ["dirty-barrel"] = true,  -- DirtyBarrels
}

-- instead of 1 barrel ever 0.2 we default to 10 barrels every 2
local energy_per_recipe = 2
local recipe_barrel_multiplier = 10
if barrel_capacity <= 500 then -- each recipe should at least process the base 50L
  recipe_barrel_multiplier = math.ceil(500 / barrel_capacity)
else
  energy_per_recipe = math.floor(barrel_capacity / 250)
end

-- set barrel stack size
if barrel_stack_size > 0 then
  for k, v in pairs(empty_barrels) do
    if data.raw.item[k] then
      log("[RS] Setting item."..tostring(data.raw.item[k].name)..".stack_size "..data.raw.item[k].stack_size.." -> "..barrel_stack_size)
      data.raw.item[k].stack_size = barrel_stack_size
    end
  end
end

for fluid_name, fluid in pairs(data.raw.fluid) do
  local barrel_name = fluid_name.."-barrel"   -- naming convention is hardcoded in base\data-update.lua
  local barrel_item = data.raw.item[barrel_name]
  if barrel_item then
    if barrel_stack_size > 0 then
      barrel_item.stack_size = barrel_stack_size
      log("[RS] Setting item."..tostring(barrel_item.name)..".stack_size "..barrel_stack_size)
    end

    -- adjust barrel capacity and recipes
    if barrel_capacity > 0 then
      local fill_recipe = data.raw.recipe["fill-"..barrel_name]
      if fill_recipe then
        if fill_recipe.ingredients and fill_recipe.results then
          log("[RS] Setting fill recipe."..tostring(fill_recipe.name).." to "..recipe_barrel_multiplier.."x "..barrel_capacity.."L barrel every "..energy_per_recipe)
          fill_recipe.energy_required = energy_per_recipe
          for _, ingredient in pairs(fill_recipe.ingredients) do
            if empty_barrels[ingredient.name] then
              ingredient.amount = ingredient.amount * recipe_barrel_multiplier
            elseif ingredient.name == fluid_name then
              ingredient.amount = barrel_capacity * recipe_barrel_multiplier
            end
          end
          for _, result in pairs(fill_recipe.results) do
            if result.name == fluid_name.."-barrel" then
              result.amount = result.amount * recipe_barrel_multiplier
            end
          end
        else
          log("[RS] ERROR: recipe.ingredients and recipe.results expected: "..serpent.block(fill_recipe) )
        end
      end

      local empty_recipe = data.raw.recipe["empty-"..barrel_name]
      if empty_recipe then
        if empty_recipe.ingredients and empty_recipe.results then
          log("[RS] Setting empty recipe."..tostring(empty_recipe.name).." to "..recipe_barrel_multiplier.."x "..barrel_capacity.."L barrel every "..energy_per_recipe)
          empty_recipe.energy_required = energy_per_recipe
          for _, ingredient in pairs(empty_recipe.ingredients) do
            if ingredient.name == fluid_name.."-barrel" then
              ingredient.amount = ingredient.amount * recipe_barrel_multiplier
            end
          end
          for _, result in pairs(empty_recipe.results) do
            if empty_barrels[result.name] then
              result.amount = result.amount * recipe_barrel_multiplier
            elseif result.name == fluid_name then
              result.amount = barrel_capacity * recipe_barrel_multiplier
            end
          end
        else
          log("[RS] ERROR: recipe.ingredients and recipe.results expected: "..serpent.block(empty_recipe) )
        end
      end
    end

    -- set barrel fuel_value
    if fluid.fuel_value then
      local energy_value, energy_unit = get_energy_value(fluid.fuel_value)
      if energy_value and energy_value > 0 then
        local fill_recipe = data.raw.recipe["fill-"..barrel_name]
        if fill_recipe and fill_recipe.ingredients and fill_recipe.results then
          local recipe_barrel_count, recipe_fluid_count
          for _, ingredient in pairs(fill_recipe.ingredients) do
            if empty_barrels[ingredient.name] then
              recipe_barrel_count = ingredient.amount
            elseif ingredient.name == fluid_name then
              recipe_fluid_count = ingredient.amount
            end
          end
          if recipe_fluid_count and recipe_barrel_count then
            log("[RS] Setting item."..tostring(barrel_item.name)..".fuel_value "..tostring(barrel_item.fuel_value).." --> "..(energy_value * recipe_fluid_count / recipe_barrel_count)..energy_unit )
            barrel_item.fuel_category = barrel_item.fuel_category or "chemical"
            barrel_item.fuel_value = (energy_value * recipe_fluid_count / recipe_barrel_count)..energy_unit
          end
        end
      end
    end

  end
end