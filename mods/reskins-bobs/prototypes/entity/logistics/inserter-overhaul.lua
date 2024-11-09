-- Copyright (c) 2022 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then return end
if not reskins.lib.setting("bobmods-logistics-inserteroverhaul") then return end

-- Set input parameters
local inputs = {
    type = "inserter",
    mod = "bobs",
    group = "logistics",
    particles = {["medium"] = 1},
    tier_labels = reskins.lib.setting("reskins-bobs-do-inserter-tier-labeling") or false
}

-- Determine inserter permutations
local stack_inserter_icon_name = reskins.lib.setting("reskins-bobs-flip-bulk-inserter-icons") and "flipped-bulk-inserter" or "bulk-inserter"
local stack_inserter_type = "bulk-inserter"

local inserter_icon_name = "inserter"
local inserter_type = (mods["bobsinserters"] or reskins.lib.setting("bobmods-logistics-inserteroverhaul")) and "long-inserter" or "inserter"


local inserter_map = {
    -- Standard inserters
    ["inserter"] = {tier = 1, type = inserter_type, icon_name = inserter_icon_name},
    ["red-inserter"] = {tier = 2, type = inserter_type, icon_name = inserter_icon_name},
    ["long-handed-inserter"] = {tier = 2, type = inserter_type, icon_name = inserter_icon_name},
    ["fast-inserter"] = {tier = 3, type = inserter_type, icon_name = inserter_icon_name},
    ["turbo-inserter"] = {tier = 4, type = inserter_type, icon_name = inserter_icon_name},
    ["express-inserter"] = {tier = 5, type = inserter_type, icon_name = inserter_icon_name},

    -- Filter inserters
    ["yellow-filter-inserter"] = {tier = 1, is_filter = true, type = inserter_type, icon_name = "filter-"..inserter_icon_name},
    ["red-filter-inserter"] = {tier = 2, is_filter = true, type = inserter_type, icon_name = "filter-"..inserter_icon_name},
    ["fast-inserter"] = {tier = 3, is_filter = true, type = inserter_type, icon_name = "filter-"..inserter_icon_name},
    ["turbo-filter-inserter"] = {tier = 4, is_filter = true, type = inserter_type, icon_name = "filter-"..inserter_icon_name},
    ["express-filter-inserter"] = {tier = 5, is_filter = true, type = inserter_type, icon_name = "filter-"..inserter_icon_name},

    -- Stack inserters
    ["red-bulk-inserter"] = {tier = 2, is_stack_inserter = true, type = stack_inserter_type, icon_name = stack_inserter_icon_name},
    ["bulk-inserter"] = {tier = 3, is_stack_inserter = true, type = stack_inserter_type, icon_name = stack_inserter_icon_name},
    ["turbo-bulk-inserter"] = {tier = 4, is_stack_inserter = true, type = stack_inserter_type, icon_name = stack_inserter_icon_name},
    ["express-bulk-inserter"] = {tier = 5, is_stack_inserter = true, type = stack_inserter_type, icon_name = stack_inserter_icon_name},

    -- Stack filter inserters
    ["red-stack-filter-inserter"] = {tier = 2, is_filter = true, is_stack_inserter = true, type = stack_inserter_type, icon_name = "filter-"..stack_inserter_icon_name},
    ["bulk-inserter"] = {tier = 3, is_filter = true, is_stack_inserter = true, type = stack_inserter_type, icon_name = "filter-"..stack_inserter_icon_name},
    ["turbo-stack-filter-inserter"] = {tier = 4, is_filter = true, is_stack_inserter = true, type = stack_inserter_type, icon_name = "filter-"..stack_inserter_icon_name},
    ["express-stack-filter-inserter"] = {tier = 5, is_filter = true, is_stack_inserter = true, type = stack_inserter_type, icon_name = "filter-"..stack_inserter_icon_name},
}

-- Inserter filter icon
local function filter_icon_symbol(tint)
    local icon = {
        {
            icon = reskins.bobs.directory.."/graphics/icons/logistics/inserter/filter.png"
        },
        {
            icon = reskins.bobs.directory.."/graphics/icons/logistics/inserter/filter.png",
            tint = reskins.lib.adjust_alpha(tint, 0.75)
        },
    }

    if reskins.lib.setting("reskins-bobs-do-inserter-filter-symbol") then
        return icon
    end
end

-- Inserter Remnants
local function inserter_remnants(parameters)
    -- Remap long-inserter type to inserter
    local prefix = (parameters.type == "long-inserter") and "inserter" or parameters.type
    if parameters.is_filter then
        prefix = "filter-"..prefix
    end

    local remnant = make_rotated_animation_variations_from_sheet (4, {
        layers = {
            -- Base
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/remnants/"..prefix.."-remnants-base.png",
                line_length = 1,
                width = 67,
                height = 47,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(3, -1.5),
                hr_version =
                {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/remnants/hr-"..prefix.."-remnants-base.png",
                    line_length = 1,
                    width = 134,
                    height = 94,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(3, -1.5),
                    scale = 0.5,
                },
            },
            -- Mask
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/remnants/"..prefix.."-remnants-mask.png",
                line_length = 1,
                width = 67,
                height = 47,
                tint = parameters.tint,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(3, -1.5),
                hr_version =
                {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/remnants/hr-"..prefix.."-remnants-mask.png",
                    line_length = 1,
                    width = 134,
                    height = 94,
                    tint = parameters.tint,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(3, -1.5),
                    scale = 0.5,
                },
            },
            -- Highlights
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/remnants/"..prefix.."-remnants-highlights.png",
                line_length = 1,
                width = 67,
                height = 47,
                blend_mode = reskins.lib.blend_mode, -- "additive",
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(3, -1.5),
                hr_version =
                {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/remnants/hr-"..prefix.."-remnants-highlights.png",
                    line_length = 1,
                    width = 134,
                    height = 94,
                    blend_mode = reskins.lib.blend_mode, -- "additive",
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(3, -1.5),
                    scale = 0.5,
                },
            }
        }
    })
    return remnant
end

-- Inserter Arms
local function inserter_arm_picture(parameters)
    local arm_picture = {
        layers = {
            -- Base
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/inserter-arm-base.png",
                priority = "extra-high",
                width = 16,
                height = 68,
                flags = {"no-crop"},
                scale = 0.5,
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/hr-inserter-arm-base.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    flags = {"no-crop"},
                    scale = 0.25
                }
            },
            -- Mask
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/inserter-arm-mask.png",
                priority = "extra-high",
                width = 16,
                height = 68,
                flags = {"no-crop"},
                tint = parameters.tint,
                scale = 0.5,
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/hr-inserter-arm-mask.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    flags = {"no-crop"},
                    tint = parameters.tint,
                    scale = 0.25
                }
            },
            -- Highlights
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/inserter-arm-highlights.png",
                priority = "extra-high",
                width = 16,
                height = 68,
                flags = {"no-crop"},
                blend_mode = reskins.lib.blend_mode, -- "additive",
                scale = 0.5,
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/hr-inserter-arm-highlights.png",
                    priority = "extra-high",
                    width = 32,
                    height = 136,
                    flags = {"no-crop"},
                    blend_mode = reskins.lib.blend_mode, -- "additive",
                    scale = 0.25
                }
            }
        }
    }

    -- Check to see if we're a filter inserter, and if so, replace the mask/highlights
    if parameters.is_filter then
        arm_picture.layers[2].filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/filter-inserter-arm-mask.png"
        arm_picture.layers[2].hr_version.filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/hr-filter-inserter-arm-mask.png"
        arm_picture.layers[3].filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/filter-inserter-arm-highlights.png"
        arm_picture.layers[3].hr_version.filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/arms/hr-filter-inserter-arm-highlights.png"
    end

    return arm_picture
end

local function inserter_arm_shadow()
    return
    {
        filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/shadows/inserter-arm-shadow.png",
        priority = "extra-high",
        width = 16,
        height = 68,
        flags = {"no-crop"},
        draw_as_shadow = true,
        scale = 0.5,
        hr_version = {
            filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/shadows/hr-inserter-arm-shadow.png",
            priority = "extra-high",
            width = 32,
            height = 136,
            flags = {"no-crop"},
            draw_as_shadow = true,
            scale = 0.25
        }
    }
end

-- Hand open, closed for stack, standard, and long-handed inserters
local function inserter_hand_picture(parameters)
    local hand_picture = {
        layers = {
            -- Base
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/"..parameters.type.."-hand-"..parameters.hand.."-base.png",
                priority = "extra-high",
                width = 65,
                height = 82,
                flags = {"no-crop"},
                scale = 0.5,
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/hr-"..parameters.type.."-hand-"..parameters.hand.."-base.png",
                    priority = "extra-high",
                    width = 130,
                    height = 164,
                    flags = {"no-crop"},
                    scale = 0.25
                }
            },
            -- Mask
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/"..parameters.type.."-hand-"..parameters.hand.."-mask.png",
                priority = "extra-high",
                width = 65,
                height = 82,
                flags = {"no-crop"},
                scale = 0.5,
                tint = parameters.tint,
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/hr-"..parameters.type.."-hand-"..parameters.hand.."-mask.png",
                    priority = "extra-high",
                    width = 130,
                    height = 164,
                    flags = {"no-crop"},
                    tint = parameters.tint,
                    scale = 0.25
                }
            },
            -- Highlights
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/"..parameters.type.."-hand-"..parameters.hand.."-highlights.png",
                priority = "extra-high",
                width = 65,
                height = 82,
                flags = {"no-crop"},
                scale = 0.5,
                blend_mode = reskins.lib.blend_mode, -- "additive",
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/hr-"..parameters.type.."-hand-"..parameters.hand.."-highlights.png",
                    priority = "extra-high",
                    width = 130,
                    height = 164,
                    flags = {"no-crop"},
                    blend_mode = reskins.lib.blend_mode, -- "additive",
                    scale = 0.25
                }
            }
        }
    }

    -- Check to see if we're a filter inserter, and if so, replace the mask/highlights
    if parameters.is_filter then
        hand_picture.layers[2].filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/filter-"..parameters.type.."-hand-mask.png"
        hand_picture.layers[2].hr_version.filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/hr-filter-"..parameters.type.."-hand-mask.png"
        hand_picture.layers[3].filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/filter-"..parameters.type.."-hand-highlights.png"
        hand_picture.layers[3].hr_version.filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/hands/hr-filter-"..parameters.type.."-hand-highlights.png"
    end

    return hand_picture
end

local function inserter_hand_shadow(parameters)
    -- Long-handed inserter types share a shadow with standard inserters
    if parameters.type == "long-inserter" then
        parameters.shadow = "inserter"
    else
        parameters.shadow = parameters.type
    end
    return

    -- Shadow
    {
        filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/shadows/"..parameters.shadow.."-hand-"..parameters.hand.."-shadow.png",
        priority = "extra-high",
        width = 65,
        height = 82,
        flags = {"no-crop"},
        scale = 0.5,
        draw_as_shadow = true,
        hr_version = {
            filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/shadows/hr-"..parameters.shadow.."-hand-"..parameters.hand.."-shadow.png",
            priority = "extra-high",
            width = 130,
            height = 164,
            flags = {"no-crop"},
            draw_as_shadow = true,
            scale = 0.25
        }
    }
end

-- Platform
local function inserter_platform_picture(parameters)
    return
    {
        sheets = {
            -- Base
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-base.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                shift = util.by_pixel(1.75, 6.75),
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-base.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    shift = util.by_pixel(1.75, 6.75),
                    scale = 0.5
                }
            },
            -- Mask
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-mask.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                tint = parameters.tint,
                shift = util.by_pixel(1.75, 6.75),
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-mask.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    tint = parameters.tint,
                    shift = util.by_pixel(1.75, 6.75),
                    scale = 0.5
                }
            },
            -- Highlights
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/platform/inserter-platform-highlights.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                blend_mode = reskins.lib.blend_mode, -- "additive",
                shift = util.by_pixel(1.75, 6.75),
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/platform/hr-inserter-platform-highlights.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    blend_mode = reskins.lib.blend_mode, -- "additive",
                    shift = util.by_pixel(1.75, 6.75),
                    scale = 0.5
                }
            },
            -- Shadow
            {
                filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/shadows/inserter-platform-shadow.png",
                priority = "extra-high",
                width = 53,
                height = 40,
                draw_as_shadow = true,
                shift = util.by_pixel(1.75, 6.75),
                hr_version = {
                    filename = reskins.bobs.directory.."/graphics/entity/logistics/inserter/shadows/hr-inserter-platform-shadow.png",
                    priority = "extra-high",
                    width = 106,
                    height = 80,
                    draw_as_shadow = true,
                    shift = util.by_pixel(1.75, 6.75),
                    scale = 0.5
                }
            }
        }
    }
end

-- Reskin entities, create and assign extra details
for name, map in pairs(inserter_map) do
    -- Create a working copy of the inputs table
    local inputs = util.copy(inputs)

    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Parse map
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index[tier]

    -- Construct input properties from map properties
    inputs.platform_tint = map.is_filter and util.color("bfbfbf") or inputs.tint -- Whiteish for filter inserters
    inputs.base_entity_name = map.is_stack_inserter and "bulk-inserter" or "inserter"
    inputs.icon_name = map.icon_name
    inputs.icon_extras = map.is_filter and filter_icon_symbol(inputs.tint)

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Fetch remnant
    local remnant = data.raw["corpse"][name.."-remnants"]

    -- Reskin remnnant
    remnant.animation = inserter_remnants{type = map.type, tint = inputs.tint, is_filter = map.is_filter}

    -- Common to all inserters
    entity.hand_base_picture = inserter_arm_picture{tint = inputs.tint, is_filter = map.is_filter}
    entity.hand_base_shadow = inserter_arm_shadow()
    entity.platform_picture = inserter_platform_picture{tint = inputs.platform_tint}

    -- Inserter hands
    entity.hand_open_picture = inserter_hand_picture{type = map.type, tint = inputs.tint, hand = "open", is_filter = map.is_filter}
    entity.hand_closed_picture = inserter_hand_picture{type = map.type, tint = inputs.tint, hand = "closed", is_filter = map.is_filter}
    entity.hand_open_shadow = inserter_hand_shadow{type = map.type, hand = "open"}
    entity.hand_closed_shadow = inserter_hand_shadow{type = map.type, hand = "closed"}

    -- Label to skip to next iteration
    ::continue::
end