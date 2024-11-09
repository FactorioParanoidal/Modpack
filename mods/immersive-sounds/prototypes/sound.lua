local sounds = require("prototypes.soundslib")

	-- COMBAT ROBOTS
	
data.raw["combat-robot"]["defender"].attack_parameters.sound = defender_shot_sound


	-- CAPSULES
	
data.raw["smoke-with-trigger"]["poison-cloud"].created_effect[1].action_delivery.target_effects[2].sound.variations = poison_smoke_sound
data.raw.capsule.grenade.capsule_action.attack_parameters.ammo_type.action[2].action_delivery.target_effects[1].sound = throwing_sound

	-- FIRE

data.raw["fire"]["crash-site-fire-flame"].working_sound = fire_flame_sound
data.raw["fire"]["fire-flame"].working_sound = fire_flame_sound
data.raw["fire"]["fire-flame-on-tree"].working_sound = fire_flame_sound
	
	-- MACHINES
	
data.raw["reactor"]["nuclear-reactor"].working_sound.sound = nuclear_reactor_sound
	
	
	-- TRAIN
	
data.raw.locomotive.locomotive.close_sound = train_door_close_sound
data.raw.locomotive.locomotive.open_sound = train_door_open_sound

data.raw.locomotive.locomotive.drive_over_tie = train_drive_tie_sound
data.raw.locomotive.locomotive.working_sound = train_engine_working_sound

data.raw.locomotive.locomotive.stop_trigger[3] = { type = "play-sound", sound = train_brakes_sound }
data.raw.locomotive.locomotive.stop_trigger[4] = { type = "play-sound", sound = train_brakes_screech_sound }

data.raw["cargo-wagon"]["cargo-wagon"].drive_over_tie = train_drive_tie_sound
data.raw["cargo-wagon"]["cargo-wagon"].working_sound = train_wagon_working_sound


	-- RAILS

data.raw["legacy-curved-rail"]["legacy-curved-rail"].walking_sound = rail_walk_over_sound
data.raw["legacy-straight-rail"]["legacy-straight-rail"].walking_sound = rail_walk_over_sound

	-- UI
	
data.raw["utility-sounds"]["default"].switch_gun = switch_gun_sound

data.raw["armor"]["modular-armor"].open_sound = armor_open_sound
data.raw["armor"]["power-armor"].open_sound = armor_open_sound
data.raw["armor"]["power-armor-mk2"].open_sound = armor_open_sound

data.raw["armor"]["modular-armor"].close_sound = armor_close_sound
data.raw["armor"]["power-armor"].close_sound = armor_close_sound
data.raw["armor"]["power-armor-mk2"].close_sound = armor_close_sound


	-- HOSTILES
	
data.raw["unit"]["small-biter"].attack_parameters.sound = biter_roar_sound
data.raw["unit"]["small-biter"].dying_sound = biter_die_sound

data.raw["unit"]["big-biter"].attack_parameters.sound = biter_big_roar_sound
data.raw["unit"]["big-biter"].dying_sound = biter_big_die_sound
data.raw["unit"]["big-biter"].walking_sound.variations = biter_big_walking_sound

data.raw["unit"]["behemoth-biter"].walking_sound.variations = biter_big_walking_sound

data.raw["unit"]["medium-biter"].attack_parameters.sound = biter_mid_roar_sound
data.raw["unit"]["medium-biter"].dying_sound = biter_die_sound

data.raw["unit"]["small-spitter"].dying_sound = spitter_die_sound

data.raw["unit-spawner"]["biter-spawner"].dying_sound = spawner_die_sound
data.raw["unit-spawner"]["biter-spawner"].working_sound.sound = spawner_live_sound

data.raw["unit-spawner"]["spitter-spawner"].dying_sound = spawner_die_sound
data.raw["unit-spawner"]["spitter-spawner"].working_sound.sound = spawner_spitter_live_sound

	-- TREE

data.raw["tree"]["dead-dry-hairy-tree"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["dead-grey-trunk"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["dead-tree-desert"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["dry-hairy-tree"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["dry-tree"].vehicle_impact_sound = car_impact_wood_sound

data.raw["tree"]["tree-01"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-02"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-02-red"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-03"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-04"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-05"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-06"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-06-brown"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-07"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-08"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-08-brown"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-08-red"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-09"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-09-brown"].vehicle_impact_sound = car_impact_wood_sound
data.raw["tree"]["tree-09-red"].vehicle_impact_sound = car_impact_wood_sound

	
	-- ROCK

data.raw.cliff.cliff.vehicle_impact_sound = car_impact_stone_sound

data.raw["simple-entity"]["big-rock"].vehicle_impact_sound = car_impact_stone_sound
data.raw["simple-entity"]["huge-rock"].vehicle_impact_sound = car_impact_stone_sound
data.raw["simple-entity"]["big-sand-rock"].vehicle_impact_sound = car_impact_stone_sound


	-- PICKAXE STUFF	

data.raw["utility-sounds"]["default"].axe_mining_ore.variations = pickaxe_mining_ore_sound


	-- GUNS

data.raw["gun"]["submachine-gun"].attack_parameters.sound = smg_sound
data.raw["gun"]["pistol"].attack_parameters.sound = pistol_sound
data.raw["gun"]["vehicle-machine-gun"].attack_parameters.sound = car_mg_sound

data.raw.gun.flamethrower.attack_parameters.cyclic_sound = flamethrower_cyclic_sound
data.raw.gun.shotgun.attack_parameters.sound = pump_shotgun_sound

data.raw["gun"]["combat-shotgun"].attack_parameters.sound = auto_shotgun_sound

data.raw["gun"]["rocket-launcher"].attack_parameters.sound = rpg_shot_sound

	-- GATLING TURRET
	
data.raw["ammo-turret"]["gun-turret"].attack_parameters.sound = gun_turret_sound
data.raw["ammo-turret"]["gun-turret"].preparing_sound = gun_turret_activate_sound
data.raw["ammo-turret"]["gun-turret"].folding_sound = gun_turret_deactivate_sound


	-- LASER TURRET 
	
data.raw["beam"]["laser-beam"].working_sound.sound = laser_beam_sound
data.raw["electric-turret"]["laser-turret"].preparing_sound = laser_turret_activate_sound
data.raw["electric-turret"]["laser-turret"].folding_sound = laser_turret_deactivate_sound


	-- ARTILLERY TURRET

data.raw["artillery-turret"]["artillery-turret"].rotating_sound.sound = arty_turret_rotate_sound
data.raw["artillery-turret"]["artillery-turret"].rotating_stopped_sound = arty_turret_stop_rotate_sound
data.raw["gun"]["artillery-wagon-cannon"].attack_parameters.sound = arty_turret_shot_sound


	-- TANK ENGINE
	
data.raw.car.tank.sound_minimum_speed = 0.1
data.raw.car.tank.sound_scaling_ratio = 0.1
data.raw.car.tank.stop_trigger_speed = 0.2

data.raw.car.tank.sound_no_fuel = tank_engine_no_fuel_sound
data.raw.car.tank.stop_trigger = tank_brake_sound
data.raw.car.tank.working_sound = tank_engine_working_sound
data.raw.car.tank.open_sound = tank_door_open_sound
data.raw.car.tank.close_sound = tank_door_close_sound


	-- TANK GUNS

data.raw["gun"]["tank-cannon"].attack_parameters.sound = tank_cannon_sound
data.raw["gun"]["tank-machine-gun"].attack_parameters.sound = tank_mg_sound


	-- CAR ENGINE

data.raw.car.car.stop_trigger_speed = 0.15
data.raw.car.car.sound_minimum_speed = 0.25
data.raw.car.car.sound_scaling_ratio = 0.8

data.raw.car.car.sound_no_fuel = car_engine_no_fuel_sound
data.raw.car.car.stop_trigger = car_brake_sound
data.raw.car.car.working_sound = car_engine_working_sound
data.raw.car.car.open_sound = car_door_open_sound
data.raw.car.car.close_sound = car_door_close_sound


	-- NUKE 

data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects[4] = { type = "play-sound", sound = nuke_explosion_sound, play_on_target_position = false, max_distance = 1000, audible_distance_modifier = 3 }
data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects[5] = { type = "play-sound", sound = nuke_aftershock_sound, play_on_target_position = false, max_distance = 1000, audible_distance_modifier = 3 }


	-- EXPLOSIONS (There is a lot, one per entity >.< !)

data.raw["explosion"]["accumulator-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["active-provider-chest-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["arithmetic-combinator-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["artillery-turret-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["artillery-wagon-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["assembling-machine-1-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["assembling-machine-2-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["assembling-machine-3-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["beacon-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["big-artillery-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["big-electric-pole-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["big-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["boiler-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["buffer-chest-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["burner-inserter-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["burner-mining-drill-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["car-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["cargo-wagon-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["centrifuge-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["chemical-plant-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["constant-combinator-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["construction-robot-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["decider-combinator-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["electric-furnace-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["electric-mining-drill-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["express-splitter-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["express-transport-belt-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["express-underground-belt-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["fast-inserter-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["fast-splitter-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["fast-transport-belt-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["fast-underground-belt-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["flamethrower-turret-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["fluid-wagon-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["gate-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["grenade-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["ground-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["gun-turret-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["heat-exchanger-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["heat-pipe-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["inserter-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["iron-chest-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["lab-explosion"].sound.variations = medium_explosion_sound
data.raw["explosion"]["lamp-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["land-mine-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["laser-turret-explosion"].sound.variations = small_explosion_sound
data.raw["explosion"]["locomotive-explosion"].sound.variations = large_explosion_sound
data.raw["explosion"]["logistic-robot-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["long-handed-inserter-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["massive-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["medium-electric-pole-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["medium-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["nuclear-reactor-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["nuke-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["offshore-pump-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["oil-refinery-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["passive-provider-chest-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["pipe-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["pipe-to-ground-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["power-switch-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["programmable-speaker-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["pump-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["pumpjack-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["radar-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["rail-chain-signal-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["rail-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["rail-signal-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["requester-chest-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["roboport-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["rocket-silo-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["slowdown-capsule-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["solar-panel-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["spidertron-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["splitter-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["bulk-inserter-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["steam-engine-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["steam-turbine-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["steel-chest-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["steel-furnace-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["stone-furnace-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["storage-chest-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["storage-tank-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["substation-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["tank-explosion"].sound.variations =  large_explosion_sound
data.raw["explosion"]["train-stop-explosion"].sound.variations =  medium_explosion_sound
data.raw["explosion"]["transport-belt-explosion"].sound.variations =  small_explosion_sound
data.raw["explosion"]["underground-belt-explosion"].sound.variations =  small_explosion_sound



	
