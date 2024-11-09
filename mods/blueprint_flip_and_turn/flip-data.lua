
local fv = {}
local fh = {}

--------------------------------------------------------------------
---- curved-rail (Vanilla) ----

fv["legacy-curved-rail"] = function(ent)
	local dir = ent.direction or 0
	ent.direction = (5 - dir +8)%8
end
--[[
0	5
1	4
2	3
3	2
4	1
5	0
6	7
7	6
]]--
fh["legacy-curved-rail"] = function(ent)
	local dir = ent.direction or 0
	ent.direction = (1 - dir +8)%8
end

--------------------------------------------------------------------
---- storage-tank (Vanilla) ----

fv["storage-tank"] = function(ent)
	if ent.direction == 2 or ent.direction == 6 then
		ent.direction = 4
	else
		ent.direction = 2
	end
end
--[[
?0?	2
2	4
?4?	2
6	4
?*?	2
]]--
fh["storage-tank"] = function(ent)
	if ent.direction == 2 or ent.direction == 6 then
		ent.direction = 4
	else
		ent.direction = 2
	end
end



--------------------------------------------------------------------
---- rail-signal (Vanilla) ----

fv["rail-signal"] = function(ent)
	local dir = ent.direction or 0
	if dir == 1 then
		ent.direction = 7
	elseif  dir == 2 then
		ent.direction = 6
	elseif  dir == 3 then
		ent.direction = 5
	elseif  dir == 5 then
		ent.direction = 3
	elseif  dir == 6 then
		ent.direction = 2
	elseif  dir == 7 then
		ent.direction = 1
	end
end
--[[
(0	0)
1	7
2	6
3	5
(4	4)
5	3
6	2
7	1
]]--
fh["rail-signal"] = function(ent)
	local dir = ent.direction or 0
	if dir == 0 then
		ent.direction = 4
	elseif dir == 1 then
		ent.direction = 3
	elseif dir == 3 then
		ent.direction = 1
	elseif dir == 4 then
		ent.direction = 0
	elseif dir == 5 then
		ent.direction = 7
	elseif dir == 7 then
		ent.direction = 5
	end
end

---- rail-chain-signal (Vanilla) ----
fv["rail-chain-signal"] = fv["rail-signal"]
fh["rail-chain-signal"] = fh["rail-signal"]

--------------------------------------------------------------------
---- train-stop (Vanilla) ----

fv["train-stop"] = function(ent)
	local dir = ent.direction or 0
	if dir == 2 then
		ent.direction = 6
	elseif  dir == 6 then
		ent.direction = 2
	end
end
--[[
2	6
6	2
]]--
fh["train-stop"] = function(ent)
	local dir = ent.direction or 0
	if dir == 0 then
		ent.direction = 4
	elseif dir == 4 then
		ent.direction = 0
	end
end


--------------------------------------------------------------------
-- splitter (Vanilla) ----

fv["splitter"] = function(ent)
	local dir = ent.direction or 0
	--[[
	Initial:
		For a vertical flip (horizontal axe) (up/down) the "entities" with "name" equal to "splitter", "fast-splitter" or "express-splitter"
		with "direction" 2 or 6 should toggle the "input_priority" and "output_priority" fields (if exists).
	Update:
		The flip rotate the splitter then we must toggle the left/right in all cases. No need to check the direction.
	]]--
	local function toggle_priority(pri)
		return ({left="right",right="left"})[pri] or pri
	end
	if ent.input_priority then
		ent.input_priority = toggle_priority(ent.input_priority)
	end
	if ent.output_priority then
		ent.output_priority = toggle_priority(ent.output_priority)
	end
	ent.direction = (4 -dir +8)%8
end
--[[
0	4
1	3
2	2
3	1
4	0
5	7
6	6
7	5
]]--
fh["splitter"] = function(ent)
	local dir = ent.direction or 0
	--[[
		Initial:
			For a horizontal flip (vertical axe) (left/right) the "entities" with "name" equal to "splitter", "fast-splitter" or "express-splitter"
			with "direction" 0 or 4 should toggle the "input_priority" and "output_priority" fields (if exists).
		Update:
			The flip rotate the splitter then we must toggle the left/right in all cases. No need to check the direction.
	]]--
	local function toggle_priority(pri)
		return ({left="right",right="left"})[pri] or pri
	end
	if ent.input_priority then
		ent.input_priority = toggle_priority(ent.input_priority)
	end
	if ent.output_priority then
		ent.output_priority = toggle_priority(ent.output_priority)
	end
	ent.direction = (16 - dir)%8
end

---- fast-splitter (Vanilla) ----
fv["fast-splitter"] = fv["splitter"]
fh["fast-splitter"] = fh["splitter"]


---- express-splitter (Vanilla) ----
fh["express-splitter"] = fh["splitter"]
fv["express-splitter"] = fv["splitter"]


--------------------------------------------------------------------
-- the default handler --

local function autowarning(ent)
	if string.find(ent.name, "tank") or string.find(ent.name, "splitter") then
		modwarning("possible tank or splitter not flipped (name="..tostring(ent.name).."). Please report it to the mod's Author.")
	end
end
fv["*"] = function(ent)
	--autowarning(ent)
	local dir = ent.direction or 0
	ent.direction = (4 -dir +8)%8
end
--[[
0	4
1	3
2	2
3	1
4	0
5	7
6	6
7	5
]]--
fh["*"] = function(ent)
	--autowarning(ent)
	local dir = ent.direction or 0
	ent.direction = (8 -dir +8)%8
end

--------------------------------------------------------------------
---- Support Bob's Logistics' liquid tanks ----
fv["storage-tank-2"] = fv["storage-tank"] ; fh["storage-tank-2"] = fh["storage-tank"]
fv["storage-tank-3"] = fv["storage-tank"] ; fh["storage-tank-3"] = fh["storage-tank"]
fv["storage-tank-4"] = fv["storage-tank"] ; fh["storage-tank-4"] = fh["storage-tank"]

--------------------------------------------------------------------
---- Support Mini Machines' liquid tanks ----
fv["mini-tank-1"] = fv["storage-tank"] ; fh["mini-tank-1"] = fh["storage-tank"]
fv["mini-tank-2"] = fv["storage-tank"] ; fh["mini-tank-2"] = fh["storage-tank"]
fv["mini-tank-3"] = fv["storage-tank"] ; fh["mini-tank-3"] = fh["storage-tank"]
fv["mini-tank-4"] = fv["storage-tank"] ; fh["mini-tank-4"] = fh["storage-tank"]

return {fv=fv,fh=fh}
