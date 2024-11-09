
local chests = {
    {
        name = 'steel-chest',
        technology = 'steel-processing',
        entity_type = 'container',
        order = "a",
        ingredients = {{"steel-plate", 2}},
    },
    {
        name = 'passive-provider-chest',
        technology = 'construction-robotics',
        entity_type = 'logistic-container',
        order = "b",
        ingredients = {{"mini-steel-chest", 1},{"electronic-circuit", 3},{"advanced-circuit", 1}}
    },
    {
        name = 'storage-chest',
        technology = 'construction-robotics',
        entity_type = 'logistic-container',
        order = "d",
        ingredients = {{"mini-steel-chest", 1},{"electronic-circuit", 3},{"advanced-circuit", 1}}
    },
    {
        name = 'active-provider-chest',
        technology = 'logistic-system',
        entity_type = 'logistic-container',
        order = "c",
        ingredients = {{"mini-steel-chest", 1},{"electronic-circuit", 3},{"advanced-circuit", 1}}
    },
    {
        name = 'buffer-chest',
        technology = 'logistic-system',
        entity_type = 'logistic-container',
        order = "e",
        ingredients = {{"mini-steel-chest", 1},{"electronic-circuit", 3},{"advanced-circuit", 1}}
    },
    {
        name = 'requester-chest',
        technology = 'logistic-system',
        entity_type = 'logistic-container',
        order = "f",
        ingredients = {{"mini-steel-chest", 1},{"electronic-circuit", 3},{"advanced-circuit", 1}}
    }
}

data:extend({
    {
    type = "item-subgroup",
    name = "mini-containers",
    group = "logistics",
    order = "a9[container-1]"
  },
});

for _, chest in pairs(chests) do
    local newChestItem   = table.deepcopy(data.raw.item[chest.name])
    local newChestEntity = table.deepcopy(data.raw[chest.entity_type][chest.name])
    local newRecipe      = table.deepcopy(data.raw.recipe[chest.name])

    newChestItem.name             = "mini-" .. chest.name
    newChestItem.subgroup         = "mini-containers"
    newChestItem.place_result     = "mini-" .. chest.name
    newChestItem.order            = "a[storage]-" .. chest.order .. "[" .. newChestItem.name .. "]"
    newChestItem.icon             = "__osha_mini_containers__/graphics/icons/" .. newChestItem.name .. ".png"
    newChestItem.icon_size        = 64
    newChestItem.icon_mipmaps     = 4
    newChestItem.icons            = nil
    newRecipe.name                = "mini-" .. chest.name
    newRecipe.result              = "mini-" .. chest.name
    newRecipe.ingredients         = chest.ingredients
    newRecipe.icon                = "__osha_mini_containers__/graphics/icons/" .. newChestItem.name .. ".png"
    newRecipe.icon_size           = 64
    newRecipe.icon_mipmaps        = 4
    newChestEntity.name           = "mini-" .. chest.name
    newChestEntity.inventory_size = 1
    newChestEntity.minable.result = newChestItem.name
    newChestEntity.icon             = "__osha_mini_containers__/graphics/icons/" .. newChestItem.name .. ".png"
    newChestEntity.icon_size        = 64
    newChestEntity.icon_mipmaps     = 4


    table.insert(data.raw.technology[chest.technology].effects,{type = "unlock-recipe", recipe = newRecipe.name})
    data:extend({newChestItem});
    data:extend({newChestEntity});
    data:extend({newRecipe});
end
