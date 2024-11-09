
local fluiddensity = { -- fluid = 0.1/wagon weight factor * content factor
["water"] = 					1 		/23.4*3.44,--g/cm3 or t/m3
["sulfuric-acid"]	=			1.84	/23.4*3.44,--g/cm3 or t/m3
["lubricant"]	=				1 		/23.4*3.44,--g/cm3 or t/m3
["petroleum-gas"]	=			0.8		/23.4*3.44,--0.002g/cm3 (vapor), 0.8 g/cm3 (fluid)
["light-oil"]	=				0.87	/23.4*3.44,--g/cm3 or t/m3
["heavy-oil"]	=				1		/23.4*3.44,--g/cm3 or t/m3
["crude-oil"]	=				0.92 	/23.4*3.44,--g/cm3 or t/m3
}


local items = {	--density/stacksize	*used space *2m3/wagon weight factor
["iron-ore"] =				5.1	/50 	*0.6*2/26*1000,
["copper-ore"] =			5.7	/50 	*0.6*2/26*1000,	--actually 2.3 but needs to be heavier than iron-ore
["uranium-ore"] =			2.1	/50 	*0.6*2/26*1000,
["stone"] =					1.6	/50 	*0.6*2/26*1000,
["iron-plate"] = 			7.9	/100	*0.4*2/26*1000,
["steel-plate"] =			7.9	/100	*0.4*2/26*1000,
["copper-plate"] = 			8.9	/100	*0.4*2/26*1000,
["raw-wood"] =				0.8	/100	*0.5*2/26*1000,
["wood"] =					0.8	/50		*0.7*2/26*1000,
["coal"] =					0.9	/50 	*0.7*2/26*1000,
["plastic-bar"] =			0.9	/100	*0.7*2/26*1000,
["solid-fuel"] =			1.8	/50 	*0.6*2/26*1000,
["glass"] =					2.8	/50 	*0.6*2/26*1000,
["sulfur"] =				1.9	/50 	*0.6*2/26*1000,
["battery"] =				2.3	/200	*0.6*2/26*1000,
["uranium-238"] =			19	/50 	*0.3*2/26*1000,
["uranium-235"] =			19	/50 	*0.3*2/26*1000,
["raw-fish"] =				1	/50 	*0.6*2/26*1000,
["processing-unit"] =		4.9	/100 	*0.4*2/26*1000,	--50% copper + plastic (?)
["advanced-circuit"] =		4.1	/200 	*0.4*2/26*1000,	--40% copper + plastic (?)
["electronic-circuit"]=		3.3	/200 	*0.4*2/26*1000,	--30% copper + plastic (?)
["barrel"] =			0.8	/10 	*0.5*2/26*1000,	
["engine-unit"] =			5.5	/50 	*0.5*2/26*1000,	--70% steel (?)
["electric-engine-unit"]=	6.7	/50 	*0.5*2/26*1000,	--85% steel (?)
["iron-gear-wheel"] =		3.9	/100 	*0.5*2/26*1000,	--50% iron (?)
["iron-stick"] =			6.7	/100 	*0.5*2/26*1000,	--85% iron (?)
["copper-cable"] =			6	/200 	*0.4*2/26*1000,	--66% copper (100 copper = 300 cables, reduced to a 200-stack)
["science-pack-1"] =		4	/200 	*0.6*2/26*1000,   --no idea..
["science-pack-2"] =		4	/200 	*0.6*2/26*1000,   --no idea..
["science-pack-3"] =		4	/200 	*0.6*2/26*1000,   --no idea..
["military-science-pack"]=	4	/200 	*0.6*2/26*1000,   --no idea..
["production-science-pack"]=4	/200 	*0.6*2/26*1000,   --no idea..
["high-tech-science-pack"]=	4	/200 	*0.6*2/26*1000,   --no idea..
["flying-robot-frame"] =	6.4	/50 	*0.5*2/26*1000,	--80% steel (?)
["pistol"] =				1.2,
["submachine-gun"] =		3.2,
["shotgun"] =				3.2,
["combat-shotgun"] =		4,
["flamethrower"] =			20,
["rocket-launcher"] =		4.5,
["firearm-magazine"] =		8	/200 	*0.4*2/26*1000,	--iron
["piercing-rounds-magazine"]=8.5/200 	*0.4*2/26*1000,	--steel/copper
["uranium-rounds-magazine"]=13.5/200 	*0.4*2/26*1000,	--50%uranium + steel
["flamethrower-ammo"] =		3	/100 	*0.4*2/26*1000,	--no idea
--["stone"] =						/200 	*2/23.4*1000,
}

local entities={
["charactercorpse"] = 2            ,
["corpse"] = 2                     ,
["entitywithhealth"] = 10          ,
["accumulator"] = 6                ,
["artilleryturret"] = 8            ,
["beacon"] = 8                     ,
["boiler"] = 10                    ,
["character"] = 2                  ,
["combinator"] = 2                 ,
["arithmeticcombinator"] = 2       ,
["decidercombinator"] = 2          ,
["constantcombinator"] = 2         ,
["container"] = 2                  ,
["logisticcontainer"] = 2          ,
["infinitycontainer"] = 2          ,
["craftingmachine"] = 10           ,
["assemblingmachine"] = 10         ,
["rocketsilo"] = 30                ,
["furnace"] = 10                   ,
["electricenergyinterface"] = 8    ,
["electricpole"] = 4               ,
["enemyspawner"] = 10              ,
["fish"] = 1                       ,
["flyingrobot"] = 1                ,
["combatrobot"] = 1                ,
["robotwithlogisticinterface"] = 1 ,
["constructionrobot"] = 1          ,
["logisticrobot"] = 1              ,
["gate"] = 6                       ,
["generator"] = 15                 ,
["heatpipe"] = 3                   ,
["inserter"] = 2                   ,
["lab"] = 10                       ,
["lamp"] = 2                       ,
["landmine"] = 2                   ,
["market"] = 10                    ,
["miningdrill"] = 8                ,
["offshorepump"] = 5               ,
["pipe"] = 3                       ,
["pipetoground"] = 3               ,
["playerport"] = 10                ,
["powerswitch"] = 8                ,
["programmablespeaker"] = 4        ,
["pump"] = 4                       ,
["radar"] = 15                     ,
["rail"] = 3                       ,
["curvedrail"] = 3                 ,
["straightrail"] = 3               ,
["railsignalbase"] = 2             ,
["railchainsignal"] = 2            ,
["railsignal"] = 2                 ,
["reactor"] = 25                   ,
["roboport"] = 20                  ,
["simpleentity"] = 8               ,
["simpleentitywithowner"] = 8      ,
["simpleentitywithforce"] = 8      ,
["solarpanel"] = 5                 ,
["storagetank"] = 9                ,
["trainstop"] = 2                  ,
["transportbeltconnectable"] = 1   ,
["loader"] = 3                     ,
["splitter"] = 3                   ,
["transportbelt"] = 1              ,
["undergroundbelt"] = 2            ,
["tree"] = 2                       ,
["turret"] = 5                     ,
["ammoturret"] = 5                 ,
["electricturret"] = 5             ,
["fluidturret"] = 5                ,
["unit"] = 3                       ,
["vehicle"] = 5                    ,
["car"] = 7                        ,
["rollingstock"] = 10              ,
["artillerywagon"] = 18            ,
["cargowagon"] = 12                ,
["fluidwagon"] = 12                ,
["locomotive"] = 16                ,
["wall"] = 6                       ,
["arrow"] = 1                      ,
["artilleryprojectile"] = 20       ,
["beam"] = 1                       ,
["cliff"] = 5                      ,
["deconstructibletileproxy"] = 1   ,
["entityghost"] = 1                ,
["explosion"] = 2                  ,
["flamethrowerexplosion"] = 2      ,
["fireflame"] = 2                  ,
["fluidstream"] = 2                ,
["flyingtext"] = 2                 ,
["itementity"] = 1                 ,
["itemrequestproxy"] = 3           ,
["legacydecorative"] = 3           ,
["particle"] = 1                   ,
["artilleryflare"] = 1             ,
["leafparticle"] = 1               ,
["particlesource"] = 1             ,
["projectile"] = 1                 ,
["railremnants"] = 3               ,
["resourceentity"] = 1             ,
["rocketsilorocket"] = 10          ,
["rocketsilorocketshadow"] = 1     ,
["smoke"] = 1                      ,
["simplesmoke"] = 1                ,
["smokewithtrigger"] = 1           ,
["sticker"] = 1                    ,
["tileghost"] = 1                  ,
}

function dbg(str)
if not global.dbg then global.dbg = 1 end
game.players[1].print(global.dbg.." "..game.tick..": "..str)
global.dbg = global.dbg + 1
end

--freight wagon 26t empty weight, full with steel: +647t (total: 82 m3) (2 m3 per slot)
function itemweight (name)
	local weight = 1.5
	if items[name] then
		weight = items[name]
	elseif game.item_prototypes[name].place_result then
		if entities[game.item_prototypes[name].place_result.type] then
			weight = entities[game.item_prototypes[name].place_result.type]
		end
	elseif game.item_prototypes[name].stack_size then
		weight = 3 /game.item_prototypes[name].stack_size *0.6*2/26*1000
	end
	return weight
end

function deadlocks(name)
	local weight = 1
	local amount = 1
	if string.sub(name, 1, 15) == "deadlock-crate-" then
		local actual_item_name = string.sub(name, 16)
		amount = game.item_prototypes[actual_item_name].stack_size/5
		weight = itemweight(actual_item_name)
	elseif string.sub(name, 1, 15) == "deadlock-stack-" then
		local actual_item_name = string.sub(name, 16)
		amount = 5
		weight = itemweight(actual_item_name)
	elseif string.sub(name, 1, 18) == "deadlock-stacking-" then
		local actual_item_name = string.sub(name, 19)
		amount = 5
		weight = itemweight(actual_item_name)
	end
	return weight*amount
end

script.on_init(function()
	global.trains = {}
	for _, surface in pairs(game.surfaces) do
		--for _, train in pairs(surface.get_trains{type="locomotive"}) do
		--	global.trains[train.unit_number] = {entity = train,tick = game.tick,speed = train.train.speed, mult = 1}
		for _, train in pairs(surface.get_trains()) do
			global.trains[train.id]= {train = train,tick = game.tick,speed = train.speed, mult = 1}
		end
	end
end)



script.on_event(defines.events.on_tick, function(event)
	if not global.iterator then
		global.iterator = next(global.trains,global.iterator)
	elseif not global.trains[global.iterator] then
		global.iterator = nil
	end
	local i = 0
	local maxruns = 6
	while i< maxruns and global.iterator do --eats 0.050 ticks at 64 trains
		local tbl = global.trains[global.iterator]
		if not tbl or not tbl.train or not tbl.train.valid then
			local iterator = global.iterator
			global.iterator = next(global.trains,global.iterator)	--iterating...
			if not global.iterator then
				global.iterator = next(global.trains,global.iterator)
			end
			i=i+1
			global.trains[iterator] = nil
		else
			if event.tick ~= tbl.tick then
				local speed = tbl.train.speed
				local mult = tbl.mult
				local new_speed = (tbl.speed*(1-mult) + speed*mult)
				if speed ~=0 and new_speed * speed > 0 and (tbl.train.manual_mode or tbl.train.riding_state.acceleration ~= defines.riding.acceleration.braking) then
					pcall(function() tbl.train.speed = new_speed end)
				end
				tbl.tick = game.tick
				tbl.speed = new_speed
			end
			

	
			global.iterator = next(global.trains,global.iterator)	--iterating...
			if not global.iterator then
				global.iterator = next(global.trains,global.iterator)
			end
			i=i+1
		end
	end
	


end)


script.on_event(defines.events.on_train_changed_state, function(event)
	local train = event.train
	if not global.trains[train.id] then
		global.trains[train.id] = {train = train,tick = game.tick,speed = train.speed, mult = 1}
	end
	local contentweight = 0

	local contents=train.get_contents()
	for content, amount in pairs(contents) do
		local weight = 1
		if string.sub(content,1,8) == "deadlock" then
			weight = deadlocks(content)
		else
			weight = itemweight(content)
		end
		weight = weight*amount
		contentweight = contentweight + weight
	end
	local contents=train.get_fluid_contents()
	for content, amount in pairs(contents) do
		--tankwagon 23.4t empty weight, +86t (86 m3) water https://www.vtg.com/fileadmin/vtg/dokumente/waggon-datenblaetter/Mineraloelkesselwagen-M16.086C.pdf
		if fluiddensity[content] then
			contentweight = contentweight + fluiddensity[content]*amount
		else
			contentweight = contentweight + 1/24*3.28*amount
		end
	end
	if settings.global["OT_realism"].value > 1 then
		contentweight = contentweight * settings.global["OT_realism"].value
	end
	global.trains[train.id].mult = 1/((contentweight+train.weight) / train.weight )*math.min(1,settings.global["OT_realism"].value) + 1*(1-math.min(1,settings.global["OT_realism"].value))
end)