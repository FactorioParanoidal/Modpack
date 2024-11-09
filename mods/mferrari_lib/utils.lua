
function Log(what)
helpers.write_file("mf_log.log", serpent.block(what), true)
end


function glow_on_entity(entity, scale, tint)
local render = rendering.draw_sprite{
        sprite = "wdm_glow",
        target = entity,
        surface = entity.surface,
        tint = tint or {r = 1, g = 1, b = 1},
        x_scale = scale,
        y_scale = scale,
        render_layer = "radius-visualization",
        --time_to_live = length,
      }
end


-- Create a random direction vector to look in
function GetRandomVector(v)
v=v or 3
    local randVec = {x=0,y=0}   
    while ((randVec.x == 0) and (randVec.y == 0)) do
        randVec.x = math.random(-v,v)
        randVec.y = math.random(-v,v)
    end
    return randVec
end



function safe_player_teleport(player,surface,position)
local pos = surface.find_non_colliding_position("character", position, 50, 2) --zero was freezing game if no tiles 
if pos then player.teleport(pos, surface) else player.teleport(position, surface) end
end

function get_gps_tag(position,surface)
	local r = '[gps='..math.floor(position.x)..','..math.floor(position.y)
	if surface then r=r..','..surface.name end
	r=r..']'
	return r	
	end
	

function get_localized_name(name)
local lname = ''
local ico = ''
if prototypes.item[name]   then lname = prototypes.item[name].localised_name ico='[img=item/'..name..']'
 elseif prototypes.equipment[name] then lname = prototypes.equipment[name].localised_name  ico='[img=item/'..name..']' 
 elseif prototypes.fluid[name]  then lname = prototypes.fluid[name].localised_name  ico='[img=fluid/'..name..']'  
 elseif prototypes.entity[name] then lname = prototypes.entity[name].localised_name ico='[img=entity/'..name..']' end
return  lname, ico 
end



function check_container_for_items(container,items)
local has_all =true
for k=1,#items do 
	if container.get_item_count(items[k].name)<items[k].count then has_all=false break end
	end
return has_all 		
end


function remove_items_from_container(container,items)
for k=1,#items do 
	container.remove_item(items[k])
	end	
end


function check_container_for_items_pay_part(container,items)
local paid_all =true
local paid=0
for k=#items,1,-1 do
	local has = container.get_item_count(items[k].name)
	local count = items[k].count 
	local removed = container.remove_item(items[k])
	paid = paid + removed
	if removed==count then
		table.remove(items,k)
		else
		paid_all=false 
		if removed>0 then 
			paid = paid + removed
			items[k].count = items[k].count - removed
			end		
		end
	end
return paid_all, paid
end


function clear_chest(chest, inventory_type)
if not inventory_type then inventory_type=defines.inventory.chest end
local inv = chest.get_inventory(inventory_type)
if inv then inv.clear() end
end

function transfer_inventory_loose (entity_a, entity_b, inventory_type)
    local inv_a = entity_a.get_inventory(inventory_type)
    if inv_a then
        local contents = inv_a.get_contents()
        for _, stack in pairs(contents) do
            entity_b.insert(stack)
        end
    end
end

function transfer_quipment_grid_from_entities(entity_a, entity_b)
local grid_a = entity_a.grid
local grid_b = entity_b.grid
local t
if grid_a and grid_b then
	t=0
	local eq = grid_a.equipment
	for x=1,#eq do 
		local e=eq[x]
		local pos = e.position
		local name= e.name
		local added = grid_b.put{name=name, position=pos}
		if added then 
			t=t+1
			if e.type=='battery-equipment' then added.energy = e.energy end
			if e.type=='energy-shield-equipment' then added.shield = e.shield end
			grid_a.take{equipment=e}
			end
		end
	end
return t
end


function transfer_inventory (entity_a, entity_b, inventory_type, inventory_type_b, filters)
local tqt = 0
    local inv_a = entity_a.get_inventory(inventory_type)
    local inv_b = entity_b.get_inventory(inventory_type_b or inventory_type)
    if inv_a and inv_b then
        local contents = inv_a.get_contents()
        for _, stack in pairs(contents) do
            if (not filters) or (in_list(filters, stack.name)) then
				local qt = inv_b.insert(stack)
				tqt = tqt + qt
				if qt>0 then inv_a.remove({name=stack.name, count=qt, quality=stack.quality}) end
				end
        end
    end
return tqt	
end


function transfer_fluid (entity_a, entity_b)
local fluids = entity_a.get_fluid_contents()
local name,amt,name_b
for n,a in pairs (fluids) do
	name=n
	amt=a
	break
	end
local fluids_b = entity_b.get_fluid_contents()
for n,a in pairs (fluids_b) do
	name_b=n
	break
	end
local transfered=0
if name and amt and ((not name_b) or name==name_b) then
	entity_b.remove_fluid{name=name,amount=transfered}
	transfered = entity_b.insert_fluid({name=name,amount=amt})
	entity_a.remove_fluid{name=name,amount=transfered}
	end

return name, transfered	
end






function GetPositionAtDistance(surface,from,distance,name)
local pX, pY, position
for t=1,20 do 
	local x = math.random(distance, distance*2)
	local y = math.random(distance, distance*2)
	if math.random(2)==1 then x=x*-1 end
	if math.random(2)==1 then y=y*-1 end
	pX = from.x+x
	pY = from.y+y
	position = surface.find_non_colliding_position(name, {x=pX,y=pY}, distance, 1)
	if position~=nil then break end
end

return position
end


function get_players_near_position(surface,pos,howfar)
local pls={}
	for p, player in pairs(game.connected_players) do
		if player and player.valid and player.character and player.character.valid and surface==player.surface then
			if distance(pos,player.position)<=howfar then table.insert(pls,player) end
			end
	end
return pls
end

function get_players_near_object(object,howfar,force)
local pls={}
if object and object.valid then
	for p, player in pairs(game.connected_players) do
		if player and player.valid and player.character and player.character.valid and object.surface==player.surface then
			if distance(object.position,player.position)<=howfar then 
				if (not force) or (force==player.force) then table.insert(pls,player) end
				end
			end
		end
	end
return pls
end

function get_pos_near_enemy_nest(surface,spawn,pforce)
	local enemy = surface.find_nearest_enemy{position=spawn, max_distance=500, force=pforce}
	if enemy then
		local f = enemy.force
		local nests = surface.find_entities_filtered{type='unit-spawner', position=enemy.position, radius=300, force=f, limit=5}
		if #nests>0 then 
			spawn = get_random_pos_near(nests[math.random(#nests)].position,30)
			spawn = surface.find_non_colliding_position('assembling-machine-1', spawn, 0, 1)
			end
		end
return spawn 
end




function add_gui(parent,element,destroy,style)
local E = parent[element.name]
if destroy and E then E.destroy() E=nil end
if not E then E=parent.add(element) end
if style then for s=1,#style do E.style[style[s][1]]=style[s][2] end end
return E
end



--- @class FlyingTextOptions
--- @field color Color?
--- @field position MapPosition?
--- @field sound LuaPlayer.play_sound_param?

--- @param player LuaPlayer
--- @param text LocalisedString
--- @param options FlyingTextOptions?
function flying_text_with_sound(player, text, options)
  options = options or {}
  options.sound = options.sound or { path = "utility/cannot_build" }
  player.create_local_flying_text({
    color = options.color,
    create_at_cursor = not options.position,
    position = options.position,
    text = text,
  })
  player.play_sound(options.sound)
end

function entity_flying_text(entity, text, color,time_to_live)
rendering.draw_text{text,use_rich_text=true,color = color, surface=entity.surface, time_to_live=time_to_live or 100,
		target={entity=entity, offset={-2+math.random()*4,-3 + math.random()*2}}} 
end

function surface_flying_text(surface, position, text, options)
 options = options or {}
  options.sound = options.sound or "utility/cannot_build"
  rendering.draw_text{text,use_rich_text=true,color = options.color, surface=surface, time_to_live=options.time_to_live or 100,
  target={entity=position}} 
  surface.play_sound{path=options.sound, position=position}
end




function create_things_around(surface,things,how_many, position,radius, force)
local ents={}
for x=1,how_many do 
	local name = things[math.random(#things)]
	local p = surface.find_non_colliding_position(name, get_random_pos_near(position,radius),radius,2)
	if p then 
		local e = surface.create_entity{name=name, position=p, force=force}
		table.insert(ents,e)
		end
	end
if #ents>0 then return ents	end
end


function count_players_on_surface(surface, force)
local look_on = force or game
local c = 0
for _,p in pairs (look_on.connected_players) do
	if surface==p.surface then c = c +1 end
	end
return c
end




function prepare_spidertron(spider,ammo)
if ammo then spider.insert(ammo) end
if script.active_mods['Krastorio2'] then spider.insert{name='dt-fuel', count=5} end
end


function validate_cost_items(list) --validate item list
for i=1,#list do 
	if not prototypes.item[list[i].name] then 
		return false end
	end
return true
end




-- Give XP to team - RPGSystem
function GrantXP(forcename,XP)
	if remote.interfaces["RPG"] then
		remote.call("RPG","TeamXP",forcename,XP)
		end
end
function GrantXPPerc(forcename,XPPerc)
	if remote.interfaces["RPG"] then
		remote.call("RPG","TeamXPPerc",forcename,XPPerc)
		end
end
	
	

function forbidden_construction_give_back_item(event, message, color)
	if not color then color=colors.lightred end
	local entity = event.entity
		if entity.type=='entity-ghost' or entity.type=='tile-ghost' then return end
	
		if event.name==defines.events.script_raised_built and entity.name=="rsc-silo-stage2" then 
			entity.surface.spill_item_stack{position=entity.position,stack={name="rsc-excavation-site"}, enable_looted=false}
			if message then mf_print(entity.force,message,color) end
	
		elseif event.robot then 
			if event.stack then entity.surface.spill_item_stack{position=entity.position, stack=event.stack, enable_looted=false} end
			
		elseif event.consumed_items and event.player_index then --and event.stack.valid_for_read
			local contents = event.consumed_items.get_contents()   --name	:: string	count	quality	:: QualityID	
			local player=game.players[event.player_index]
			for _,stack in pairs(contents) do
				if player.character and player.character.valid then
					player.insert(stack)
					else
					entity.surface.spill_item_stack{position=entity.position, stack=stack, enable_looted=false}
					end
				end
			if message then	mf_print(player,message,color) end
			end
	if entity.valid then entity.destroy() end			
	end


function mf_print(to_who,message, color, icon)
message={"", icon, "[font=default-large-bold]", message, "[/font]"}
to_who.print(message,{color=color})
end	




function translate_element_icon(element_icon, make_it_a_tag)
	if element_icon then
		local icon
		local name 
		local typ   
	if element_icon.type and element_icon.type=='virtual' then 
			name=element_icon.name
			typ="virtual-signal"
			icon ='virtual-signal/'..element_icon.name 
		elseif element_icon.type then 
			name=element_icon.name
			typ=element_icon.type
			icon =element_icon.type..'/'..element_icon.name 
		elseif element_icon.name then
			name=element_icon.name
			typ="item"			
			icon ='item/'..element_icon.name
		else
			name=element_icon
			typ="item"				
			icon ='item/'..element_icon
		end
	if make_it_a_tag then 
		return {type=typ,name=name}
		else return icon
		end
	end
	end
	