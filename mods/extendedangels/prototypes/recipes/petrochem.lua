-- Fetch marathon mode settings
local buildingmulti = angelsmods.marathon.buildingmulti
local buildingtime = angelsmods.marathon.buildingtime

angelsmods.functions.RB.build({
    -- Advanced gas refinery 4
    {
        type = "recipe",
        name = "gas-refinery-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"gas-refinery-3", 1},
                {"t6-plate", 10},
                {"t5-circuit", 5},
                {"t6-brick", 10},
                {"t6-pipe", 19},
            },
            result= "gas-refinery-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"gas-refinery-3", 1},
                {"t6-plate", 10 * buildingmulti},
                {"t5-circuit", 5 * buildingmulti},
                {"t6-brick", 10 * buildingmulti},
                {"t6-pipe", 19 * buildingmulti},
            },
            result= "gas-refinery-4",
        },
    },

    -- Advanced chemical plant 3
    {
        type = "recipe",
        name = "advanced-chemical-plant-3",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"advanced-chemical-plant-2", 1},
                {"t5-plate", 2},
                {"t5-circuit", 4},
                {"t6-brick", 4},
                {"t5-pipe", 12},
            },
            result= "advanced-chemical-plant-3",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"advanced-chemical-plant-2", 1},
                {"t5-plate", 2 * buildingmulti},
                {"t5-circuit", 4 * buildingmulti},
                {"t6-brick", 4 * buildingmulti},
                {"t5-pipe", 12 * buildingmulti},
            },
            result= "advanced-chemical-plant-3",
        },
    },

    -- -- Air filter 3
    -- {
    --     type = "recipe",
    --     name = "angels-air-filter-3",
    --     normal = {
    --         energy_required = 5,
    --         enabled = false,
    --         ingredients = {
    --             {"angels-air-filter-2", 1},
    --             {"t3-plate", 4},
    --             {"t3-circuit", 5},
    --             {"t3-brick", 5},
    --             {"t3-pipe", 8},
    --         },
    --         result= "angels-air-filter-3",
    --     },
    --     expensive = {
    --         energy_required = 5 * buildingtime,
    --         enabled = false,
    --         ingredients = {
    --             {"angels-air-filter-2", 1},
    --             {"t3-plate", 4 * buildingmulti},
    --             {"t3-circuit", 5 * buildingmulti},
    --             {"t3-brick", 5 * buildingmulti},
    --             {"t3-pipe", 8 * buildingmulti},
    --         },
    --         result= "angels-air-filter-3",
    --     },
    -- },

    -- Air filter 4
    {
        type = "recipe",
        name = "angels-air-filter-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"angels-air-filter-3", 1},
                {"t4-plate", 4},
                {"t4-circuit", 5},
                {"t4-brick", 5},
                {"t4-pipe", 8},
            },
            result= "angels-air-filter-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"angels-air-filter-3", 1},
                {"t4-plate", 4 * buildingmulti},
                {"t4-circuit", 5 * buildingmulti},
                {"t4-brick", 5 * buildingmulti},
                {"t4-pipe", 8 * buildingmulti},
            },
            result= "angels-air-filter-4",
        },
    },
})

data:extend({
    -- Sodium flouride 1
    {
        type = "recipe",
        name = "solid-sodium-floride-1",
        category = "chemistry",
        subgroup = "petrochem-sodium",
        energy_required = 2,
        enabled = false,
        ingredients = {
            {type = "item", name = "solid-sodium-hydroxide", amount = 5},
            {type = "fluid", name = "liquid-hydrofluoric-acid", amount = 50},
        },
        results = {
            {type = "item", name = "solid-sodium-floride", amount = 5},
            {type = "fluid", name = "water-purified", amount = 50},
        },
        icon = "__extendedangels__/graphics/icons/solid-sodium-floride.png",
        icon_size = 32,
        order = "k",
    },

    -- Sodium flouride 2
    {
        type = "recipe",
        name = "solid-sodium-floride-2",
        category = "chemistry",
        subgroup = "petrochem-sodium",
        energy_required = 2,
        enabled = false,
        ingredients = {
            {type = "item", name = "solid-sodium-carbonate", amount = 5},
            {type = "fluid", name = "liquid-hexafluorosilicic-acid", amount = 25},
        },
        results = {
            {type = "item", name = "solid-sodium-floride", amount = 5},
            {type = "fluid", name = "water-purified", amount = 25},
        },
        icon = "__extendedangels__/graphics/icons/solid-sodium-floride.png",
        icon_size = 32,
        order = "l",
    },

    -- Argon
    {
        type = "recipe",
        name = "gas-argon",
        category = "chemistry",
        subgroup = "petrochem-argon",
        energy_required = 2,
        enabled = false,
        ingredients = {
            {type = "fluid", name = "gas-compressed-air",   amount=100}
        },
        results = {
            {type = "fluid", name = "gas-argon", amount = 50},
        },
        icon = "__extendedangels__/graphics/icons/gas-argon.png",
        icon_size = 32,
        order = "a",
    },
})


if mods["Clowns-Processing"] then
    data:extend({
        -- Disodium phosphate
        {
            type = "recipe",
            name = "solid-disodium-phosphate",
            category = "chemistry",
            subgroup = "petrochem-sodium",
            energy_required = 2,
            enabled = false,
            ingredients = {
                {type = "item", name = "solid-sodium-carbonate", amount = 5},
                {type = "fluid", name = "liquid-phosphoric-acid", amount = 50},
            },
            results = {
                {type = "item", name = "solid-disodium-phosphate", amount = 5},
            },
            icon = "__Clowns-Processing__/graphics/icons/solid-white-phosphorus.png",
            icon_size = 32,
            order = "m",
        },

        -- Tetrasodium pyrophosphate
        {
            type = "recipe",
            name = "solid-tetrasodium-pyrophosphate",
            category = "smelting",
            subgroup = "petrochem-sodium",
            energy_required = 3.5,
            ingredients = {
                {"solid-disodium-phosphate", 1}
            },
            result = "solid-tetrasodium-pyrophosphate",
            order = "n",
        },
    })
end
