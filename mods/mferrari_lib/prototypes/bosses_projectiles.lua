--[[ 
** FIRE projectile names
"mf-fire-sticker",
"mf-fire-splash-small",
"mf-fire-stream-small",
"mf-cluster-fire-projectile-small",
"mf-fire-splash-big",
"mf-fire-stream-big",
"mf-cluster-fire-projectile-big",
"mf-boss-fire-projectile-big",
"mf-fire-stream-small-t", --TURRETS
"mf-cluster-fire-projectile-small-t",
"mf-fire-stream-big-t",
"mf-cluster-fire-projectile-big-t",

**ACID VARIANTS
"bm-acid-sticker",
"bm-acid-splash-fire",
"bm-acid-stream",
"maf-area-acid-projectile-purple",
]]





local fire_tint = {r = 1.0, g = 0.3, b = 0.1, a = 1}
local small_scale =0.6
local big_scale = 1.2
local boss_scale = 2.5
local stream_worm_scale = 1.4


local mf_fire_flame = table.deepcopy(data.raw["fire"]["fire-flame"])
mf_fire_flame.name = "mf_fire_flame"
mf_fire_flame.localised_name={"entity-name.fire-flame"} 
mf_fire_flame.initial_lifetime = 700
mf_fire_flame.damage_per_tick = { amount = 100 / 60, type = "fire" }
mf_fire_flame.on_fuel_added_action = nil
mf_fire_flame.damage_multiplier_decrease_per_tick = 0.0005
mf_fire_flame.maximum_damage_multiplier = 1
mf_fire_flame.fade_out_duration = 60
mf_fire_flame.lifetime_increase_by = 0
data:extend({mf_fire_flame})


function get_proj_sprites(scale,tint)
return {  
particle =
{
  filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
  draw_as_glow = true,
  line_length = 5,
  width = 42,
  height = 164,
  frame_count = 15,
  shift = util.mul_shift(util.by_pixel(-2, 31), scale),
  tint = tint,
  priority = "high",
  scale = 0.5 * scale,
  animation_speed = 1
},
spine_animation =
{
  filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
  draw_as_glow = true,
  line_length = 5,
  width = 132,
  height = 20,
  frame_count = 15,
  shift = util.mul_shift(util.by_pixel(0, -1), scale),
  tint = tint,
  priority = "high",
  scale = 0.5 * scale,
  animation_speed = 1
},
shadow =
{
  filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
  line_length = 15,
  width = 42,
  height = 164,
  frame_count = 15,
  shift = util.mul_shift(util.by_pixel(-2, 31), scale),
  draw_as_shadow = true,
  priority = "high",
  scale = 0.5 * scale,
  animation_speed = 1
}}
end

function get_proj_sounds()
return {
  type = "play-sound",
  sound =
  {
    category = "enemy",
    variations =
    {
      {filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
      {filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
      {filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
      {filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg", volume = 0.65, modifiers = volume_multiplier("main-menu", 0.9)},
    },
    aggregation = {max_count = 3, remove = true, count_already_playing = true}
  }
}
end



function fire_stream(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    stream_light = {intensity = 1, size = 6}, -----
    ground_light = {intensity = 0.8, size = 6}, ---
    particle_buffer_size = 90,
    particle_spawn_interval = data.particle_spawn_interval,
    particle_spawn_timeout = data.particle_spawn_timeout,
    particle_vertical_acceleration = 0.005 * 0.60 *1.5, --x
    particle_horizontal_speed = 0.2* 0.75 * 1.5 * 1.5, --x
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_alpha_per_part = 0.8,
    particle_scale_per_part = 0.8,
    particle_loop_frame_count = 15,
    --particle_fade_out_threshold = 0.95,
    particle_fade_out_duration = 2, 
    particle_loop_exit_threshold = 0.25,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    initial_action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            get_proj_sounds(),
            {
              type = "create-fire",
              entity_name = data.splash_fire_name,
              tile_collision_mask = { layers={water_tile=true}},
              show_in_tooltip = true			  
            },
            {
              type = "create-entity",
              entity_name = "water-splash",
              tile_collision_mask = {layers={ground_tile=true}}
            },
            {
              type = "create-fire",
              entity_name = "mf_fire_flame",
              initial_ground_flame_count = 30,
              tile_collision_mask = { layers={water_tile=true}},
            },

          }
        }
      },
      {
        type = "area",
        radius = data.spit_radius,
        force = "enemy",
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.sticker_name
            },
            {
              type = "damage", --added so it can break stones
              damage = {amount = 10, type = "physical"}
            },
            {
              type = "damage",
              damage = {amount = 20, type = "fire"}
            }	
          }
        }
      }
    },
    particle        =get_proj_sprites(data.scale,data.tint).particle,
    spine_animation =get_proj_sprites(data.scale,data.tint).spine_animation,
    shadow          =get_proj_sprites(data.scale,data.tint).shadow,
    oriented_particle = true,
    shadow_scale_enabled = true,
  }
end

function fire_stream_cluster(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    stream_light = {intensity = 1, size = 4}, -----
    ground_light = {intensity = 0.8, size = 4}, ---
    particle_buffer_size = 90,
    particle_spawn_interval = data.particle_spawn_interval,
    particle_spawn_timeout = data.particle_spawn_timeout,
    particle_vertical_acceleration = 0.005 * 0.60 *1.5, --x
    particle_horizontal_speed = 0.2* 0.75 * 1.5 * 1.5, --x
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_alpha_per_part = 0.8,
    particle_scale_per_part = 0.8,
    particle_loop_frame_count = 15,
    --particle_fade_out_threshold = 0.95,
    particle_fade_out_duration = 2, 
    particle_loop_exit_threshold = 0.25,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    initial_action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            get_proj_sounds(),
            {
              type = "create-fire",
              entity_name = data.splash_fire_name,
              tile_collision_mask = { layers={water_tile=true}},
              show_in_tooltip = true			  
            },
            {
              type = "create-entity",
              entity_name = "water-splash",
              tile_collision_mask = {layers={ground_tile=true}}
            },
			{
			  type = "create-fire",
			  entity_name = "mf_fire_flame",
			  initial_ground_flame_count = 30,
			  tile_collision_mask = { layers={water_tile=true}},
			},			
			{
				type = "nested-result",
				action =
						{
							type = "cluster",
							cluster_count = 5,
							distance = 5,
							distance_deviation = 20,
							action_delivery =
							{
								type = "stream",
								stream =data.child_stream,
								starting_speed = 0.1,
								max_range = 20
							},
						}
			},
          }
        }
      },
      {
        type = "area",
        radius = data.spit_radius,
        force = "enemy",
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.sticker_name
            },
            {
              type = "damage", --added so it can break stones
              damage = {amount = 10, type = "physical"}
            },
            {
              type = "damage",
              damage = {amount = 20, type = "fire"}
            }	
          }
        }
      }
    },
    particle        =get_proj_sprites(data.scale,data.tint).particle,
    spine_animation =get_proj_sprites(data.scale,data.tint).spine_animation,
    shadow          =get_proj_sprites(data.scale,data.tint).shadow,
    oriented_particle = true,
    shadow_scale_enabled = true,
  }
end
	



function acid_stream_cluster(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    --stream_light = {intensity = 1, size = 4},
    --ground_light = {intensity = 0.8, size = 4},

    particle_buffer_size = 90,
    particle_spawn_interval = data.particle_spawn_interval,
    particle_spawn_timeout = data.particle_spawn_timeout,
    particle_vertical_acceleration = 0.005 * 0.60 *1.5, --x
    particle_horizontal_speed = 0.2* 0.75 * 1.5 * 1.5, --x
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_alpha_per_part = 0.8,
    particle_scale_per_part = 0.8,
    particle_loop_frame_count = 15,
    --particle_fade_out_threshold = 0.95,
    particle_fade_out_duration = 2, 
    particle_loop_exit_threshold = 0.25,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    initial_action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            get_proj_sounds(),
            {
              type = "create-fire",
              entity_name = data.splash_fire_name,
              tile_collision_mask = { layers={water_tile=true}},
              show_in_tooltip = true				  
            },
            {
              type = "create-entity",
              entity_name = "water-splash",
              tile_collision_mask = {layers={ground_tile=true}}
            },		
			{
				type = "nested-result",
				action =
						{
							type = "cluster",
							cluster_count = 5,
							distance = 5,
							distance_deviation = 20,
							action_delivery =
							{
								type = "stream",
								stream = "bm-acid-stream",
								starting_speed = 0.2,
								max_range = 20
							},
						}
			},
          }
        }
      },
      {
        type = "area",
        radius = data.spit_radius,
        force = "enemy",
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.sticker_name
            },
            {
              type = "damage",
              damage = {amount = 30, type = "acid"}
            }
          }
        }
      }
    },
    particle        =get_proj_sprites(data.scale,data.tint).particle,
    spine_animation =get_proj_sprites(data.scale,data.tint).spine_animation,
    shadow          =get_proj_sprites(data.scale,data.tint).shadow,
    oriented_particle = true,
    shadow_scale_enabled = true,
  }
end




data:extend(
{

  acid_sticker({
    name = "bm-acid-sticker",
    tint = sticker_tint_behemoth,
    slow_player_movement = 0.5,
    slow_vehicle_speed = 0.5,
    slow_vehicle_friction = 1.5,
    slow_seconds = 5
  }),
  
  acid_splash_fire({
    name = "bm-acid-splash-fire",
    scale = (boss_scale-1),
    tint = splash_tint_worm_behemoth,
    ground_patch_scale = (boss_scale-1) * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = 1,
    sticker_name = "bm-acid-sticker"
  }),
  
  acid_stream({
    name = "bm-acid-stream",
    scale = boss_scale-1,
    tint = stream_tint_worm_behemoth,
    corpse_name = "bm-acid-splash",
    spit_radius = stream_radius_worm_behemoth, --2
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "bm-acid-splash-fire",
    sticker_name = "bm-acid-sticker"
  }),

  acid_stream_cluster({
    name = "maf-area-acid-projectile-purple",
    scale = boss_scale,
    tint = stream_tint_worm_behemoth,
    corpse_name = "bm-acid-splash",
    spit_radius = stream_radius_worm_behemoth, --2
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "bm-acid-splash-fire",
    sticker_name = "bm-acid-sticker"
  }),

  


-- FIRE ATTACKS	
  
acid_sticker({
  name = "mf-fire-sticker",
  tint = fire_tint,
  slow_player_movement = 0.5,
  slow_vehicle_speed = 0.5,
  slow_vehicle_friction = 1.5,
  slow_seconds = 5
}),

acid_splash_fire({
  name = "mf-fire-splash-small",
  scale = small_scale,
  tint = fire_tint,
  ground_patch_scale = small_scale * ground_patch_scale_modifier,
  patch_tint_multiplier = patch_opacity,
  splash_damage_per_tick = 0.4,
  sticker_name = "mf-fire-sticker"
}),

fire_stream({
  name = "mf-fire-stream-small",
  scale = small_scale,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse",
  spit_radius = stream_radius_spitter_small,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-small",
  sticker_name = "mf-fire-sticker"
}),

fire_stream_cluster({
  name = "mf-cluster-fire-projectile-small",
  scale = small_scale,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse",
  spit_radius = stream_radius_spitter_small,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-small",
  sticker_name = "mf-fire-sticker",
cluster =2,
child_stream = 'mf-fire-stream-small'	
}),

---big-

acid_splash_fire({
  name = "mf-fire-splash-big",
  scale = big_scale,
  tint = fire_tint,
  ground_patch_scale = big_scale * ground_patch_scale_modifier,
  patch_tint_multiplier = patch_opacity,
  splash_damage_per_tick = 0.4,
  sticker_name = "mf-fire-sticker"
}),

fire_stream({
  name = "mf-fire-stream-big",
  scale = big_scale,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-big",
  spit_radius = stream_radius_spitter_big,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-big",
  sticker_name = "mf-fire-sticker"
}),

fire_stream_cluster({
  name = "mf-cluster-fire-projectile-big",
  scale = big_scale,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-big",
  spit_radius = stream_radius_spitter_big,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-big",
  sticker_name = "mf-fire-sticker",
cluster =3,
child_stream = 'mf-fire-stream-big'
}),


fire_stream_cluster({
  name = "mf-boss-fire-projectile-big",
  scale = boss_scale,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-big",
  spit_radius = stream_radius_worm_behemoth, --2
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-big",
  sticker_name = "mf-fire-sticker",
cluster = 3,	
child_stream = 'mf-fire-stream-big'	
}),

---  WORMS 
  fire_stream({
  name = "mf-fire-stream-small-t",
  scale = stream_worm_scale,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-t",
  spit_radius = stream_radius_spitter_small,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-small",
  sticker_name = "mf-fire-sticker"
}),

fire_stream_cluster({
  name = "mf-cluster-fire-projectile-small-t",
  scale = stream_worm_scale+0.5,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-t",
  spit_radius = stream_radius_spitter_small,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-small",
  sticker_name = "mf-fire-sticker",
child_stream = "mf-fire-stream-small-t",
cluster =2
}),

---big-

fire_stream({
  name = "mf-fire-stream-big-t",
  scale = stream_worm_scale+1,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-big-t",
  spit_radius = stream_radius_spitter_big,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-big",
  sticker_name = "mf-fire-sticker"
}),

fire_stream_cluster({
  name = "mf-cluster-fire-projectile-big-t",
  scale = stream_worm_scale+1.1,
  tint = fire_tint,
  corpse_name = "mf-fire-splash-corpse-big-t",
  spit_radius = stream_radius_spitter_big,
  particle_spawn_interval = 1,
  particle_spawn_timeout = 6,
  splash_fire_name = "mf-fire-splash-big",
  sticker_name = "mf-fire-sticker",
child_stream = "mf-fire-stream-big-t",
cluster =4
}),



})
