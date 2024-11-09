require ("prototypes.armoured_animation")

local behemoth_armoured_tint1 = {r=0.7, g=0.43, b=0.34, a=1}
local behemoth_armoured_tint2 = {r=0, g=1, b=0.4, a=1}

local boss_hp_multiplier = settings.startup["maf-enemy-hp-multiplier"].value
local boss_dmg_multiplier = settings.startup["maf-enemy-damage-multiplier"].value
local wpe_boss_resist_multiplier = 1


local function make_biter_area_damage(level,scale)
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
						  damage = {amount = (40+level*10*boss_dmg_multiplier), type = "physical"}
						},
						{
						type = "create-particle",
						repeat_count = 6,
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


function make_a_boss(k)
local scale = 1.6 + k/4

local name = "maf-boss-armoured-biter-"..k

if not data.raw.unit[name] then 

data:extend(
{
	
		{
            type = "unit",
            name = name,
			localised_name = {"entity-name.maf-boss-biter"},
            order="b-b-d",
            icon = "__ArmouredBiters__/graphics/icons/behemoth-armoured-biter.png",
            icon_size = 32,
            flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
            max_health = 50000 * k * boss_hp_multiplier,
            subgroup="enemies",
            resistances = {},
            spawning_time_modifier = 12,
            healing_per_tick = 0,
			collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
			selection_box = {{-3.4, -3.4}, {3.4, 3.4}},
            sticker_box = {{-0.6, -0.8}, {0.6, 0}},
			call_for_help_radius = 100,
            distraction_cooldown = 100,
            min_pursue_time = 30 * 60,
            max_pursue_distance = 80,
            attack_parameters =
                {
                    type = "projectile",
                    range = 2.2 + k/2,
                    cooldown = 80-k,
                    sound =  sounds.biter_roars_big(0.4),
                    animation = armoredAttackBiter(scale, behemoth_armoured_tint1, behemoth_armoured_tint2),
					ammo_type = {
							  category = "melee",
							  target_type = "entity",
								action = {
								  {
								  action_delivery = {
									target_effects = {
									  damage = {
										amount = (200+k*30)*boss_dmg_multiplier,
										type = "physical"
									  },
									  type = "damage",
									  show_in_tooltip = true
									},
									type = "instant"
								  },
								  type = "direct"
								  },
								  make_biter_area_damage(1,scale),
								  },
							}					
                },
            vision_distance = 50+k,
            movement_speed = 0.03 + k/100,
            distance_per_frame = 0.2,
            -- in pu
            pollution_to_join_attack = 1,
            run_animation = armoredRunBiter(scale, behemoth_armoured_tint1, behemoth_armoured_tint2),
            corpse =  "maf-boss-armoured-biter-corpse-"..k,
            dying_explosion = "blood-explosion-big",
			working_sound = sounds.biter_calls_big(1.4),
			dying_sound = sounds.biter_dying_big(1),
			walking_sound = sounds.biter_walk_big(1.2),
			running_sound_animation_positions = {2,},
			hide_resistances = false,
			ai_settings = {destroy_when_commands_fail = false},
			damaged_trigger_effect = table.deepcopy(data.raw['unit']['behemoth-biter'].damaged_trigger_effect),
		    loot = getLoot(),
			has_belt_immunity = true,			
        },
		add_biter_armoured_die_animation(scale, behemoth_armoured_tint1, behemoth_armoured_tint2,
		{
			type = "corpse",
			name = "maf-boss-armoured-biter-corpse-"..k,
			icon = "__ArmouredBiters__/graphics/icons/behemoth-armoured-biter.png",
			icon_size = 32,
			selection_box = {{-3, -3}, {3, 3}},
			selectable_in_game = false,
			subgroup="corpses",
			order = "c[corpse]-a[biter]-a[small]",
			flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
		})
 })
 end
end


-- armoured biters mod
if data.raw.unit['small-armoured-biter'] then
local weakness = {"physical","fire","laser","electric","explosion"}
local x=0
for k=1,10 do 
make_a_boss(k) 
x=x+1
if x>#weakness then x=1 end
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit['maf-boss-armoured-biter-'..k], 15+k*2*wpe_boss_resist_multiplier,weakness[x])
end
end