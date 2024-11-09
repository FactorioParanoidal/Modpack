require ("__mferrari_lib__/prototypes/worms_animations")

function make_new_worm(datatab)
  --raw = vanilla raw
  --name,max_health,stream,damage,icon,call_for_help),resistances
local worm 
if datatab.raw then worm=table.deepcopy(datatab.raw) else worm=table.deepcopy(data.raw.turret["behemoth-worm-turret"]) end
worm.name=datatab.name
if icon then worm.icon=datatab.icon end
worm.max_health = datatab.max_health
if datatab.resistances then worm.resistances=datatab.resistances end

worm.folded_animation = worm_folded_animation(datatab.scale, datatab.tint)
worm.preparing_animation = worm_preparing_animation(datatab.scale, datatab.tint, "forward")
worm.prepared_animation = worm_prepared_animation(datatab.scale, datatab.tint)
worm.prepared_alternative_animation = worm_prepared_alternative_animation(datatab.scale, datatab.tint)
worm.starting_attack_animation = worm_start_attack_animation(datatab.scale, datatab.tint)
worm.ending_attack_animation = worm_end_attack_animation(datatab.scale, datatab.tint)
worm.folding_animation =  worm_preparing_animation(datatab.scale, datatab.tint, "backward")
worm.integration = worm_integration(datatab.scale, true)
worm.corpse = datatab.name .. "-corpse"
worm.folded_state_corpse = datatab.name .. "-corpse-burrowed"
worm.attack_parameters.damage_modifier = datatab.damage or worm.attack_parameters.damage_modifier
worm.attack_parameters.range = datatab.range or worm.attack_parameters.range
worm.attack_parameters.ammo_type.action.action_delivery.stream = datatab.stream
--worm.attack_parameters.ammo_type.action.action_delivery.duration = 200
worm.attack_parameters.projectile_creation_parameters = worm_shoot_shiftings(datatab.scale, datatab.scale * 1)


local corpse1 = mf_worm_corpse(datatab.name, datatab.scale or 1, datatab.tint,"w")
local corpse2 = mf_worm_corpse_burrowed(datatab.name, datatab.scale or 1, datatab.tint,"w")
return {worm=worm,corpse1=corpse1,corpse2=corpse2}
end
