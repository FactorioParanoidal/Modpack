require ("util")
local format_time   = util.formattime
local format_number = util.format_number

function d_format_number(number, form)
	if not form then form = "%.2f" end
	return string.format(form, number)
	end
	

function format_time_hour(tick)
return string.format("%d:%02d:%02d", math.floor(tick / 216000), math.floor(tick / 3600) % 60, math.floor(tick / 60) % 60)
end

function format_t(tick)
return format_time(tick)
end


function format_time_from_tick(ThatTick)
  if game.tick > ThatTick then return format_time(game.tick-ThatTick)
  else return format_time(ThatTick - game.tick)
  end
end

function getDayTimeString(surface)
    local daytime = surface.daytime + 0.5
    local dayminutes = math.floor(daytime * 24 * 60) % 60
    local dayhour = math.floor(daytime * 24 ) % 24
   return string.format("%02d:%02d", dayhour, dayminutes)
   end

   
function format_evolution(evo)
return string.format("%.2f", math.floor(evo * 1000) / 10)
end

function format_force_evolution(force,surface)
local evo = force.get_evolution_factor(surface)
return format_evolution(evo) 
end

function shortnumberstring(number)
    local steps = {
        {1,""},
        {1e3,"k"},
        {1e6,"m"},
        {1e9,"g"},
        {1e12,"t"},
    }
    for _,b in ipairs(steps) do
        if b[1] <= number+1 then
            steps.use = _
        end
    end
    local result = string.format("%.1f", number / steps[steps.use][1])
    if tonumber(result) >= 1e3 and steps.use < #steps then
        steps.use = steps.use + 1
        result = string.format("%.1f", tonumber(result) / 1e3)
    end
    return result .. steps[steps.use][2]
end

function my_format_number(number, maxed)
if not maxed then maxed=1000000000 end
local result 
if number < maxed then result=format_number(number)  --- 
	else result=shortnumberstring(number) end
return result
end


-- Get a random 1 or -1
function RandomNegPos()
    if (math.random(0,1) == 1) then
        return 1
    else
        return -1
    end
end


function to_table(pos_arr)
    if #pos_arr == 2 then
        return { x = pos_arr[1], y = pos_arr[2] }
    end
    return pos_arr
end

function distance_squared(pos1, pos2)
    pos1 = to_table(pos1)
    pos2 = to_table(pos2)
    local axbx = pos1.x - pos2.x
    local ayby = pos1.y - pos2.y
    return axbx * axbx + ayby * ayby
end

--------------------------------------------------------------------------------------
function square_area( origin, radius )
	return {
		{x=origin.x - radius, y=origin.y - radius},
		{x=origin.x + radius, y=origin.y + radius}
	}
end

function get_area_center(area)
local x1 = area.left_top.x
local y1 = area.left_top.y
local x2 = area.right_bottom.x
local y2 = area.right_bottom.y
return {x= math.floor(x1 + x2) /2,y= math.floor(y1 + y2) /2}
end

-- Get an area given a position and distance.
-- Square length = 2x distance
function GetAreaAroundPos(pos, dist, right_adj)
right_adj = right_adj or 0
    return {left_top=
                    {x=pos.x-dist,
                     y=pos.y-dist},
            right_bottom=
                    {x=pos.x+dist + right_adj,
                     y=pos.y+dist + right_adj}}
end


function create_retangle_area(pos,height,width,adjust_w,adjust_h)
local h = math.ceil(height/2)
local w = math.ceil(width/2)
adjust_w = adjust_w or 0
adjust_h = adjust_h or 0
    return {left_top=
                    {x=pos.x-w + adjust_w,
                     y=pos.y-h + adjust_h},
            right_bottom=
                    {x=pos.x+w,
                     y=pos.y+h}}
end


function get_random_pos_near(pos,dist)
return {x=pos.x+math.random(-dist,dist),y=pos.y+math.random(-dist,dist)}
end

--------------------------------------------------------------------------------------
function distance( pos1, pos2 )
	local dx = pos2.x - pos1.x
	local dy = pos2.y - pos1.y
	return( math.sqrt(dx*dx+dy*dy) )
end

--------------------------------------------------------------------------------------
function distance_square( pos1, pos2 )
	return( math.max(math.abs(pos2.x - pos1.x),math.abs(pos2.y - pos1.y)) )
end

--------------------------------------------------------------------------------------
function pos_offset( pos, offset )
	return { x=pos.x + offset.x, y=pos.y + offset.y }
end

function get_pos_offset( pos1, pos2)
	return { x=pos2.x - pos1.x, y=pos2.y - pos1.y}
end



--------------------------------------------------------------------------------------
function get_pos_near_from_aproach(pos, from, dist,rnd )
	local x=pos.x
	local y=pos.x
	if x>from.x then x=pos.x-dist else x=pos.x+dist end
	if y>from.y then y=pos.y-dist else y=pos.y+dist end
	
	if rnd then 
		x=x+ math.random(rnd)*RandomNegPos()
		y=y+ math.random(rnd)*RandomNegPos()
		end
	
	return { x=x, y=y }
end


--------------------------------------------------------------------------------------
function surface_area(surf)
	local x1, y1, x2, y2 = 0,0,0,0
	
	for chunk in surf.get_chunks() do
		if chunk.x < x1 then
			x1 = chunk.x
		elseif chunk.x > x2 then
			x2 = chunk.x
		end
		if chunk.y < y1 then
			y1 = chunk.y
		elseif chunk.y > y2 then
			y2 = chunk.y
		end
	end
	
	return( {{x1*32-8,y1*32-8},{x2*32+40,y2*32+40}} )
end

--------------------------------------------------------------------------------------
function iif( cond, val1, val2 )
	if cond then
		return val1
	else
		return val2
	end
end


--for k,v in Sort_a_Table(your_table, function(t,a,b) return t[b] > t[a] end) do
function Sort_a_Table(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

--------------------------------------------------------------------------------------
function add_list(list, obj)
	-- to avoid duplicates...
	for i, obj2 in pairs(list) do
		if obj2 == obj then
			return(false)
		end
	end
	table.insert(list,obj)
	return(true)
end

--------------------------------------------------------------------------------------
function del_list(list, obj)
	for i, obj2 in pairs(list) do
		if obj2 == obj then
			table.remove( list, i )
			return(true)
		end
	end
	return(false)
end
--------------------------------------------------------------------------------------
function del_list2(list, list2)
	for i, obj2 in pairs(list2) do del_list(list, obj2) end
end
--------------------------------------------------------------------------------------
function in_list(list, obj)
	for k, obj2 in pairs(list) do
		if obj2 == obj then
			return(k)
		end
	end
	return(nil)
end

--------------------------------------------------------------------------------------
function size_list(list)
	local n = 0
	for i in pairs(list) do
		n = n + 1
	end
	return(n)
end

--------------------------------------------------------------------------------------
function concat_lists(list1, list2)
	-- add list2 into list1 , do not avoid duplicates...
	for i, obj in pairs(list2) do
		table.insert(list1,obj)
	end
end

function concat_lists_no_dup(list1, list2)
	-- add list2 into list1 , Avoiding duplicates...
	for i, obj in pairs(list2) do
		add_list(list1,obj)
	end
end
