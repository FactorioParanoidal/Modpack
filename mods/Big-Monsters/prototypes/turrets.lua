require("values")
local sounds = require("__base__/prototypes/entity/sounds.lua")
local enemy_autoplace = require ("__base__/prototypes/entity/enemy-autoplace-utils")
require ("__mferrari_lib__/prototypes/worms")
require ("__mferrari_lib__/prototypes/bosses_projectiles")

local behemoth_worm_scale = 2.2
local behemoth_worm_tint = {r=0.64, g=0.88, b=0.90, a=1.0}

local colossal_worm_scale = 3.3
local colossal_worm_tint = {r=0.94, g=0.98, b=0.90, a=1.0}

local boss_scale = 3.5
local Loot = get_mf_Loot()


--call worm lib
local wormkit = make_new_worm({
    name="maf-behemoth-worm-turret",
    max_health = 400000 * mf_hp_multiplier,
    resistances = acid_resistances,
    tint=behemoth_worm_tint,
    scale=behemoth_worm_scale,
    range = 48,
    stream = "bm-acid-stream",
    damage = 110 * mf_dmg_multiplier
    })
local worm = wormkit.worm
worm.build_base_evolution_requirement = 0.93
worm.autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(9, 6)")
worm.call_for_help_radius = 90
data:extend({worm, wormkit.corpse1,wormkit.corpse2})



local wormkit = make_new_worm({
  name="maf-colossal-worm-turret",
  max_health = 800000 * mf_hp_multiplier,
  resistances = acid_resistances,
  tint=colossal_worm_tint,
  scale=colossal_worm_scale,
  range = 50,
  stream = "maf-area-acid-projectile-purple",
  damage = 150 * mf_dmg_multiplier
  })
local worm = wormkit.worm
worm.build_base_evolution_requirement = 0.97
worm.loot = Loot
worm.autoplace = nil --enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(10, 7)")
worm.call_for_help_radius = 90
data:extend({worm, wormkit.corpse1,wormkit.corpse2})



local wormkit = make_new_worm({
  name="bm-worm-boss-acid-shooter",
  max_health = 1200000 *mf_hp_multiplier,
  resistances = acid_resistances,
  tint={r = 0, g = 1, b = 0},
  scale=boss_scale,
  range = 60,
  stream = "maf-area-acid-projectile-purple",
  damage = 200 * mf_dmg_multiplier
  })
local worm = wormkit.worm
worm.build_base_evolution_requirement = 1
worm.loot = Loot
worm.autoplace = enemy_autoplace.enemy_worm_autoplace("enemy_autoplace_base(10, 7)")
worm.call_for_help_radius = 120
data:extend({worm, wormkit.corpse1,wormkit.corpse2})

