local function set_settings_default_value(settings_type, settings_name, settings_default_value)
    if not settings_type or type(settings_type) ~= "string" or not settings_name or type(settings_name) ~= "string" then
        error(
            "settings_type "
            .. tostring(settings_type)
            .. " settings_name "
            .. tostring(settings_name)
            .. " has wrong signature!"
        )
    end
    if
        type(settings_default_value) == "table"
        or type(settings_default_value) == "function"
        or type(settings_default_value) == "thread"
        or type(settings_default_value) == "userdata"
    then
        error("default value must be have only primitive type such as boolean, string, number")
    end
    if not data.raw[settings_type][settings_name] then
        error("mod setting data.raw['" .. settings_type .. "']['" .. settings_name .. "'] not exists!")
    end
    data.raw[settings_type][settings_name].default_value = settings_default_value
    log(
        "setting data.raw['"
        .. settings_type
        .. "']['"
        .. settings_name
        .. "'].default_value to "
        .. tostring(settings_default_value)
    )
end

--helmod - КАЖДЫЙ САМ НАСТРАИВАЕТ ПОД СЕБЯ, если использует. СТАНДАРТНЫХ НАСТРОЕК НЕТ!
--shortcuts - КАЖДЫЙ САМ НАСТРАИВАЕТ ПОД СЕБЯ, если использует. СТАНДАРТНЫХ НАСТРОЕК НЕТ!
--runtime.global влияют на всю карту
-- руины
if mods["AbandonedRuins"] then
    set_settings_default_value("string-setting", "AbandonedRuins-set", "base")
    set_settings_default_value("double-setting", "ruins-large-ruin-chance", 0.0025)
    set_settings_default_value("double-setting", "ruins-medium-ruin-chance", 0.01)
    set_settings_default_value("int-setting", "ruins-min-distance-from-spawn", 400)
    set_settings_default_value("double-setting", "ruins-small-ruin-chance", 0.025)
end
--ритег
if mods["__RITEG__"] then
    set_settings_default_value("int-setting", "__RITEG__autodeconstruct-health-threshold", 15)
end
--биг монстры
if mods["Big-Monsters"] then
    set_settings_default_value("double-setting", "bm-biterzilla-min_evo", 0.4)
    set_settings_default_value("int-setting", "bm-difficulty-level", 5)
    set_settings_default_value("int-setting", "bm-invasion-chance", 0)
    set_settings_default_value("double-setting", "bm-invasion-min_evo", 0.4)
    set_settings_default_value("double-setting", "bm-soldiers-min_evo", 0.2)
    set_settings_default_value("bool-setting", "bm-spawn_near_nests", true)
    set_settings_default_value("int-setting", "bm-spidertron-chance", 20)
    set_settings_default_value("int-setting", "bm-swarm-chance", 20)
    set_settings_default_value("int-setting", "bm-volcano-chance", 0)
    set_settings_default_value("double-setting", "bm-volcano-max_evo", 1)
    set_settings_default_value("int-setting", "bm-worms-chance", 0)
end

-- DeleteChuncks
if mods["DeleteEmptyChunks"] then
    set_settings_default_value("int-setting", "DeleteEmptyChunks_radius", 1)
end
--Factorissimo2
if mods["factorissimo-2-notnotmelon"] or mods["Factorissimo2"] then
    set_settings_default_value("bool-setting", "Factorissimo2-better-recursion-2", false)
end
--even-distribution
if mods["even-distribution"] then
    set_settings_default_value("int-setting", "global-max-inventory-cleanup-range", 100)
end
--ltn-cleanup
if mods["ltn-cleanup"] then
    set_settings_default_value("bool-setting", "ltn-cleanup-failed-trains", true)
    set_settings_default_value("int-setting", "ltn-dispatcher-nth_tick", 6)
    set_settings_default_value("bool-setting", "ltn-interface-message-gps", true)
    set_settings_default_value("string-setting", "ltn-interface-console-level", "0")
    set_settings_default_value("bool-setting", "ltn-interface-message-gps", true)
end
if mods["LTN_Content_Reader"] then
    set_settings_default_value("int-setting", "ltn_content_reader_update_interval", 240)
end
if mods["LtnManager"] then
    set_settings_default_value("int-setting", "ltnm-iterations-per-tick", 2)
end
if mods["LTN_Combinator"] then
    set_settings_default_value("bool-setting", "show-ltn-max-trains", true)
end
if mods["deep-storage-unit"] or mods["fluid-memory-storage"] then
    set_settings_default_value("string-setting", "memory-unit-power-usage", "480kW")
end
if mods["ModuleInserter"] then
    set_settings_default_value("int-setting", "module_inserter_proxies_per_tick", 10)
end
if mods["namelists"] then
    set_settings_default_value("bool-setting", "namelists-backer-stations", true)
end
if mods["NightBrightness"] then
    set_settings_default_value("int-setting", "night_brightness_period_days", 24)
end
if mods["Noxys_Trees"] then
    set_settings_default_value("int-setting", "Noxys_Trees-maximum-trees-per-chunk", 256)
    set_settings_default_value("int-setting", "Noxys_Trees-ticks-between-operations", 61)
end
if mods["OverloadedTrains"] then
    set_settings_default_value("double-setting", "OT_realism", 1)
end
if mods["Picks-Inserter"] then
    set_settings_default_value("int-setting", "PI_clear_max", 1)
    set_settings_default_value("bool-setting", "PI_target_selection", false)
    set_settings_default_value("bool-setting", "PI_target_train_stop", false)
    set_settings_default_value("bool-setting", "PI_temp_unlock", false)
end
if mods["PickerInventoryTools"] then
    set_settings_default_value("bool-setting", "picker-autodeconstruct", true)
    set_settings_default_value("bool-setting", "picker-autodeconstruct-target", true)
    set_settings_default_value(
        "string-setting",
        "picker-carousel-registry",
        "{['medium-electric-pole'] = 'big-electric-pole', ['big-electric-pole'] = 'substation'}"
    )
    set_settings_default_value("bool-setting", "picker-copy-between-surfaces", false)
    set_settings_default_value("bool-setting", "picker-get-out-of-the-way", false)
    set_settings_default_value("bool-setting", "picker-train-honk", false)
end
if mods["QualityOfLife"] then
    set_settings_default_value("double-setting", "qol-logistic-slots-flat-bonus", 0)
    set_settings_default_value("double-setting", "qol-logistic-slots-multiplier", 1)
    set_settings_default_value("double-setting", "qol-toolbelts-flat-bonus", 0)
    set_settings_default_value("double-setting", "qol-toolbelts-multiplier", 1)
end
if mods["railloader"] then
    set_settings_default_value("string-setting", "railloader-allowed-items", "any")
    set_settings_default_value("bool-setting", "railloader-show-configuration-messages", false)
end
if mods["RampantFixed"] then
    set_settings_default_value("int-setting", "rampantFixed--attackWaveMaxSize", 55)
    set_settings_default_value("int-setting", "rampantFixed--maxNumberOfBuilders", 25)
    set_settings_default_value("int-setting", "rampantFixed--maxNumberOfSquads", 20)

    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-bigElectricPole", true)
    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-curvedRail", true)
    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-lamps", true)
    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-railChainSignals", true)
    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-railSignals", true)
    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-straightRail", true)
    set_settings_default_value("bool-setting", "rampantFixed--safeBuildings-trainStops", true)
end
if mods["TimedSpawnControl"] then
    set_settings_default_value("bool-setting", "random-spawn", false)
    set_settings_default_value("int-setting", "respawn-timer", 60)
    set_settings_default_value("bool-setting", "unstuck-button", false)
end
if mods["robot-attrition"] then
    set_settings_default_value("double-setting", "robot-attrition-factor", 0.4)
end
if mods["rso-mod"] then
    set_settings_default_value("double-setting", "rso-infinite-ore-threshold", 0.99)
    set_settings_default_value("bool-setting", "rso-remove-trees", true)
    set_settings_default_value("bool-setting", "rso-use-donuts", true)
end
-- end runtime.global
-- runtime.per_user влияют на каждого игрока в отдельности
if mods["PMRPGsystem"] then
    set_settings_default_value("bool-setting", "charxpmod_hide_xp_panel", true)
end
if mods["LogisticTrainNetwork"] then
    set_settings_default_value("bool-setting", "ltn-interface-factorio-alerts", false)
end
if mods["PickerInventoryTools"] then
    set_settings_default_value("bool-setting", "picker-auto-sort-inventory", false)
    set_settings_default_value("bool-setting", "picker-filter-filters", false)
    set_settings_default_value("bool-setting", "picker-filter-requests", false)
    set_settings_default_value("bool-setting", "picker-use-bar-limit", false)
end
if mods["PickerPipeTools"] then
    set_settings_default_value("bool-setting", "picker-find-orphans", false)
end
if mods["PickerVehicles"] then
    set_settings_default_value("bool-setting", "picker-manual-train-keys", true)
end
if mods["PipeVisualizer"] then
    set_settings_default_value("double-setting", "pv-overlay-opacity", 0.6)
end
if mods["reskins-library"] then
    set_settings_default_value("bool-setting", "reskins-lib-display-notifications", false)
end
-- end runtime.per_user
-- startup влияют на прототипы(сущности, предметы, рецепты, технологии и их связи между собой)
if mods["aai-industry"] then
    set_settings_default_value("int-setting", "aai-burner-turbine-efficiency", 25)
end
if mods["Aircraft"] then
    set_settings_default_value("bool-setting", "aircraft-hardmode", true)
    set_settings_default_value("bool-setting", "inserter-immunity", true)
end
if mods["True-Nukes"] then
    set_settings_default_value("bool-setting", "enable-menu-backgrounds", false)
    set_settings_default_value("bool-setting", "enable-nuclear-tests", false)
end
if mods["angelspetrochem"] then
    set_settings_default_value("bool-setting", "angels-enable-converter", false)
end
if mods["angelsrefining"] then
    set_settings_default_value("bool-setting", "angels-enable-hide-void", true)
    set_settings_default_value("double-setting", "angels-marathon-buildingmulti", 5)
    set_settings_default_value("double-setting", "angels-marathon-buildingtime", 4)
    set_settings_default_value("double-setting", "angels-marathon-intermediatemulti", 2)
    set_settings_default_value("double-setting", "angels-marathon-rawmulti", 2)
end
if mods["angelsinfiniteores"] then
    set_settings_default_value("bool-setting", "angels-enablefluidreq", true)
    set_settings_default_value("int-setting", "angels-infinite-yield", 1)
end
if mods["BatteryElectricTrain"] then
    set_settings_default_value("bool-setting", "bet-cheatsy-wagons", true)
end
if mods["Clowns-Nuclear"] then
    set_settings_default_value("bool-setting", "artillery-shells", true)
end
if mods["BottleneckLite"] then
    set_settings_default_value("bool-setting", "bnl-include-mining-drills", false)
end
if mods["bobassembly"] then
    set_settings_default_value("bool-setting", "bobmods-assembly-centrifuge", false)
    set_settings_default_value("bool-setting", "bobmods-assembly-oilfurnaces", false)
    set_settings_default_value("bool-setting", "bobmods-assembly-chemicalplants", true)
    set_settings_default_value("bool-setting", "bobmods-assembly-distilleries", false)
    set_settings_default_value("bool-setting", "bobmods-assembly-electrolysers", true)
    set_settings_default_value("bool-setting", "bobmods-assembly-electronicmachines", true)
    set_settings_default_value("bool-setting", "bobmods-assembly-furnaces", true)
    set_settings_default_value("bool-setting", "bobmods-assembly-limits", false)
    set_settings_default_value("bool-setting", "bobmods-assembly-multipurposefurnaces", true)
end
if mods["bobenemies"] then
    set_settings_default_value("bool-setting", "bobmods-enemies-superspawner", true)
end
if mods["bobores"] then
    set_settings_default_value("double-setting", "bobmods-gems-amethystratio", 0.2)
    set_settings_default_value("double-setting", "bobmods-gems-diamondratio", 0.1)
    set_settings_default_value("double-setting", "bobmods-gems-emeraldratio", 0.3)
    set_settings_default_value("double-setting", "bobmods-gems-rubyratio", 0.5)
    set_settings_default_value("double-setting", "bobmods-gems-sapphireratio", 0.4)
    set_settings_default_value("double-setting", "bobmods-gems-topazratio", 0.15)
end
if mods["boblogistics"] then
    set_settings_default_value("bool-setting", "bobmods-logistics-beltoverhaulspeed", true)
    set_settings_default_value("int-setting", "bobmods-logistics-beltperlevel", 6)
    set_settings_default_value("double-setting", "bobmods-logistics-beltspeedperlevel", 12.5)
    set_settings_default_value("int-setting", "bobmods-logistics-beltstarting", 4)
    set_settings_default_value("bool-setting", "bobmods-logistics-ugdistanceoverhaul", false)
end
if mods["bobmining"] then
    set_settings_default_value("bool-setting", "bobmods-mining-steamminingdrills", false)
    set_settings_default_value("bool-setting", "bobmods-mining-waterminers", false)
end
if mods["bobmodules"] then
    set_settings_default_value("bool-setting", "bobmods-modules-enablegodmodules", true)
end
if mods["bobplates"] then
    set_settings_default_value("bool-setting", "bobmods-plates-bluedeuterium", true)
    set_settings_default_value("bool-setting", "bobmods-plates-cheapersteel", false)
    set_settings_default_value("int-setting", "bobmods-plates-inventorysize", 60)
end
if mods["bobpower"] then
    set_settings_default_value("bool-setting", "bobmods-power-burnergenerator", false)
    set_settings_default_value("bool-setting", "bobmods-power-fluidgenerator", false)
    set_settings_default_value("bool-setting", "bobmods-power-heatsources", false)
end
if mods["bobrevamp"] then
    set_settings_default_value("bool-setting", "bobmods-revamp-oil", false)
end
if mods["Oberhaul"] then
    set_settings_default_value("bool-setting", "bobs-military-simplify", false)
end
if mods["DeadlockResearchNotifications"] then
    set_settings_default_value("bool-setting", "deadlock-force-research-queue", true)
end
if mods["extended-descriptions"] then
    set_settings_default_value("bool-setting", "ed-inserter-stats", false)
    set_settings_default_value("bool-setting", "ed-solar-ratios", false)
end
if mods["ElectricResistance"] then
    set_settings_default_value("int-setting", "electric-resistance-power-consumption", 2)
end
if mods["FluidMustFlow"] then
    set_settings_default_value("int-setting", "fmf-underground-duct-max-length", 50)
end
if mods["heroturrets"] then
    set_settings_default_value(
        "string-setting",
        "heroturrets-csv-names",
        "Ефрейтор,Капрал,Сержант,Старшина,Лейтенант,Капитан,Майор,Подполковник,Полковник,Генерал,Генералиссимус,Легендарный"
    )
    set_settings_default_value("int-setting", "heroturrets-setting-artillery-turret-kill-multiplier", 20)
    set_settings_default_value("int-setting", "heroturrets-setting-electric-turret-kill-multiplier", 20)
    set_settings_default_value("int-setting", "heroturrets-setting-level-buff-modifier", 100)
    set_settings_default_value("int-setting", "heroturrets-setting-level-up-modifier", 100)
    set_settings_default_value("bool-setting", "heroturrets-use-csv", true)
end
if mods["LightedPolesPlus"] then
    set_settings_default_value(
        "string-setting",
        "lepp_pole_blacklist",
        "bi-power-to-rail-pole,bi-rail-hidden-power-pole,ee-super-electric-pole,ee-super-substation"
    )
end
if mods["toxicPollution"] then
    set_settings_default_value("double-setting", "min-pollution-to-damage", 150)
    set_settings_default_value("int-setting", "armor-absorb-multiplier", 1000)
    set_settings_default_value("bool-setting", "auto-equip-armor", true)
end
if mods["miniloader"] then
    set_settings_default_value("bool-setting", "miniloader-enable-chute", false)
end
if mods["minime_temp"] then
    set_settings_default_value("bool-setting", "minime_character-selector", false)
end
if mods["multi-product-recipe-details"] then
    set_settings_default_value("bool-setting", "mprd-amount-display", true)
    set_settings_default_value("bool-setting", "mprd-vertical-display", true)
end
if mods["Noxys_Trees"] then
    set_settings_default_value("double-setting", "Noxys_Trees-emission_multiplier", 1.5)
end
if mods["P-U-M-P-S"] then
    set_settings_default_value("bool-setting", "osm-pumps-burner-offshore-pump", true)
end
if mods["PCPRedux"] then
    set_settings_default_value("bool-setting", "pcp-glass-sink", false)
end
if mods["PickerTweaks"] then
    set_settings_default_value("double-setting", "picker-belt-sounds", 0.5)
    set_settings_default_value("bool-setting", "picker-clean-tree-burning", true)
    set_settings_default_value("bool-setting", "picker-fireproof-rail-signals", true)
    set_settings_default_value("bool-setting", "picker-fireproof-rolling-stock", true)
    set_settings_default_value("bool-setting", "picker-generic-vehicle-grids", true)
    set_settings_default_value("string-setting", "picker-ghost-tint", "lightblue")
    set_settings_default_value("int-setting", "picker-inventory-size", 60)
    set_settings_default_value("string-setting", "picker-iondicators-arrow", "cyan")
    set_settings_default_value("string-setting", "picker-iondicators-line", "green")
    set_settings_default_value("bool-setting", "picker-no-artillery-reveal", true)
    set_settings_default_value("double-setting", "picker-reacher-build-distance", 6)
    set_settings_default_value("double-setting", "picker-reacher-drop-item-distance", 6)
    set_settings_default_value("double-setting", "picker-reacher-reach-distance", 6)
    set_settings_default_value("bool-setting", "picker-roundup-resources", true)
    set_settings_default_value("bool-setting", "picker-show-bots-on-map", true)
end
if mods["PickerVehicles"] then
    set_settings_default_value("bool-setting", "picker-naked-rails", false)
    set_settings_default_value("bool-setting", "picker-unstoppable-trains", true)
end
if mods["SchallPickupTower"] then
    set_settings_default_value("int-setting", "pickuptower-tier-max", 4)
end
if mods["railloader"] then
    set_settings_default_value("int-setting", "railloader-capacity", 320)
end
if mods["RampantFixed"] then
    set_settings_default_value("bool-setting", "rampantFixed--allowLongRangeImmunity", false)
    set_settings_default_value("bool-setting", "rampantFixed--allowOneshotProtection", false)
    set_settings_default_value("bool-setting", "rampantFixed--removeBloodParticles", true)
    set_settings_default_value("int-setting", "rampantFixed--tierEnd", 10)
    set_settings_default_value("int-setting", "rampantFixed--unitAndSpawnerFadeTime", 20)
end
if mods["research_evolution_factor"] then
    set_settings_default_value("bool-setting", "research-evolution-factor-ignore-inf", true)
    set_settings_default_value("bool-setting", "research-evolution-factor-ignore-qol", true)
end
if mods["reskins-angels"] then
    set_settings_default_value("bool-setting", "reskins-angels-use-angels-material-colors-pipes", false)
    set_settings_default_value("bool-setting", "reskins-angels-use-vanilla-chemical-plant-sprites", true)
end
if mods["reskins-bobs"] then
    set_settings_default_value("bool-setting", "reskins-bobs-flip-bulk-inserter-icons", true)
end
if mods["reskins-library"] then
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-0", "402000")
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-1", "de9400")
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-2", "c20600")
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-3", "1b87c2")
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-4", "a600bf")
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-5", "23de55")
    set_settings_default_value("string-setting", "reskins-lib-custom-colors-tier-6", "4d4cff")
    set_settings_default_value("string-setting", "reskins-lib-tier-mapping", "traditional-map")
end
if mods["ReStack"] then
    set_settings_default_value("int-setting", "ReStack-ammo-bullet", 200)
    set_settings_default_value("int-setting", "ReStack-ammo-cannon", 200)
    set_settings_default_value("int-setting", "ReStack-ammo-flamethrower", 100)
    set_settings_default_value("int-setting", "ReStack-ammo-rocket", 200)
    set_settings_default_value("int-setting", "ReStack-ammo-shotgun", 200)
    set_settings_default_value("int-setting", "ReStack-belt", 100)
    set_settings_default_value("int-setting", "ReStack-combinator", 50)
    set_settings_default_value("int-setting", "ReStack-electric-pole", 50)
    set_settings_default_value("int-setting", "Rebulk-inserter", 50)
    set_settings_default_value("int-setting", "ReStack-nuclear-fuel", 10)
    set_settings_default_value("int-setting", "ReStack-ores", 200)
    set_settings_default_value("int-setting", "ReStack-pipe", 100)
    set_settings_default_value("int-setting", "ReStack-plates", 400)
    set_settings_default_value("int-setting", "ReStack-roboport", 20)
    set_settings_default_value("int-setting", "ReStack-rocket-parts", 10)
    set_settings_default_value("int-setting", "ReStack-science-pack", 200)
    set_settings_default_value("int-setting", "ReStack-solid-fuel", 100)
    set_settings_default_value("int-setting", "ReStack-uranium", 100)
    set_settings_default_value("int-setting", "ReStack-wire", 400)
    set_settings_default_value("int-setting", "ReStack-wood", 200)
end
if mods["Rocket-Silo-Construction"] then
    set_settings_default_value("bool-setting", "rsc-st-not-removable-silo", true)
    set_settings_default_value("bool-setting", "rsc-st-not-removable-site", true)
end
if mods["Oberhaul"] then
    set_settings_default_value("bool-setting", "simple-cordite", false)
end
if mods["SpaceMod"] then
    set_settings_default_value("string-setting", "SpaceX-launch-profile", "Launch Meglo-mania(x25)")
end
if mods["SchallTankPlatoon"] then
    set_settings_default_value("bool-setting", "tankplatoon-ht-RA-enable", false)
    set_settings_default_value(
        "string-setting",
        "tankplatoon-personal-laser-defense-equipment-energy-consumption",
        "800kJ"
    )
end
if mods["Warehousing"] then
    set_settings_default_value("bool-setting", "Warehousing-sixteen-mode", true)
end
if mods["WideChests"] then
    set_settings_default_value("int-setting", "WideChests_inventory-size-limit", 220)
    set_settings_default_value("double-setting", "WideChests_inventory-size-multiplier", 0.3)
    set_settings_default_value("int-setting", "WideChests_max-chest-height", 6)
    set_settings_default_value("int-setting", "WideChests_max-chest-width", 6)
end

if mods["UnrealisticReactors"] then
    if mods["bobpower"] then
        set_settings_default_value("bool-setting", "realistic-reactors-disable-vanilla-reactor", false)
    end
end
if mods["bobmodules"]then
    set_settings_default_value("bool-setting","bobmods-modules-enableproductivitylimitation",false)
end
-- end startup

