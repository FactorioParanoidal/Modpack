local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local resistances = require("__mferrari_lib__.prototypes.resistances")
require ("__mferrari_lib__/proto")
require ("__mferrari_lib__/prototypes/loot")
require ("__mferrari_lib__/prototypes/worms_animations")

local boss_scale = 3.5

local Loot = get_mf_Loot() 

local red={r = 1, g = 0, b = 0}
-- The mod calling this may have globals
local boss_hp_multiplier  = mf_hp_multiplier or 1
local boss_dmg_multiplier = mf_dmg_multiplier or 1


data:extend(
{
 
  {
    type = "turret",
    name = "maf-worm-boss-fire-shooter",
    icon = "__base__/graphics/icons/behemoth-worm.png",
	  icon_size = 64, 
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    max_health = 500000 * boss_hp_multiplier,
    order="b-b-f",
    subgroup="enemies",
    resistances = resistances.boss_fireworm,
    healing_per_tick = 0.02,
    collision_box = {{-4, -4}, {4, 4}},
    selection_box = {{-4, -4}, {4, 4}},
    map_generator_bounding_box = {{-5, -5}, {5, 5}},
    damaged_trigger_effect = hit_effects.biter(),
    graphics_set = {},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "maf-boss-fire-shooter-worm-corpse",
    folded_state_corpse = "maf-boss-fire-shooter-worm-corpse-burrowed",
    dying_explosion = "big-artillery-explosion",
    dying_sound = sounds.worm_dying(2.0),
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(boss_scale, red),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(boss_scale, red, "forward"),
    preparing_sound = sounds.worm_standup(2),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(boss_scale, red),
    prepared_sound = sounds.worm_breath(2),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(boss_scale, red),
    prepared_alternative_sound = sounds.worm_roar_alternative(2),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(boss_scale, red),
    starting_attack_sound = sounds.worm_roars(2),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(boss_scale, red),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(boss_scale, red, "backward"),
    folding_sound = sounds.worm_fold(2),
    integration = worm_integration(boss_scale),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,
    prepare_range = range_worm_behemoth + prepare_range_worm_behemoth,
    allow_turning_when_starting_attack = true,
	  call_for_help_radius = 300,
    loot = Loot,
	  build_base_evolution_requirement = 1,
--    autoplace = enemy_autoplace.enemy_worm_autoplace(10),
    attack_parameters =
    {
      type = "stream",
      ammo_category = "biological",
      damage_modifier = 100 * boss_dmg_multiplier,
      cooldown = 120,
      range = 80,
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(boss_scale, boss_scale * scale_worm_stream),
      use_shooter_direction = true,
      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "mf-cluster-fire-projectile-big-t",
            duration = 100,
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
  },
 
  mf_worm_corpse("maf-boss-fire-shooter-worm", boss_scale, red,"f"),
  mf_worm_corpse_burrowed("maf-boss-fire-shooter-worm", boss_scale, red,"f"),
  }
)
