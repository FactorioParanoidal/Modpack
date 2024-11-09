-- Copyright (c) 2022 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.equipment.technologies) then return end

local inputs = {
    type = "technology",
    mod = "bobs",
    group = "equipment",
    technology_icon_extras = {reskins.lib.technology_equipment_overlay{scale = 1}},
    technology_icon_size = 256,
    technology_icon_mipmaps = 4,
}

local technologies = {
    -- Roboport modular equipment
    ["personal-roboport-modular-equipment-1"] = {icon_name = "modular-equipment", icon_base = "modular-equipment-1", tier = 1, prog_tier = 2},
    ["personal-roboport-modular-equipment-2"] = {icon_name = "modular-equipment", icon_base = "modular-equipment-2", tier = 2, prog_tier = 3},
    ["personal-roboport-modular-equipment-3"] = {icon_name = "modular-equipment", icon_base = "modular-equipment-3", tier = 3, prog_tier = 4},
    ["personal-roboport-modular-equipment-4"] = {icon_name = "modular-equipment", icon_base = "modular-equipment-4", tier = 4, prog_tier = 5},

    -- Solar panels
    ["solar-panel-equipment"] = {icon_name = "solar-panel", tier = 1, prog_tier = 2},
    ["solar-panel-equipment-2"] = {icon_name = "solar-panel", tier = 2, prog_tier = 3},
    ["solar-panel-equipment-3"] = {icon_name = "solar-panel", tier = 3, prog_tier = 4},
    ["solar-panel-equipment-4"] = {icon_name = "solar-panel", tier = 4, prog_tier = 5},

    -- Batteries
    ["battery-equipment"] = {icon_name = "battery", tier = 0},
    ["battery-mk2-equipment"] = {icon_name = "battery", tier = 1},
    ["bob-battery-equipment-3"] = {icon_name = "battery", tier = 2},
    ["bob-battery-equipment-4"] = {icon_name = "battery", tier = 3},
    ["bob-battery-equipment-5"] = {icon_name = "battery", tier = 4},
    ["bob-battery-equipment-6"] = {icon_name = "battery", tier = 5},

    -- Shields
    ["energy-shield-equipment"] = {icon_name = "energy-shield", tier = 0},
    ["energy-shield-mk2-equipment"] = {icon_name = "energy-shield", tier = 1},
    ["bob-energy-shield-equipment-3"] = {icon_name = "energy-shield", tier = 2},
    ["bob-energy-shield-equipment-4"] = {icon_name = "energy-shield", tier = 3},
    ["bob-energy-shield-equipment-5"] = {icon_name = "energy-shield", tier = 4},
    ["bob-energy-shield-equipment-6"] = {icon_name = "energy-shield", tier = 5},

    -- Laser defense
    ["personal-laser-defense-equipment"] = {icon_name = "laser-defense", tier = 0},
    ["personal-laser-defense-equipment-2"] = {icon_name = "laser-defense", tier = 1},
    ["personal-laser-defense-equipment-3"] = {icon_name = "laser-defense", tier = 2},
    ["personal-laser-defense-equipment-4"] = {icon_name = "laser-defense", tier = 3},
    ["personal-laser-defense-equipment-5"] = {icon_name = "laser-defense", tier = 4},
    ["personal-laser-defense-equipment-6"] = {icon_name = "laser-defense", tier = 5},

    -- Fusion Reactors
    ["fission-reactor-equipment"] = {icon_name = "fusion-reactor", tier = 1, prog_tier = 2},
    ["fusion-reactor-equipment-2"] = {icon_name = "fusion-reactor", tier = 2, prog_tier = 3},
    ["fusion-reactor-equipment-3"] = {icon_name = "fusion-reactor", tier = 3, prog_tier = 4},
    ["fusion-reactor-equipment-4"] = {icon_name = "fusion-reactor", tier = 4, prog_tier = 5},

    -- Night vision
    ["night-vision-equipment"] = {icon_name = "night-vision", tier = 1, prog_tier = 2},
    ["night-vision-equipment-2"] = {icon_name = "night-vision", tier = 2, prog_tier = 3},
    ["night-vision-equipment-3"] = {icon_name = "night-vision", tier = 3, prog_tier = 4},

    -- Exoskeleton
    ["exoskeleton-equipment"] = {icon_name = "exoskeleton", tier = 1, prog_tier = 2},
    ["exoskeleton-equipment-2"] = {icon_name = "exoskeleton", tier = 2, prog_tier = 3},
    ["exoskeleton-equipment-3"] = {icon_name = "exoskeleton", tier = 3, prog_tier = 4},

    -- Roboports
    ["personal-roboport-equipment"] = {icon_name = "personal-roboport-1", tier = 1, prog_tier = 2},
    ["personal-roboport-mk2-equipment"] = {icon_name = "personal-roboport-1", tier = 2, prog_tier = 3},
    ["personal-roboport-mk3-equipment"] = {icon_name = "personal-roboport-2", tier = 3, prog_tier = 4},
    ["personal-roboport-mk4-equipment"] = {icon_name = "personal-roboport-2", tier = 4, prog_tier = 5},
}

reskins.lib.create_icons_from_list(technologies, inputs)