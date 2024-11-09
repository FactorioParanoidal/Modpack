---------
--
--
--  bosses v 3.0 (18/10/24) - made on lib

-----------

local sounds = require("__base__/prototypes/entity/sounds")
require("__base__/prototypes/entity/spawner-animation")

local resistances = require("__mferrari_lib__/prototypes/resistances")
require ("__mferrari_lib__/prototypes/bosses_projectiles")
require ("__mferrari_lib__/prototypes/unit_functions")
require ("__mferrari_lib__/prototypes/loot")
require ("__mferrari_lib__/proto")


-- The mod calling this may have globals
local boss_hp_multiplier  = mf_hp_multiplier or 1
local boss_hp_variant     = mf_hp_variant or 1
local boss_dmg_multiplier = mf_dmg_multiplier or 1

local Loot = get_mf_Loot() 

local spawner_boss_scale = 3.4
local boss_spawner_tint = {0.92, 0.54, 0, 0.5}
--smoke_boss_tint??

local boss_spawn_all_units = {
      {"small-biter", {{0.0, 0.3}, {0.25, 0.3}, {0.35, 0.0}}},
      {"small-spitter", {{0.25, 0.3}, {0.5, 0.3}, {0.7, 0.0}}},
	    {"medium-biter", 		 {{0.30, 0.0}, {0.50, 0.3}, {0.60, 0.0}}},
      {"medium-spitter", {{0.4, 0.0}, {0.5, 0.3}, {0.6, 0.0}}},
      {"big-spitter", {{0.59, 0.0}, {0.6, 0.4}, {0.7, 0.0}}},
	    {"big-biter",	{{0.59, 0.0}, {0.6, 0.3}, {0.7, 0.0}}},
	    {"behemoth-biter", {{0.69, 0.0}, {0.9, 0.4}}},
	    {"behemoth-spitter", {{0.69, 0.0}, {0.9, 0.4}}}
	  }




local big_spawner = table.deepcopy(data.raw["unit-spawner"]["biter-spawner"])
big_spawner.name = "maf-big-spawner"
big_spawner.icons = {{icon = "__base__/graphics/icons/biter-spawner.png",icon_size = 64, tint = smoke_boss_tint}}
big_spawner.max_health = 200000 *boss_hp_multiplier
big_spawner.working_sound.apparent_volume=2
big_spawner.dying_sound=
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 2.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 2.0
      }
    }
big_spawner.resistances = resistances.boss_fire_only
big_spawner.healing_per_tick = 0.02
big_spawner.absorptions_per_second = { pollution = { absolute = 15, proportional = 0.005 } } -- v20/0.01
big_spawner.pollution_to_enhance_spawning = 200
big_spawner.corpse = "maf-big-spawner-corpse"
big_spawner.dying_explosion = "blood-explosion-huge"
big_spawner.loot = Loot
big_spawner.max_count_of_owned_units = 500
big_spawner.max_friends_around_to_spawn = 300
big_spawner.collision_box = scale_box(big_spawner.collision_box, spawner_boss_scale)
big_spawner.selection_box = scale_box(big_spawner.selection_box, spawner_boss_scale)
big_spawner.map_generator_bounding_box = scale_box(big_spawner.map_generator_bounding_box, spawner_boss_scale)
big_spawner.result_units = boss_spawn_all_units
big_spawner.spawning_cooldown = {50, 15}
big_spawner.spawning_radius = 30
big_spawner.spawning_spacing = 3
big_spawner.max_spawn_shift = 0
big_spawner.max_richness_for_spawn_shift = 100
big_spawner.autoplace = nil
big_spawner.call_for_help_radius = 250
big_spawner.time_to_capture = nil
--hack_scale(big_spawner, spawner_boss_scale+1.5)
big_spawner.graphics_set =
{
  animations =
  {
    spawner_idle_animation(0, boss_spawner_tint),
    spawner_idle_animation(1, boss_spawner_tint),
    spawner_idle_animation(2, boss_spawner_tint),
    spawner_idle_animation(3, boss_spawner_tint)
  }
}
hack_scale(big_spawner.graphics_set, spawner_boss_scale+1.5)

local boss_corpse=
  {
    type = "corpse",
    name = "maf-big-spawner-corpse",
      hidden_in_factoriopedia = true,
      flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
      icon = "__base__/graphics/icons/biter-spawner-corpse.png",
      collision_box = big_spawner.collision_box,
      selection_box = big_spawner.collision_box,
      selectable_in_game = false,
      dying_speed = 0.005,
      time_before_removed = 15 * 60 * 60,
      subgroup="corpses",
      order = "c[corpse]-c[biter-spawner]",
      animation =
      {
        spawner_die_animation(0, boss_spawner_tint),
        spawner_die_animation(1, boss_spawner_tint),
        spawner_die_animation(2, boss_spawner_tint),
        spawner_die_animation(3, boss_spawner_tint)
      },
      decay_animation =
      {
        spawner_decay_animation(0, boss_spawner_tint),
        spawner_decay_animation(1, boss_spawner_tint),
        spawner_decay_animation(2, boss_spawner_tint),
        spawner_decay_animation(3, boss_spawner_tint)
      },
      decay_frame_transition_duration = 6 * 60,
      final_render_layer = "lower-object-above-shadow" -- this is essentially ignored when 'use_decay_layer' is true
    }

hack_scale(boss_corpse, spawner_boss_scale+1.5)
data:extend({big_spawner, boss_corpse})



--- new spawner for BIG BOSSES 
local bigspawner = table.deepcopy(data.raw["unit-spawner"]["maf-big-spawner"]) 
bigspawner.name="maf-big-boss-spawner"
big_spawner.max_friends_around_to_spawn = 2
big_spawner.spawning_cooldown = {4000, 2000} -- 60 segundos com evo min , ou 25 no max 
big_spawner.max_spawn_shift=0
big_spawner.spawning_radius = 40
big_spawner.spawning_spacing = 7
big_spawner.absorptions_per_second = { pollution = { absolute = 100, proportional = 0.005 } }
big_spawner.pollution_to_enhance_spawning = 1000
bigspawner.result_units = {} 
for k=1,10 do 
	table.insert (bigspawner.result_units, {'maf-boss-biter-'..k, {{k/10 - 0.05, 0.0}, {k/10, 0.05}}})
	table.insert (bigspawner.result_units, {'maf-boss-acid-spitter-'..k, {{k/10 - 0.05, 0.0}, {k/10, 0.05}}})
	if mods['ArmouredBiters'] then 
		table.insert (bigspawner.result_units, {'maf-boss-armoured-biter-'..k, {{k/10 - 0.05, 0.0}, {k/10, 0.05}}})
		end
	end
data:extend({bigspawner})





 
local function make_biter_area_damage(level,radius)
return  {
					type = "area",
					radius = radius,
					force = "enemy",
					ignore_collision_condition = true,
					action_delivery =
					{
					  type = "instant",
					  target_effects =
					  {
						{
						  type = "damage",
						  damage = {amount = (30+level*5), type = "physical"}
						},
						{
						type = "create-particle",
						repeat_count = 5,
						particle_name = "explosion-remnants-particle",
						initial_height = 0.5,
						speed_from_center = 0.08,
						speed_from_center_deviation = 0.15,
						initial_vertical_speed = 0.08,
						initial_vertical_speed_deviation = 0.15,
						offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
						},
					  }
					}
                   }
end





function make_bosses(k)
local scale = 1.5 + k/3

local bzilla_blue = {r=0 +k/20, g=k/30, b=1, a=0.9}
local bzilla_blue2 = {r=0.2+k/20, g=0.1+k/30, b=0.6, a=0.8}
local szilla_green = {r=0+k/20, g=1 -k/20, b=0+k/30, a=1}
local szilla_green2 = {r=0.4+k/30, g=0.8 -k/30, b=0.2, a=0.75}



data:extend(
{
		{ -- BLUE BITTER BOSS 
			type = "unit",
			order="b-b-d",
			name='maf-boss-biter-'..k,
			localised_name = {"",{"entity-name.maf-boss-biter"}," ",tostring(k)},
			icon = "__base__/graphics/icons/behemoth-biter.png",
		  icon_size = 64, 
			flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
			max_health =  (40000 * k^boss_hp_variant) * boss_hp_multiplier/boss_hp_variant,  --40000 * k * boss_hp_multiplier,
			subgroup="enemies",
			resistances = {},
			call_for_help_radius = 100+k*5,
			spawning_time_modifier = 8,
			healing_per_tick = 0.1 + k/100,
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
			distraction_cooldown = 100, -- 300,
		    loot = Loot,
			has_belt_immunity = true,
			attack_parameters =
			{
				type = "projectile",
				range = 1.5 + k/2,
				cooldown = 45-k,
				ammo_category = "melee",
				sound =  sounds.biter_roars(2),
				animation = biterattackanimation(scale, bzilla_blue, bzilla_blue2),
				ammo_type = {
							  category = "melee",
							  target_type = "entity",
								action = {
								  {
								  action_delivery = {
									target_effects = {
									  damage = {
										amount = (100+k*40)*boss_dmg_multiplier,
										type = "physical"
									  },
									  type = "damage",
									  show_in_tooltip = true
									},
									type = "instant"
								  },
								  type = "direct"
								  },
								  make_biter_area_damage(k,k+1),
								  },
							}
			},
			vision_distance = 50+k, -- 30
			movement_speed = 0.06 + k/100,
			distance_per_frame = 0.3,
			-- in pu
			absorptions_to_join_attack = { pollution = 1 }, -- 20000
			corpse = "maf-boss-bitter-corpse-"..k,
			dying_explosion = "blood-explosion-big",
			working_sound = sounds.biter_calls_big(1.4),
			dying_sound = sounds.biter_dying_big(1),
			walking_sound = sounds.biter_walk_big(1.2),
			running_sound_animation_positions = {2,},
			damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
			water_reflection = biter_water_reflection(scale),	
			run_animation = biterrunanimation(scale, bzilla_blue, bzilla_blue2),
			hide_resistances = false,
			ai_settings = {destroy_when_commands_fail = false},
		},
		
  add_biter_die_animation(scale, bzilla_blue, bzilla_blue2,
  {
    type = "corpse",
    name = "maf-boss-bitter-corpse-"..k,
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, 
    selection_box = {{-3, -3}, {3, 3}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
  }),


-- SPITTERS
  {
    type = "unit",
    name = "maf-boss-acid-spitter-"..k,
	  localised_name = {"",{"entity-name.maf-boss-spitter"}," ",tostring(k)},
    icon = "__base__/graphics/icons/behemoth-spitter.png",
    icon_size = 64, 
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = (30000 * k^boss_hp_variant) * boss_hp_multiplier/boss_hp_variant, --30000*k * boss_hp_multiplier,
    order="b-b-g",
    subgroup="enemies",
    resistances = {},
    healing_per_tick = 0.01,
	  collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
	  selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
	  sticker_box = {{-0.4, -0.6}, {0.4, 0.2}},
    distraction_cooldown = 100,
    loot = Loot,
	  has_belt_immunity = true,
    min_pursue_time = 6 * 60,
    max_pursue_distance = 30,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "maf-area-acid-projectile-purple", -- "jb-acid-cluster-projectile",
      range=60+k*2,
      min_attack_distance=10,
      cooldown=130-k*3,
      damage_modifier=12+k*4*boss_dmg_multiplier,
      scale=scale,
      tint1=szilla_green,
      tint2=szilla_green2,
      roarvolume=2
    }),
    call_for_help_radius = 150,
	  vision_distance = 80+k,
    movement_speed = 0.07+ k/150,
    distance_per_frame = 0.04,
    absorptions_to_join_attack = { pollution = 100 },
    corpse = "maf-boss-acid-spitter-corpse-"..k,
    dying_explosion = "blood-explosion-huge",
    working_sound = sounds.spitter_calls_big(1),
    dying_sound = sounds.spitter_dying_big(1),
    walking_sound = sounds.spitter_walk_big(1),
    running_sound_animation_positions = {2,},
    damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-spitter'].damaged_trigger_effect),
  	water_reflection = spitter_water_reflection(scale),	
    run_animation = spitterrunanimation(scale, szilla_green,szilla_green2),
  	hide_resistances = false,
	  ai_settings = {destroy_when_commands_fail = false}
  },



-- CORPSES SPITTERS
  add_spitter_die_animation(scale, szilla_green, szilla_green2,
  {
    type = "corpse",
    name = "maf-boss-acid-spitter-corpse-"..k,
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, 
    selectable_in_game = false,
    selection_box = {{-4, -4}, {4, 4}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
	dying_speed = 0.01,
  }),   

 })
end


local weakness = {"physical","fire","laser","electric","explosion"}
local x=0
for k=1,10 do 
if not data.raw.unit['maf-boss-biter-'..k] then 
make_bosses(k) 
x=x+1
if x>#weakness then x=1 end
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit['maf-boss-biter-'..k], 10+k*2,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit['maf-boss-acid-spitter-'..k], 10+k*2,weakness[#weakness+1-x])
end
end



