local function copyPrototype(type, name, newName)
    if not data.raw[type][name] then error("type "..type.." "..name.." doesn't exist") end
    local p = table.deepcopy(data.raw[type][name])
    p.name = newName
    if p.minable and p.minable.result then
        p.minable.result = newName
    end
    if p.place_result then
        p.place_result = newName
    end
    if p.result then
        p.result = newName
    end
    return p
end

data:extend{{
    type = "item",
    name = "module_inserter_pickup",
    icon = "__base__/graphics/icons/wooden-chest.png",
    flags = {"hidden"},
    icon_size = 32,
    order = "a[items]-a[wooden-chest]",
    place_result = "module_inserter_pickup",
    stack_size = 1
}}

local mi_proxy = copyPrototype("logistic-container","active-provider-chest","module_inserter_pickup")

mi_proxy.max_health = 100
mi_proxy.corpse = "small-remnants"
mi_proxy.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
mi_proxy.minable = {mining_time = 0.1}
mi_proxy.icon = "__ModuleInserter__/graphics/module-inserter-icon.png"
mi_proxy.icon_size = 32
mi_proxy.icon_mipmaps = 0
mi_proxy.flags = {
    "placeable-neutral",
    "player-creation",
    "placeable-off-grid",
    "hidden",
    "not-on-map",
    "not-blueprintable",
    "not-upgradable",
    "no-automated-item-removal",
    "no-automated-item-insertion",
}
mi_proxy.next_upgrade = nil
mi_proxy.fast_replaceable_group = nil
mi_proxy.collision_box = {{-0.1,-0.1},{0.1,0.1}}
mi_proxy.collision_mask = {"doodad-layer", "not-colliding-with-itself"}

data:extend{mi_proxy}