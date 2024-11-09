data:extend({
  {
    type = "double-setting",
    name = "lepp_light_size_factor",
    order = "aa",
    setting_type = "startup",
    default_value = 1, -- default size = 40 equal to a a small lamp on medium pole
    minimum_value = 0, -- 0 = don't scale, use small light everywhere
    maximum_value = 100,
  },
  {
    type = "int-setting",
    name = "lepp_light_max_size",
    order = "ab",
    setting_type = "startup",
    default_value = 75, -- game engine max light radius = 75
    minimum_value = 1,
  },
  {
    type = "string-setting",
    name = "lepp_pole_whitelist",
    order = "ba",
    setting_type = "startup",
    allow_blank = true,
    default_value = "fish-pole,slp-dec-med-pole,slp-dec-big-pole,slp-dec-sub-pole",
  },
  {
    type = "string-setting",
    name = "lepp_pole_blacklist",
    order = "bb",
    setting_type = "startup",
    allow_blank = true,
    default_value = "bi-power-to-rail-pole,bi-rail-hidden-power-pole,ee-super-electric-pole,ee-super-substation,se-pylon-construction,se-pylon-construction-radar",
  },
  {
    type = "string-setting",
    name = "lepp_tech_blacklist",
    order = "bc",
    setting_type = "startup",
    allow_blank = true,
    default_value = "",
  },
  {
    type = "string-setting",
    name = "lepp_tech_fallback",
    order = "bd",
    setting_type = "startup",
    allow_blank = false,
    default_value =  "lamp",
  },
})
