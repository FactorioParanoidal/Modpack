--[[
	 * * * FAKE HUMAN PROTOTYPES * * * 
								by MFerrari 
v 1.5  03/2021 - grenade projectile - resistances								
v 1.61 07/2021 - hidden from bonus gui
v 2.1  8/2023 red,blood , turrets ,nest result, generic independent, dying sounds,  02/05  vision  30/03/2020 MSI2 - grenade projectile + resistances    02/08/22 - sizes, david speed & hp
v 2.2  4/2024 added optional Mechanicus character mod
v 2.3  6/2024 added flamethrower, nerf rocket & grenade, not homing grenade
v 2.4  7/2024 added options for scale, explosives(rocket/grenade soldiers)
v 2.5 10/2014 made a mod lib 
]]

local path = "__mferrari_lib__/"
require ("__mferrari_lib__/prototypes/fake_humans-fire")
require ("__mferrari_lib__/prototypes/flying_saucer_animation")
local colors = require("__mferrari_lib__/colors")

--settings - a mod calling should set these constants
local hp_multiplier  = mf_hp_multiplier or 1
local dmg_multiplier = mf_dmg_multiplier or 1

local base_name      = mf_fh_base_name       or  'mf_fake_human'
local add_spawner    = mf_fh_add_spawner     or true
local add_turrets    = mf_fh_add_turrets     or true
local add_nuker      = mf_fh_add_nuker       or false
local add_explosive  = mf_fh_add_explosive   or false
local mechanicus_skin= mf_fh_mechanicus_skin or false
local unit_scale     = 1



function concat_lists(list1, list2)
	-- add list2 into list1 , do not avoid duplicates...
	for i, obj in pairs(list2) do
		table.insert(list1,obj)
	end
end


local hit_effect= 
  {
    type = "create-entity",
    entity_name = "maf-blood-damaged-explosion-hit",
    offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
    damage_type_filters = "fire"
  }


local sounds = require("__base__/prototypes/entity/sounds.lua")
local human_dying_sounds =
    {
      {
        filename = path.."sounds/human_die_1.ogg",
        volume = 0.4
      },
      {
        filename = path.."sounds/human_die_2.ogg",
        volume = 0.4
      }
	  
    }
local boss_dying_sounds =
    {
      {
        filename = path.."sounds/human_die_3.ogg",
        volume = 1
      },
      {
        filename = path.."sounds/human_die_4.ogg",
        volume = 1
      }
    }



local character = util.copy(data.raw.character.character)
local human_corpse = table.deepcopy(data.raw["character-corpse"]["character-corpse"])
local corpse_pic = table.deepcopy(human_corpse.pictures[1].layers[1])

if mods["MechanicusMiniMAX"] and mechanicus_skin then 
	character = util.copy(data.raw.character["Mechanicus_character_skin"])
	human_corpse = table.deepcopy(data.raw["character-corpse"]["Mechanicus_character_skin-corpse"])
	else --vanilla
	mechanicus_skin=false		
	human_corpse.pictures = {
        layers =
        {corpse_pic
        }}	
	end



human_corpse.selectable_in_game = false
human_corpse.selection_box = nil
human_corpse.render_layer = "remnants"
human_corpse.armor_picture_mapping = nil
human_corpse.subgroup="corpses"



-- sniper beam
local beam_base = util.copy(data.raw.beam["laser-beam"])
beam_base.damage_interval = 60*5
beam_base.action=nil
beam_base.working_sound=nil
beam_base.random_target_offset = true
beam_base.name =  'sniper-beam'	
hack_tint(beam_base, colors.yellow)
hack_scale(beam_base, 0.5)
data:extend{beam_base}


local function make_beam_attack(damage_modifier,beam)
 return   {
      type = "beam",
      ammo_category = "beam",
      cooldown = 20, --40
      range = 15 + damage_modifier/2 ,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = damage_modifier,
      --sound = make_laser_sounds(),
      ammo_type =
      {
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = beam,
            max_length = 16+ damage_modifier/2,
            duration = 20, --30
            source_offset = {0, -1}
          }
        }
      }
    }
end


local sound_melee={
  {
    filename = "__base__/sound/walking/sand-1.ogg",
    volume = 1
  },
  {
    filename = "__base__/sound/walking/dirt-02.ogg",
    volume = 1
  },  {
    filename = "__base__/sound/walking/concrete-2.ogg",
    volume = 1
  },

}

local sound_gun={
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-1.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-2.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-3.ogg",
    volume = 0.4
  },
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-4.ogg",
    volume = 0.4
  }
}

local sound_sniper={
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-1.ogg",
    volume = 1
  },
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-2.ogg",
    volume = 1
  },
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-3.ogg",
    volume = 1
  },
  {
    filename = "__base__/sound/fight/gun-turret-gunshot-4.ogg",
    volume = 1
  }
}




local function make_sniper_attack(damage,range,cooldown,beam)
 return   {
      type = "projectile",
	    sound = sound_sniper,
      cooldown = cooldown, 
      range = range,
      source_direction_count = 64,
      source_offset = {0, -3.423489 / 4},
      damage_modifier = 1,
      ammo_category = "bullet",
      ammo_type =
      {
		    target_type = "entity",
        action =
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
				source_effects =
				{
				type = "create-explosion",
				entity_name = "explosion-gunshot-small"
				},			  
              target_effects =
              {
              {
                type = "create-entity",
                entity_name = "explosion-hit"
              },			  
                {
                  type = "damage",
                  damage = {amount = damage, type = "physical"}
                }
              }
            },
			
		   {
            type = "beam",
            beam = beam,
            max_length = range,
            duration = 10, --30
            source_offset = {0, -1.31439 },
			      target_offset = {0, -4}
           }
		  }
        }
      }
    }
end



local function make_smg_attack(damage,range,cooldown)
return   {
      type = "projectile",
	     sound = sound_gun,
      ammo_category = "bullet",
      warmup = 10,
      cooldown = cooldown,
      range = range,
      ammo_type =
      {
        category = "bullet",
        target_type = "entity",
        action =
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
				source_effects =
				{
				type = "create-explosion",
				entity_name = "explosion-gunshot-small"
				},			  
              target_effects =
              {
              {
                type = "create-entity",
                entity_name = "explosion-hit"
              },			  
                {
                  type = "damage",
                  damage = {amount = damage, type = "physical"}
                }
              }
            }
          }
        }
      },
    }
end



local function make_rocket_attack(damage_modifier,range,cooldown,projectile,min_range)
return   {
      type = "projectile",
      ammo_category = "rocket",
      warmup = 40,
      cooldown = cooldown,
      range = range,
	  min_range = min_range,
	  damage_modifier = damage_modifier,
	  --lead_target_for_projectile_speed = 0.3,
      ammo_type =
      {
        target_type = "entity",
        action =
        {
          type = "direct",
          action_delivery =
          {
            {
          type = "projectile",
          projectile = projectile,
          starting_speed = 0.005,
		  source_offset = {0, -5},
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          },
            }
          }
        }
      },
    }
end




local function make_grenade_attack(damage_modifier,range,cooldown,projectile,min_range)
return   {
      type = "projectile",
      ammo_category = "grenade",
      warmup = 40,
      cooldown = cooldown,
      range = range,
	  min_range = min_range,
	  damage_modifier = damage_modifier * dmg_multiplier,
	  projectile_creation_distance = 0.6,
	  lead_target_for_projectile_speed = 0.2,	  
      ammo_type =
      {
         target_type = "position",
		 activation_type = "throw",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = projectile,
                starting_speed = 0.1
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile
                  }
                }
              }
            }
          }
      }
    }
end

local make_unit_melee_ammo_type = function(damage_value)
  return
  {
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damage_value , type = "physical"}
        }
      }
    }
  }
end


local function make_melee_attack(damage)
 return   {
      type = "projectile",
      damage_modifier = dmg_multiplier,
      range = 0.5,
      cooldown = 40,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(damage),
	    sound = sound_melee,  
    }
end



-- cool 90 range 25   "explosive-cannon-projectile",
local function make_cannon_attack(projectile,damage_modifier,range,cooldown)
 return   {
      type = "projectile",
	  sound = sounds.tank_gunshot,
      cooldown = cooldown, 
      range = range,
	  flags = {"not-on-map"},
	  ammo_category = "cannon-shell",
      warmup = 10,
	  min_range = 10,
	  damage_modifier = damage_modifier,
      ammo_type =
      {
        target_type = "entity",
        action =
        {
          type = "direct",
          action_delivery =
          {
            {
          type = "projectile",
          projectile = projectile,
          starting_speed = 1,
		  source_offset = {0, -10},
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          },
            }
          }
        }
      },
    }

end



function create_fake_human(base_name,surname,level,armor, set_color, scale,attack_parameters, hp_mp )
local color = table.deepcopy(set_color)
if not hp_mp then hp_mp=1 end
local att_anim 

if mechanicus_skin then --Mechanicus
	att_anim = table.deepcopy(character.animations[1].idle_with_gun)
else --vanilla
	att_anim = table.deepcopy(character.animations[armor].idle_with_gun)
end

if attack_parameters.ammo_category and attack_parameters.ammo_category == "melee" then 
	if mechanicus_skin then --Mechanicus
	att_anim = table.deepcopy(character.animations[1].mining_with_tool)
	else --vanilla
	att_anim = table.deepcopy(character.animations[armor].mining_with_tool)
	end
	end

local name = base_name..'_'..surname
local lname = {"",{"entity-name."..name},' '..tostring(level)}

  local fake_human = table.deepcopy(data.raw.unit["medium-biter"])
  fake_human.flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"}
  fake_human.hidden=true
  fake_human.order="z-"..name.."-"..level
  fake_human.name=name..'_'..level
  fake_human.localised_name = lname
  fake_human.selection_box = scale_box(table.deepcopy(character.selection_box),scale)
  fake_human.sticker_box   = scale_box(table.deepcopy(character.sticker_box),scale)
	fake_human.icon = path.. "graphics/icon/fake_human.png"
	fake_human.icon_size = 64
  fake_human.water_reflection = table.deepcopy(character.water_reflection)
  fake_human.max_health = 250*level*hp_mp*hp_multiplier --was 200
	--fake_human.map_color = color
	--fake_human.enemy_map_color = color --{r = 1}	
--  fake_human.move_while_shooting = true  --- se ativar ele foge do alvo -flee
  fake_human.affected_by_tiles = true
  fake_human.attack_parameters = attack_parameters
  fake_human.attack_parameters.animation = att_anim
 
  if mechanicus_skin then --Mechanicus
    fake_human.run_animation = table.deepcopy(character.animations[1].running)
	fake_human.icons = character.icons
	else
	fake_human.run_animation = table.deepcopy(character.animations[armor].running)
	end
	
  fake_human.absorptions_to_join_attack = { pollution = 10 + level * 10}
  fake_human.movement_speed = 0.04 + level/30
  fake_human.healing_per_tick = 0.01 + level/500
	fake_human.damaged_trigger_effect = hit_effect
	fake_human.dying_explosion = "maf-blood-explosion"
	fake_human.corpse = fake_human.name.."-corpse" 
	fake_human.can_open_gates = true
  fake_human.has_belt_immunity = true
  fake_human.rotation_speed = 0.05
  fake_human.vision_distance = 40
  if string.find(surname, "sniper") then fake_human.vision_distance = 90 end
  if string.find(surname, "boss") then fake_human.dying_sound = boss_dying_sounds else  fake_human.dying_sound = human_dying_sounds end
  fake_human.working_sound = nil 
  fake_human.destroy_when_commands_fail = false
  fake_human.hide_resistances = false
  fake_human.dying_sound = human_dying_sounds
  if surname=='melee' then hack_tint(fake_human, color, false) else hack_tint(fake_human, color, true) end
  if scale*unit_scale ~= 1 then hack_scale(fake_human, scale*unit_scale, mechanicus_skin) end
  fake_human.ai_settings = {destroy_when_commands_fail = true}
--[[	fake_human.resistances = {
	  {type = "fire", percent = 20+level*5},
	 -- {type = "cold", percent = 30+level*4},
      {type = "physical", percent = 10+level*5},
      {type = "impact", decrease = 10, percent = 10+level*3},
      {type = "explosion", percent = 10+level*3},
      {type = "acid", percent = 10+level*2},
      {type = "poison", percent = 10+level*5},
      {type = "laser", percent = -50+level*4},
	  {type = "electric", percent = -50+level*4},
	  }  
  if mods["cold_biters"] then table.insert(fake_human.resistances,{type = "cold", percent = 30+level*4}) end
 ]] 
  
  fake_human.light =
    {
      {
        minimum_darkness = 0.3,
        intensity = 0.4,
        size = 15,
        color = {r=1.0, g=1.0, b=1.0}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0, -7},
        size = 1,
        intensity = 0.6,
        color = {r=1.0, g=1.0, b=1.0}
      }
    } 

    fake_human.running_sound_animation_positions = {5, 16}
    fake_human.walking_sound = {
      aggregation =
      {
        max_count = 2,
        remove = true
      },
      variations = data.raw.tile["sand-1"].walking_sound
    }


  data:extend {fake_human}
  JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[fake_human.name], level/2)

  local corpse = table.deepcopy(human_corpse)
  corpse.name = fake_human.name.."-corpse"
  corpse.order = "zzz-"..name
  if mechanicus_skin then --Mechanicus
	corpse.icons = {
  {
    icon                  = "__MechanicusMiniMAX__/graphics/mechanicus-corpse.png",
    icon_mipmaps          = 1,
    icon_size             = 128,
  }}
  end
  if scale*unit_scale~=1 then hack_scale(corpse, scale*unit_scale, mechanicus_skin) end --1+ scale/2)
  hack_tint(corpse, color)
  fake_human.corpse = fake_human.name.."-corpse" 
  data:extend {corpse}

end




for k=1,10 do 
	local armor = 1
	if k>=7 then armor = 3 elseif k>=4 then armor = 2 end
	local scale=1 + k/100
	create_fake_human(base_name,'melee',k,armor,colors.white,scale,make_melee_attack(5+k*2)) -- damage
	create_fake_human(base_name,'pistol_gunner',k,armor,colors.yellow,scale,make_smg_attack((8+k*2)* dmg_multiplier,18+k,20-k/2)) -- damage,range,cooldown
	create_fake_human(base_name,'machine_gunner',k,armor,colors.brown,scale,make_smg_attack((8+k*2)* dmg_multiplier,18+k,2)) -- damage,range,cooldown
	create_fake_human(base_name,'sniper',k,armor,colors.green,scale,make_sniper_attack((100+k*5)* dmg_multiplier,70+k,60*6,'sniper-beam')) -- damage,range,cooldown
	create_fake_human(base_name,'laser',k,armor,colors.cyan,scale,make_beam_attack( (1+ k/5)* dmg_multiplier,"laser-beam")) -- damage,range,cooldown
	create_fake_human(base_name,'electric',k,armor, colors.blue,scale,make_beam_attack( (1+ k/4)* dmg_multiplier,'electric-beam')) -- damage,range,cooldown
	create_fake_human(base_name,'rocket',k,armor,colors.orange,scale, make_rocket_attack( (1+ k/5)* dmg_multiplier/3,22+k,60-k,"rocket")) -- damage,range,cooldown
	create_fake_human(base_name,'grenade',k,armor,colors.lightgrey,scale, make_grenade_attack( k/5,22+k,120-k,"grenade",10)) -- damage,range,cooldown
	create_fake_human(base_name,'flamethrower',k,armor,colors.red,scale, make_flamethrower_attack( k/5,23+k,40-k,1)) -- damage,range,cooldown
	create_fake_human(base_name,'cannon',k,armor,colors.orange,scale, make_cannon_attack("cannon-projectile",1+ k/5,30+k,90-k)) -- (projectile,damage_modifier,range,cooldown)
	if add_explosive then 
		create_fake_human(base_name,'cannon_explosive',k,armor,colors.orange,scale, make_cannon_attack("explosive-cannon-projectile",1+ k/5,35+k,90-k)) -- (projectile,damage_modifier,range,cooldown)
		create_fake_human(base_name,'cluster_grenade',k,armor,colors.lightgreen,scale, make_grenade_attack( k/5,22+k,120-k,"cluster-grenade",10)) -- damage,range,cooldown
		create_fake_human(base_name,'erocket',k,armor,colors.purple,scale, make_rocket_attack(  (1+ k/5)* dmg_multiplier/3 ,22+k,60-k,"explosive-rocket")) -- damage,range,cooldown
		end

	if add_nuker then create_fake_human(base_name,'nuke_rocket',k,armor,colors.magenta,scale, make_rocket_attack(1+ k/5,40+k,60*10,"mf-small-atomic-rocket",30)) end -- damage,range,cooldown
	end


--Human Bosses
local weakness = {"physical","laser","fire","explosion"}
local x=0

for k=1,10 do 
x=x+1
if x>#weakness then x=1 end

local armor = 3
local scale = 1.5 + k/3
local boss_hpmp =  200 * k
--create_fake_human(base_name,'boss_melee',k,armor,colors.blue,scale,make_melee_attack(20+k*10)) -- damage
create_fake_human(base_name,'boss_machine_gunner',k,armor,colors.brown,scale,make_smg_attack((50+k*10)* dmg_multiplier,30+k,2),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_pistol_gunner',k,armor,colors.yellow,scale,make_smg_attack((50+k*10)* dmg_multiplier,30+k,20-k/2),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_sniper',k,armor,colors.green,scale,make_sniper_attack((250+k*40)* dmg_multiplier,89+k,60*5,'sniper-beam'),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_laser',k,armor,colors.cyan,scale,make_beam_attack(    (18 + k*2.5)*dmg_multiplier,"laser-beam"),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_electric',k,armor,colors.lightblue,scale,make_beam_attack( (20 + k*3)*dmg_multiplier,'electric-beam'),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_rocket',k,armor,colors.orange,scale, make_rocket_attack( (1+ k/5)* dmg_multiplier,40+k,60-k,"rocket"),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_grenade',k,armor,colors.lightgrey,scale, make_grenade_attack(3+ k/5,50+k,120-k,"grenade",30),boss_hpmp) -- damage,range,cooldown
create_fake_human(base_name,'boss_flamethrower',k,armor,colors.red,scale, make_flamethrower_attack(3+ k/5,55+k,80-k,scale)) -- damage,range,cooldown
	--if add_explosive then 
	create_fake_human(base_name,'boss_cannon_explosive',k,armor,colors.orange,scale, make_cannon_attack("explosive-cannon-projectile", 3+ k/5,50+k,60-k),boss_hpmp) -- (projectile,damage_modifier,range,cooldown)
	create_fake_human(base_name,'boss_cluster_grenade',k,armor,colors.lightgreen,scale, make_grenade_attack(3+ k/5,55+k,120-k,"cluster-grenade",30),boss_hpmp) -- damage,range,cooldown
	create_fake_human(base_name,'boss_erocket',k,armor,colors.purple,scale, make_rocket_attack((1+ k/5)* dmg_multiplier,40+k,60-k,"explosive-rocket",30),boss_hpmp) -- damage,range,cooldown
	--end
	
if add_nuker then create_fake_human(base_name,'boss_nuke_rocket',k,armor,colors.magenta,scale, make_rocket_attack(3+ k/5,50+k,60*10,"mf-small-atomic-rocket",35)) end -- damage,range,cooldown


local res=10+k*2
--JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'boss_melee_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_machine_gunner_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_pistol_gunner_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_sniper_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_laser_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_electric_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_rocket_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_erocket_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_grenade_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_cluster_grenade_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_flamethrower_'..k], res,weakness[x])
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_cannon_explosive_'..k], res,weakness[x])
if add_nuker then JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_boss_nuke_rocket_'..k], res,weakness[x]) end
end

-- ultimates [[FOR BIG MONSTER ONLY]]
create_fake_human(base_name,'ultimate_boss_cannon',20,3,colors.white,3, make_cannon_attack("explosive-cannon-projectile", 5,80,20),4000) -- (projectile,damage_modifier,range,cooldown)
JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(data.raw.unit[base_name..'_ultimate_boss_cannon_20'], 35)









-----------------------------------------------
--   SPAWNER
--
--
------------------------------------------------
if add_spawner then 
local base_reactor = table.deepcopy(data.raw["reactor"]["nuclear-reactor"]) 


local function get_human_soldiers()
local surnames={'melee','pistol_gunner','machine_gunner','laser','electric','rocket','flamethrower', 'grenade','sniper'}
if add_explosive then concat_lists(surnames,{'cluster_grenade','erocket'}) end

local res = {}
for L=1,10 do  --level
	for S=1, #surnames do 
		local name = base_name..'_'..surnames[S]..'_'..L
		local perc = {}

		local Plevel = (L-1)/10     --0.2  + 0,08
		local peso_nome = S/100
		local Ideal_evo = Plevel + peso_nome
		local min_evo = math.max(0, Ideal_evo-0.06)
		local max_evo = math.min(1, Ideal_evo+0.06)
		local proba = 0.2
		if S>1 then proba=proba- peso_nome/1.5 end
		if surnames[S]=='sniper' then proba=proba/2 end

		if min_evo>0 then table.insert(perc,{min_evo, 0}) end
		table.insert(perc,{Ideal_evo, proba})
		if max_evo<1 then table.insert(perc,{max_evo, 0}) end		
		--if surnames[S]=='erocket' or  surnames[S]=='sniper' then pe = 0.05 rat=rat+0.1 end
		table.insert(res,{name, perc}) -- evo , power
		end
	end
return res
end



local fake_human_spawner = table.deepcopy(data.raw["unit-spawner"]["biter-spawner"])
fake_human_spawner.name=base_name .. "_spawner"
fake_human_spawner.max_health=1000 *hp_multiplier
concat_lists(fake_human_spawner.flags, {"not-flammable"})
fake_human_spawner.icon=path.. "graphics/entity/flying_saucer/flying_saucer_ico.png"
fake_human_spawner.map_color = data.raw["unit-spawner"]["biter-spawner"].map_color
fake_human_spawner.enemy_map_color = data.raw["unit-spawner"]["biter-spawner"].enemy_map_color
fake_human_spawner.corpse = nil -- "huge-scorchmark" --   base_name .. "_spawner_corpse" 
fake_human_spawner.dying_explosion = "big-explosion"
fake_human_spawner.damaged_trigger_effect = base_reactor.damaged_trigger_effect
fake_human_spawner.healing_per_tick = 0.01
fake_human_spawner.collision_box = {{-1, -1}, {1, 1}}
fake_human_spawner.selection_box = {{-1, -7}, {1, -0.5}}--{{-3.9, -2.7}, {3.9, 2.7}}
fake_human_spawner.map_generator_bounding_box = {{-4.3, -3.5}, {4.3, 3.5}}
fake_human_spawner.sticker_box = fake_human_spawner.selection_box
fake_human_spawner.hit_visualization_box = fake_human_spawner.selection_box
fake_human_spawner.shooting_cursor_size= 1
fake_human_spawner.autoplace = nil
fake_human_spawner.graphics_set = {animations = flying_saucer_animation()}
fake_human_spawner.max_count_of_owned_units = 4
fake_human_spawner.max_friends_around_to_spawn = 3
fake_human_spawner.spawning_cooldown = {60*30, 60*15}  -- default With zero evolution the spawn rate is 20 seconds, with max evolution it is 2.5 seconds
fake_human_spawner.spawn_decoration = nil
fake_human_spawner.spawn_decorations_on_expansion = nil
fake_human_spawner.absorptions_per_second = { pollution = { absolute = 30, proportional = 0.02 } }
fake_human_spawner.resistances = 
    {
      {
        type = "physical",
        decrease = 10,
        percent = 40
      },
      {
        type = "acid",
        percent = 40
      },	  
      {
        type = "explosion",
        decrease = 5,
        percent = 25
      },
	  {
        type = "laser",
        percent = 40
      },
	  {
        type = "electric",
        percent = 25
      },
	  {
        type = "poison",
        percent = 50
      },	  
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 100
      },	  
    }
if mods["Cold_biters"] then table.insert(fake_human_spawner.resistances,{type = "cold", percent = 50}) end
fake_human_spawner.working_sound = {sound = {{filename = path.."sounds/ufo.ogg",volume = 1.0}}}
fake_human_spawner.dying_sound = nil
fake_human_spawner.result_units = get_human_soldiers()
hack_scale(fake_human_spawner, 1.1)
data:extend({fake_human_spawner})	

--hack_tint(data.raw["unit-spawner"]["msi_protomolecule_spawner"], proto_color, false)

local boss_scale = 3.2
--[[local spawner_corpse = table.deepcopy(spawner_corpse)
spawner_corpse.name = base_name .. "_spawner_boss_corpse"
hack_scale(spawner_corpse, boss_scale)
data:extend({spawner_corpse})	
]]

local fake_human_boss_spawner = table.deepcopy(data.raw["unit-spawner"][base_name .. "_spawner"])
hack_scale(fake_human_boss_spawner,boss_scale)
fake_human_boss_spawner.name=base_name .. "_spawner_boss"
--fake_human_boss_spawner.corpse = base_name .. "_spawner_boss_corpse"
fake_human_boss_spawner.max_health = 2000000*hp_multiplier
fake_human_boss_spawner.resistances = {
	  {type = "fire", decrease = 10, percent = 10},
      {type = "physical", decrease = 20, percent = 60},
      {type = "impact", decrease = 20, percent = 90},
      {type = "explosion", decrease = 40, percent = 60},
      {type = "acid", decrease = 10, percent = 50},
      {type = "poison", percent = 30},
      {type = "laser", decrease = 10, percent = 50},
	  {type = "electric", decrease = 10, percent = 50},
	  }
if mods["cold_biters"] then table.insert(fake_human_boss_spawner.resistances,{type = "cold", percent = 50}) end
fake_human_boss_spawner.collision_box = {{-3.5*boss_scale, -2.5*boss_scale}, {3.5*boss_scale, 2.5*boss_scale}}
fake_human_boss_spawner.selection_box = fake_human_boss_spawner.collision_box
fake_human_boss_spawner.map_generator_bounding_box = fake_human_boss_spawner.collision_box
fake_human_boss_spawner.max_count_of_owned_units = 600
fake_human_boss_spawner.max_friends_around_to_spawn = 400
fake_human_boss_spawner.call_for_help_radius = 300
fake_human_boss_spawner.spawning_radius = 20
fake_human_boss_spawner.spawning_cooldown = {60*10, 60*3}  -- default With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
fake_human_spawner.corpse = "huge-scorchmark" --   base_name .. "_spawner_corpse" 
fake_human_spawner.dying_explosion = "nuke-explosion"
data:extend({fake_human_boss_spawner})

end






if add_turrets then 
-- SPECIAL TURRET / no ammo / power 
  local function add_ammo_turret(name)
  if data.raw["ammo-turret"][name] then 
    local gun_turret = table.deepcopy(data.raw["ammo-turret"][name])
    gun_turret.name=base_name ..'_'..name
   -- gun_turret.flags = {"placeable-player", "placeable-enemy", "not-repairable"}
    gun_turret.hidden = true
    gun_turret.attack_parameters.ammo_consumption_modifier = 0 -- does not consume ammo
    gun_turret.attack_parameters.damage_modifier = 1 + dmg_multiplier
    gun_turret.max_health = gun_turret.max_health * hp_multiplier
    data:extend({gun_turret})
  end
  end

  local function add_electric_turret(name)
    if data.raw["electric-turret"][name] then   
    local laser_turret = table.deepcopy(data.raw["electric-turret"][name])
    laser_turret.name=base_name ..'_'..name
   -- laser_turret.flags = {"placeable-player", "placeable-enemy", "not-repairable"}
    laser_turret.attack_parameters.ammo_type.energy_consumption = "0kJ"
    laser_turret.attack_parameters.damage_modifier = 3 * dmg_multiplier
    laser_turret.max_health = laser_turret.max_health * hp_multiplier
    laser_turret.hidden = true
    laser_turret.void_energy_source =
        {
          type = "electric",
          buffer_capacity = "15MJ",
          input_flow_limit = "7MW",
          drain = "1MW",
          usage_priority = "primary-input"
        }
    data:extend({laser_turret})
      end
    end

local turrets = {"gun-turret","railgun-turret","rocket-turret"}
for _,name in pairs(turrets) do add_ammo_turret(name) end

local turrets = {"laser-turret","tesla-turret"}
for _,name in pairs(turrets) do add_electric_turret(name) end
end


if add_nuker then  add_nuker_warfare() end
