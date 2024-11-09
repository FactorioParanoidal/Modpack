local path = "__mferrari_lib__/"
local colors = require("__mferrari_lib__/colors")
require("__mferrari_lib__/prototypes/flying_saucer_animation")


local sprite_fields = {
    "upper_part",
    "lower_part",
    "upper_part_shadow",
    "lower_part_shadow",
    "upper_part_water_reflection",
    "lower_part_water_reflection",
    "joint",
    "joint_shadow",
}



local movement_speed = 10
-- invisible spider legs
for n = 1, 8 do
	local spider_leg = table.deepcopy(data.raw["spider-leg"]["spidertron-leg-"..n])
	spider_leg.name = 'spidertron-invisible-leg-'..n
	for _, field in pairs(sprite_fields) do
        spider_leg.graphics_set[field] = nil
		end
	spider_leg.localised_name = {"entity-name.spidertron-leg"}
	spider_leg.working_sound = nil
	spider_leg.collision_box = nil
	spider_leg.collision_mask = nil
	spider_leg.selection_box = {{-0, -0}, {0, 0}}
	spider_leg.target_position_randomisation_distance = 0
	spider_leg.walking_sound_volume_modifier = 0
	spider_leg.initial_movement_speed = 0.06 * movement_speed
    spider_leg.movement_acceleration = 0.03 * movement_speed
	data:extend({spider_leg})	
	end




-- The mod calling this may have globals
local boss_hp_multiplier  = mf_hp_multiplier or 1
local boss_hp_variant     = mf_hp_variant or 1
local boss_dmg_multiplier = mf_dmg_multiplier or 1



local function add_flying_saucer(k)
local flyind_saucer = table.deepcopy(data.raw["spider-vehicle"].spidertron)
flyind_saucer.name="maf_flying_saucer_"..k 
flyind_saucer.icon= path .."graphics/entity/flying_saucer/flying_saucer_ico.png"
flyind_saucer.icon_size=64
flyind_saucer.max_health = (20000 * k^boss_hp_variant) * boss_hp_multiplier/boss_hp_variant
flyind_saucer.localised_name = {"entity-name.maf_flying_saucer"}
flyind_saucer.allow_passengers = false
flyind_saucer.automatic_weapon_cycling = true
flyind_saucer.inventory_size = 10 + 5*k
flyind_saucer.chunk_exploration_radius = 1
flyind_saucer.hit_visualization_box = {{-2, -4}, {2, -2}}
flyind_saucer.height = 2
flyind_saucer.corpse ="big-remnants"
flyind_saucer.dying_explosion = "nuke-explosion"
flyind_saucer.minable=nil
--flyind_saucer.hide_resistances = false
flyind_saucer.minimap_representation =
    {
      filename = path .."graphics/entity/flying_saucer/flying_saucer_ico.png",
      flags = {"icon"},
      size = {64, 64},
      scale = 0.8
    }
flyind_saucer.resistances = {
	  {type = "fire", percent = 30+k*5},
	  --{type = "cold", percent = 80+k},
      {type = "physical", percent = 30+k*5},
      {type = "impact", decrease = 10, percent = 20+k*5},
      {type = "explosion", percent = 30+k*5},
      {type = "acid", percent = 30+k*2},
      {type = "poison", percent = 100},
      {type = "laser", percent = -50+k*5},
	  {type = "electric", percent = -50+k*5},
	  }
for L=1,8 do 
	flyind_saucer.spider_engine.legs[L].leg='spidertron-invisible-leg-'..L
	flyind_saucer.spider_engine.legs[L].leg_hit_the_ground_trigger=nil
	end
	
flyind_saucer.graphics_set.base_animation = nil
flyind_saucer.graphics_set.shadow_base_animation = nil
flyind_saucer.graphics_set.animation = flying_saucer_animation()
flyind_saucer.graphics_set.shadow_animation = nil
flyind_saucer.graphics_set.eye_light= nil
flyind_saucer.guns = {"spidertron-rocket-launcher-1", "spidertron-rocket-launcher-2","flying-saucer-laser-cannon" } -- "tank-flamethrower"
flyind_saucer.working_sound = {sound = {{filename = path.."sounds/ufo.ogg",volume = 1.0}}}

data:extend({flyind_saucer})
end
for x=1,10 do add_flying_saucer(x) end





data:extend({
  {
    type = "gun",
    name = "flying-saucer-laser-cannon",
    icon = path .."graphics/entity/flying_saucer/laser-cannon.png",
    icon_size = 64,
    hidden = true,
    subgroup = "gun",
    order = "f-s-c",
	
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "flying-saucer-laser",
	    ammo_consumption_modifier = 0,
      cooldown = 120,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 3,
      projectile_center = {0, -2},
      range = 40,
      sound =
		{
		  {
			filename = "__base__/sound/fight/laser-1.ogg",
			volume = 1
		  },
		  {
			filename = "__base__/sound/fight/laser-2.ogg",
			volume = 1
		  },
		  {
			filename = "__base__/sound/fight/laser-3.ogg",
			volume = 1
		  }
		},
    },
    stack_size = 1
  },


  {
    type = "ammo",
    name = "flying-saucer-laser-ammo",
    icon = "__base__/graphics/icons/flamethrower-ammo.png",
    icon_size = 64,
    ammo_category = "flying-saucer-laser",
    ammo_type =
    {
      
      target_type = "direction",
      clamp_position = true,
      action =
      {
        type = "line",
        range = 50,
        width = 1,
		action_delivery = {
            type = "projectile",
            projectile = "flying-saucer-laser-projectile",
            starting_speed = 1,
            direction_deviation = 0.1,
            range_deviation = 0.1,
            max_range = 40, 
			}
      }
    },
    magazine_size = 5,
    subgroup = "ammo",
    order = "f-s-c",
    stack_size = 200
},



  {
  	type = "ammo-category",
  	name = "flying-saucer-laser",
    bonus_gui_order = "maf",
  },


  {
    type = "projectile",
    name = "flying-saucer-laser-projectile",
    flags = { "not-on-map" },
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 80*boss_dmg_multiplier, type = "laser" },
          },
          {
            type = "create-entity",
            entity_name = "big-explosion",
          },
        },
      },
    },
    final_action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {

          {
            type = "create-entity",
            entity_name = "big-explosion",
          },
          {
            type = "show-explosion-on-chart",
            scale = 1,
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 4,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 50*boss_dmg_multiplier, type = "explosion" },
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion",
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = path .. "graphics/entity/flying_saucer/laser.png",
      frame_count = 1,
      width = 6,
      height = 120,
      priority = "high",
    },
    light = { intensity = 2, size = 15, color = colors.pink },
  },
  
})
--data.raw["utility-constants"].default.bonus_gui_ordering["laser-cannon"] = "maf"



