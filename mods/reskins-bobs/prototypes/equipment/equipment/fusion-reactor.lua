-- Copyright (c) 2022 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.equipment.equipment) then return end

local inputs = {
    type = "generator-equipment",
    icon_name = "fusion-reactor",
    mod = "bobs",
    group = "equipment",
}

-- Setup defaults
reskins.lib.parse_inputs(inputs)

local fusion_reactors = {
    ["fission-reactor-equipment"] = {tier = 1, prog_tier = 2},
    ["fusion-reactor-equipment-2"] = {tier = 2, prog_tier = 3},
    ["fusion-reactor-equipment-3"] = {tier = 3, prog_tier = 4},
    ["fusion-reactor-equipment-4"] = {tier = 4, prog_tier = 5},
}

-- Reskin equipment
for name, map in pairs(fusion_reactors) do
    -- Fetch equipment
    local equipment = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not equipment then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index[tier]

    -- Construct icon
    reskins.lib.construct_icon(name, tier, inputs)

    -- Reskin the equipment
    equipment.sprite = {
        layers = {
            -- Base
            {
                filename = reskins.bobs.directory.."/graphics/equipment/equipment/fusion-reactor/fusion-reactor-equipment-base.png",
                size = 128,
                priority = "medium",
                flags = { "no-crop" },
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/equipment/equipment/fusion-reactor/hr-fusion-reactor-equipment-base.png",
                    size = 256,
                    priority = "medium",
                    flags = { "no-crop" },
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.bobs.directory.."/graphics/equipment/equipment/fusion-reactor/fusion-reactor-equipment-mask.png",
                size = 128,
                priority = "medium",
                flags = { "no-crop" },
                tint = inputs.tint,
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/equipment/equipment/fusion-reactor/hr-fusion-reactor-equipment-mask.png",
                    size = 256,
                    priority = "medium",
                    flags = { "no-crop" },
                    tint = inputs.tint,
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.bobs.directory.."/graphics/equipment/equipment/fusion-reactor/fusion-reactor-equipment-highlights.png",
                size = 128,
                priority = "medium",
                flags = { "no-crop" },
                blend_mode = reskins.lib.blend_mode, -- "additive",
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/equipment/equipment/fusion-reactor/hr-fusion-reactor-equipment-highlights.png",
                    size = 256,
                    priority = "medium",
                    flags = { "no-crop" },
                    blend_mode = reskins.lib.blend_mode, -- "additive",
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end