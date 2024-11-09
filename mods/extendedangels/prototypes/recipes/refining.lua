-- Fetch marathon mode settings
local buildingmulti = angelsmods.marathon.buildingmulti
local buildingtime = angelsmods.marathon.buildingtime

angelsmods.functions.RB.build({
    -- Hydro plant 4
	{
        type = "recipe",
        name = "hydro-plant-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"hydro-plant-3", 1},
                {"t5-plate", 4},
                {"t5-circuit", 12},
                {"t5-pipe", 16},
                {"t6-brick", 12},
            },
            result =  "hydro-plant-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"hydro-plant-3", 1},
                {"t5-plate", 4 * buildingmulti},
                {"t5-circuit", 12 * buildingmulti},
                {"t5-pipe", 16 * buildingmulti},
                {"t6-brick", 12 * buildingmulti},
            },
            result =  "hydro-plant-4",
        },
    },

    -- Salination plant 3
	{
        type = "recipe",
        name = "salination-plant-3",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"salination-plant-2", 1},
                {"t5-plate", 14},
                {"t5-circuit", 12},
                {"t5-pipe", 8},
                {"t6-brick", 15},
            },
            result =  "salination-plant-3",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"salination-plant-2", 1},
                {"t5-plate", 14 * buildingmulti},
                {"t5-circuit", 12 * buildingmulti},
                {"t5-pipe", 8 * buildingmulti},
                {"t6-brick", 15 * buildingmulti},
            },
            result =  "salination-plant-3",
        },
    },

    -- Washing plant 3
    {
        type = "recipe",
        name = "washing-plant-3",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"washing-plant-2", 1},
                {"t3-plate", 4},
                {"t3-circuit", 4},
                {"t3-pipe", 9},
                {"t3-brick", 5},
            },
            result = "washing-plant-3",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"washing-plant-2", 1},
                {"t3-plate", 4 * buildingmulti},
                {"t3-circuit", 4 * buildingmulti},
                {"t3-pipe", 9 * buildingmulti},
                {"t3-brick", 5 * buildingmulti},
            },
            result = "washing-plant-3",
        },
    },

    -- Washing plant 4
	{
        type = "recipe",
        name = "washing-plant-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"washing-plant-3", 1},
                {"t4-plate", 4},
                {"t4-circuit", 4},
                {"t4-pipe", 9},
                {"t4-brick", 5},
            },
            result = "washing-plant-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"washing-plant-2", 1},
                {"t4-plate", 4 * buildingmulti},
                {"t4-circuit", 4 * buildingmulti},
                {"t4-pipe", 9 * buildingmulti},
                {"t4-brick", 5 * buildingmulti},
            },
            result = "washing-plant-4",
        },
    },

-- Ore crusher 4
    {
        type = "recipe",
        name = "ore-crusher-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"ore-crusher-3", 1},
                {"t4-plate", 3},
                {"t4-brick", 3},
                {"t4-gears", 2},
            },
            result =  "ore-crusher-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"ore-crusher-3", 1},
                {"t4-plate", 3 * buildingmulti},
                {"t4-brick", 3 * buildingmulti},
                {"t4-gears", 2 * buildingmulti},
            },
            result =  "ore-crusher-4",
        },
        subgroup = "ore-crusher",
    },

    -- Ore floatation cell 4
    {
        type = "recipe",
        name = "ore-floatation-cell-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"ore-floatation-cell-3", 1},
                {"t5-plate", 4},
                {"t5-circuit", 8},
                {"t5-pipe", 4},
                {"t6-brick", 8},
            },
            result =  "ore-floatation-cell-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"ore-floatation-cell-3", 1},
                {"t5-plate", 4 * buildingmulti},
                {"t5-circuit", 8 * buildingmulti},
                {"t5-pipe", 4 * buildingmulti},
                {"t6-brick", 8 * buildingmulti},
            },
            result =  "ore-floatation-cell-4",
        },
        subgroup = "ore-floatation",
    },

    -- Ore leaching plant 4
    {
        type = "recipe",
        name = "ore-leaching-plant-4",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"ore-leaching-plant-3", 1},
                {"t6-plate", 4},
                {"t5-circuit", 8},
                {"t6-pipe", 4},
                {"t6-brick", 8},
            },
            result =  "ore-leaching-plant-4",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"ore-leaching-plant-3", 1},
                {"t6-plate", 4 * buildingmulti},
                {"t5-circuit", 8 * buildingmulti},
                {"t6-pipe", 4 * buildingmulti},
                {"t6-brick", 8 * buildingmulti},
            },
            result =  "ore-leaching-plant-4",
        },
        subgroup = "ore-leaching",
    },


    -- Ore refinery 3
    {
        type = "recipe",
        name = "ore-refinery-3",
        normal = {
            energy_required = 5,
            enabled = false,
            ingredients = {
                {"ore-refinery-2", 1},
                {"t6-plate", 12},
                {"t5-circuit", 12},
                {"t6-brick", 20},
            },
            result =  "ore-refinery-3",
        },
        expensive = {
            energy_required = 5 * buildingtime,
            enabled = false,
            ingredients = {
                {"ore-refinery-2", 1},
                {"t6-plate", 12 * buildingmulti},
                {"t5-circuit", 12 * buildingmulti},
                {"t6-brick", 20 * buildingmulti},
            },
            result =  "ore-refinery-3",
        },
        subgroup = "ore-refining",
    },

    -- -- Crystallizer 3
    -- {
    --     type = "recipe",
    --     name = "crystallizer-3",
    --     normal = {
    --     energy_required = 5,
    --     enabled = false,
    --     ingredients = {
    --         {"crystallizer-2", 1},
    --         {"t5-plate", 10},
    --         {"t5-circuit", 5},
    --         {"t5-pipe", 5},
    --         {"t6-brick", 10},
    --     },
    --     result = "crystallizer-3",
    --     },
    --     expensive = {
    --     energy_required = 5 * buildingtime,
    --     enabled = false,
    --     ingredients = {
    --         {"crystallizer-2", 1},
    --         {"t5-plate", 10 * buildingmulti},
    --         {"t5-circuit", 5 * buildingmulti},
    --         {"t5-pipe", 5 * buildingmulti},
    --         {"t6-brick", 10 * buildingmulti},
    --     },
    --     result = "crystallizer-3",
    --     },
    -- },

    -- -- Filtration unit 3
    -- {
    --     type = "recipe",
    --     name = "filtration-unit-3",
    --     normal = {
    --         energy_required = 5,
    --         enabled = false,
    --         ingredients = {
    --             {"filtration-unit-2", 1},
    --             {"t5-plate", 2},
    --             {"t5-circuit", 5},
    --             {"t5-pipe", 8},
    --             {"t6-brick", 5},
    --         },
    --         result = "filtration-unit-3",
    --     },
    --     expensive = {
    --         energy_required = 5 * buildingtime,
    --         enabled = false,
    --         ingredients = {
    --             {"filtration-unit-2", 1},
    --             {"t5-plate", 2 * buildingmulti},
    --             {"t5-circuit", 5 * buildingmulti},
    --             {"t5-pipe", 8 * buildingmulti},
    --             {"t6-brick", 5 * buildingmulti},
    --         },
    --         result = "filtration-unit-3",
    --     },
    -- },
})

-- Order fixes
