local create_sprite = require('scripts.sprite_generation')

--- @param chest_name string
--- @param width number
--- @param height number
local function get_circuit_connector(chest_name, width, height)
	local mod_settings = MergingChests.get_mod_settings(chest_name)
	local variation, x, y
	local _, _, side, position = string.find(mod_settings.circuit_connector_position, '([^-]+)[-]([^-]+)')

	if side == 'right' then
		variation = 24
		x = -width / 2
	elseif side == 'left' then
		variation = 28
		x = width / 2
	elseif side == 'bottom' then
		variation = 26
		y = height / 2 - 0.5
	elseif side == 'center' then
		if width >= height then
			variation = 26
			x = 0
			y = height / 2 - 0.5
		else
			variation = 24
			x = -width / 2
			y = 0
		end
	end

	if position == 'top' then
		y = -height / 2 + 0.5
	elseif position == 'middle' then
		if x == nil then
			x = 0
		else
			y = 0
		end
	elseif position == 'bottom' then
		y = height / 2 - 0.75
	elseif position == 'right' then
		x = -width / 2 + 0.5
	elseif position == 'left' then
		x = width / 2 - 0.5
	end

	return circuit_connector_definitions.create_vector(
		universal_connector_template,
		{
			{
				variation = variation,
				main_offset = { x, y },
				shadow_offset = { x + 0.1, y + 0.1 },
				show_shadow = false
			}
		}
	)
end

--- @alias entity_data
--- | { chest_name: string, override_prototype_properties?: table }

--- @param entity_data entity_data
--- @param loc_name table
--- @param subgroup string
--- @param width number
--- @param height number
--- @param segment_data entity_sprite
local function create_entity(entity_data, loc_name, subgroup, width, height, segment_data)
	local base_chest = data.raw['logistic-container'][entity_data.chest_name] or data.raw.container[entity_data.chest_name]

	if base_chest == nil then
		error('Chest with name '..entity_data.chest_name..' not found')
	end

	local sprite = create_sprite(width, height, segment_data)
	local connector = get_circuit_connector(entity_data.chest_name, width, height)

	local type_specific_properties
	if base_chest.logistic_mode then
		type_specific_properties = {
			type = 'logistic-container',
			logistic_mode = base_chest.logistic_mode,
			animation_sound = base_chest.animation_sound,
			opened_duration = 7,
			animation = {
				layers = sprite
			}
		}

		if base_chest.logistic_mode == 'storage' then
			type_specific_properties.max_logistic_slots = 1
		end
	else
		type_specific_properties = {
			type = 'container',
			picture = {
				layers = sprite
			}
		}
	end

	local merged_chest_name = MergingChests.get_merged_chest_name(entity_data.chest_name, width, height)

	table.insert(data.raw['selection-tool'][MergingChests.merge_selection_tool_name].alt_entity_filters, merged_chest_name)

	return util.merge({
		type_specific_properties,
		{
			name = merged_chest_name,
			localised_name = loc_name,
			icon = base_chest.icon,
			icons = base_chest.icons,
			icon_size = base_chest.icon_size,
			fast_replaceable_group = 'merged-container',
			open_sound = base_chest.open_sound,
			close_sound = base_chest.close_sound,
			max_health = base_chest.max_health * math.min(width * height, 10),
			inventory_size = MergingChests.get_inventory_size(base_chest.inventory_size, width * height, entity_data.chest_name),
			flags = { 'placeable-player', 'player-creation' },
			minable = { mining_time = 2, result = entity_data.chest_name, count = width * height },
			placeable_by = { item = entity_data.chest_name, count = width * height },
			corpse = 'medium-remnants',
			dying_explosion = 'medium-explosion',
			vehicle_impact_sound = { filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65 },
			collision_box = { { -width / 2 + 0.15, -height / 2 + 0.15 }, { width / 2 - 0.15, height / 2 - 0.15 } },
			selection_box = { { -width / 2, -height / 2 }, { width / 2, height / 2 } },
			subgroup = subgroup,
			circuit_wire_connection_point = connector.points,
			circuit_connector_sprites = connector.sprites,
			circuit_wire_max_distance = default_circuit_wire_max_distance + math.min(width, height) - 1,
		},
		entity_data.override_prototype_properties or {}
	})
end

--- @param entity_data entity_data
--- @param segment_data entity_sprite
--- @param width number
local function create_wide_chest_entity(entity_data, segment_data, width)
	return create_entity(
		entity_data,
		{ 'chest-name.'..MergingChests.prefix_with_modname('wide-'..entity_data.chest_name), width },
		MergingChests.item_group_names.wide_chests,
		width,
        1,
		segment_data
	)
end

--- @param entity_data entity_data
--- @param segment_data entity_sprite
--- @param height number
local function create_high_chest_entity(entity_data, segment_data, height)
	return create_entity(
		entity_data,
		{ 'chest-name.'..MergingChests.prefix_with_modname('high-'..entity_data.chest_name), height },
		MergingChests.item_group_names.high_chests,
		1,
        height,
		segment_data
	)
end

--- @param entity_data entity_data
--- @param segment_data entity_sprite
--- @param width number
--- @param height number
local function create_warehouse_entity(entity_data, segment_data, width, height)
	return create_entity(
		entity_data,
		{ 'chest-name.'..MergingChests.prefix_with_modname(entity_data.chest_name..'-warehouse'), width, height },
		MergingChests.item_group_names.warehouses,
		width,
        height,
		segment_data
	)
end

--- @param entity_data entity_data
--- @param segment_data entity_sprite
--- @param width number
--- @param height number
local function create_trashdump_entity(entity_data, segment_data, width, height)
	return create_entity(
		entity_data,
		{ 'chest-name.'..MergingChests.prefix_with_modname(entity_data.chest_name..'-trashdump'), width, height },
		MergingChests.item_group_names.trashdumps,
		width,
        height,
		segment_data
	)
end

--- @type { [setting_allowed_value]: boolean[] }
local setting_value_to_enabled_flags = {
    ['none'] = { false, false, false },
    ['chest'] = { true, false, false },
    ['warehouse'] = { false, true, false },
    ['trashdump'] = { false, false, true },
    ['chest-warehouse'] = { true, true, false },
    ['chest-trashdump'] = { true, false, true },
    ['warehouse-trashdump'] = { false, true, true },
    ['chest-warehouse-trashdump'] = { true, true, true }
}

--- Creates merged chest prototypes
---
--- Reads settings made during settings stage with same `chest_name`.
--- @param entity_data entity_data
--- @param segments_data segments_data
function MergingChests.create_mergeable_chest(entity_data, segments_data)
    local setting = settings.startup[MergingChests.chest_specific_setting_name(MergingChests.setting_names.mergeable_chest, entity_data.chest_name)]
    local enable_chest, enable_warehouse, enable_trashdump = table.unpack(
        setting_value_to_enabled_flags[setting and setting.value or 'none']
    )

	if setting and MergingChests.is_mod_active(MergingChests.all_types_mod_name) then
		enable_chest = true
		enable_warehouse = true
		enable_trashdump = true
	end

	local mod_settings = MergingChests.get_mod_settings(entity_data.chest_name)
	local max_area = 0

    if enable_chest and segments_data.high_segments then
        for height = 2, math.min(mod_settings.max_height, mod_settings.max_area) do
            if MergingChests.is_size_allowed(1, height, entity_data.chest_name) then
                data:extend({ create_high_chest_entity(entity_data, segments_data.high_segments, height) })
				max_area = math.max(max_area, height)
            end
        end
    end

	for width = 2, math.min(mod_settings.max_width, mod_settings.max_area) do
        if enable_chest and segments_data.wide_segments then
            if MergingChests.is_size_allowed(width, 1, entity_data.chest_name) then
                data:extend({ create_wide_chest_entity(entity_data, segments_data.wide_segments, width) })
				max_area = math.max(max_area, width)
            end
        end

        for height = 2, math.min(mod_settings.max_height, mod_settings.max_area) do
			if MergingChests.is_size_allowed(width, height, entity_data.chest_name) then
				if enable_trashdump and width > mod_settings.warehouse_threshold and height > mod_settings.warehouse_threshold and segments_data.trashdump_segments then
					data:extend({ create_trashdump_entity(entity_data, segments_data.trashdump_segments, width, height) })
					max_area = math.max(max_area, width * height)
				elseif enable_warehouse and segments_data.warehouse_segments then
					data:extend({ create_warehouse_entity(entity_data, segments_data.warehouse_segments, width, height) })
					max_area = math.max(max_area, width * height)
				end
			end
		end
	end

	if enable_chest or enable_warehouse or enable_trashdump then
		table.insert(data.raw['selection-tool'][MergingChests.merge_selection_tool_name].entity_filters, entity_data.chest_name)
		data.raw.item[entity_data.chest_name].stack_size = math.max(data.raw.item[entity_data.chest_name].stack_size, max_area)
	end
end

--- Sets next_upgrade of chests of type `type` merged from `chest_name`
--- @param type `logistic-container` | `container`
--- @param chest_name string
--- @param next_upgrade string
function MergingChests.set_next_upgrade_of(type, chest_name, next_upgrade)
    for _, prototype in pairs(data.raw[type]) do
        local name, width, height = MergingChests.get_merged_chest_info(prototype.name)
        if name == chest_name and width and height then
			local merged_upgrade_name = MergingChests.get_merged_chest_name(next_upgrade, width, height)
			if data.raw[type][merged_upgrade_name] then
				prototype.next_upgrade = merged_upgrade_name
			end
        end
    end
end

--- Disables next_upgrade of chests of type `type` merged from `chest_name`
--- @param type `logistic-container` | `container`
--- @param chest_name string
function MergingChests.disable_next_upgrade_of(type, chest_name)
    for _, prototype in pairs(data.raw[type]) do
        local name, _ = MergingChests.get_merged_chest_info(prototype.name)
        if name == chest_name then
            prototype.next_upgrade = nil
        end
    end
end

--- Disables next_upgrade of chests which of type `type` which are upgraded to `chest_name`
--- @param type `logistic-container` | `container`
--- @param chest_name string
function MergingChests.disable_next_upgrade_to(type, chest_name)
    for _, prototype in pairs(data.raw[type]) do
		if prototype.next_upgrade then
			local name, _ = MergingChests.get_merged_chest_info(prototype.next_upgrade)
			if name == chest_name then
				prototype.next_upgrade = nil
			end
		end
    end
end
