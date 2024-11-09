local floor = math.floor

local function add_to_description(type, prototype, localised_string)
	if prototype.localised_description and prototype.localised_description ~= '' then
		prototype.localised_description = {'', prototype.localised_description, '\n', localised_string}
		return
	end

	local place_result = prototype.place_result or prototype.placed_as_equipment_result
	if type == 'item' and place_result then
		for _, machine in pairs(data.raw) do
			machine = machine[place_result]
			if machine and machine.localised_description then
				prototype.localised_description = {
					'?',
					{'', machine.localised_description, '\n', localised_string},
					localised_string
				}
				return
			end
		end

		local entity_type = prototype.place_result and 'entity' or 'equipment'
		prototype.localised_description = {
			'?',
			{'', {entity_type .. '-description.' .. place_result}, '\n', localised_string},
			{'', {type .. '-description.' .. prototype.name}, '\n', localised_string},
			localised_string
		}
	else
		prototype.localised_description = {
			'?',
			{'', {type .. '-description.' .. prototype.name}, '\n', localised_string},
			localised_string
		}
	end
end

local function contains(tbl, goal, f)
	for _, v in pairs(tbl) do
		if f then
			if f(v) == goal then return true end
		else
			if v == goal then return true end
		end
	end
	return false
end

local function localised_string_contains(localised_string, key)
	if type(localised_string) ~= 'table' then
		return false
	end
	if localised_string[1] == key then
		return localised_string[1]
	end
	for k, v in ipairs(localised_string) do
		if k ~= 1 then
			local result = localised_string_contains(v, key)
			if result then return result end
		end
	end
	return false
end

local prefixes = {
	[''] = 1,
	k = 1000,
	K = 1000,
	M = 1000000,
	G = 1000000000,
	T = 1000000000000,
	P = 1000000000000000,
	E = 1000000000000000000,
	Z = 1000000000000000000000,
	Y = 1000000000000000000000000
}
local function energy_to_number(energy)
	local amount, unit, _ = string.match(energy, '(%d+)(%a-)[JW]')
	return tonumber(amount) * prefixes[unit]
end

local function map(tbl, f)
	local result = {}
	for k, v in pairs(tbl) do
		result[k] = f(v, k, tbl)
	end
	return result
end

local function localised_string_depth(localised_string)
	if type(localised_string) ~= 'table' then
		return 0
	end
	local result = 0
	for k, v in pairs(localised_string) do
		if k ~= 1 then
			local depth = localised_string_depth(v)
			if depth > result then
				result = depth
			end
		end
	end
	return result + 1
end

-- productivity

local recipes = {}
for module_name, mod in pairs(data.raw.module) do
	if mod.limitation and mod.effect.productivity and module_name:find('pyveganism') == nil then
		for recipe_name, recipe in pairs(data.raw.recipe) do
			if not recipes[recipe_name] and contains(mod.limitation, recipe_name) then
				add_to_description('recipe', recipe, {'description.productivity-message'})
				recipes[recipe_name] = true
			end
		end
	end
end

-- allowed modules

if settings.startup['ed-allowed-modules'].value then
	for _, prototype in ipairs{'lab', 'assembling-machine', 'furnace', 'rocket-silo', 'beacon', 'mining-drill'} do
		for _, machine in pairs(data.raw[prototype]) do
			if (prototype == 'lab' or prototype == 'mining-drill') and machine.allowed_effects == nil then
				machine.allowed_effects = {'speed', 'productivity', 'consumption', 'pollution'}
			end

			local modules = machine.module_specification
			if modules and tonumber(modules.module_slots) and tonumber(modules.module_slots) > 0 and machine.allowed_effects and machine.allowed_effects ~= {} then
				add_to_description('entity', machine, {'description.module-slots', tostring(machine.module_specification.module_slots)})

				local allowed
				if type(machine.allowed_effects) == 'string' then
					allowed = {machine.allowed_effects}
				elseif type(machine.allowed_effects) == 'table' then
					allowed = machine.allowed_effects
				end

				if not contains(allowed, 'speed') then
					add_to_description('entity', machine, {'description.speed-module-limitation'})
				end
				if not contains(allowed, 'productivity') then
					add_to_description('entity', machine, {'description.productivity-module-limitation'})
				end
				if not contains(allowed, 'consumption') then
					add_to_description('entity', machine, {'description.consumption-module-limitation'})
				end
			end
		end
	end
end

-- building size

if settings.startup['ed-building-size'].value then
	for _, prototype in pairs(data.raw) do
		for item_name, item in pairs(prototype) do
			if item.stack_size then
				if item.place_result then
					for _, entity in pairs(data.raw) do
						for _, entity in pairs(entity) do
							if entity.minable and entity.minable.result == item_name and (entity.flags == nil or contains(entity.flags, 'placeable-off-grid') == false) then
								local box = entity.collision_box
								if box then
									local x = math.ceil(box[2][2] * 2) / 2 - math.floor(box[1][2] * 2) / 2
									local y = math.ceil(box[2][1] * 2) / 2 - math.floor(box[1][1] * 2) / 2
									if x > 1 or y > 1 then
										if y > x then x, y = y, x end
										add_to_description('entity', entity, {'description.building-size', tostring(x), tostring(y)})
									end
								end
								goto done
							end
						end
					end
					::done::
				end
			else break end
		end
	end
end

-- resistances for military entities

if settings.startup['ed-military-resistances'].value then
	for _, prototype in pairs(data.raw) do
		for _, entity in pairs(prototype) do
			if entity.stack_size then break end
			if entity.attack_parameters or (entity.flags and contains(entity.flags, 'placeable-enemy')) then
				entity.hide_resistances = false
			end
		end
	end

	for _, prototype in ipairs{'wall', 'gate', 'car', 'artillery-wagon'} do
		for _, entity in pairs(data.raw[prototype]) do
			entity.hide_resistances = false
		end
	end
end

-- heat

if settings.startup['ed-heat'].value then
	for _, name in ipairs{'reactor', 'heat-pipe'} do
		for _, prototype in pairs(data.raw[name]) do
			local buffer = prototype.heat_buffer
			add_to_description('entity', prototype, {'description.max-heat', buffer.max_temperature})
			add_to_description('entity', prototype, {(name == 'reactor') and 'description.heat-loss-reactor' or 'description.heat-loss-pipe', buffer.min_temperature_gradient or 1})
		end
	end
end

-- solar ratios

if settings.startup['ed-solar-ratios'].value then
    for _, prototype in ipairs{'accumulator', 'solar-panel'} do
	    for name, machine in pairs(data.raw[prototype]) do
		    for _, item in pairs(data.raw.item) do
			    if item.place_result == name then
				    item.localised_description = item.localised_description or machine.localised_description or ''
			    end
		    end
	    end
    end

    local empty_table = function() return {} end
    local accumulators_perfect = map(data.raw.accumulator, empty_table)
    local accumulators_imperfect = map(data.raw.accumulator, empty_table)
    local solar_panels_perfect = map(data.raw['solar-panel'], empty_table)
    local solar_panels_imperfect = map(data.raw['solar-panel'], empty_table)

    local accumulator_count = 0
    local solar_count = 0

    for _, _ in pairs(data.raw['solar-panel']) do
	    solar_count = solar_count + 1
    end

    for accumulator_name, accumulator in pairs(data.raw.accumulator) do
	    accumulator_count = accumulator_count + 1
	    local accumulator_localised_name = accumulator.localised_name or {'entity-name.' .. accumulator_name}
	    local accumulator_size = accumulator.energy_source.buffer_capacity

	    if accumulator_size == '1J' then goto a end

	    for solar_name, solar in pairs(data.raw['solar-panel']) do
		    local solar_localised_name = solar.localised_name or {'entity-name.' .. solar_name}
		    local panel_production = solar.production

		    if panel_production == '1W' then goto s end

		    local ratio = energy_to_number(panel_production) / energy_to_number(accumulator_size) * 70

		    local integer = math.floor(ratio)
		    local decimal = ratio - integer
		    local pn, n, N = 0, 1
		    local pd, d, D = 1, 0
		    local x, perfect, q, Q
		    repeat
			    x = x and 1 / (x - q) or decimal
			    q, Q = math.floor(x), math.floor(x + 0.5)
			    pn, n, N = n, q * n + pn, Q * n + pn
			    pd, d, D = d, q * d + pd, Q * d + pd
			    perfect = decimal - N/D
		    until math.abs(perfect) < 0.00000001
		    perfect = perfect == 0

		    if perfect then
			    local accumulator_ratio = N + D * integer
			    local solar_ratio = D
			    table.insert(accumulators_perfect[accumulator_name], {'description.solar-ratio', solar_localised_name, accumulator_ratio, solar_ratio})
			    table.insert(solar_panels_perfect[solar_name], {'description.solar-ratio', accumulator_localised_name, solar_ratio, accumulator_ratio})
		    else
			    table.insert(accumulators_imperfect[accumulator_name], {'description.solar-ratio-imperfect', solar_localised_name	, math.floor(0.5 + ratio * 1000) / 1000})
			    table.insert(solar_panels_imperfect[solar_name], {'description.solar-ratio-imperfect', accumulator_localised_name, math.floor(0.5 + 1 / ratio * 1000) / 1000})
		    end
		    ::s::
	    end
	    ::a::
    end

    for name, accumulator in pairs(data.raw.accumulator) do
	    if solar_count + localised_string_depth(accumulator.localised_description) > 18 then goto next end
	    for _, perfect in pairs(accumulators_perfect[name]) do
		    add_to_description('entity', accumulator, perfect)
	    end
	    for _, perfect in pairs(accumulators_imperfect[name]) do
		    add_to_description('entity', accumulator, perfect)
	    end
	    ::next::
    end

    for name, solar in pairs(data.raw['solar-panel']) do
	    if accumulator_count + localised_string_depth(solar.localised_description) > 18 then goto next end
	    for _, perfect in pairs(solar_panels_perfect[name]) do
		    add_to_description('entity', solar, perfect)
	    end
	    for _, perfect in pairs(solar_panels_imperfect[name]) do
		    add_to_description('entity', solar, perfect)
	    end
	    ::next::
    end
end

-- radar range

if settings.startup['ed-radar-stats'].value then
	for _, radar in pairs(data.raw.radar) do
		add_to_description('entity', radar, {'description.radar-primary-range', radar.max_distance_of_nearby_sector_revealed})
		add_to_description('entity', radar, {'description.radar-secondary-range', radar.max_distance_of_sector_revealed})
		add_to_description('entity', radar, {'description.radar-scan-time', math.floor(0.5 + energy_to_number(radar.energy_per_sector) / energy_to_number(radar.energy_usage) * 100) / 100})
	end
end

-- inserters

if settings.startup['ed-inserter-stats'].value then
    local inserter_stack_size = 1
    local stack_inserter_stack_size = 1

    for _, technology in pairs(data.raw.technology) do
	    if technology.hidden ~= true and technology.enabled ~= false and technology.effects then
		    for _, effect in ipairs(technology.effects) do
			    if effect.type == 'inserter-stack-size-bonus' then
				    inserter_stack_size = inserter_stack_size + effect.modifier
			    elseif effect.type == 'bulk-inserter-capacity-bonus' then
				    stack_inserter_stack_size = stack_inserter_stack_size + effect.modifier
			    end
		    end
	    end
    end

    local fastest_belt
    local slowest_belt
    for _, belt in pairs(data.raw['transport-belt']) do
	    local speed = belt.speed * 480
	    if 0 < speed and speed < 200 then
		    if fastest_belt == nil or speed > fastest_belt then
			    fastest_belt = speed
		    end
		    if slowest_belt == nil or speed < slowest_belt then
			    slowest_belt = speed
		    end
	    end
    end

    for inserter_name, inserter in pairs(data.raw.inserter) do
	    local multiplier_1 = inserter.stack and 2 or 1
	    local multiplier_2 = inserter.stack and stack_inserter_stack_size or inserter_stack_size
	    local hand_speed = inserter.rotation_speed * 57.75
	    for _, item in pairs(data.raw.item) do
		    if item.place_result == inserter_name then
			    item.localised_description = item.localised_description or inserter.localised_description or ''
		    end
	    end
	    add_to_description('entity', inserter, {
		    '',
		    {'description.inserter-speed'},
		    {'description.inserter-speed-chest-to-chest'},
		    {'description.inserter-stack-size', multiplier_1, math.floor(0.5 + hand_speed * multiplier_1 * 100) / 100},
		    {'description.inserter-stack-size', multiplier_2, math.floor(0.5 + hand_speed * multiplier_2 * 100) / 100},
		    {'description.inserter-speed-chest-to-belt'},
		    {'description.inserter-stack-size', multiplier_1, math.floor(0.5 + 1 / (1 / hand_speed / multiplier_1 + 0.0445272463 * multiplier_1 / slowest_belt) * 100) / 100},
		    {'description.inserter-belt-speed', slowest_belt},
		    '\n',
		    {'description.inserter-stack-size', multiplier_2, math.floor(0.5 + 1 / (1 / hand_speed / multiplier_2 + 0.0445272463 * multiplier_2 / fastest_belt) * 100) / 100},
		    {'description.inserter-belt-speed', fastest_belt},
		    '\n',
		    {'description.inserter-speed-belt-to-chest'},
		    {'description.inserter-stack-size-guess', multiplier_1, math.floor(0.5 + 1 / (1 / hand_speed / multiplier_1 + 0.055 * multiplier_1 / slowest_belt) * 10) / 10},
		    {'description.inserter-belt-speed', slowest_belt},
		    '\n',
		    {'description.inserter-stack-size-guess', multiplier_2, math.floor(0.5 + 1 / (1 / hand_speed / multiplier_2 + 0.055 * multiplier_2 / fastest_belt) * 10) / 10},
		    {'description.inserter-belt-speed', fastest_belt},
	    })
    end
end

-- SE build restrictions

if mods['space-exploration'] then
	for _, building in pairs(data.raw) do
		for _, building in pairs(building) do
			if building.localised_description then
				local placement = localised_string_contains(building.localised_description, 'placement_restriction_line')
				if placement then
					add_to_description('entity', building, placement)
				end
			end
		end
	end
end

-- tank size and pressure

if settings.startup['ed-tank-size'].value then
	for prototype_name, tank in pairs(data.raw) do
		for tank_name, tank in pairs(tank) do
			local box = tank.fluid_box
			if box then
				if tank.minable then
					local size = (box.height or 1) * (box.base_area or 1)
					local pressure = (box.height or 1) + (box.base_level or 0)

					if prototype_name ~= 'storage-tank' or pressure ~= 1 then
						add_to_description('entity', tank, {'description.tank-size', size * 100})
						add_to_description('entity', tank, {'description.pressure', pressure * 100})
					end
				end
			else break end
		end
	end
end

-- fluid colors

if settings.startup['ed-fluid-colors'].value then
	local function interpret_color(color)
		local r = color.r or color[1] or 0
		local g = color.g or color[2] or 0
		local b = color.b or color[3] or 0
		local a = color.a or color[4] or 1

		if r <= 1 and g <= 1 and b <= 1 and a <= 1 then
			r = r * 255
			g = g * 255
			b = b * 255
		end

		return '[color=' .. tostring(floor(r)) .. ',' .. tostring(floor(g)) .. ',' .. tostring(floor(b)) .. '] ■[/color]'
	end

    for _, fluid in pairs(data.raw.fluid) do
	    if fluid.localised_name and fluid.localised_name ~= '' then
		    fluid.localised_name = {'', fluid.localised_name, interpret_color(fluid.base_color)}
	    else
		    fluid.localised_name = {'', {'fluid-name.' .. fluid.name}, interpret_color(fluid.base_color)}
	    end
    end
end

-- deadlock stacking & item stack sizes

for _, prototype in pairs(data.raw) do
	for item_name, item in pairs(prototype) do
		if item.stack_size and not item_name:find('^big%-data%-') then
			add_to_description('item', item, {'description.stack-size', tostring(item.stack_size)})

			if mods['deadlock-beltboxes-loaders'] and data.raw.item['deadlock-stack-' .. item_name] then
				add_to_description('item', item, {'description.stackable'})
			end
		else break end
	end
end

-- voiding

if settings.startup['ed-voiding'].value then
    local void_categories = {
	    ['incineration'] = {'incinerator', 'electric-incinerator'},
	    ['fuel-incineration'] = {'electric-incinerator'},
	    ['flaring'] = {'vent-stack', 'flare-stack'},
	    ['py-incineration'] = {'py-burner'},
	    ['py-venting'] = {'py-gas-vent'},
	    ['py-runoff'] = {'py-sinkhole'},
	    ['angels-chemical-void'] = {'angels-flare-stack'},
	    ['angels-water-void'] = {'clarifier'}
    }

    for _, recipe in pairs(data.raw.recipe) do
	    if recipe.category and void_categories[recipe.category] then
		    recipe.always_show_products = true

		    local difficulty = recipe.normal or recipe.expensive or recipe
		    local ingredient = difficulty.ingredients[1]

		    if ingredient == nil then break end

		    if ingredient[1] then
			    ingredient = {type = 'item', name = ingredient[1], amount = ingredient[2]}
		    end

		    local target
		    local target_type = 'item'
		    if ingredient.type == 'item' then
			    for _, prototype in pairs(data.raw) do
				    for _, item in pairs(prototype) do
					    if item.stack_size and prototype[ingredient.name] then
						    target = prototype[ingredient.name]
						    goto done
					    end
					    break
				    end
			    end
			    ::done::
		    elseif ingredient.type == 'fluid' then
			    target = data.raw.fluid[ingredient.name]
			    target_type = 'fluid'
		    end

		    for _, machine in ipairs(void_categories[recipe.category]) do
			    machine = data.raw.furnace[machine] or data.raw['assembling-machine'][machine]
			    if machine then
				    add_to_description(target_type, target, {
					    'description.voidable',
					    machine.localised_name or {'entity-name.' .. machine.name},
					    math.floor(0.5 + ingredient.amount / (difficulty.energy_required or 0.5) * 100) / 100
				    })
			    end
		    end
	    end
    end
end

