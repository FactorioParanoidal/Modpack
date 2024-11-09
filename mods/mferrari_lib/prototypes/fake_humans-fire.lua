local sounds = require("__base__/prototypes/entity/sounds.lua")


function flamethrower_shiftings(scale, offset)
  return
  {
    {0.0625 *  0, util.add_shift(util.mul_shift(util.by_pixel(   0, -135), scale * 0.5), util.by_pixel(  offset *    0, -offset *    1))},
    {0.0625 *  1, util.add_shift(util.mul_shift(util.by_pixel(  24, -133), scale * 0.5), util.by_pixel(  offset * 0.38, -offset * 0.92))},
    {0.0625 *  2, util.add_shift(util.mul_shift(util.by_pixel(  48, -121), scale * 0.5), util.by_pixel(  offset * 0.71, -offset * 0.71))},
    {0.0625 *  3, util.add_shift(util.mul_shift(util.by_pixel(  76, -105), scale * 0.5), util.by_pixel(  offset * 0.92, -offset * 0.38))},
    {0.0625 *  4, util.add_shift(util.mul_shift(util.by_pixel(  86,  -73), scale * 0.5), util.by_pixel(  offset *    1,  offset *    0))},
    {0.0625 *  5, util.add_shift(util.mul_shift(util.by_pixel(  74,  -43), scale * 0.5), util.by_pixel(  offset * 0.92,  offset * 0.38))},
    {0.0625 *  6, util.add_shift(util.mul_shift(util.by_pixel(  52,  -25), scale * 0.5), util.by_pixel(  offset * 0.71,  offset * 0.71))},
    {0.0625 *  7, util.add_shift(util.mul_shift(util.by_pixel(  26,  -17), scale * 0.5), util.by_pixel(  offset * 0.38,  offset * 0.92))},
    {0.0625 *  8, util.add_shift(util.mul_shift(util.by_pixel(   1,  -13), scale * 0.5), util.by_pixel(  offset *    0,  offset *    1))},
    {0.0625 *  9, util.add_shift(util.mul_shift(util.by_pixel( -27,  -16), scale * 0.5), util.by_pixel( -offset * 0.38,  offset * 0.92))},
    {0.0625 * 10, util.add_shift(util.mul_shift(util.by_pixel( -51,  -23), scale * 0.5), util.by_pixel( -offset * 0.71,  offset * 0.71))},
    {0.0625 * 11, util.add_shift(util.mul_shift(util.by_pixel( -71,  -41), scale * 0.5), util.by_pixel( -offset * 0.92,  offset * 0.38))},
    {0.0625 * 12, util.add_shift(util.mul_shift(util.by_pixel( -85,  -71), scale * 0.5), util.by_pixel( -offset *    1,  offset *    0))},
    {0.0625 * 13, util.add_shift(util.mul_shift(util.by_pixel( -71, -103), scale * 0.5), util.by_pixel( -offset * 0.92, -offset * 0.38))},
    {0.0625 * 14, util.add_shift(util.mul_shift(util.by_pixel( -49, -119), scale * 0.5), util.by_pixel( -offset * 0.71, -offset * 0.71))},
    {0.0625 * 15, util.add_shift(util.mul_shift(util.by_pixel( -23, -125), scale * 0.5), util.by_pixel( -offset * 0.38, -offset * 0.92))}
  }
end



function flamethrower_attack_parameters(data)
	return
		{
			type = "stream",
			ammo_category = "biological",
			cooldown = data.cooldown,
			cooldown_deviation = data.cooldown_deviation,
			range = data.range,
			range_mode = data.range_mode,
			min_range = data.min_range,
			min_attack_distance = data.min_attack_distance,
			--projectile_creation_distance = 1.9,
			damage_modifier = data.damage_modifier,
			warmup = 30,
			projectile_creation_parameters = flamethrower_shiftings(data.scale, data.scale),
			use_shooter_direction = true,
			lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 *1.5, -- this is same as particle horizontal speed of flamethrower fire stream
			ammo_type =
			{
			category = "biological",
			action =
			{
				type = "direct",
				action_delivery =
				{
				type = "stream",
						stream = "flamethrower-fire-stream"  -- v flamethrower-fire-stream
				}
			}
			},
			cyclic_sound =
			{
			begin_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-start-1.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-2.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-3.ogg",
				volume = 0.27
				},
				{
				filename = "__base__/sound/creatures/spitter-spit-start-4.ogg",
				volume = 0.27
				}
			},
			middle_sound =
			{
				{
				filename = "__base__/sound/fight/flamethrower-mid.ogg",
				volume = 0
				}
			},
			end_sound =
			{
				{
				filename = "__base__/sound/creatures/spitter-spit-end-1.ogg",
				volume = 0
				}
			}
			},
			--sound = sounds.flyer_roars(data.roarvolume),
			--animation = l9m2_flyerattackanimation(data.scale, data.tint1, data.tint2)
		}
end



function make_flamethrower_attack(damage_modifier, range, cooldown, scale )
return flamethrower_attack_parameters(
    {
      range = range,
	  min_range = 3,
      min_attack_distance = 18,
      cooldown = cooldown,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier,
      scale = scale,
      range_mode = "bounding-box-to-bounding-box"
    })
end





function add_nuker_warfare()
data:extend({
	-- small atomic rocket
	{
	  type = "projectile",
	  name = "mf-small-atomic-rocket",
	  flags = {"not-on-map"},
	  acceleration = 0.005,
	  turn_speed = 0.003,
	  turning_speed_increases_exponentially_with_projectile_speed = true,
	  action =
	  {
		type = "direct",
		action_delivery =
		{
		  type = "instant",
		  target_effects =
		  {
			{
			  type = "set-tile",
			  tile_name = "nuclear-ground",
			  radius = 4,
			  apply_projection = true,
			  tile_collision_mask = { layers={water_tile=true} }
			},
			{
			  type = "create-entity",
			  entity_name = "nuke-explosion"
			},
			{
			  type = "camera-effect",
			  effect = "screen-burn",
			  duration = 20,
			  ease_in_duration = 5,
			  ease_out_duration = 20,
			  delay = 0,
			  strength = 2,
			  full_strength_max_distance = 100,
			  max_distance = 200
			},
			{
			  type = "play-sound",
			  sound = sounds.nuclear_explosion(0.8),
			  play_on_target_position = false,
			  -- min_distance = 200,
			  max_distance = 400,
			  -- volume_modifier = 1,
			  audible_distance_modifier = 2
			},
			{
			  type = "play-sound",
			  sound = sounds.nuclear_explosion_aftershock(0.3),
			  play_on_target_position = false,
			  -- min_distance = 200,
			  max_distance = 400,
			  -- volume_modifier = 1,
			  audible_distance_modifier = 2
			},
			{
			  type = "damage",
			  damage = {amount = 400, type = "explosion"}
			},
			{
			  type = "create-entity",
			  entity_name = "huge-scorchmark",
			  offsets = {{ 0, -0.5 }},
			  check_buildability = true
			},
			{
			  type = "invoke-tile-trigger",
			  repeat_count = 1
			},
			{
			  type = "destroy-decoratives",
			  include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
			  include_decals = true,
			  invoke_decorative_trigger = true,
			  decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
			  radius = 4 -- large radius for demostrative purposes
			},
			{
			  type = "nested-result",
			  action =
			  {
				type = "area",
				target_entities = false,
				trigger_from_target = true,
				repeat_count = 500,
				radius = 7,
				action_delivery =
				{
				  type = "projectile",
				  projectile = "atomic-bomb-ground-zero-projectile",
				  starting_speed = 0.6 * 0.8,
				  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
				}
			  }
			},
			{
			  type = "nested-result",
			  action =
			  {
				type = "area",
				target_entities = false,
				trigger_from_target = true,
				repeat_count = 500,
				radius = 8,
				action_delivery =
				{
				  type = "projectile",
				  projectile = "atomic-bomb-wave",
				  starting_speed = 0.5 * 0.7,
				  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
				}
			  }
			},
			{
			  type = "nested-result",
			  action =
			  {
				type = "area",
				show_in_tooltip = false,
				target_entities = false,
				trigger_from_target = true,
				repeat_count = 500,
				radius = 8,
				action_delivery =
				{
				  type = "projectile",
				  projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
				  starting_speed = 0.5 * 0.7,
				  starting_speed_deviation = nuke_shockwave_starting_speed_deviation
				}
			  }
			},
			  {
			  type = "nested-result",
			  action =
			  {
				type = "area",
				show_in_tooltip = false,
				target_entities = false,
				trigger_from_target = true,
				repeat_count = 10,
				radius = 8,
				action_delivery =
				{
				  type = "instant",
				  target_effects =
				  {
					{
					  type = "create-entity",
					  entity_name = "nuclear-smouldering-smoke-source",
					  tile_collision_mask = { layers={water_tile=true} }
					}
				  }
				}
			  }
			}
		  }
		}
	  },
	  --light = {intensity = 0.8, size = 15},
	  animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({0.3, 1, 0.3}),
	  shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
	  smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
	},
	
	

	
	-- mini nuke rocket ammo
	{
	  type = "ammo",
	  name = "maf-small-atomic-rocket",
	icons= {{icon = "__base__/graphics/icons/atomic-bomb.png",icon_size = 64, scale=0.6}},
	  pictures =
	  {
		layers =
		{
		  {
			size = 64,
			filename = "__base__/graphics/icons/atomic-bomb.png",
			scale = 0.25,
			mipmap_count = 4,
		scale=0.75,
		  },
		  {
			draw_as_light = true,
			flags = {"light"},
			size = 64,
			filename = "__base__/graphics/icons/atomic-bomb-light.png",
			scale = 0.25,
			mipmap_count = 4,
		scale=0.75,
		  }
		}
	  },
	  ammo_category = "rocket",
	  ammo_type =
	  {
		range_modifier = 1.5,
		cooldown_modifier = 5,
		target_type = "position",
		
		action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "projectile",
			projectile = "mf-small-atomic-rocket",
			starting_speed = 0.05,
			source_effects =
			{
			  type = "create-entity",
			  entity_name = "explosion-hit"
			}
		  }
		}
	  },
	  subgroup = "ammo",
	  order = "d[rocket-launcher]-c[atomic-bomb]m",
	  stack_size = 10
	},
	
})
end  
	