-- Copyright (c) 2022 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.logistics.technologies) then return end

-- Setup standard inputs
local inputs = {
    mod = "bobs",
    group = "logistics",
    type = "technology",
    technology_icon_size = 256,
    technology_icon_mipmaps = 4,
}

-- Filenames and effect overlays
local stack_inserter_icon = "__base__/graphics/technology/bulk-inserter.png"
local inserter_icon = "__base__/graphics/technology/inserter-capacity.png"
local toolbelt_icon = "__base__/graphics/technology/toolbelt.png"
local constant_capacity = reskins.lib.return_technology_effect_icon("capacity")

local technologies = {
    -- Fluid wagons
    -- ["fluid-wagon"] = {tier = 1, prog_tier = 2},
    -- ["bob-fluid-wagon-2"] = {tier = 1, prog_tier = 3},
    -- ["bob-fluid-wagon-3"] = {tier = 1, prog_tier = 4},
    -- ["bob-armoured-fluid-wagon"] = {tier = 1, prog_tier = 4},
    -- ["bob-armoured-fluid-wagon-2"] = {tier = 1, prog_tier = 5},

    -- Trains and cargo wagons
    -- ["railway"] = {tier = 1, prog_tier = 2},
    -- ["bob-railway-2"] = {tier = 1, prog_tier = 3},
    -- ["bob-railway-3"] = {tier = 1, prog_tier = 4},
    -- ["bob-armoured-railway"] = {tier = 1, prog_tier = 4},
    -- ["bob-armoured-railway-2"] = {tier = 1, prog_tier = 5},

    -- Roboports
    -- ["bob-robo-modular-1"] = {tier = 1, prog_tier = 2},
    -- ["bob-robo-modular-2"] = {tier = 2, prog_tier = 3},
    -- ["bob-robo-modular-3"] = {tier = 3, prog_tier = 4},
    -- ["bob-robo-modular-4"] = {tier = 4, prog_tier = 5},

    -- Repair packs
    ["bob-repair-pack-2"] = {tier = 2, icon_name = "repair-pack", technology_icon_size = 128, technology_icon_mipmaps = 0},
    ["bob-repair-pack-3"] = {tier = 3, icon_name = "repair-pack", technology_icon_size = 128, technology_icon_mipmaps = 0},
    ["bob-repair-pack-4"] = {tier = 4, icon_name = "repair-pack", technology_icon_size = 128, technology_icon_mipmaps = 0},
    ["bob-repair-pack-5"] = {tier = 5, icon_name = "repair-pack", technology_icon_size = 128, technology_icon_mipmaps = 0},

    -- Fluid Handling
    -- ["fluid-handling"] = {flat_icon = false, tier = 1, prog_tier = 2, icon_name = "fluid-handling"}, -- handled by technology/plates.lua
    -- ["bob-fluid-handling-2"] = {flat_icon = false, tier = 2, prog_tier = 3, icon_name = "fluid-handling"}, -- handled by technology/plates.lua
    -- ["bob-fluid-handling-3"] = {flat_icon = false, tier = 3, prog_tier = 4, icon_name = "fluid-handling"}, -- handled by technology/plates.lua
    -- ["bob-fluid-handling-4"] = {flat_icon = false, tier = 4, prog_tier = 5, icon_name = "fluid-handling"}, -- handled by technology/plates.lua

    -- Robot frames
    ["robotics"] = {icon_name = "robotics", tier = 1, prog_tier = 2},
    ["bob-robotics-2"] = {icon_name = "robotics", tier = 2, prog_tier = 3},
    ["bob-robotics-3"] = {icon_name = "robotics", tier = 3, prog_tier = 4},
    ["bob-robotics-4"] = {icon_name = "robotics", tier = 4, prog_tier = 5},

    -- Construction/Logistic robots
    -- ["construction-robots"] = {tier = 1},
    -- ["logistic-robots"] = {tier = 1},
    ["bob-robots-1"] = {icon_name = "robots", tier = 2},
    ["bob-robots-2"] = {icon_name = "robots", tier = 3},
    ["bob-robots-3"] = {icon_name = "robots", tier = 4},
    ["bob-robots-4"] = {icon_name = "robots", tier = 5},

    -- Logistic systems
    -- ["logistic-system"] = {tier = 1, prog_tier = 2},
    -- ["logistic-system-2"] = {tier = 2, prog_tier = 3},
    -- ["logistic-system-3"] = {tier = 3, prog_tier = 4},

    -- TECHNOLOGY EFFECTS
    -- Stack inserter capacities
    ["inserter-capacity-bonus-1"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-2"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-3"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-4"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-5"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-6"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-7"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-capacity-bonus-8"] = {technology_icon_filename = stack_inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},

    -- Inserter capacities
    ["inserter-stack-size-bonus-1"] = {technology_icon_filename = inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-stack-size-bonus-2"] = {technology_icon_filename = inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-stack-size-bonus-3"] = {technology_icon_filename = inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["inserter-stack-size-bonus-4"] = {technology_icon_filename = inserter_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},

    -- Toolbelt capacity
    ["toolbelt"] = {technology_icon_filename = toolbelt_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["toolbelt-2"] = {technology_icon_filename = toolbelt_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["toolbelt-3"] = {technology_icon_filename = toolbelt_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["toolbelt-4"] = {technology_icon_filename = toolbelt_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
    ["toolbelt-5"] = {technology_icon_filename = toolbelt_icon, technology_icon_extras = {constant_capacity}, flat_icon = true},
}

-- Disable select items based on Bob's settings
-- if (reskins.lib.setting("bobmods-logistics-flyingrobotframes") == false or reskins.lib.setting("bobmods-logistics-robotparts") == false) then
--     technologies["robotics"] = nil
-- end

-- Set fusion robot color
if (reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" and reskins.lib.setting("reskins-bobs-do-progression-based-robots")) then
    -- technologies["construction-robots"].prog_tier = 2
    -- technologies["logistic-robots"].prog_tier = 2
    technologies["bob-robots-1"].prog_tier = 3
    technologies["bob-robots-2"].prog_tier = 4
    technologies["bob-robots-3"].prog_tier = 5
    technologies["bob-robots-4"].tint = util.color(reskins.lib.setting("reskins-bobs-fusion-robot-color"))
end

-- Load which set of inserter technologies are to be reskinned
if reskins.lib.setting("bobmods-logistics-inserteroverhaul") == true then
    -- Standard inserters
    technologies["fast-inserter"] = {icon_name = "inserter", tier = 2}
    technologies["express-inserters"] = {icon_name = "inserter", tier = 3}
    technologies["turbo-inserter"] = {icon_name = "inserter", tier = 4}
    technologies["ultimate-inserter"] = {icon_name = "inserter", tier = 5}

    -- Stack inserters
    technologies["bulk-inserter"] = {icon_name = "bulk-inserter", tier = 2}
    technologies["bulk-inserter-2"] = {icon_name = "bulk-inserter", tier = 3}
    technologies["bulk-inserter-3"] = {icon_name = "bulk-inserter", tier = 4}
    technologies["bulk-inserter-4"] = {icon_name = "bulk-inserter", tier = 5}
else
    technologies["long-inserters-1"] = {flat_icon = true}
    -- technologies["fast-inserter"] = {} -- fine as-is
    technologies["express-inserters"] = {flat_icon = true} -- green/pink
    technologies["bulk-inserter"] = {flat_icon = true} -- green/white
    technologies["bulk-inserter-2"] = {flat_icon = true} -- rich green/gray
end

reskins.lib.create_icons_from_list(technologies, inputs)

-- Overwrite icons for technology effects
data.raw["utility-sprites"].default.stack_inserter_capacity_bonus_modifier_icon.filename = reskins.bobs.directory.."/graphics/icons/logistics/inserter/bulk-inserter-technology-effect-icon.png"