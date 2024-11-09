local small_ruins = {
  require("ruins/Blue-Chip-S"),
  require("ruins/Con-Bot-S"),
  require("ruins/Green-Chip-S"),
  require("ruins/Red-Chip-S"),
  require("ruins/Filter-Inserter-S"),
}
local small_ruins_RPGsystem = {
  require("ruins/Craft-Potion-S"),
  require("ruins/Exp-Potion-S"),
  require("ruins/Heal-Potion-S"),
  require("ruins/Speed-Potion-S"),
}
local small_ruins_angelsrefining = {
  require("ruins/Sludge-S"),
  require("ruins/Sulfuric-Acid-S"),
}
local small_ruins_robotarmy = {
  require("ruins/BattleBot-S"),
  require("ruins/Clockwork-S"),
  require("ruins/FlameBot-S"),
  require("ruins/RocketBot-S"),
  require("ruins/Terminator-S"),
}
local medium_ruins = {
  require("ruins/AProvider-Box-M"),
  require("ruins/Blue-Red-Chips-M"),
  require("ruins/Buffer-Box-M"),
  require("ruins/Con-Bot-M"),
  require("ruins/Logi-Bot-M"),
  require("ruins/Lube-M"),
  require("ruins/Nuke-Rods-M"),
  require("ruins/Provider-Box-M"),
  require("ruins/Red-Green-Chips-M"),
  require("ruins/Req-Box-M"),
  require("ruins/Storage-Box-M"),
  require("ruins/Inv-Bat-M"),
  require("ruins/Inv-Solar-M"),
  require("ruins/Inv-Modular-M"),
  require("ruins/Inv-Lpd-M"),
  require("ruins/Inv-Shield-M"),
}
local medium_ruins_RPGsystem = {
  require("ruins/RPG-M"),
}
local medium_ruins_angelspetrochem = {
  require("ruins/Air-Filter-M"),
  require("ruins/Electrolyser-M"),
  require("ruins/Gas-Refinery-M"),
}
local medium_ruins_angelsrefining = {
  require("ruins/Barrels-M"),
  require("ruins/Hydro-plant-M"),
  require("ruins/Sulfuric-Acid-M"),
  require("ruins/Washing-M"),
}
local medium_ruins_robotarmy = {
  require("ruins/Droids-M"),
}
local medium_ruins_Aircraft = {
  require("ruins/Cargo-Plane-M"),
}
local large_ruins = {
  require("ruins/Blue-L"),
  require("ruins/Mil-Tech-L"),
  require("ruins/Reactor-L"),
  require("ruins/Roboport-L"),
  require("ruins/Inv-L"),
  require("ruins/Ammo-Dump-L"),
}
local large_ruins_angelspetrochem = {
  require("ruins/Electric-Steam-L"),
}
local large_ruins_angelsrefining = {
  require("ruins/Ore-Crush-Sort-L"),
  require("ruins/Filtration-Unit-L"),
}
local large_ruins_angelssmelting = {
  require("ruins/Casting-L"),
}
local large_ruins_angelsrefining_angelspetrochem = {
  require("ruins/Crystalize4-L"),
  require("ruins/Electrolyser-L"),
}
local large_ruins_RPGsystem_angelspetrochem = {
  require("ruins/Lazors-L"),
}

local function make_ruin_set()
  -- Get the base ruin set of the AbandonedRuins mod. This creates a copy of that ruin set.
  local base_ruins = remote.call("AbandonedRuins", "get_ruin_set", "base")

  -- Add the silly ruins to the existing ruins.
  for _, ruin in pairs(small_ruins) do
    table.insert(base_ruins.small, ruin)
  end
  for _, ruin in pairs(medium_ruins) do
    table.insert(base_ruins.medium, ruin)
  end
  for _, ruin in pairs(large_ruins) do
    table.insert(base_ruins.large, ruin)
  end
  if global.RPGsystem then
    for _, ruin in pairs(small_ruins_RPGsystem) do
      table.insert(base_ruins.small, ruin)
    end
    for _, ruin in pairs(medium_ruins_RPGsystem) do
      table.insert(base_ruins.medium, ruin)
    end
  end
  if global.angelspetrochem then
    for _, ruin in pairs(medium_ruins_angelspetrochem) do
      table.insert(base_ruins.medium, ruin)
    end
    for _, ruin in pairs(large_ruins_angelspetrochem) do
      table.insert(base_ruins.large, ruin)
    end
  end
  if global.angelsrefining then
    for _, ruin in pairs(small_ruins_angelsrefining) do
      table.insert(base_ruins.small, ruin)
    end
    for _, ruin in pairs(medium_ruins_angelsrefining) do
      table.insert(base_ruins.medium, ruin)
    end
    for _, ruin in pairs(large_ruins_angelsrefining) do
      table.insert(base_ruins.large, ruin)
    end
  end
  if global.robotarmy then
    for _, ruin in pairs(small_ruins_robotarmy) do
      table.insert(base_ruins.small, ruin)
    end
    for _, ruin in pairs(medium_ruins_robotarmy) do
      table.insert(base_ruins.medium, ruin)
    end
  end
  if global.Aircraft then
    for _, ruin in pairs(medium_ruins_Aircraft) do
      table.insert(base_ruins.medium, ruin)
    end
  end
  if global.angelssmelting then
    for _, ruin in pairs(large_ruins_angelssmelting) do
      table.insert(base_ruins.large, ruin)
    end
  end
  if global.angelsrefining and global.angelspetrochem then
    for _, ruin in pairs(large_ruins_angelsrefining_angelspetrochem) do
      table.insert(base_ruins.large, ruin)
    end
  end
  if global.RPGsystem and global.angelspetrochem then
    for _, ruin in pairs(large_ruins_RPGsystem_angelspetrochem) do
      table.insert(base_ruins.large, ruin)
    end
  end

  if global.angelsrefining then
    -- Replace rocks with trees, otherwise Angel replaces them with larger rocks- blocking chest placement.
    replace_entity_name_in_all_ruins(base_ruins, "big-rock", "tree-04")
  end

  -- Provide the extended and modified ruin set as the "silly" set.
  remote.call("AbandonedRuins", "add_ruin_set", "silly", base_ruins.small, base_ruins.medium, base_ruins.large)
end

local function make_optional_modlist()
  global.RPGsystem = game.active_mods["RPGsystem"]
  global.angelspetrochem = game.active_mods["angelspetrochem"]
  global.angelsrefining = game.active_mods["angelsrefining"]
  global.robotarmy = game.active_mods["robotarmy"]
  global.Aircraft = game.active_mods["Aircraft"]
  global.angelssmelting = game.active_mods["angelssmelting"]
end

local function handle_on_init()
  make_optional_modlist()
  make_ruin_set()
end

-- The ruin set is created always when the game is loaded, since the ruin sets are not save/loaded by AbandonedRuins.
--  Since this is using on_load, we must be sure that it always produces the same result for everyone.
--   Luckily, it's okay to do ruin changes based on a startup setting here since those cannot change during the game.
script.on_init(handle_on_init)
script.on_load(make_ruin_set)
script.on_configuration_changed(handle_on_init)

function replace_entity_name_in_all_ruins(ruin_set, value, replacement)
  for _, ruin in pairs(ruin_set.small) do
    replace_entity_name(ruin, value, replacement)
  end
  for _, ruin in pairs(ruin_set.medium) do
    replace_entity_name(ruin, value, replacement)
  end
  for _, ruin in pairs(ruin_set.large) do
    replace_entity_name(ruin, value, replacement)
  end
end

function replace_entity_name(ruin, name, replacement)
  if not (ruin.entities and next(ruin.entities) ~= nil) then return end
  for _, entity in pairs(ruin.entities) do
    if entity[1] and entity[1] == name then
      entity[1] = replacement
    end
  end
end