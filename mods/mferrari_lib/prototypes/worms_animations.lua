require ("__base__.prototypes.entity.worm-animations")

function mf_worm_corpse(name, scale, tint, order_char, icon)
  local tab = {}
  order_char = order_char or "a"
  tab.type = "corpse"
  tab.name = name .. "-corpse"
  tab.icon = icon or "__base__/graphics/icons/behemoth-worm-corpse.png"
  tab.selection_box = {{-0.8, -0.8}, {0.8, 0.8}}
  tab.selectable_in_game = false
  tab.dying_speed = 0.01
  tab.time_before_removed = 15 * 60 * 60
  tab.subgroup = "corpses"
  tab.order = "c[corpse]-c[worm]-".. order_char .."[" .. name .. "]"
  tab.flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  tab.hidden_in_factoriopedia = true
  tab.final_render_layer = "lower-object-above-shadow"
  tab.animation = worm_die_animation(scale, tint)
  tab.decay_animation = worm_decay_animation(scale, tint)
  tab.decay_frame_transition_duration = 6 * 60
  tab.ground_patch =
  {
    sheet = worm_integration(scale)
  }
  tab.ground_patch_decay =
  {
    sheet = worm_integration_decay(scale)
  }
  return tab
end

function mf_worm_corpse_burrowed(name, scale, tint, order_char)
  local tab = mf_worm_corpse(name, scale, tint, order_char)
  tab.name = tab.name .. "-burrowed"
  tab.order = tab.order .. "-burrowed"
  tab.animation = worm_die_burrowed_animation(scale, tint)
  return tab
end
