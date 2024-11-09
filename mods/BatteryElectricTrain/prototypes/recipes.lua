local items = data.raw["item"]

local fuel_value_cache = {}
local function get_fuel_value(name)
	local value = fuel_value_cache[name]

	if not value then
		value = util.parse_energy(items[name.."-full"].fuel_value)
		fuel_value_cache[name] = value
	end

	return value
end

local battery_capacity = 4000000

local ingr_advc = {"advanced-circuit",      1}
local ingr_proc = {"processing-unit",       1}
local ingr_lowd = {"low-density-structure", 1}
local ingr_effm = {"efficiency-module-3",  1}

local function MakeBatteryRecipe(name)
	local level = tonumber(name:sub(-1))
	local item_name = name.."-empty"

	local ingr = {
		{"battery", math.floor(get_fuel_value(name) / battery_capacity + 0.9)},
		{"steel-plate", 2*level},
		ingr_advc,
	}

	if level >= 2 then ingr[4] = ingr_proc end
	if level >= 3 then ingr[5] = ingr_lowd end
	if level >= 4 then ingr[6] = ingr_effm end

	return {
		type = "recipe",
		name = item_name,
		enabled = false,
		energy_required = 5*level,
		ingredients = ingr,
		result = item_name,
	}
end


local charging_power = util.parse_energy(data.raw["furnace"][name_chg1].energy_usage) * 60 -- parse_energy() returns consumption per tick, so multiply with 60

local function MakeChargingRecipe(name)
	local item_name = name.."-full"

	return {
		type = "recipe",
		name = item_name,
		category = name_cat_recipe_chg,
		enabled = false,
		energy_required = math.floor(get_fuel_value(name) / charging_power + 0.9),
		ingredients = {{name.."-empty", 1}},
		result = item_name,
		allow_decomposition = false,
	}
end


local function MakeTertiaryCharger(basename, tname)
	return {
		type = "recipe",
		name = tname,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{basename, 1},
			{"substation", 1},
		},
		result = tname,
	}
end


data:extend({
	{
		type = "recipe",
		name = name_locomotive,
		energy_required = 4,
		enabled = false,
		ingredients = {
			{"electric-engine-unit", 16},
			{"electronic-circuit", 20},
			{"advanced-circuit", 5},
			{"steel-plate", 30},
		},
		result = name_locomotive,
	},
	{
		type = "recipe",
		name = name_chg1,
		enabled = false,
		energy_required = 10,
		ingredients = {
			{"steel-plate", 10},
			{"copper-cable", 5},
			{"electronic-circuit", 5},
			{"advanced-circuit", 5},
		},
		result = name_chg1,
	},
	{
		type = "recipe",
		name = name_chg2,
		enabled = false,
		energy_required = 15,
		ingredients = {
			{name_chg1, 1},
			{"copper-cable", 10},
			{"electronic-circuit", 10},
			{"advanced-circuit", 10},
			{"speed-module", 1},
		},
		result = name_chg2,
	},
	{
		type = "recipe",
		name = name_chg3,
		enabled = false,
		energy_required = 20,
		ingredients = {
			{name_chg2, 1},
			{"copper-cable", 20},
			{"electronic-circuit", 20},
			{"advanced-circuit", 20},
			{"speed-module-2", 1},
		},
		result = name_chg3,
	},
	MakeTertiaryCharger(name_chg1, name_chg1t),
	MakeTertiaryCharger(name_chg2, name_chg2t),
	MakeTertiaryCharger(name_chg3, name_chg3t),
	MakeBatteryRecipe(name_fuel1),
	MakeBatteryRecipe(name_fuel2),
	MakeBatteryRecipe(name_fuel3),
	MakeBatteryRecipe(name_fuel4),
	MakeChargingRecipe(name_fuel1),
	MakeChargingRecipe(name_fuel2),
	MakeChargingRecipe(name_fuel3),
	MakeChargingRecipe(name_fuel4),
})

if settings.startup[setting_recycling].value then
	local function MakeRecyclingRecipe(name)
		local level = tonumber(name:sub(-1))

		return {
			type = "recipe",
			name = name.."-recycling",
			icon = graphics_path..name.."-recycling-icon.png",
			icon_size = 64, icon_mipmaps = 4,
			subgroup = name_group_batteries,
			order = "c",
			category = "advanced-crafting",
			enabled = false,
			energy_required = 5*level,
			ingredients = {{name.."-empty", 1}},
			result = "battery",
			result_count = math.floor(get_fuel_value(name)/battery_capacity*0.9),
			hide_from_stats = true,
			allow_as_intermediate = false, -- don't allow as intermediate, hand-crafting not allowed anyway (fixes incompatibility with Industrial Revolution 2)
			allow_decomposition = false,
			main_product = "",
		}
	end

	data:extend({
		MakeRecyclingRecipe(name_fuel1),
		MakeRecyclingRecipe(name_fuel2),
		MakeRecyclingRecipe(name_fuel3),
		MakeRecyclingRecipe(name_fuel4),
	})
end
