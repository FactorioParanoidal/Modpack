
require ("prototypes.values")
local sounds = require("__base__/prototypes/entity/sounds.lua")
local dying_s = {{filename = "__Big-Monsters__/sounds/death-z.wav",volume = 2}}

local HPMult   = mf_hp_multiplier 
local BIGHPMult= settings.startup["bm-big-enemy-hp-multiplier"].value 

-- spider legs water walker
for n = 1, 8 do
	local spider_leg = table.deepcopy(data.raw["spider-leg"]["spidertron-leg-"..n])
	spider_leg.name = 'maf-spidertron-water-leg-'..n
	spider_leg.collision_box = nil
	data:extend({spider_leg})	
	end



local largetunnel = table.deepcopy(data.raw.corpse["biter-spawner-corpse"])
largetunnel.name="bm-large-tunnel"
largetunnel.integration=nil
largetunnel.decay_animation=nil
largetunnel.animation =
{
	{
		layers =
		{
			{
				width = 300,
				height = 300,
				frame_count = 1,
				direction_count = 1,
				shift = {0,0},
				stripes =
				{
					{
						filename = "__Big-Monsters__/graphics/large-tunnel.png",
						width_in_frames = 1,
						height_in_frames = 1,
						y = 0
					},
				}
			},
		}
	}
}
largetunnel.time_before_removed = 5 * 60 * 60





--------------------------------------------------------------------------------------
local corpse = table.deepcopy(data.raw.corpse["biter-spawner-corpse"])
corpse.name="bm-spawner-corpse"
corpse.integration=nil
dLog(corpse)
corpse.decay_animation=nil
corpse.animation =
{
	{
		layers =
		{
			{
				width = 148,
				height = 148,
				frame_count = 1,
				direction_count = 1,
				shift = {0,0},
				stripes =
				{
					{
						filename = "__Big-Monsters__/graphics/tunnel-dead.png",
						width_in_frames = 1,
						height_in_frames = 1,
						y = 0
					},
				}
			},
		}
	}
}
corpse.time_before_removed = 5 * 60 * 60


--------------------------------------------------------------------------------------
local spawner = table.deepcopy(data.raw["unit-spawner"]["biter-spawner"])
spawner.name="bm-spawner" 
spawner.corpse = "bm-spawner-corpse"
spawner.autoplace = nil 
spawner.time_to_capture = nil
spawner.graphics_set = {animations =
{
	{
		layers =
		{
			{
				filename = "__Big-Monsters__/graphics/tunnel.png",
				line_length = 1,
				width = 148,
				height = 148,
				frame_count = 1,
				animation_speed = 0.18,
				direction_count = 1,
				run_mode = "forward-then-backward",
				shift = {0,0},
			},
		}
	}
}}



-- VOLCANO
local spawnbase = "spitter-spawner"
if data.raw['unit-spawner']["explosive-biter-spawner"] then spawnbase = "explosive-biter-spawner" end
local volcano =  table.deepcopy(data.raw["unit-spawner"][spawnbase])
volcano.name="bm-volcano"
volcano.dying_explosion = "nuke-explosion"
volcano.corpse = nil
volcano.max_health = 12000 * HPMult
volcano.autoplace = nil 
volcano.resistances = volcano_resistances
volcano.time_to_capture = nil
volcano.graphics_set = {animations = 
{
	{
		layers =
		{
			{
				filename = "__Big-Monsters__/graphics/volcano.png",
				line_length = 1,
				width = 300,
				height = 300,
				frame_count = 1,
				animation_speed = 0.18,
				direction_count = 1,
				run_mode = "forward-then-backward",
				shift = {0,0},
			},
		}
	}
}}


--------------------------------------------------------------------------------------
local biterzilla_scale = 5
local biterzilla_tint1 = {r=0.9, g=0.1, b=0.1, a=1}
local biterzilla_tint2 = {r=0.88, g=0.24, b=0.24, a=0.9}
local bzilla_amarelo1 = {r=0, g=0, b=1, a=1}
local bzilla_amarelo2 = {r=0, g=0, b=0.7, a=0.8}
local bzilla_carco1 = {r=0.6, g=0.5, b=0.1, a=1}
local bzilla_carco2 = {r=0.5, g=0.4, b=0.1, a=0.7}
local bzilla_verde = {r=0, g=1, b=0, a=1}
local bzilla_verde2 = {r=0.2, g=0.9, b=0.1, a=0.75}

local Loot = get_mf_Loot()


function make_biter_area_damage(damage,scale)
return  {
					type = "area",
					radius = scale,
					force = "enemy",
					ignore_collision_condition = true,
					action_delivery =
					{
					  type = "instant",
					  target_effects =
					  {
						{
						  type = "damage",
						  damage = {amount = damage, type = "physical"}
						},
						{
						type = "create-particle",
						repeat_count = 8,
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


 
function add_big_monsters(L)
data:extend(
{

  {
    type = "unit",
    name = "maf-giant-fire-spitter" .. L,
	localised_name = {"entity-name.maf-giant-fire-spitter"},
    icon = "__base__/graphics/icons/behemoth-spitter.png",
	icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = (1000000 + L^mf_hp_variant * 500000) * BIGHPMult / mf_hp_variant, --    (1000000 + L*500000) * BIGHPMult,
    order="b-b-g",
    subgroup="enemies",
    resistances = fire_resistances,
    healing_per_tick = 0.01,
	collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
	selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
	sticker_box = {{-0.4, -0.6}, {0.4, 0.2}},
    distraction_cooldown = 300,
    loot = Loot,
	has_belt_immunity = true,
    min_pursue_time = 6 * 60,
    max_pursue_distance = 30,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "mf-boss-fire-projectile-big",
      range=85+L,
      min_attack_distance=10,
      cooldown=100-L*5,
      damage_modifier=(100*(L+1)/2) * mf_dmg_multiplier,
      scale=biterzilla_scale,
      tint1=biterzilla_tint1,
      tint2=biterzilla_tint2,
      roarvolume=1
    }),
    call_for_help_radius = 200+L*2,
	vision_distance = 100,
    movement_speed = 0.03+L/100,
    distance_per_frame = 0.04,
    absorptions_to_join_attack = { pollution = 100 },
    corpse = "maf-giant-fire-spitter-corpse",
    dying_explosion = "blood-explosion-huge",
	dying_sound = dying_s,
    working_sound = sounds.biter_calls(2),
    walking_sound = sounds.spitter_walk(2),
    running_sound_animation_positions = {2,},
	water_reflection = biter_water_reflection(biterzilla_scale),	
    damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
	run_animation = spitterrunanimation(biterzilla_scale, biterzilla_tint1,biterzilla_tint2),
    hide_resistances = false,
    ai_settings = {destroy_when_commands_fail = false},
  },




  
  {
    type = "unit",
    name = "maf-giant-acid-spitter"..L,
	localised_name = {"entity-name.maf-giant-acid-spitter"},
    icon = "__base__/graphics/icons/behemoth-spitter.png",
	icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    --max_health = (1000000 + L*500000) * BIGHPMult,
	max_health = (1000000 + L^mf_hp_variant * 500000) * BIGHPMult / mf_hp_variant, 	
    order="b-b-g",
    subgroup="enemies",
    resistances = acid_resistances,
    healing_per_tick = 0.01,
	collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
	selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
	sticker_box = {{-0.4, -0.6}, {0.4, 0.2}},
    distraction_cooldown = 300,
    loot = Loot,
	has_belt_immunity = true,
    min_pursue_time = 6 * 60,
    max_pursue_distance = 30,
    attack_parameters = spitter_attack_parameters(
    {
      acid_stream_name = "maf-area-acid-projectile-purple",
      range=80+L*2,
      min_attack_distance=10,
      cooldown=100-L*5,
      damage_modifier=(100*(L+1)/2) * mf_dmg_multiplier,
      scale=biterzilla_scale,
      tint1=bzilla_verde,
      tint2=bzilla_verde2,
      roarvolume=1
    }),
    call_for_help_radius = 100+L*10,
	vision_distance = 100,
    movement_speed = 0.03+L/100,
    distance_per_frame = 0.04,
    absorptions_to_join_attack = { pollution = 100 },
    corpse = "maf-giant-acid-spitter-corpse",
    dying_explosion = "blood-explosion-huge",
    dying_sound = dying_s,
    working_sound = sounds.spitter_calls(2),
    walking_sound = sounds.spitter_walk(2),	
    running_sound_animation_positions = {2,},
    damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-spitter'].damaged_trigger_effect),
	water_reflection = spitter_water_reflection(biterzilla_scale),
    run_animation = spitterrunanimation(biterzilla_scale, bzilla_verde,bzilla_verde2),
    hide_resistances = false,
    ai_settings = {destroy_when_commands_fail = false},
	
  },
  
		
		{ -- BITERZILLA - FOGO - VERMELHO
			type = "unit",
			name = "biterzilla1"..L,
			localised_name = {"entity-name.biterzilla1"},
			order="b-b-d",
			icon = "__base__/graphics/icons/behemoth-biter.png",
			icon_size = 64, icon_mipmaps = 4,
			flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
			max_health = (1000000 + L^mf_hp_variant * 500000) * BIGHPMult / mf_hp_variant, 	
			subgroup="enemies",
			resistances = fire_resistances,
			call_for_help_radius = 80+ L*3,
			spawning_time_modifier = 8,
			healing_per_tick = 0.0,
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
			distraction_cooldown = 200, -- 300,
		    loot = Loot,
			has_belt_immunity = true,
			attack_parameters =
			{
				type = "projectile",
				range = 15+L,
				cooldown = 20-L,
				ammo_category = "melee",
				sound =  sounds.biter_roars(2),
				animation = biterattackanimation(biterzilla_scale, biterzilla_tint1, biterzilla_tint2),
				ammo_type = {
							  category = "melee",
							  target_type = "entity",
								action = {
								  {
								  action_delivery = {
									target_effects = {
									  damage = {
										amount = (600*(L+1)/2) * mf_dmg_multiplier,
										type = "physical"
									  },
									  type = "damage",
									  show_in_tooltip = true
									},
									type = "instant"
								  },
								  type = "direct"
								  },
								  make_biter_area_damage((30 + L*5)*mf_dmg_multiplier,6+L), -- damage *MP / area
								  },
							}
			},
			vision_distance = 45+L*3, -- 30
			movement_speed = 0.04+L/100,
			distance_per_frame = 0.3,
			-- in pu
			absorptions_to_join_attack = { pollution = 1 },
			corpse = "biterzilla-corpse",
		    dying_sound = dying_s,
			dying_explosion = "blood-explosion-big",
			working_sound = sounds.biter_calls_big(1.4),
			walking_sound = sounds.biter_walk_big(1.2),
			running_sound_animation_positions = {2,},
			damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
			water_reflection = biter_water_reflection(biterzilla_scale),
			run_animation = biterrunanimation(biterzilla_scale, biterzilla_tint1, biterzilla_tint2),
			ai_settings = {destroy_when_commands_fail = false},
		},
		

		{ -- MOTHERZILLA - VERDE
			type = "unit",
			name = "bm-motherbiterzilla"..L,
			localised_name = {"entity-name.bm-motherbiterzilla"},
			order="b-b-d",
			icon = "__base__/graphics/icons/behemoth-biter.png",
			icon_size = 64, icon_mipmaps = 4,
			flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
			max_health = (1000000 + L^mf_hp_variant * 500000) * BIGHPMult / mf_hp_variant, 	
			subgroup="enemies",
			resistances = acidweak_resistances,
			call_for_help_radius = 100,
			spawning_time_modifier = 8,
			healing_per_tick = 0.0,
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
			distraction_cooldown = 100, -- 300,
		    loot = Loot,
			has_belt_immunity = true,
			attack_parameters =
			{
				type = "projectile",
				range = 16+L,
				cooldown = 20-L,
				ammo_category = "melee",
				sound =  sounds.biter_roars(2),
				animation = biterattackanimation(biterzilla_scale+2,  bzilla_verde, bzilla_verde2),
				ammo_type = {
							  category = "melee",
							  target_type = "entity",
								action = {
								  {
								  action_delivery = {
									target_effects = {
									  damage = {
										amount = (600*(L+1)/2) * mf_dmg_multiplier,
										type = "physical"
									  },
									  type = "damage",
									  show_in_tooltip = true
									},
									type = "instant"
								  },
								  type = "direct"
								  },
								  make_biter_area_damage((35+L*4)*mf_dmg_multiplier,8+L), -- damage *MP / area
								  },
							}
			},
			vision_distance = 45+L*3, -- 30
			movement_speed = 0.035+L/100,
			distance_per_frame = 0.3,
			-- in pu
			absorptions_to_join_attack = { pollution = 1 },
			corpse = "bm-motherbzilla-corpse",
		    dying_sound = dying_s,
			dying_explosion = "blood-explosion-big",
			working_sound = sounds.biter_calls_big(1.4),
			walking_sound = sounds.biter_walk_big(1.2),
			running_sound_animation_positions = {2,},
			damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
			water_reflection = biter_water_reflection(biterzilla_scale+2),
			run_animation = biterrunanimation(biterzilla_scale+2, bzilla_verde, bzilla_verde2),
			ai_settings = {destroy_when_commands_fail = false},
		},



	
		{ -- BARATAO AZUL ELETRICO
			type = "unit",
			name = "biterzilla2"..L,
			localised_name = {"entity-name.biterzilla2"},
			order="b-b-d",
			icon = "__base__/graphics/icons/behemoth-biter.png",
			icon_size = 64, icon_mipmaps = 4,
			flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
			max_health = (1000000 + L^mf_hp_variant * 200000) * BIGHPMult / mf_hp_variant, 				
			subgroup="enemies",
			resistances = energy_resistances,
			call_for_help_radius = 80,
			spawning_time_modifier = 8,
			healing_per_tick = 0.1,
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
			distraction_cooldown = 300, -- 300,
		    loot = Loot,
			has_belt_immunity = true,
			attack_parameters =
			{
				type = "projectile",
				range = 13+L,
				cooldown = 20-L,
				ammo_category = "melee",
				sound =  sounds.biter_roars(2),
				animation = biterattackanimation(biterzilla_scale-1, bzilla_amarelo1, bzilla_amarelo2),
				ammo_type = {
							  category = "melee",
							  target_type = "entity",
								action = {
								  {
								  action_delivery = {
									target_effects = {
									  damage = {
										amount = (500*(L+1)/2) * mf_dmg_multiplier,
										type = "physical"
									  },
									  type = "damage",
									  show_in_tooltip = true
									},
									type = "instant"
								  },
								  type = "direct"
								  },
								  make_biter_area_damage((40+L*5)*mf_dmg_multiplier,5+L), -- damage *MP / area
								  },
							}
			},			
			vision_distance = 45+L, -- 30
			movement_speed = 0.08+L/100,
			distance_per_frame = 0.3,
			-- in pu
			absorptions_to_join_attack = { pollution = 1 },
			corpse = "biterzilla-corpse2",
		    dying_sound =dying_s,
			dying_explosion = "blood-explosion-big",
			working_sound = sounds.biter_calls_big(1.4),
			walking_sound = sounds.biter_walk_big(1.2),
			running_sound_animation_positions = {2,},
			damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
			water_reflection = biter_water_reflection(biterzilla_scale-1),
			run_animation = biterrunanimation(biterzilla_scale-1, bzilla_amarelo1, bzilla_amarelo2),
			ai_settings = {destroy_when_commands_fail = false},
		},
		
		
	
		{ -- BARATAO CASCUDO MARROM
			type = "unit",
			name = "biterzilla3"..L,
			localised_name = {"entity-name.biterzilla3"},
			order="b-b-d",
			icon = "__base__/graphics/icons/behemoth-biter.png",
			icon_size = 64, icon_mipmaps = 4,
			flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
			--max_health = (1600000 + L*400000) * BIGHPMult,
			max_health = (1600000 + L^mf_hp_variant * 400000) * BIGHPMult / mf_hp_variant, 				
			subgroup="enemies",
			resistances = strong_resistances,
			call_for_help_radius = 80+L,
			spawning_time_modifier = 8,
			healing_per_tick = 0.1,
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
			distraction_cooldown = 300, -- 300,
		    loot = Loot,
			has_belt_immunity = true,
			attack_parameters =
			{
				type = "projectile",
				range = 17+L,
				cooldown = 20-L,
				ammo_category = "melee",
				sound =  sounds.biter_roars(2),
				animation = biterattackanimation(biterzilla_scale+1, bzilla_carco1, bzilla_carco2),
				ammo_type = {
							  category = "melee",
							  target_type = "entity",
								action = {
								  {
								  action_delivery = {
									target_effects = {
									  damage = {
										amount = (700*(L+1)/2) * mf_dmg_multiplier,
										type = "physical"
									  },
									  type = "damage",
									  show_in_tooltip = true
									},
									type = "instant"
								  },
								  type = "direct"
								  },
								   make_biter_area_damage((50+L*5)*mf_dmg_multiplier,8+L), -- damage *MP / area
								  },
							}
			},			
			vision_distance = 30+L*3, -- 30
			movement_speed = 0.04+L/100,
			distance_per_frame = 0.3,
			-- in pu
			absorptions_to_join_attack = { pollution = 1 },
			corpse = "biterzilla-corpse3",
		    dying_sound =dying_s,
		 	dying_explosion = "blood-explosion-big",
			working_sound = sounds.biter_calls_big(1.4),
			walking_sound = sounds.biter_walk_big(1.2),
			running_sound_animation_positions = {2,},
			damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
			water_reflection = biter_water_reflection(biterzilla_scale+1),
			run_animation = biterrunanimation(biterzilla_scale+1, bzilla_carco1, bzilla_carco2),
			ai_settings = {destroy_when_commands_fail = false},
		},
		
})		


local spider_droid = table.deepcopy(data.raw["spider-vehicle"].spidertron)
spider_droid.name="bm-spidertron_"..L 
--spider_droid.max_health=(50000 + L*5000) * BIGHPMult
spider_droid.max_health = (50000 + L^mf_hp_variant * 5000) * BIGHPMult / mf_hp_variant
spider_droid.localised_name = {"",{"entity-name.spidertron"},' '..L}
spider_droid.hide_resistances = false
spider_droid.inventory_size=1
spider_droid.dying_explosion = "small-atomic-explosion"
for xl=1,8 do 
	spider_droid.spider_engine.legs[xl].leg='maf-spidertron-water-leg-'..xl
	--spider_droid.spider_engine.legs[xl].leg_hit_the_ground_trigger=nil
	end
hack_tint(spider_droid, colors.lightred, false)
data:extend({spider_droid})
end
for x=1,5 do add_big_monsters(x) end


		
data:extend(
	{

 
  add_spitter_die_animation(biterzilla_scale, bzilla_verde, bzilla_verde2,
  {
    type = "corpse",
    name = "maf-giant-acid-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-4, -4}, {4, 4}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
	dying_speed = 0.01,
  }),    
  
   add_spitter_die_animation(biterzilla_scale, biterzilla_tint1, biterzilla_tint2,
  {
    type = "corpse",
    name = "maf-giant-fire-spitter-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selectable_in_game = false,
    selection_box = {{-4, -4}, {4, 4}},
    subgroup="corpses",
    order = "c[corpse]-b[spitter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-on-map"},
	dying_speed = 0.01,
  }),    

	
		corpse,
		spawner,
		largetunnel,
		volcano,


  add_biter_die_animation(biterzilla_scale, biterzilla_tint1, biterzilla_tint2,
  {
    type = "corpse",
    name = "biterzilla-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-3, -3}, {3, 3}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
  }),

  add_biter_die_animation(biterzilla_scale-1, bzilla_amarelo1, bzilla_amarelo2,
  {
    type = "corpse",
    name = "biterzilla-corpse2",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-3, -3}, {3, 3}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
  }),	

  add_biter_die_animation(biterzilla_scale+1, bzilla_carco1, bzilla_carco2,
  {
    type = "corpse",
    name = "biterzilla-corpse3",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 64, icon_mipmaps = 4,
    selection_box = {{-3, -3}, {3, 3}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
  }),	
	
	
  add_biter_die_animation(biterzilla_scale+2, bzilla_verde, bzilla_verde2,
  {
    type = "corpse",
    name = "bm-motherbzilla-corpse",
    icon = "__base__/graphics/icons/big-biter-corpse.png",
    icon_size = 32, icon_mipmaps = 4,
    selection_box = {{-3, -3}, {3, 3}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-f[leviathan]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
  }),  
  

  
}
)