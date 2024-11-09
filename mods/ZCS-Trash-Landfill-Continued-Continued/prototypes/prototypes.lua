data:extend({
  {
    type = "item",
    name = "zcs-trash-landfill",
    icon = "__ZCS-Trash-Landfill-Continued-Continued__/graphics/zcs-trash-landfill.png",
	icon_size = 32,
    subgroup = "storage",
    order = "a[landfill]",
    place_result = "zcs-trash-landfill",
    stack_size = 1
  },
  
  {
    type = "recipe",
    name = "zcs-trash-landfill",
    ingredients = {{"stone-brick",100},{"stone-wall",100}},
    result = "zcs-trash-landfill",
    result_count = 1,
    enabled = false
  },
  
  {
    type = "container",
    name = "zcs-trash-landfill",
    icon = "__ZCS-Trash-Landfill-Continued-Continued__/graphics/zcs-trash-landfill.png",
	icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "zcs-trash-landfill"},
    max_health = 200,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-8.4, -8.4}, {8.4, 8.4}},
    selection_box = {{-8.4, -8.4}, {8.4, 8.4}},
    fast_replaceable_group = "container",
    inventory_size = 32,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__ZCS-Trash-Landfill-Continued-Continued__/graphics/zcs-trash-landfill-entity.png",
      priority = "extra-high",
      width = 637,
      height = 637,
      shift = {-0, 0}
    },
  },
  
  {
    type = "technology",
    name = "zcs-trash-landfill",
    icon = "__ZCS-Trash-Landfill-Continued-Continued__/graphics/zcs-trash-landfill.png",
	icon_size = 32,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "zcs-trash-landfill"
      }
    },
    prerequisites =
    {
      --"advanced-material-processing",
      --"gates"
    },
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 1}
        --{"logistic-science-pack", 1}
      },
      time = 30
    }
  }
})