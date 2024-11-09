local sounds = require("__base__.prototypes.entity.sounds")


local default_ended_in_water_trigger_effect = function()
  return
  {
    {
      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "secondary",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "primary",
      offsets =
      {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 }
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0,
      tail_width = 1
    },
    {
      type = "play-sound",
      sound = sounds.small_splash
    }
  }

end


local make_my_particle = function(params)
  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle =
  {
    type = "optimized-particle",
    name = params.name,
    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,
    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",
    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,
    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,
    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,
    mining_particle_frame_speed = params.mining_particle_frame_speed,
  }
  return particle
end



---- RED BLOOD
local shadowtint={r = 0, g = 0, b = 0}
local red_blood={r = 200, g = 15, b = 15}


local get_blood_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
      line_length = 12,
      width = 32,
      height = 24,
      frame_count = 12,
      variation_count = 7,
      tint=options.tint,
      scale = 0.5 * options.scale,
      shift = util.add_shift(util.by_pixel(0,0.5), options.shift)
    }
  }
end



data:extend(
{
make_my_particle{
    name = "mf-red-blood-particle",
    life_time = 180,
    pictures = get_blood_particle_pictures({ tint =red_blood, scale = 0.75}),
    shadows = get_blood_particle_pictures({tint = shadowtint, shift = util.by_pixel (1,0), scale = 0.75}),
    draw_shadow_when_on_ground = false,
    ended_in_water_trigger_effect = false,
    movement_modifier_when_on_ground = 0,
    render_layer = "higher-object-under"
  }
})



-- used on fake humans
local blood_explosion_hit = {
    type = "explosion",
    name = "maf-blood-damaged-explosion-hit",
    icon = "__base__/graphics/icons/small-biter.png",
    icon_size = 64, 
    flags = {"not-on-map"},
    subgroup = "hit-effects",
    height = 0.3,
    animations =
    {
      util.empty_sprite()
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "maf-red-blood-fountain-hit-spray",
            repeat_count = 1
          },
        }
      }
    }
  }

local  red_blood_fountain_hit_spray = {
    type = "particle-source",
    name = "maf-red-blood-fountain-hit-spray",
    subgroup = "particles",
    particle = "mf-red-blood-particle",
    icon_size = 32,
    time_to_live = 10,
    time_to_live_deviation = 5,
    time_before_start = 0,
    time_before_start_deviation = 0,
    height = 0.3,
    height_deviation = 0.1,
    vertical_speed = 0.02,
    vertical_speed_deviation = 0.08,
    horizontal_speed = 0.07,
    horizontal_speed_deviation = 0.04
  }
data:extend({blood_explosion_hit,red_blood_fountain_hit_spray})

----  die explosion 
local effect_blood_explosion =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 3,
        repeat_count_deviation = 2,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "mf-red-blood-particle",
        offsets =
        {
          { 0, -0.8 },
          { 0, -0.25 }
        },
        offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
        tile_collision_mask = nil,
        initial_height = 0.9,
        initial_height_deviation = 0.9,
        initial_vertical_speed = 0.03,
        initial_vertical_speed_deviation = 0.03,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0.02,
        tail_length = 12,
        tail_length_deviation = 25,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 9,
        repeat_count_deviation = 0,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "mf-red-blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.075,
        initial_vertical_speed_deviation = 0.075,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.03,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 21,
        tail_length_deviation = 3,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 13,
        repeat_count_deviation = 1,
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "mf-red-blood-particle",
        offsets = { { 0, 0 } },
        offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
        tile_collision_mask = nil,
        initial_height = 0.1,
        initial_height_deviation = 0.1,
        initial_vertical_speed = 0.01,
        initial_vertical_speed_deviation = 0.01,
        speed_from_center = 0.05,
        speed_from_center_deviation = 0.05,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 11,
        tail_length_deviation = 7,
        tail_width = 3
      },
    }
  }
}


local empty_explosion = function(params)
  return
  {
    type = "explosion",
    name = params.name,
    localised_name = params.localised_name,
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect = params.created_effect
  }
end

data:extend({
  empty_explosion(
  {
    name = "maf-blood-explosion",
    created_effect = effect_blood_explosion
  }),
})


