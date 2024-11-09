--log("data-updates")
local make_crane_entity = require("data.entity")
local make_crane_item = require("data.item")
local make_crane_recipe = require("data.recipe")
local setup_crane_tech = require("data.tech")

local function register_crane(entityName, newName, wide, forced_ips)
	make_crane_entity(entityName, newName, wide, forced_ips)
	make_crane_item(entityName, newName, wide)
	make_crane_recipe(entityName, newName, wide)
	setup_crane_tech(entityName, newName)
end

--vanilla inserters
local speed_limit = 108
local speed_limit_wide = 324
if mods["bobinserters"] then
	--if we can set dropoff points 2 row train station become possible for every inserter
	speed_limit = nil
	speed_limit_wide = nil
end

register_crane("bulk-inserter", "nco-wide-crane", true, speed_limit_wide)
register_crane("bulk-inserter", "nco-wide-filter-crane", true, speed_limit_wide)
register_crane("bulk-inserter", "nco-crane", false, speed_limit)
register_crane("bulk-inserter", "nco-filter-crane", false, speed_limit)

-- bob's logistics
if mods["boblogistics"] then
	register_crane("red-bulk-inserter", "nco-red-wide-crane", true, nil)
	register_crane("red-stack-filter-inserter", "nco-red-wide-filter-crane", true, nil)
	register_crane("red-bulk-inserter", "nco-red-crane", false, nil)
	register_crane("red-stack-filter-inserter", "nco-red-filter-crane", false, nil)

	register_crane("turbo-bulk-inserter", "nco-wide-turbo-crane", true, nil)
	register_crane("turbo-stack-filter-inserter", "nco-wide-turbo-filter-crane", true, nil)
	register_crane("turbo-bulk-inserter", "nco-turbo-crane", false, nil)
	register_crane("turbo-stack-filter-inserter", "nco-turbo-filter-crane", false, nil)

	register_crane("express-bulk-inserter", "nco-wide-express-crane", true, nil)
	register_crane("express-stack-filter-inserter", "nco-wide-express-filter-crane", true, nil)
	register_crane("express-bulk-inserter", "nco-express-crane", true, nil)
	register_crane("express-stack-filter-inserter", "nco-express-filter-crane", true, nil)
end

--krastorio 2
if mods["Krastorio2"] then
	--wide (6x2)
	register_crane("kr-superior-inserter", "nco-superior-wide-crane", true, nil)
	register_crane("kr-superior-filter-inserter", "nco-superior-wide-filter-crane", true, nil)
	--normal (2x2)
	register_crane("kr-superior-inserter", "nco-superior-crane", false, nil)
	register_crane("kr-superior-filter-inserter", "nco-superior-filter-crane", false, nil)
end
