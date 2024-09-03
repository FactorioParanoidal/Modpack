data:extend({ 
    --патроны из пистолета
{
    type = "recipe",
    name = "pistol-rearm-ammo",
    energy_required = 5,
    -- enabled = true,
    ingredients = {{"pistol", 1}},
    results = {
        {type = "item", name = "firearm-magazine", amount =  3}
    }
},
--камень из блоков
{
    type = "recipe",
    name = "stone-crushed",
    energy_required = 1,
    enabled = false,
    ingredients = {{"stone-brick", 1}},
    results = {
        {type = "item", name = "stone", amount =  2}
    }
}
})

