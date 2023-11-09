local function get_minable_datas()
    local result = {}
    _table.each(data.raw["resource"],
        function(prototype)
            local prototype_name = prototype.name
            if string.find(prototype_name, 'infinite-', 1, true) then
                return
            end
            if not prototype.minable then
                return
            end
            if not prototype.minable.results then
                return
            end
            _table.each(prototype.minable.results,
                function(minable_result)
                    table.insert(result,
                        {
                            type = minable_result.type,
                            name = minable_result.name or minable_result[1]
                        }
                    )
                end)
        end
    )
    _table.insert_all_if_not_exists(result,
        {
            { type = "item",  name = 'coal' },
            { type = "item",  name = 'wood' },
            { type = "item",  name = 'stone' },
            --вода и пар - неочевидные рецепты
            { type = "fluid", name = 'water' },
            -- сады разных зон
            { type = "item",  name = "swamp-garden" },
            { type = "item",  name = "desert-garden" },
            { type = "item",  name = "temperate-garden" },
            -- инопланетные артефакты
            { type = "item",  name = "small-alien-artifact" },
            { type = "item",  name = "small-alien-artifact-red" },
            { type = "item",  name = "small-alien-artifact-orange" },
            { type = "item",  name = "small-alien-artifact-yellow" },
            { type = "item",  name = "small-alien-artifact-green" },
            { type = "item",  name = "small-alien-artifact-blue" },
            { type = "item",  name = "small-alien-artifact-purple" },
            -- деревья различных зон
            { type = "item",  name = "temperate-tree" },
            { type = "item",  name = "swamp-tree" },
            { type = "item",  name = "desert-tree" },
            -- фугу
            --puffer-nest=Гнездо фугу"}
            --рыбы
            { type = "fish",  name = "alien-fish-1" },
            { type = "fish",  name = "alien-fish-2" },
            { type = "fish",  name = "alien-fish-3" }
        }
    )
    return result
end
local function createBasicRecipe(basic_data, suffix)
    local resource_type = basic_data.type
    local resource_name = basic_data.name
    local resourceRecipeName = resource_name .. suffix
    local resourceItemPrototype = data.raw[resource_type][resource_name]
    data:extend {
        {
            type = "recipe",
            name = resourceRecipeName,
            icons = resourceItemPrototype.icons,
            icon = resourceItemPrototype.icon,
            icon_size = resourceItemPrototype.icon_size,
            ingredients = {},
            category = 'crafting',
            results =
            {
                basic_data
            },
            enabled = false
        }
    }
    return resourceRecipeName
end

function createResourceRecipeNames()
    local minable_datas = get_minable_datas()
    local result = {}
    _table.each(minable_datas,
        function(minable_data)
            table.insert(result, createBasicRecipe(minable_data, 'mineable'))
        end)
    return result
end

function createSteamRecipe()
    return createBasicRecipe({ type = "fluid", name = 'steam' }, 'flamable')
end
