local sounds = require("__base__.prototypes.entity.sounds")
local nuke_shockwave_starting_speed_deviation = 0.075
local radius=40

data:extend({

   {
    type = "explosion",
    name = "atomic-explosion",
    flags = {"not-on-map"},
    animations = table.deepcopy(data.raw.explosion["nuke-explosion"].animations),
    light = {intensity = 1, size = 30+radius, color = {r=1.0, g=1.0, b=1.0}},
    sound = 
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.25
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.25
        }
      }
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
              type = "set-tile",
              tile_name = "nuclear-ground",
              radius = 12,
              apply_projection = true,
              tile_collision_mask = { layers={water_tile=true} }
            },
            {
              type = "destroy-cliffs",
              radius = 9,
              explosion_at_trigger = "explosion"
            },
            {
              type = "create-entity",
              entity_name = "nuke-explosion"
            },
            {
              type = "camera-effect",
              duration = 60,
              ease_in_duration = 5,
              ease_out_duration = 60,
              delay = 0,
              strength = 6,
              full_strength_max_distance = 200,
              max_distance = 800
            },
            {
              type = "play-sound",
              sound = sounds.nuclear_explosion(0.9),
              play_on_target_position = false,
              -- min_distance = 200,
              max_distance = 1000,
              -- volume_modifier = 1,
              audible_distance_modifier = 3
            },
            {
              type = "play-sound",
              sound = sounds.nuclear_explosion_aftershock(0.4),
              play_on_target_position = false,
              -- min_distance = 200,
              max_distance = 1000,
              -- volume_modifier = 1,
              audible_distance_modifier = 3
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
              radius = 14 -- large radius for demostrative purposes
            },
            {
              type = "create-decorative",
              decorative = "nuclear-ground-patch",
              spawn_min_radius = 11.5,
              spawn_max_radius = 12.5,
              spawn_min = 30,
              spawn_max = 40,
              apply_projection = true,
              spread_evenly = true
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 1000,
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
                repeat_count = 1000,
                radius = 35,
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
                repeat_count = 1000,
                radius = 26,
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
                repeat_count = 700,
                radius = 4,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                  starting_speed = 0.5 * 0.65,
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
                repeat_count = 1000,
                radius = 8,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                  starting_speed = 0.5 * 0.65,
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
                repeat_count = 300,
                radius = 26,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                  starting_speed = 0.5 * 0.65,
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
                      tile_collision_mask = {layers={water_tile=true}}
                    }
                  }
                }
              }
            }
          }
      }
    }
  },
})



function make_custom_nuke(name,radius)
data:extend({
   {
    type = "explosion",
    name = name,
    localised_name={"item-name.atomic-bomb"},
    flags = {"not-on-map"},
    animations = table.deepcopy(data.raw.explosion["nuke-explosion"].animations),
    light = {intensity = 1, size = 30+radius, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.25
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.25
        }
      }
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
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = radius,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.6 * 0.8,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = radius,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = radius,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },	
		  --[[{
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10,
              radius = radius,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "create-entity",
                    entity_name = "nuclear-smouldering-smoke-source",
                    tile_collision_mask = { "water-tile" }
                  }
                }
              }
            }
          },]]
		
    --[[      {
            type = "create-entity",
            entity_name = "big-scorchmark",
            check_buildability = true
          },]]
		  
        }
      }
    }
  }

})
end

make_custom_nuke("small-atomic-explosion",10)   --"mf-atomic-explosion-"..radius,


