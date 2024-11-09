-- IRONWORKS

--SET-UP BASE CASTING RECIPES TO COPY LATER
data:extend(
{
  {
    type = "recipe",
    name = "angels-iron-pipe-casting",
    category = "casting",
    subgroup = "angels-iron-casting",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "liquid-molten-iron", amount = 40},
    },
    results =
    {
      { type = "item", name = "pipe", amount = 4},
    },
    order = "ya",
  },
  {
    type = "recipe",
    name = "angels-iron-pipe-to-ground-casting",
    category = "casting",
    subgroup = "angels-iron-casting",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "liquid-molten-iron", amount = 150},
    },
    results=
    {
      { type = "item", name = "pipe-to-ground", amount = 2},
    },
    order = "yb",
  },
})
-- bobs pipe casting
if mods["boblogistics"] and mods["bobplates"] then
  --call pipe metal types (metal_tab)
  for n,metal in pairs(ASE.tables.metal_tab) do
    --metal straight pipes
    local m_pipe = table.deepcopy(data.raw.recipe["angels-iron-pipe-casting"])

    m_pipe.name = "angels-"..metal.."-pipe-casting"
    m_pipe.subgroup = "angels-"..metal.."-casting"
    m_pipe.ingredients = {{ type = "fluid", name = "liquid-molten-"..metal, amount = 40},}
    m_pipe.results = {{ type = "item", name = metal.."-pipe", amount = 4},}
    --metal UG pipes
    local u_pipe = table.deepcopy(data.raw.recipe["angels-iron-pipe-to-ground-casting"])

    local ug_multi = {
      ["copper"] = 150,
      ["stone"] = 15,
      ["steel"] = 170,
      ["plastic"] = 170,
      ["titanium"] = 210,
      ["brass"] = 190,
      ["bronze"] = 170,
      ["nitinol"] = 230,
      ["tungsten"] = 21,
      ["copper-tungsten"] = 5 --should be 23
    }
    --iron is 15x for UG
    u_pipe.name = "angels-"..metal.."-pipe-to-ground-casting"
    u_pipe.subgroup = "angels-"..metal.."-casting"
    u_pipe.ingredients = {{ type = "fluid", name = "liquid-molten-"..metal, amount = ug_multi[metal]},}
    u_pipe.results = {{ type = "item", name = metal.."-pipe-to-ground", amount = 2},}
    --tungsten-fixes
    if metal == "tungsten" then
      m_pipe.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 4}
      m_pipe.category = "sintering"
      u_pipe.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = ug_multi[metal]}
      u_pipe.category = "sintering"
    end
    --plastic
    if metal == "plastic" then
      m_pipe.ingredients[1] = { type = "fluid", name = "liquid-plastic", amount = 4}
      m_pipe.subgroup = "angels-alloys-casting"
      u_pipe.ingredients[1] = { type = "fluid", name = "liquid-plastic", amount = ug_multi[metal]}
      u_pipe.subgroup = "angels-alloys-casting"
    end
    --stone
    if metal == "stone" then
      m_pipe.ingredients[1] = { type = "item", name = "stone", amount = 4*5}
      m_pipe.category = "sintering"
      u_pipe.ingredients[1] = { type = "item", name = "stone", amount = ug_multi[metal]*5}
      u_pipe.category = "sintering"
    end
    --copper-tungsten
    if metal == "copper-tungsten" then
      m_pipe.ingredients[1] = { type = "item", name = "powdered-tungsten", amount = 3}
      m_pipe.ingredients[2] = { type = "item", name = "powder-copper", amount = 1}
      m_pipe.category = "sintering"
      m_pipe.subgroup = "angels-alloys-casting"
      u_pipe.ingredients[1] = { type = "item", name = "powdered-tungsten", amount = ug_multi[metal]*3}
      u_pipe.ingredients[2] = { type = "item", name = "powder-copper", amount = ug_multi[metal]*2}
      u_pipe.category = "sintering"
      u_pipe.subgroup = "angels-alloys-casting"
    end
    --ceramic
    --==NO CERAMICS AT THIS POINT==--
    data:extend({m_pipe,u_pipe})
  end
end
--SETTING UP CASTING MOLD ITEMS and RECIPES
data:extend({
  --expendable mold recipe (want roasted)
  {
    type = "recipe",
    name = "ASE-sand-die",
    category = "sintering",
    subgroup = "angels-mold-casting",
    energy_required = 8,
    enabled = false,
    icons = {
      {
        icon = "__angelssmelting__/graphics/icons/expendable-mold.png",
        icon_size = 32,
        icon_mipmaps = 1
      },
      {
        icon = "__angelssmelting__/graphics/icons/expendable-mold.png",
        icon_size = 32,
        icon_mipmaps = 1,
        tint = {.91, .89, .79, .5}
      },
      {
        icon = "__angelsrefining__/graphics/icons/solid-sand.png",
        icon_size = 32,
        scale = 0.4375,
        shift = { 10, -10}
      }
    },
    icon_size = 32,
    ingredients = {
      { type = "item", name = "solid-sand", amount = 40},
      { type = "item", name = "powder-steel", amount = 1}
    },
    results = {
      { type = "item", name = "ASE-sand-die", amount = 8},
    },
    order = "aa",
  },
  --non-expendable mold recipe (initial)
  {
    type = "recipe",
    name = "ASE-metal-die",
    category = "sintering",
    subgroup = "angels-mold-casting",
    icons = angelsmods.functions.add_number_icon_layer(
      {
        {
          icon = "__angelssmelting__/graphics/icons/non-expendable-mold.png",
          icon_size = 32,
          icon_mipmaps = 1
        },
        {
          icon = "__angelssmelting__/graphics/icons/non-expendable-mold.png",
          icon_size = 32,
          icon_mipmaps = 1,
          tint = {.91, .89, .79, .5}
        },
        {
          icon = "__angelssmelting__/graphics/icons/powder-steel.png",
          icon_size = 64,
          scale = 0.4375*0.5,
          shift = {10, -10},
        },
      }, 1, angelsmods.smelting.number_tint),
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "solid-zinc-oxide", amount = 40},
      { type = "item", name = "powder-steel", amount = 10}
    },
    results = {
      { type = "item", name = "ASE-metal-die", amount = 8},
    },
    order = "ab",
  },

  --non-expendable mold washing
  {
    type = "recipe",
    name = "ASE-metal-die-wash",
    category = "crafting-with-fluid",
    subgroup = "angels-mold-casting",
    energy_required = 8,
    enabled =false,
    icons = angelsmods.functions.add_number_icon_layer(
      angelsmods.functions.get_object_icons("ASE-spent-metal-die"),
      2, angelsmods.smelting.number_tint),
    ingredients = {
      { type = "item", name = "ASE-spent-metal-die", amount = 3},
      { type = "fluid", name = "liquid-nitric-acid", amount = 20}
    },
    results = {
      { type = "item", name = "ASE-metal-die", amount = 3},
      { type = "fluid", name = "water-red-waste", amount = 20},
    },
    order = "ac",
  },
})
--SET-UP BASE CASTING RECIPES TO COPY LATER
--iron gears
data:extend(
{
  {
    type = "recipe",
    name = "angels-iron-gear-wheel-casting",
    category = "casting",
    subgroup = "angels-iron-casting",
    localised_name = {"recipe-name.reg-casting", { "lookup.iron"}, {"string.gear"}},
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "liquid-molten-iron", amount = 80},
    },
    results =
    {
      { type = "item", name = "iron-gear-wheel", amount = 8},
    },
    order = "yc",
  },
  {
    type = "recipe",
    name = "ASE-iron-gear-casting-expendable",
    category = "casting",
    subgroup = "angels-iron-casting",
    localised_name = { "recipe-name.sand-casting", { "lookup.iron"}, {"string.gear"}},
    energy_required = 0.5,
    enabled = false,
    icons = {
      { icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64,},
      { 
        icon = "__angelssmelting__/graphics/icons/expendable-mold.png",
        icon_size = 32,
        scale = 0.4375,
        shift = {-10, -10}
      },
      { 
        icon = "__angelssmelting__/graphics/icons/expendable-mold.png",
        icon_size = 32,
        scale = 0.4375,
        shift = {-10, -10},
        tint = {.91, .89, .79, .5}
      },
    },
    ingredients = {
      { type = "fluid", name = "liquid-molten-iron", amount = 80},
      { type = "item", name = "ASE-sand-die", amount = 2}
    },
    results =
    {
      {type = "item", name = "iron-gear-wheel", amount = 11},
      {type = "item", name = "solid-sand", amount = 5},
    },
    order = "yd",
  },
  {
    type = "recipe",
    name = "ASE-iron-gear-casting-advanced",
    category = "casting",
    subgroup = "angels-iron-casting",
    localised_name = { "recipe-name.die-casting", { "lookup.iron"}, {"string.gear"}},
    energy_required = 0.5,
    enabled = false,
    icons = {
      { icon = "__base__/graphics/icons/iron-gear-wheel.png", icon_size = 64,},
      {
        icon = "__angelssmelting__/graphics/icons/non-expendable-mold.png",
        icon_size = 32,
        scale = 0.4375,
        shift = {-10, -10},
      },
      {
        icon = "__angelssmelting__/graphics/icons/non-expendable-mold.png",
        icon_size = 32,
        scale = 0.4375,
        shift = {-10, -10},
        tint = {.91, .89, .79, .5}
      },
    },
    ingredients = {
      { type = "fluid", name = "liquid-molten-iron", amount = 80},
      { type = "item", name = "ASE-metal-die", amount = 3},
    },
    results = 
    {
      { type = "item", name = "iron-gear-wheel", amount = 15},
      { type = "item", name = "ASE-spent-metal-die", amount = 3},
    },
    order = "ye",
  },
})
if mods["bobplates"] then
for n,metal in pairs(ASE.tables.gears) do
    -- regular casting
    local m_gear1 = table.deepcopy(data.raw.recipe["angels-iron-gear-wheel-casting"])

    m_gear1.name = "angels-"..metal.."-gear-wheel-casting"
    m_gear1.subgroup = "angels-"..metal.."-casting"
    m_gear1.localised_name = { "recipe-name.reg-casting", { "lookup."..metal}, {"string.gear"}}
    m_gear1.ingredients = {{ type = "fluid", name = "liquid-molten-"..metal, amount = 40},}
    m_gear1.results = {{ type = "item", name = metal.."-gear-wheel", amount = 9},}
    -- expendable casting
    local m_gear2 = table.deepcopy(data.raw.recipe["ASE-iron-gear-casting-expendable"])

    m_gear2.name = "ASE-"..metal.."-gear-casting-expendable"
    m_gear2.subgroup = "angels-"..metal.."-casting"
    m_gear2.localised_name = { "recipe-name.sand-casting", { "lookup."..metal}, {"string.gear"}}
    m_gear2.icons[1] = { icon = "__bobplates__/graphics/icons/"..metal.."-gear-wheel.png", icon_size = 32,}
    m_gear2.ingredients = {
      { type = "fluid", name = "liquid-molten-"..metal, amount = 80},
      { type = "item", name = "ASE-sand-die", amount = 2}
    }
    m_gear2.results=
    {
      {type = "item", name = metal.."-gear-wheel", amount = 11},
      {type = "item", name = "solid-sand", amount = 5},
    }
    -- non-expendable casting
    local m_gear3 = table.deepcopy(data.raw.recipe["ASE-iron-gear-casting-advanced"])

    m_gear3.name = "ASE-"..metal.."-gear-casting-advanced"
    m_gear3.subgroup = "angels-"..metal.."-casting"
    m_gear3.localised_name = { "recipe-name.die-casting", { "lookup."..metal}, {"string.gear"}}
    m_gear3.icons[1] = { icon = "__bobplates__/graphics/icons/"..metal.."-gear-wheel.png", icon_size = 32,}
    m_gear3.ingredients = {
      { type = "fluid", name = "liquid-molten-"..metal, amount = 80},
      { type = "item", name = "ASE-metal-die", amount = 3},
    }
    m_gear3.results =
    {
      { type = "item", name = metal.."-gear-wheel", amount = 15},
      { type = "item", name = "ASE-spent-metal-die", amount = 3},
    }
    --tungsten-fixes
    if metal == "tungsten" then
      m_gear1.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 12}
      m_gear1.category = "sintering"
      m_gear2.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 12}
      m_gear2.category = "sintering"
      m_gear3.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 12}
      m_gear3.category = "sintering"
    end
    data:extend({m_gear1,m_gear2,m_gear3})
  end
end
--ANGELS COMPONENT PARTS
if mods["angelsindustries"] and (settings.startup["angels-enable-components"].value or settings.startup["angels-enable-tech"].value) then

  for item,i in pairs(ASE.tables.a_inters) do
    local ico_name = {}
    if i.icon then
      ico_name = i.icon
    else
      ico_name = item
    end
    --item_n = item:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    -- regular casting
    local m_inter1 = table.deepcopy(data.raw.recipe["angels-iron-gear-wheel-casting"])

    m_inter1.name = item.."-casting"
    m_inter1.subgroup = "angels-"..i.metal.."-casting"
    m_inter1.localised_name = { "recipe-name.angels-advanced-regular", { "item-name." ..item}}
    m_inter1.ingredients = {{ type = "fluid", name = "liquid-molten-"..i.metal, amount = 40*i.cost},}
    m_inter1.results = {{ type = "item", name = item, amount = 4*i.amount},}
    m_inter1.order = "z["..item.."]-c"
    -- expendable casting
    local m_inter2 = table.deepcopy(data.raw.recipe["ASE-iron-gear-casting-expendable"])
    m_inter2.name = "ASE-"..item.."-casting-expendable"
    m_inter2.subgroup = "angels-"..i.metal.."-casting"
    m_inter2.localised_name = { "recipe-name.angels-advanced-expendable", { "item-name."..item}}
    m_inter2.icons[1] = { icon = "__angelsindustries__/graphics/icons/"..ico_name..".png", icon_size = 32,}
    m_inter2.ingredients[1] = { type = "fluid", name = "liquid-molten-"..i.metal, amount = 60*i.cost}
    m_inter2.results[1] = { type = "item", name = item, amount = 8*i.amount}
    m_inter2.order = "z["..item.."]-d"
    --non-expendable casting
    local m_inter3 = table.deepcopy(data.raw.recipe["ASE-iron-gear-casting-advanced"])
    m_inter3.name = "ASE-"..item.."-casting-advanced"
    m_inter3.subgroup = "angels-"..i.metal.."-casting"
    m_inter3.localised_name = { "recipe-name.angels-advanced-crafting", { "item-name."..item}}
    m_inter3.icons[1] = { icon = "__angelsindustries__/graphics/icons/"..ico_name..".png", icon_size = 32,}
    m_inter3.ingredients[1] = { type="fluid", name="liquid-molten-"..i.metal, amount = 80*i.cost}
    m_inter3.results[1] = { type="item", name = item, amount = 12*i.amount}
    m_inter3.order = "z["..item.."]-e"

    --tungsten-fixes
    if i.metal=="tungsten" then
      m_inter1.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 4*i.cost}
      m_inter1.category = "sintering"
      m_inter2.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 6*i.cost}
      m_inter2.category = "sintering"
      m_inter3.ingredients[1] = { type = "item", name = "casting-powder-tungsten", amount = 8*i.cost}
      m_inter3.category = "sintering"
    end
    data:extend({m_inter1,m_inter2,m_inter3})
  end
end
