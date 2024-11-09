

-- fixed for 2.0
function unit_attack_target(unit,target,distraction)
    if not distraction then distraction = defines.distraction.by_enemy end
    local BC = unit.commandable
    if BC then 
        BC.set_command({type = defines.command.attack,distraction = distraction,
                        pathfind_flags = {use_cache = false, low_priority=true, allow_destroy_friendly_entities=false}})
        end
end
    -- fixed for 2.0
function unit_go_to_loc(unit,destination,distraction)
    if not distraction then distraction = defines.distraction.by_enemy end
    local BC = unit.commandable
    if BC then 
        local command = {type = defines.command.go_to_location,
                        pathfind_flags = {use_cache = true, low_priority=false, allow_destroy_friendly_entities=false},
                        distraction = distraction 
                        }
        if destination.x and destination.y then command.destination=destination 
        else command.destination_entity=destination end
        BC.set_command(command)			
        end
end	
    
function group_set_command(group,position_1,position_2, position_3)
	local compound = defines.command.compound
	local structure = defines.compound_command.return_last
	local go_to = defines.command.attack_area   
	if not position_2 then position_2=position_1 end
	if not position_3 then position_3=position_2 end
		group.set_command(
		  { 
			type = compound,
			structure_type = structure,
			commands =
			{
			{type = go_to, destination = position_1, distraction = defines.distraction.by_anything, radius=50},
			{type = go_to, destination = position_2, distraction = defines.distraction.by_enemy, radius=30},
			{type = go_to, destination = position_3, distraction = defines.distraction.by_enemy, radius=30},
			{type = defines.command.wander, distraction = defines.distraction.by_enemy, radius=30},
			}
		  })
  --group.start_moving()
  end

function unit_wander(unit)
    local BC = unit.commandable
    if BC then     
        local command = {type = defines.command.wander}
        unit.set_command(command)
        BC.set_command(command)
        end
end

-- only for wdm ?
function get_random_big_nest(surface,position)
if not position then position={0,0} end
local nests = {"maf-big-spawner","maf_infected_ship"}
if prototypes.entity["tb_infected_ship"] then 
	local aux = GetLocalAux(surface,position)
	if aux and aux >0.65 then table.insert (nests,"tb_infected_ship") end
	end
return nests[math.random(#nests)]
end		


function get_worms_for_evolution(evolution, extra_evo, surface, position)
--check temperature ,aux (toxic)
local temp, aux 
if surface and position then 
	temp = GetLocalTemp(surface,position) 
	aux  = GetLocalAux(surface,position) 
	end

	local function is_valid_worm(name) 
		local add = true
		if string.find(name, "cold") and ((not temp) or (temp>10))  then add=false end
		if string.find(name, "explosive") and ((not temp) or (temp<40))  then add=false end
		if string.find(name, "toxic") and ((not aux) or (aux<0.6)) then add=false end
		if string.find(name, "kr-") or string.find(name, "RTPrimer") or string.find(name, "creative") then add=false end -- krastorio fake worms 
		if not (string.find(name, "worm")) then add=false end	
		return add
		end


if not evolution then evolution = get_evo_here(surface) end
local filter = {{filter = "type",type = "turret"},{filter = "build-base-evolution-requirement", comparison = "≤", value = evolution, mode = "and"}} 
local worms_p = prototypes.get_entity_filtered(filter)
local worms = {}


for name,proto in pairs (worms_p) do 
	if (not string.find(name, "boss")) and (not string.find(name, "mother"))  then 
		if proto.build_base_evolution_requirement ~= nil then
			if is_valid_worm(name) then table.insert(worms,name) end
			end 
		end
	end

local strong_worms = {}
if extra_evo then 
	local filter = {{filter = "type",type = "turret"},{filter = "build-base-evolution-requirement", comparison = "≤", value = evolution+extra_evo, mode = "and"},
		{filter = "build-base-evolution-requirement", comparison = "≥", value = evolution, mode = "and"}}
	local worms_p = prototypes.get_entity_filtered(filter)
	for name,proto in pairs (worms_p) do 
		if not string.find(name, "boss") then 
		if proto.build_base_evolution_requirement ~= nil then 
			if is_valid_worm(name) then table.insert(strong_worms,name) end
			end 
		end
		end
	end
return worms,strong_worms
end		


function CallWormAttack(surface,position,how_many,min_distance,max_distance,force,not_on_tiles)
if not max_distance then max_distance = min_distance + 5 end
local worms = get_worms_for_evolution(get_evo_here(surface,force),nil, surface, position)
--how_many = how_many + global.settings.difficulty_level - 1
for w=1,how_many do
	local worm = worms[math.random(#worms)]
		for t=1,10 do
			local x = position.x + math.random(min_distance,max_distance)* RandomNegPos()
			local y = position.y + math.random(min_distance,max_distance)* RandomNegPos()
			local pos = surface.find_non_colliding_position(worm, {x=x,y=y}, 6, 2)
			-- avoid concrete
			if pos then 
				if not_on_tiles then 
					local tiles = surface.find_tiles_filtered{position=pos, radius=3, name=not_on_tiles, limit=1}
					if #tiles>0 then break end
					end
				create_remnants_particles (surface, math.random(20,40) , pos) 
				local wo = surface.create_entity{name=worm,force=force,position=pos}
				break
				end
		end
	end
end




function Call_Underground_Attack(surface,position,how_many,min_distance,max_distance,force,not_on_tiles)
if not max_distance then max_distance = min_distance + 5 end
for s=1,how_many do
	local name = "wdm-hole-spawner"
	for t=1,10 do
		local x = position.x + math.random(min_distance,max_distance)* RandomNegPos()
		local y = position.y + math.random(min_distance,max_distance)* RandomNegPos()
		local pos = surface.find_non_colliding_position(name, {x=x,y=y}, 6, 2)
		-- avoid concrete
		if pos then 
			if not_on_tiles then 
				local tiles = surface.find_tiles_filtered{position=pos, radius=3, name=not_on_tiles, limit=1}
				if #tiles>0 then break end
				end
			create_remnants_particles (surface, math.random(20,40) , pos) 
			local wo = surface.create_entity{name=name,force=force,position=pos}
			break
			end
		end
	end
end



function create_tatoo_for_unit(unit, color)
if unit and unit.valid then
if not color then color=colors.red end
local tatoo = rendering.draw_circle
	{
	color = color,
	radius = 0.18,
	filled = true,
	target = unit,
	surface = unit.surface,
	}	
end
end



function get_units_for_evolution(evolution,extra_evo, spawners)
if not evolution then evolution = game.forces.enemy.get_evolution_factor() end
if type(spawners)=='string' then spawners = prototypes.get_entity_filtered({{filter = "name", name = spawners}}) end
if not spawners then 
	local filter = {{filter = "type", type = "unit-spawner"}}
	spawners = prototypes.get_entity_filtered(filter) 
	end
local unit_names = {}
local strong_units = {} -- for extra strong ones

	for name,proto in pairs (spawners) do
		if not (string.find(name, "protomolecule") or string.find(name, "boss") ) then 
			for Y,RU in pairs (proto.result_units) do
				local uname = RU.unit
				local SP = RU['spawn_points']
				if not in_list(unit_names,uname) and prototypes.entity[uname] and prototypes.entity[uname].type=='unit' then 
					local emin = SP[1]['evolution_factor']
					local emax = SP[#SP]['evolution_factor']
					if SP[#SP]['weight']>0 then emax=2 end	
					if evolution>=emin and evolution<emax then				
						add_list(unit_names, uname)
						end
						
					if extra_evo and evolution+extra_evo>=emin and evolution+extra_evo<emax then
						add_list(strong_units, uname)
						end
						
					end
				end
			end
		end
return unit_names,strong_units
end	





function CallFrenzyAttack(surface,target,limit,multiplier)
	--disable this bcause of space age
    --if surface.map_gen_settings.autoplace_controls and surface.map_gen_settings.autoplace_controls["enemy-base"] 
      --and surface.map_gen_settings.autoplace_controls["enemy-base"].size>0 then
local diff = 1 --= storage.settings.difficulty_level or
    local position
    if target.type and target.valid 
        then 
        position=target.position
        else
        position = target
        end
    
    local Min = 10
    local Max = 300
    local Dist = 1500
    
    local spawn = surface.find_entities_filtered({type = "unit-spawner",limit=1,position=position,radius=Dist})
    if #spawn>0 then
    local force = spawn[1].force
    
    local aliens = Max * get_evo_here(surface,force) 
    aliens = math.floor(aliens + (aliens * (diff-1))/2)
    
    if aliens < Min then aliens=Min end
    if limit and aliens>limit then aliens=limit end
    if multiplier then aliens=math.floor(aliens * multiplier) end 
    
        if target.type and target.valid then 
            local sent = surface.set_multi_command({
                command = {type=defines.command.attack, target=target, distraction = defines.distraction.by_anything },
                unit_count = aliens,
                force = force,
                unit_search_distance = Dist,
            })
            else
            local sent = surface.set_multi_command({
                command = {type=defines.command.attack_area, destination=position, radius=80 },  --, distraction = defines.distraction.by_anything
                unit_count = aliens,
                force = force,
                unit_search_distance = Dist,
            })
            end
        end
   -- end
    end
    

function get_evolut_1_to_10(evolution)
	return math.min(10, math.max(math.floor((evolution+0.02)*10),1))
	end

function get_evo_here(surface,force)
force=force or game.forces.enemy
if surface and surface.valid then return force.get_evolution_factor(surface) 
	else return force.get_evolution_factor() end
end
	

function get_random_lesser_boss(evolution,surface)
		if not evolution then evolution = get_evo_here(surface) end
		local list = {'maf-boss-biter-','maf-boss-acid-spitter-'}
		if script.active_mods['ArmouredBiters'] then table.insert(list,'maf-boss-armoured-biter-') end
		
		if script.active_mods['Cold_biters'] then 
			if (not surface) or #surface.find_entities_filtered{name='cb-cold-spawner',limit=1}>0 then 
			table.insert(list,'maf-boss-frost-biter-')
			table.insert(list,'maf-boss-frost-spitter-')
			end	end
		if script.active_mods['Explosive_biters'] then 
			if (not surface) or #surface.find_entities_filtered{name='explosive-biter-spawner',limit=1}>0 then 
			table.insert(list,'maf-boss-explosive-biter-')
			table.insert(list,'maf-boss-explosive-spitter-')
			end	end
		
		if script.active_mods['Toxic_biters'] then 
			if (not surface) or #surface.find_entities_filtered{name='toxic-biter-spawner',limit=1}>0 then 
			table.insert(list,'maf-boss-toxic-biter-')
			table.insert(list,'maf-boss-toxic-spitter-')	
			end	end
		
		if script.active_mods['Arachnids_enemy'] then 
			if (not surface) or #surface.find_entities_filtered{name='arachnid-spawner-unitspawner',limit=1}>0 then 
			table.insert(list,'maf-boss-arachnid-biter-')
			end	end
		
		local n=math.min(10, math.max(math.ceil(evolution*10),1))
		return list[math.random(#list)] ..n
	end
		