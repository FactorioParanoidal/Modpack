
local bbr_rail_pictures_internal = function(elems)
	local keys = {{"straight_rail", "horizontal", 64, 128, 0, 0, true},
                {"straight_rail", "vertical", 128, 64, 0, 0, true},
                {"straight_rail", "diagonal-left-top", 96, 96, 0.5, 0.5, true},
                {"straight_rail", "diagonal-right-top", 96, 96, -0.5, 0.5, true},
                {"straight_rail", "diagonal-right-bottom", 96, 96, -0.5, -0.5, true},
                {"straight_rail", "diagonal-left-bottom", 96, 96, 0.5, -0.5, true},
                {"curved_rail", "vertical-left-top", 192, 288, 0.5, 0.5},
                {"curved_rail", "vertical-right-top", 192, 288, -0.5, 0.5},
                {"curved_rail", "vertical-right-bottom", 192, 288, -0.5, -0.5},
                {"curved_rail", "vertical-left-bottom", 192, 288, 0.5, -0.5},
                {"curved_rail" ,"horizontal-left-top", 288, 192, 0.5, 0.5},
                {"curved_rail" ,"horizontal-right-top", 288, 192, -0.5, 0.5},
                {"curved_rail" ,"horizontal-right-bottom", 288, 192, -0.5, -0.5},
                {"curved_rail" ,"horizontal-left-bottom", 288, 192, 0.5, -0.5}}
	local res = {}
	local g_path
	for _ , key in ipairs(keys) do
		part = {}
		dashkey = key[1]:gsub("_", "-")
		for _ , elem in ipairs(elems) do
			if elem.id then
				g_path = "__beautiful_straight_bridge_railway__"
				footer = "-"..elem.id
			else
				g_path = "__base__"
				footer = ""
			end
			part[elem[1]] = {
				filename = string.format("%s/graphics/entity/%s/%s-%s-%s%s.png",g_path, dashkey, dashkey, key[2], elem[2], footer),
				priority = elem.priority or "extra-high",
				flags = elem.mipmap and { "icon" } or { "low-object" },
				width = key[3],
				height = key[4],
				shift = {key[5], key[6]},
				variation_count = (key[7] and elem.variations) or 1,
				hr_version = {
					filename = string.format("%s/graphics/entity/%s/hr-%s-%s-%s%s.png",g_path, dashkey, dashkey, key[2], elem[2], footer),
					priority = elem.priority or "extra-high",
					flags = elem.mipmap and { "icon" } or { "low-object" },
					width = key[3]*2,
					height = key[4]*2,
					shift = {key[5], key[6]},
					scale = 0.5,
					variation_count = (key[7] and elem.variations) or 1,
				}
			}
		end
		dashkey2 = key[2]:gsub("-", "_")
		res[key[1] .. "_" .. dashkey2] = part
	end

	res["rail_endings"] = { sheets = {
		{
			filename = "__base__/graphics/entity/rail-endings/rail-endings-background.png",
			priority = "high",
			flags = { "low-object" },
			width = 128,
			height = 128,
			hr_version = {
				filename = "__base__/graphics/entity/rail-endings/hr-rail-endings-background.png",
				priority = "high",
				flags = { "low-object" },
				width = 256,
				height = 256,
				scale = 0.5
			}
		},
		{
			filename = "__base__/graphics/entity/rail-endings/rail-endings-metals.png",
			priority = "high",
			flags = { "icon" },
			width = 128,
			height = 128,
			hr_version = {
				filename = "__base__/graphics/entity/rail-endings/hr-rail-endings-metals.png",
				priority = "high",
				flags = { "icon" },
				width = 256,
				height = 256,
				scale = 0.5
			}
		}
	}}
	return res
end

local bbr_rail_pictures = function(id)
	return bbr_rail_pictures_internal({{"metals", "metals", mipmap = true},
									{"backplates", "backplates", mipmap = true},
									{"ties", "ties", variations = 3},
									{"stone_path", "stone-path", variations = 3, id = id},
									{"stone_path_background", "stone-path-background", variations = 3, id = id},
									{"segment_visualisation_middle", "segment-visualisation-middle"},
									{"segment_visualisation_ending_front", "segment-visualisation-ending-1"},
									{"segment_visualisation_ending_back", "segment-visualisation-ending-2"},
									{"segment_visualisation_continuing_front", "segment-visualisation-continuing-1"},
									{"segment_visualisation_continuing_back", "segment-visualisation-continuing-2"}
									})
end

-- add fast_replaceable_group to vanilla rail
-- data.raw["legacy-straight-rail"]["legacy-straight-rail"].fast_replaceable_group = "legacy-straight-rail"
-- data.raw["legacy-curved-rail"]["legacy-curved-rail"].fast_replaceable_group = "legacy-curved-rail"

local ptype
local holder = {}
local bridges = {
	brick = {
		order = "a[train-system]-az-c",
		ingredients = {
			{"stone-brick", 1}, {"iron-stick", 1}, {"steel-plate", 1}
		},
		overlay_icon = "stone-brick.png"
	}
}

for id, param in pairs(bridges) do

-- recipe
	ptype = table.deepcopy(data.raw["recipe"]["rail"])
	ptype.name = "bbr-rail-"..id
	ptype.ingredients = param.ingredients
	ptype.result = "bbr-rail-"..id
	table.insert(holder, ptype)

-- item
	ptype = table.deepcopy(data.raw["rail-planner"]["rail"])
	ptype.name = "bbr-rail-"..id
	ptype.localised_name = {"entity-name."..ptype.name}
	ptype.icons = {
		{ icon = ptype.icon },
		{
			icon = "__base__/graphics/icons/"..param.overlay_icon ,
			scale = 0.4,
			shift = {6, -6},
			tint = param.tint
		}
	}
	ptype.order = string.format("%s[%s]", param.order, ptype.name)
	ptype.place_result = "bbr-straight-rail-"..id
	ptype.straight_rail = "bbr-straight-rail-"..id
	ptype.curved_rail = "bbr-curved-rail-"..id
	table.insert(holder, ptype)

-- straight-rail
	ptype = table.deepcopy(data.raw["legacy-straight-rail"]["legacy-straight-rail"])
	ptype.name = "bbr-straight-rail-"..id
	ptype.collision_mask = { "object-layer" }
	ptype.minable.result = "bbr-rail-"..id
	ptype.pictures = bbr_rail_pictures(id)
	ptype.icons = {
		{ icon = ptype.icon },
		{
			icon = "__base__/graphics/icons/"..param.overlay_icon ,
			scale = 0.4,
			shift = {6, -6},
			tint = param.tint
		}
	}
	table.insert(holder, ptype)

-- curved-rail
	ptype = table.deepcopy(data.raw["legacy-curved-rail"]["legacy-curved-rail"])
	ptype.name = "bbr-curved-rail-"..id
	ptype.collision_mask = { "object-layer" }
	ptype.minable.result = "bbr-rail-"..id
	ptype.placeable_by.item="bbr-rail-"..id
	ptype.pictures = bbr_rail_pictures(id)
	ptype.icons = {
		{ icon = ptype.icon },
		{
			icon = "__base__/graphics/icons/"..param.overlay_icon ,
			scale = 0.4,
			shift = {6, -6},
			tint = param.tint
		}
	}
	table.insert(holder, ptype)
end

data:extend(holder)