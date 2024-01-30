bobmods.lib.tech.replace_science_pack("electricity", "angels-science-pack-red", "angels-science-pack-grey")
bobmods.lib.tech.replace_science_pack("basic-automation", "angels-science-pack-red", "angels-science-pack-grey")
bobmods.lib.tech.replace_science_pack("basic-fluid-handling", "angels-science-pack-red", "angels-science-pack-grey")
bobmods.lib.tech.replace_science_pack("basic-automation", "datacore-processing-1", "datacore-basic")
bobmods.lib.tech.replace_science_pack("basic-fluid-handling", "datacore-logistic-1", "datacore-basic")
bobmods.lib.tech.replace_science_pack("steam-power", "angels-science-pack-red", "angels-science-pack-grey")
bobmods.lib.tech.replace_science_pack("steam-power", "datacore-energy-1", "datacore-basic")
bobmods.lib.tech.add_prerequisite("basic-automation","angels-components-mechanical-1")
angelsmods.functions.OV.global_replace_item("brass-gear-wheel", "brass-alloy")
angelsmods.functions.OV.global_replace_item("steel-gear-wheel", "steel-bearing")
angelsmods.functions.OV.global_replace_item("engine-unit", "motor-2")
angelsmods.functions.OV.global_replace_item("electric-engine-unit", "motor-4")
angelsmods.functions.OV.global_replace_item("battery", "battery-2")
angelsmods.functions.OV.global_replace_item("lab", "angels-basic-lab-2")
angelsmods.functions.OV.global_replace_item("condensator", "circuit-transistor")
angelsmods.functions.OV.global_replace_item("condensator2", "circuit-microchip")
angelsmods.functions.OV.global_replace_item("condensator3", "circuit-transformer")
angelsmods.functions.OV.global_replace_item("titanium-gear-wheel", "mechanical-parts")
angelsmods.functions.OV.global_replace_item("predictive-io", "module-contact")
angelsmods.functions.OV.global_replace_item("intelligent-io", "module-contact")
angelsmods.functions.OV.disable_recipe("condensator")
angelsmods.functions.OV.disable_recipe("condensator2")
angelsmods.functions.OV.disable_recipe("condensator3")
angelsmods.functions.OV.execute()
bobmods.lib.recipe.replace_ingredient("fast-belt", "angels-gear", "steel-bearing")
bobmods.lib.recipe.replace_ingredient("fast-splitter", "angels-gear", "steel-bearing")

--меняем рецепт у прототипа артилерии
bobmods.lib.recipe.clear_ingredients("artillery-turret-prototype")
bobmods.lib.recipe.add_ingredient("artillery-turret-prototype", {"block-construction-2", 10})
bobmods.lib.recipe.add_ingredient("artillery-turret-prototype", {"block-mechanical-1", 5})
bobmods.lib.recipe.add_ingredient("artillery-turret-prototype", {"block-electronics-2", 2})
bobmods.lib.recipe.add_ingredient("artillery-turret-prototype", {"block-warfare-2", 2})
bobmods.lib.recipe.add_ingredient("artillery-turret-prototype", {"concrete-brick", 100})

--меняем рецепт у смешивателей металла
    bobmods.lib.recipe.clear_ingredients("alloy-mixer")
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"alloym-1", 1})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t1-plate", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t0-circuit", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t1-pipe", 4})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t1-gears", 2})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t1-brick", 2})

    bobmods.lib.recipe.clear_ingredients("alloy-mixer-2")
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"alloym-2", 1})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t2-plate", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t2-circuit", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t2-pipe", 4})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t2-gears", 2})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t2-brick", 2})

    bobmods.lib.recipe.clear_ingredients("alloy-mixer-3")
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"alloym-3", 1})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t3-plate", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t3-circuit", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t3-pipe", 4})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t3-gears", 2})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t3-brick", 2})

    bobmods.lib.recipe.clear_ingredients("alloy-mixer-4")
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"alloym-4", 1})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t4-plate", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t4-circuit", 3})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t4-pipe", 4})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t4-gears", 2})
    bobmods.lib.recipe.add_ingredient("alloy-mixer", {"t4-brick", 2})

--доработка атомных снарядов
data.raw.projectile["atomic-bomb-wave"].action[1].action_delivery.target_effects.damage.amount=5000
data.raw.projectile["atomic-bomb-wave"].action[1].action_delivery.target_effects.upper_distance_threshold=100
data.raw["artillery-projectile"]["artillery-projectile-nuclear"].action.action_delivery.target_effects[5].action.radius = 66
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[7].damage.amount = 666666
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[10].radius = 240
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[13].action.radius = 78
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[13].action.repeat_count = 4000
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[14].action.radius = 103
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[14].action.repeat_count = 4000
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[15].action.radius = 132
data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"].action.action_delivery.target_effects[15].action.repeat_count = 4000