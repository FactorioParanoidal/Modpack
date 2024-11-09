-- Copyright (c) 2022 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.electronics.technologies) then return end

-- Setup standard inputs
local inputs = {
    mod = "bobs",
    group = "electronics",
    type = "technology",
    technology_icon_size = 256,
    technology_icon_mipmaps = 4,
    flat_icon = true,
}

local technologies = {
    -- ["electronics"] = {}, -- solder, solder plate, insulated wire, basic circuit, filter inserter, resistor, tin wire

    -- Advanced electronics
    -- ["advanced-circuit"] = {},
    ["advanced-electronics-3"] = {technology_icon_filename = "__base__/graphics/technology/advanced-electronics-2.png"}, -- Use "processing-unit" from base
}

reskins.lib.create_icons_from_list(technologies, inputs)