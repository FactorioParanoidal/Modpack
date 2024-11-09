--[[ Copyright (c) 2017 Optera
 * Part of Lighted Electric Poles +
 *
 * See LICENSE.md in the project directory for license information.
--]]

local format = string.format
local gmatch = string.gmatch
local flib = require('__flib__.data-util')

local light_scale = settings.startup["lepp_light_size_factor"].value
local light_size_limit = settings.startup["lepp_light_max_size"].value
local lep_icons_layer = { { icon = "__LightedPolesPlus__/graphics/icons/lighted.png", icon_size = 32, tint = {r=1, g=1, b=1, a=0.85} } }
local pole_entity_whitelist = {}
for name in gmatch(settings.startup["lepp_pole_whitelist"].value, '([^, *]+)') do
  pole_entity_whitelist[name] = true
end
local pole_entity_blacklist = {}
for name in gmatch(settings.startup["lepp_pole_blacklist"].value, '([^, *]+)') do
  pole_entity_blacklist[name] = true
end
local tech_blacklist = {}
for name in gmatch(settings.startup["lepp_tech_blacklist"].value, '([^, *]+)') do
  tech_blacklist[name] = true
end

local fallback_technology = settings.startup["lepp_tech_fallback"].value

local pole_names = {} -- dictionary [original pole item name] -> lighted pole entity/item/recipe name
local lightedPoles = {}

-- finds all recipes by result
function find_recipe_by_results(search_products)
  local found_recipes = {} -- recipes producing the product
  for _, recipe in pairs (data.raw["recipe"]) do
    if recipe.result and search_products[recipe.result] then
      found_recipes[recipe.name] = {product=recipe.result, subgroup=recipe.subgroup, order=recipe.order}
    end
    if recipe.normal and recipe.normal.result and search_products[recipe.normal.result] then
      found_recipes[recipe.name] = {product=recipe.normal.result, subgroup=recipe.subgroup, order=recipe.order}
    end
    if recipe.expensive and recipe.expensive.result and search_products[recipe.expensive.result] then
      found_recipes[recipe.name] = {product=recipe.expensive.result, subgroup=recipe.subgroup, order=recipe.order}
    end
    if recipe.results then
      for _, r in pairs(recipe.results) do
        if type(r) == "table" and (not r.type or r.type == "item")
        and (r.name and search_products[r.name] or search_products[r[1]]) then
          found_recipes[recipe.name] = {product=r.name or r[1], subgroup=recipe.subgroup, order=recipe.order}
        end
      end
    end
    if recipe.normal and recipe.normal.results then
      for _, r in pairs(recipe.normal.results) do
        if type(r) == "table" and (not r.type or r.type == "item")
        and (r.name and search_products[r.name] or search_products[r[1]]) then
          found_recipes[recipe.name] = {product=r.name or r[1], subgroup=recipe.subgroup, order=recipe.order}
        end
      end
    end
    if recipe.expensive and recipe.expensive.results then
      for _, r in pairs(recipe.expensive.results) do
        if type(r) == "table" and (not r.type or r.type == "item")
        and (r.name and search_products[r.name] or search_products[r[1]]) then
          found_recipes[recipe.name] = {product=r.name or r[1], subgroup=recipe.subgroup, order=recipe.order}
        end
      end
    end
  end
  return found_recipes
end

-- look through items for electric-poles should save looking through recipes and entities
for _, item in pairs (data.raw["item"]) do
  -- look through all item.place_result in case item and recipe names don't match entity name
  if item.place_result and data.raw["electric-pole"][item.place_result] and not pole_entity_blacklist[item.place_result] then
    -- log("[LEP+] found pole "..item.place_result.." in item "..item.name)
    local pole = data.raw["electric-pole"][item.place_result]
    if pole_entity_whitelist[item.place_result] -- include if whitelisted
    or (pole.draw_copper_wires ~= false -- exclude poles without copper wire connection
    and pole.maximum_wire_distance and pole.maximum_wire_distance > 0 -- exclude poles with no wire reach
    and pole.minable and pole.minable.result and pole.minable.result == item.name) then

      pole.fast_replaceable_group = pole.fast_replaceable_group or "electric-pole"

      local newName = "lighted-"..pole.name

      -- log("[LEP+] copying entity "..tostring(pole.name).." to "..tostring(newName))
      local newPole = flib.copy_prototype(pole, newName, true)
      newPole.icons = flib.create_icons(pole, lep_icons_layer) or lep_icons_layer
      newPole.localised_name = {"entity-name.lighted-pole", {"entity-name." .. pole.name}}
      if newPole.next_upgrade then
        newPole.next_upgrade = "lighted-"..newPole.next_upgrade
      end

      -- log("[LEP+] copying item "..tostring(item.name).." to "..tostring(newName))
      pole_names[item.name] = newName --save name for technology lookup
      local newItem = flib.copy_prototype(item, newName, true)
      newItem.icons = flib.create_icons(item, lep_icons_layer) or lep_icons_layer
      newItem.localised_name = newPole.localised_name
      newItem.order = (item.order or "").."-0"
      newPole.icons = newPole.icons or newItem.icons -- use item icon for lighted pole in case base pole entity had none

      local hidden_lamp = flib.copy_prototype(data.raw["lamp"]["small-lamp"], newName.."-lamp", true)
      hidden_lamp.icons = newPole.icons
      hidden_lamp.localised_name = newPole.localised_name
      hidden_lamp.minable = nil
      hidden_lamp.next_upgrade = nil
      hidden_lamp.flags = {"not-blueprintable", "not-deconstructable", "placeable-off-grid", "not-on-map"}
      hidden_lamp.selectable_in_game = false
      hidden_lamp.collision_box = {{-0.1, -0.1}, {0.1, 0.1}}
      hidden_lamp.selection_box = {{-0.4, -0.4}, {0.4, 0.4}}
      hidden_lamp.collision_mask = { "resource-layer" }
      hidden_lamp.picture_off =
      {
        filename = "__core__/graphics/empty.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
      }
      hidden_lamp.picture_on =
      {
        filename = "__core__/graphics/empty.png",
        priority = "high",
        width = 1,
        height = 1,
        frame_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
      }
      local lamp_count = 1
      local light_size = 40 --small lamp default
      hidden_lamp.light = {intensity = 0.9, size = light_size, color = {r=1.0, g=1.0, b=1.0}}
      hidden_lamp.light_when_colored = {intensity = 1, size = light_size * 0.15, color = {r=1.0, g=1.0, b=1.0}}
      hidden_lamp.energy_usage_per_tick = "5kW"
      if light_scale > 0 then
        light_size = math.floor(math.sqrt(newPole.maximum_wire_distance)*(40/math.sqrt(7.5))*light_scale+0.5)  -- scale to small lamp radius on small poles
        if light_size > light_size_limit then light_size = light_size_limit end
        lamp_count = math.ceil(light_size / 40)
        hidden_lamp.light = {intensity = 0.9, size = light_size, color = {r=1.0, g=1.0, b=1.0}}
        hidden_lamp.light_when_colored = {intensity = 1, size = light_size * 0.15, color = {r=1.0, g=1.0, b=1.0}}
        hidden_lamp.energy_usage_per_tick = light_size * 0.125 .."kW"
      end
      log("[LEP+] Created "..newName.."; light size = "..light_size)

      local newRecipe =
      {
        type = "recipe",
        name = newName,
        enabled = false,
        ingredients =
        {
          {item.name, 1},
          {"small-lamp", lamp_count}
        },
        result = newName
      }

      -- find original recipe so new recipe can be sorted next to it
      local recipes = find_recipe_by_results({[item.name] = true})
      for k,v in pairs(recipes) do
        if v.subgroup then newRecipe.subgroup = v.subgroup end
        if v.order then newRecipe.order = v.order.."-0" end
        log(format("[LEP+] sorting new recipe according to recipe \"%s\" subgroup= \"%s\" order= \"%s\"", k, v.subgroup, v.order) )
        break -- pick first recipe
      end

      -- temporary store generated pole, will be added to data after generation is complete
      table.insert(lightedPoles, newPole)
      table.insert(lightedPoles, newItem)
      table.insert(lightedPoles, hidden_lamp)
      table.insert(lightedPoles, newRecipe)
    end
  end
end
data:extend(lightedPoles)

local recipe_lookup = find_recipe_by_results(pole_names)
local techs_found = {}
-- add to technology
for _, tech in pairs(data.raw["technology"]) do
  if tech.effects and not tech_blacklist[tech.name] then
    for _, effect in pairs(tech.effects) do
      if effect.recipe and recipe_lookup[effect.recipe] then
        local base_item = recipe_lookup[effect.recipe].product
        if not (techs_found[base_item] and techs_found[base_item][tech.name]) then
          -- don't insert multiple times in same technology (nullius)
          log("[LEP+] found original pole "..base_item.." in technology "..tech.name..", inserting "..pole_names[base_item].." into technology "..tech.name)
          table.insert(data.raw["technology"][tech.name].effects, {type="unlock-recipe",recipe=pole_names[base_item]})
          -- multiple techs may unlock the same recipe
          techs_found[base_item] = techs_found[base_item] or {}
          techs_found[base_item][tech.name] = true
        end
      end
    end
  end
end

-- add unassigned recipes to fallback technology (optics)
local tech = data.raw.technology[fallback_technology]
if tech then
  for original_pole, lighted_pole in pairs(pole_names) do
    if not techs_found[original_pole] then
      if tech.effects then
        log("[LEP+] no technology unlock found for "..original_pole..", inserting "..lighted_pole.." into technology "..tech.name)
        table.insert(tech.effects, {type="unlock-recipe", recipe=lighted_pole})
      else
        log("[LEP+] no technology unlock found for "..original_pole..", creating new effects table for "..lighted_pole.." in technology "..tech.name)
        tech.effects = {type="unlock-recipe", recipe=lighted_pole}
      end
    end
  end
else
  error("[LEP+] ERROR: Technology "..fallback_technology.." not found")
end
