local BioInd = require('common')('Bio_Industries')

for var, name in pairs({
  BI_Bio_Fuel = "BI_Bio_Fuel",
  BI_Easy_Bio_Gardens = "BI_Easy_Bio_Gardens",
  BI_Game_Tweaks_Stack_Size = "BI_Game_Tweaks_Stack_Size",
  BI_Game_Tweaks_Recipe = "BI_Game_Tweaks_Recipe",
  BI_Game_Tweaks_Tree = "BI_Game_Tweaks_Tree",
  BI_Game_Tweaks_Player = "BI_Game_Tweaks_Player",
  BI_Solar_Additions = "BI_Solar_Additions",
}) do
  BI.Settings[var] = BioInd.get_startup_setting(name)
end


--~ BioInd.show("data.raw.recipe[\"bi-sulfur\"]", data.raw.recipe["bi-sulfur"])
BioInd.show("BI.Settings.BI_Easy_Bio_Gardens", BI.Settings.BI_Easy_Bio_Gardens)
local ICONPATH = "__Bio_Industries__/graphics/icons/"

----Update the Wood Pipe Images
require("prototypes.Wood_Products.pipes")

--~ --- Bridge Rail Remnants
--~ require("prototypes.Wood_Products.update_bridge_rails_remnants")
require("prototypes.Wood_Products.tint_rails_remnants_function")

-- Concrete Rail
---- Update Standard Rails to use and look like concrete
set_tint_to_rails(
  {
    data.raw["legacy-straight-rail"]["legacy-straight-rail"],
    data.raw["legacy-curved-rail"]["legacy-curved-rail"]
  },
  {r = 183/255, g = 183/255, b = 183/255, a = 1}
) -- concrete

set_tint_to_remnants(
  {
    data.raw["rail-remnants"]["legacy-straight-rail-remnants"],
    data.raw["rail-remnants"]["legacy-curved-rail-remnants"]
  },
  {r = 183/255, g = 183/255, b = 183/255, a = 1}
) -- concrete

-- Damage Bonus to Ammo
require("prototypes.Bio_Turret.technology-updates")

-- Unlock recipes for Crushed Stone from concrete/hazard concrete
thxbob.lib.tech.add_recipe_unlock("advanced-material-processing-2", "bi-crushed-stone-2")
thxbob.lib.tech.add_recipe_unlock("advanced-material-processing-2", "bi-crushed-stone-3")
thxbob.lib.tech.add_recipe_unlock("advanced-material-processing-2", "bi-crushed-stone-4")
thxbob.lib.tech.add_recipe_unlock("advanced-material-processing-2", "bi-crushed-stone-5")
--~ thxbob.lib.tech.add_prerequisite("advanced-material-processing-2", "concrete")

--- Wood Floors
-- Make wood placeable only if Dectorio isn't installed. Should leave existing flooring intact.
if not mods["Dectorio"] then
  data.raw.item["wood"].place_as_tile = {
    result = "bi-wood-floor",
    condition_size = 4,
    condition = { "water-tile" }
  }
end


--- Make it so that the Base game tile "grass" can't be placed in blueprints
--- New as of 0.16
for _, tile in ipairs{"grass-1", "grass-2", "grass-3", "grass-4"} do
  BI_Functions.lib.remove_from_blueprint(tile)
end

if mods["alien-biomes"] then
  BioInd.writeDebug("Removing AB tiles from blueprints")
  local patterns = {
    "frozen%-snow%-%d",
    "mineral%-aubergine%-dirt%-%d",
    "mineral%-aubergine%-sand%-%d",
    "mineral%-beige%-dirt%-%d",
    "mineral%-beige%-sand%-%d",
    "mineral%-black%-dirt%-%d",
    "mineral%-black%-sand%-%d",
    "mineral%-brown%-dirt%-%d",
    "mineral%-brown%-sand%-%d",
    "mineral%-cream%-dirt%-%d",
    "mineral%-cream%-sand%-%d",
    "mineral%-dustyrose%-dirt%-%d",
    "mineral%-dustyrose%-sand%-%d",
    "mineral%-grey%-dirt%-%d",
    "mineral%-grey%-sand%-%d",
    "mineral%-purple%-dirt%-%d",
    "mineral%-purple%-sand%-%d",
    "mineral%-red%-dirt%-%d",
    "mineral%-red%-sand%-%d",
    "mineral%-tan%-dirt%-%d",
    "mineral%-tan%-sand%-%d",
    "mineral%-violet%-dirt%-%d",
    "mineral%-violet%-sand%-%d",
    "mineral%-white%-dirt%-%d",
    "mineral%-white%-sand%-%d",
    "vegetation%-blue%-grass%-%d",
    "vegetation%-green%-grass%-%d",
    "vegetation%-mauve%-grass%-%d",
    "vegetation%-olive%-grass%-%d",
    "vegetation%-orange%-grass%-%d",
    "vegetation%-purple%-grass%-%d",
    "vegetation%-red%-grass%-%d",
    "vegetation%-turquoise%-grass%-%d",
    "vegetation%-violet%-grass%-%d",
    "vegetation%-yellow%-grass%-%d",
    "volcanic%-blue%-heat%-%d",
    "volcanic%-green%-heat%-%d",
    "volcanic%-orange%-heat%-%d",
    "volcanic%-purple%-heat%-%d",
  }
  for tile_name, tile in pairs(data.raw.tile) do
    for p, pattern in ipairs(patterns) do
      if tile_name:match(pattern) then
        BI_Functions.lib.remove_from_blueprint(tile)
        break
      end
    end
  end
end

--- Adds Solar Farm, Solar Plant, Bio Accumulator and Substation to Tech tree
if BI.Settings.BI_Solar_Additions then
  --- Electric redo if Bob' Electric
  -- Huge Electric Pole
  if data.raw.item["tinned-copper-cable"] then
    thxbob.lib.recipe.remove_ingredient("bi-wooden-pole-huge", "wood")
    thxbob.lib.recipe.add_new_ingredient("bi-wooden-pole-huge", {
      type = "item",
      name = "tinned-copper-cable",
      amount = 15}
    )
  end

  -- Solar Farm
  if data.raw.item["solar-panel-large"] then
    thxbob.lib.recipe.remove_ingredient("bi-bio-solar-farm", "solar-panel")
    thxbob.lib.recipe.add_new_ingredient("bi-bio-solar-farm", {
      type = "item",
      name = "solar-panel-large-2", --DrD solar-panel-large
      amount = 10} --DrD 30
    )
  end

  -- Huge Sub Station
  if data.raw.item["substation-4"] then --DrD substation-3
    thxbob.lib.recipe.remove_ingredient("bi-large-substation", "substation")
    thxbob.lib.recipe.add_new_ingredient("bi-large-substation", {
      type = "item",
      name = "substation-4", --DrD substation-3
      amount = 12} -- --DrD 6
    )
  end 

  if data.raw.item["gold-plate"] then --DrD change of electrum-alloy till end
    thxbob.lib.recipe.remove_ingredient("bi-large-substation", "steel-plate")
    thxbob.lib.recipe.add_new_ingredient("bi-large-substation", {
      type = "item",
      name = "gold-plate",
      amount = 100}
    )
  end

  -- Huge Accumulator
  if data.raw.item["large-accumulator-2"] then
    thxbob.lib.recipe.remove_ingredient("bi-bio-accumulator", "accumulator")
    thxbob.lib.recipe.add_new_ingredient("bi-bio-accumulator", {
      type = "item",
      name = "large-accumulator",
      amount = 30}
    )
  end

  if data.raw.item["aluminium-plate"] then
    thxbob.lib.recipe.remove_ingredient("bi-bio-accumulator", "copper-cable")
    thxbob.lib.recipe.add_new_ingredient("bi-bio-accumulator", {
      type = "item",
      name = "aluminium-plate",
      amount = 80} --DrD 50
    )
  end

  -- Solar Boiler / Plant
  if data.raw.item["angels-electric-boiler"] then
    thxbob.lib.recipe.remove_ingredient("bi-solar-boiler-hidden-panel", "boiler")
    thxbob.lib.recipe.add_new_ingredient("bi-solar-boiler-hidden-panel", {
      type = "item",
      name = "angels-electric-boiler",
      amount = 1}
    )
    --~ thxbob.lib.recipe.remove_ingredient ("bi-solar-boiler", "boiler")
    --~ thxbob.lib.recipe.add_new_ingredient ("bi-solar-boiler", {type = "item", name = "angels-electric-boiler", amount = 1})
  end
end

require("prototypes.Bio_Farm.compatible_recipes") -- Bob and Angels mesh

-- Blacklist bioreactor in Assembler Pipe Passthrough
if mods["assembler-pipe-passthrough"] then
  appmod.blacklist['bi-bio-reactor'] = true
end

if settings.startup["angels-use-angels-barreling"] and settings.startup["angels-use-angels-barreling"].value then
  data.raw.technology["bi-tech-fertilizer"].prerequisites = {
    "bi-tech-bio-farming",
    -- AND (
    "water-treatment", -- sulfur
    -- OR
    "angels-fluid-barreling", -- barreling (needed 'water-treatment' as prerequisites)
    -- )
  }
end


----- Angels Merge ----
if mods["angelspetrochem"] then
    data.raw.item["pellet-coke"].icon = "__angelspetrochem__/graphics/icons/pellet-coke.png"
    data.raw.item["pellet-coke"].icon_size = 32
    data.raw.item["pellet-coke"].fuel_acceleration_multiplier = 1.1
    data.raw.item["pellet-coke"].fuel_top_speed_multiplier = 1.2

    data.raw.recipe["pellet-coke"].category = "biofarm-mod-smelting"
    thxbob.lib.tech.remove_recipe_unlock ("angels-coal-processing-2", "pellet-coke")
    thxbob.lib.tech.add_recipe_unlock("angels-coal-cracking", "pellet-coke")
end

  local ICONPATH = BioInd.modRoot .. "/graphics/icons/"

  -- We only want to create nitrogen if it doesn't exist yet. We then also need to create
  -- liquid air.
  if not data.raw.fluid["nitrogen"] then
    data:extend({
      {
        type = "fluid",
        name = "nitrogen",
        icon = ICONPATH .. "nitrogen.png",
        icon_size = 64,
        icons = {
          {
            icon = ICONPATH .. "nitrogen.png",
            icon_size = 64,
            icon_mipmaps = 1,
          }
        },
        default_temperature = 25,
        gas_temperature = -210,
        max_temperature = 100,
        heat_capacity = "1KJ",
        base_color = {r = 0.0, g = 0.0, b = 1.0},
        flow_color = {r = 0.0, g = 0.0, b = 1.0},
        pressure_to_speed_ratio = 0.4,
        flow_to_energy_ratio = 0.59,
        order = "a[fluid]-b[nitrogen]"
      },
    })
    --~ BI_Functions.lib.allow_productivity("bi-nitrogen")
    BioInd.writeDebug("Made recipe for \"nitrogen\".")

    if not data.raw.fluid["liquid-air"] then
      data:extend({
        {
          type = "fluid",
          name = "liquid-air",
          icon = ICONPATH .. "liquid-air.png",
          icon_size = 64,
          icons = {
            {
              icon = ICONPATH .. "liquid-air.png",
              icon_size = 64,
              icon_mipmaps = 1,
            }
          },
          default_temperature = 25,
          gas_temperature = -100,
          max_temperature = 100,
          heat_capacity = "1KJ",
          base_color = {r = 0, g = 0, b = 0},
          flow_color = {r = 0.5, g = 1.0, b = 1.0},
          pressure_to_speed_ratio = 0.4,
          flow_to_energy_ratio = 0.59,
          order = "a[fluid]-b[liquid-air]"
        },
      })
      --~ BI_Functions.lib.allow_productivity("bi-liquid-air")
      BioInd.writeDebug("Made recipe for \"liquid-air\".")
    end

  -- Recipes for "bi-liquid-air" and "bi-nitrogen" aren't needed!
  else
    -- Remove recipe unlocks
    thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertilizer", "bi-liquid-air")
    thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertilizer", "bi-nitrogen")
    BioInd.writeDebug("Removed recipe unlocks for \"bi-liquid-air\" and \"bi-nitrogen\"")

    -- Replace liquid air with oxygen (from Krastorio/K2) in recipes for Algae Biomass 2 and 3
    if data.raw.fluid.oxygen then
      thxbob.lib.recipe.replace_ingredient("bi-biomass-2", "liquid-air", "oxygen")
      thxbob.lib.recipe.replace_ingredient("bi-biomass-3", "liquid-air", "oxygen")
      BioInd.writeDebug("Replaced \"liquid-air\" with \"oxygen\" in recipes \"bi-biomass-2\" and \"bi-biomass-3\"")
    -- Perhaps there is no oxygen? But there's nitrogen for sure, so we fall back to that!
    elseif data.raw.fluid.nitrogen then
      thxbob.lib.recipe.replace_ingredient("bi-biomass-2", "liquid-air", "nitrogen")
      thxbob.lib.recipe.replace_ingredient("bi-biomass-3", "liquid-air", "nitrogen")
      BioInd.writeDebug("Replaced \"liquid-air\" with \"nitrogen\" in recipes \"bi-biomass-2\" and \"bi-biomass-3\"")
    end

    -- Remove recipes for these fluids
    data.raw.recipe["bi-liquid-air"] = nil
    data.raw.recipe["bi-nitrogen"] = nil
    BioInd.writeDebug("Removed recipes for \"nitrogen\" and \"liquid air\".")
  end

-- Moved here from data-final-fixes.lua for 0.18.34/1.1.4! (Fixes https://mods.factorio.com/mod/Bio_Industries/discussion/5ff570bd916993002371332a)
---- Game Tweaks ---- Recipes
if BI.Settings.BI_Game_Tweaks_Recipe then
  --- Concrete Recipe Tweak
  thxbob.lib.recipe.remove_ingredient("concrete", "iron-ore")
  thxbob.lib.recipe.add_new_ingredient("concrete", {type = "item", name = "iron-stick", amount = 2})

  --- Stone Wall
  thxbob.lib.recipe.add_new_ingredient("stone-wall", {type = "item", name = "iron-stick", amount = 1})

  --- Rail (Remove Stone and Add Crushed Stone)
  if data.raw.item["stone-crushed"] then
    thxbob.lib.recipe.remove_ingredient("rail", "stone")
    thxbob.lib.recipe.add_new_ingredient("rail", {type = "item", name = "stone-crushed", amount = 6})
  end

  -- vanilla rail recipe update
  thxbob.lib.recipe.add_new_ingredient("rail", {type = "item", name = "concrete", amount = 6})
end

--- Enable Productivity in Recipes
for recipe, r in pairs(data.raw.recipe) do
  for p, pattern in ipairs({
  "bi%-acid",
  "bi%-battery",
  "bi%-biomass%-%d",
  "bi%-biomass%-conversion%-%d",
  "bi%-cellulose%-%d",
  "bi%-crushed%-stone%-%d",
  "bi%-liquid%-air",
  "bi%-logs%-%d",
  "bi%-nitrogen",
  "bi%-plastic%-%d",
  "bi%-press%-wood",
  "bi%-resin%-pulp",
  "bi%-resin%-wood",
  "bi%-seed%-%d",
  "bi%-seedling%-%d",
  "bi%-stone%-brick",
  "bi%-sulfur",
  "bi%-sulfur%-angels",
  "bi%-wood%-from%-pulp",
  "bi%-woodpulp",
   -- Added for 0.17.49/0.18.17
  "bi%-basic%-gas%-processing",
  }) do
    if recipe:match(pattern) then
      BI_Functions.lib.allow_productivity(recipe)
      break
    end
  end
end


------------------------------------------------------------------------------------
-- Add resistances to our hidden entities
------------------------------------------------------------------------------------
-- Make resistances for each damage type
local resistances = {}
for damage, d in pairs(data.raw["damage-type"]) do
  resistances[#resistances + 1] = {
    type = damage,
    percent = 100
  }
end

-- Add resistances to prototypes
-- (h_type is not guaranteed to be a prototype type -- it's the short handle that we
-- use compound_entities.hidden!)
local h_type
for h_key, h_names in pairs(BI.hidden_entities.types) do
  h_type = BioInd.HE_map[h_key]
  for h_name, h in pairs(h_names) do
--~ BioInd.writeDebug("h_type: %s\th_name: %s\th:%s", {h_type, h_name, h})
    data.raw[h_type][h_name].resistances = resistances
    BioInd.writeDebug("Added resistances to %s (%s): %s",
                      {h_name, h_type, data.raw[h_type][h_name].resistances})
  end
end

------------------------------------------------------------------------------------
-- Omnifluid will be confused by our bi-solar-boiler (the compound boiler + solar
-- plant entity). Let's blacklist it if the mod is active!
BioInd.show("Omnifluid is active", mods["omnimatter_fluid"] or false)
BioInd.show("forbidden_boilers", forbidden_boilers)

if mods["omnimatter_fluid"]  then
  forbidden_boilers = forbidden_boilers or {}
  forbidden_boilers["bi-solar-boiler"] = true
end
BioInd.writeDebug("OMNIFLUID Test! forbidden_boilers = %s", {forbidden_boilers})


------------------------------------------------------------------------------------
-- If the Py-Suite is installed, we move our coal-processing unlocks to their techs!
local check, set
if mods["pyrawores"] then
  -- Are all techs there?
  check = true
  for i = 1, 3 do
    if not data.raw.technology["coal-mk0" .. i] then
      check = false
      break
    end
  end

  if check then
    set = true
    local unlocks = require("prototypes.Bio_Farm.coal_processing")
    for i = 1, 3 do
      for u, unlock in ipairs(unlocks[i]) do
        thxbob.lib.tech.add_recipe_unlock("coal-mk0" .. i, unlock.recipe)
BioInd.writeDebug("Added recipe %s to unlocks of %s", {unlock.recipe, "coal-mk0" .. i})
      end
    end
  end
end
-- PyRawOres has priority!
if mods["pycoalprocessing"] and not set then
   -- Are all techs there?
  check = true
  for i = 1, 3 do
    if not data.raw.technology["coal-processing-" .. i] then
      check = false
      break
    end
  end

  if check then
    set = true
    local unlocks = require("prototypes.Bio_Farm.coal_processing")
    for i = 1, 3 do
      for u, unlock in ipairs(unlocks[i]) do
        thxbob.lib.tech.add_recipe_unlock("coal-processing-" .. i, unlock.recipe)
BioInd.writeDebug("Added recipe %s to unlocks of %s", {unlock.recipe, "coal-processing-" .. i})
      end
    end
  end
end
if set then
  for i = 1, 3 do
    data.raw.technology["bi-tech-coal-processing-" .. i] = nil
BioInd.writeDebug("Removed technology " .. "bi-tech-coal-processing-" .. i)
  end
end

------------------------------------------------------------------------------------
-- Add icons to our prototypes
BioInd.BI_add_icons()