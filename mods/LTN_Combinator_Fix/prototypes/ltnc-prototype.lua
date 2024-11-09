--[[
--]]

-- ENTITY
local ltnc_entity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
ltnc_entity.name = "ltn-combinator"
ltnc_entity.item_slot_count = 27
ltnc_entity.minable.result = "ltn-combinator"
ltnc_entity.fast_replaceable_group = "constant-combinator"
ltnc_entity.sprites = make_4way_animation_from_spritesheet({
  layers = {
    {
      filename = "__LTN_Combinator_Fix__/graphics/ltn-combinator.png",
      width = 58,
      height = 52,
      frame_count = 1,
      shift = util.by_pixel(0, 5),
      hr_version = {
        scale = 0.5,
        filename = "__LTN_Combinator_Fix__/graphics/hr-ltn-combinator.png",
        width = 114,
        height = 102,
        frame_count = 1,
        shift = util.by_pixel(0, 5),
      },
    },
    {
      filename = "__base__/graphics/entity/combinator/constant-combinator-shadow.png",
      width = 50,
      height = 34,
      frame_count = 1,
      shift = util.by_pixel(9, 6),
      draw_as_shadow = true,
      hr_version = {
        scale = 0.5,
        filename = "__base__/graphics/entity/combinator/hr-constant-combinator-shadow.png",
        width = 98,
        height = 66,
        frame_count = 1,
        shift = util.by_pixel(8.5, 5.5),
        draw_as_shadow = true,
      },
    },
  },
})

data:extend({ltnc_entity})

-- ITEM
local ltnc_item = table.deepcopy(data.raw["item"]["constant-combinator"]) 
ltnc_item.name = "ltn-combinator"
ltnc_item.icon = "__LTN_Combinator_Fix__/graphics/ltn-combinator-item.png"
ltnc_item.icon_size = 64
ltnc_item.icon_mipmaps = 4
ltnc_item.subgroup = "circuit-network"
ltnc_item.place_result="ltn-combinator"
ltnc_item.order = "c[combinators]-z[ltn-combinator]"
ltnc_item.stack_size= 50

data:extend({ltnc_item})

-- RECIPE
local ltnc_recipe = {}
ltnc_recipe.type = "recipe"
ltnc_recipe.name = "ltn-combinator"
ltnc_recipe.icon = "__LTN_Combinator_Fix__/graphics/ltn-combinator-item.png"
ltnc_recipe.icon_size = 64
ltnc_recipe.icon_mipmaps = 4
ltnc_recipe.enabled = false
ltnc_recipe.ingredients = {{"constant-combinator", 1}, {"electronic-circuit", 1}}
ltnc_recipe.result = "ltn-combinator"

data:extend({ltnc_recipe})
