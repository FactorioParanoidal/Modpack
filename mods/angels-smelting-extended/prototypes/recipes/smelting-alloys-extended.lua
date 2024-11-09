local function get_icon_base(fluid, ingot_metal)
  local icon_base = angelsmods.functions.get_object_icons(fluid)
  if type(icon_base) == "table" then --not void
    table.insert(icon_base,{icon = "__angelssmelting__/graphics/icons/ingot-"..ingot_metal..".png", icon_size = 64, scale = 32/64 * 0.4375, shift = {10, -10}})
  else
    icon_base = {{icon = icon_base, size = 32},{icon = "__angelssmelting__/graphics/icons/ingot-"..ingot_metal..".png", icon_size = 64, scale = 32/64 * 0.4375, shift = {10, -10}}}
  end
  return icon_base
end

if mods["bobplates"] then
  if settings.startup["ASE-angels-molten-recipes"] then
    data:extend(
      {
        --STEEL BLENDING FROM IRON RECIPES
        --Steel starts with 6 from 24 iron ingots /w oxygen (AS A BASE)         
        {
          type = "recipe",
          name = "ASE-molten-steel-smelting-1",
          category = "induction-smelting",
          subgroup = "angels-steel-casting",
          energy_required = 6,
          enabled = false,
          ingredients = {
            {type="item", name="ingot-iron", amount=40},
            {type="item", name="solid-coke", amount=6},
            {type="item", name="ingot-silicon", amount=20},
          },
          results=
          {
            {type="fluid", name="liquid-molten-steel", amount=240},
          },
          order = "xa",
          icons = angelsmods.functions.add_number_icon_layer(get_icon_base("liquid-molten-steel", "iron"), 2, angelsmods.smelting.number_tint),
          order = "i[liquid-molten-steel]-f",
          crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-steel")
        },
        {
          type = "recipe",
          name = "ASE-molten-steel-smelting-2",
          category = "induction-smelting",
          subgroup = "angels-steel-casting",
          energy_required = 6,
          enabled = false,
          ingredients = {
            {type="item", name="ingot-iron", amount=40},
            {type="item", name="solid-coke", amount=6},
            {type="item", name="ingot-manganese", amount=20},
          },
          results=
          {
            {type="fluid", name="liquid-molten-steel", amount=240},
          },
          order = "xa",
          icons = angelsmods.functions.add_number_icon_layer(get_icon_base("liquid-molten-steel", "iron"), 3, angelsmods.smelting.number_tint),
          order = "i[liquid-molten-steel]-g",
          crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-steel")
        },
        {
          type = "recipe",
          name = "ASE-molten-steel-smelting-3",
          category = "induction-smelting",
          subgroup = "angels-steel-casting",
          energy_required = 6,
          enabled = false,
          ingredients = {
            {type="item", name="ingot-iron", amount=42},
            {type="item", name="solid-coke", amount=6},
            {type="item", name="ingot-nickel", amount=15},
            {type="item", name="ingot-cobalt", amount=15},
          },
          results=
          {
            {type="fluid", name="liquid-molten-steel", amount = 360},
          },
          order = "xa",
          icons = angelsmods.functions.add_number_icon_layer(get_icon_base("liquid-molten-steel", "iron"), 4, angelsmods.smelting.number_tint),
          order = "i[liquid-molten-steel]-h",
          crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-steel")
        },
        {
          type = "recipe",
          name = "ASE-molten-steel-smelting-4",
          category = "induction-smelting",
          subgroup = "angels-steel-casting",
          energy_required = 6,
          enabled = false,
          ingredients = {
            {type="item", name="ingot-iron", amount=42},
            {type="item", name="solid-coke", amount=6},
            {type="item", name="ingot-chrome", amount=15},
            {type="item", name="powdered-tungsten", amount=5},
            {type="item", name="ingot-nickel", amount=10},
          },
          results=
          {
            {type="fluid", name="liquid-molten-steel", amount = 360},
          },
          order = "xa",
          icons = angelsmods.functions.add_number_icon_layer(get_icon_base("liquid-molten-steel", "iron"), 5, angelsmods.smelting.number_tint),
          order = "i[liquid-molten-steel]-i",
          crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-steel")
        },
        --Invar from iron ingot recipe
        {
          type = "recipe",
          name = "ASE-molten-invar-smelting",
          category = "induction-smelting",
          subgroup = "angels-invar-casting",
          energy_required = 6,
          enabled = false,
          ingredients = {
            {type="item", name="ingot-iron", amount=46},
            {type="item", name="solid-coke", amount=1},
            {type="item", name="ingot-nickel", amount=26},
          },
          results=
          {
            {type="fluid", name="liquid-molten-invar", amount = 360},
          },
          order = "xa",
          icons = angelsmods.functions.add_number_icon_layer(get_icon_base("liquid-molten-invar", "nickel"), 1, angelsmods.smelting.number_tint),
          order = "d[liquid-molten-invar]-b",
          crafting_machine_tint = angelsmods.functions.get_fluid_recipe_tint("liquid-molten-invar")
        },

        --ALLOYS CASTING This needs serious balancing
      --Look at having the triple fluid recipes being really high yield
      --[[
      
      {
      type = "recipe",
      name = "angels-nitinol-smelting-1",
      category = "induction-smelting",
    subgroup = "angels-alloys-casting",
      energy_required = 4,
    enabled = false,
      ingredients ={
        {type="item", name="ingot-nickel", amount=24},
        {type="item", name="ingot-titanium", amount=12},
    },
      results=
      {
        {type="fluid", name="liquid-molten-nitinol", amount=240},
      },
      order = "xf",
      },
      {
      type = "recipe",
      name = "angels-plate-nitinol",
      category = "casting",
    subgroup = "angels-alloys-casting",
      energy_required = 15,
    enabled = false,
      ingredients ={
        {type="fluid", name="liquid-molten-nitinol", amount=40},
    },
      results=
      {
        {type="item", name="angels-plate-nitinol", amount=4},
      },
      order = "yf",
    },]]
      {
      type = "recipe",
      name = "angels-plate-cobalt-steel-1",
      category = "casting",
    subgroup = "angels-cobalt-steel-casting",
      energy_required = 30,
    enabled = false,
      ingredients ={
        {type="fluid", name="liquid-molten-iron", amount=140},
        {type="fluid", name="liquid-molten-cobalt", amount=10},
    },
      results=
      {
        {type="item", name="angels-plate-cobalt-steel", amount=10},
      },
      order = "l",
      },
      {
      type = "recipe",
      name = "angels-plate-cobalt-steel-2",
      category = "casting",
    subgroup = "angels-cobalt-steel-casting",
      energy_required = 30,
    enabled = false,
      ingredients ={
        {type="fluid", name="liquid-molten-steel", amount=35},
        {type="fluid", name="liquid-molten-cobalt", amount=10},
    },
      results=
      {
        {type="item", name="angels-plate-cobalt-steel", amount=10},
      },
      order = "m",
      },
  }
  )
end
end