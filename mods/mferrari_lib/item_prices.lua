--[[

 * ITEM PRICING ROUTINE  by MFERRARI
  used on market
 
 v 1.05 (31/12/2021) - added compatibillity with SE
 v 1.06 (28/01/2022) - added new items for SE/K2 by dOOm
 v 1.07 (04/02/2023) - added compatibillity with IR3
 v 1.08 (21/03/2023) - added is_excluded_recipe
 v 1.09 (09/05/2023) - added compatibillity with Exotic Industries
 v 1.10 (28/05/2023) - added function get_itens_to_pay_for_price + compatibillity with Warp Drime Machine
 v 1.11 (26/03/2024) - added must_have_prices.  Added partial compatibillity with 248k
 v 1.12 (29/05/2024) - fix possible crash on Excluded_recipes
 v 2.0  (11/10/2024) - factorio 2, new items, mod is now a lib

]]


local debug_prices = false
local debug_lost_items = false
local log_all_price_table = false

local energy_div = 3

local Excluded_recipes_part_names = {
"_expensive",
}

local Excluded_recipes = {
"angels-plate-iron",
"angels-plate-tin",
"player-port",
"loader",
"fast-loader",
"express-loader",
"rocket-part",
"belt-immunity-equipment",
"small-plane",
"tc_import_chest",
"tc_export_chest",
"artillery-targeting-remote",
"tc_portable_loader_coal_in",
"tc_portable_loader_in",
"tc_portable_loader_out",
}


local must_have_prices = {
["automation-science-pack"] = 39,
["logistic-science-pack"] = 115,
["military-science-pack"] = 364,
["chemical-science-pack"] = 972,
["utility-science-pack"] = 4922,
["production-science-pack"] = 4151,
}



-- BASIC PRICES
local Basic_Item_Prices = {
["raw-fish"]=2,
["wood"]=2,
["coal"]=3,
["stone"]=3,
["copper-ore"]= 4,
["iron-ore"]=4,
["uranium-ore"]=20,
["uranium-235"]=60000,
["uranium-238"]=1000,
["solid-fuel"]=30,
--["used-up-uranium-fuel-cell"]=45,
--["used-up-uranium-fuel-cell"]=45,

--space age
["calcite"]=3,
["jelly"]=2,
["jellynut-seed"]=1,
["jellynut"]=1,
["tree-seed"]=0.5,
["yumako"]=1,
["yumako-mash"]=1,
["yumako-seed"]=1,
["ice"]=1,
["scrap"]=1,
["spoilage"]=0.2,
["copper-bacteria"]=0.1,
["iron-bacteria"]=0.1,
["biter-egg"]=1,
["holmium-ore"]= 10,
["ammoniacal-solution"]=0.2,
["ammonia"]=0.2,
["nutrients"]=0.2,
["lithium-brine"]=0.2,
["metallic-asteroid-chunk"]=60,
["carbonic-asteroid-chunk"]=50,
["oxide-asteroid-chunk"]=5,
["promethium-asteroid-chunk"]=1000,
["fluoroketone-cold"]=20,
["fluoroketone-hot"]=50,


-- fluids
["water"]=0.1,
["steam"]=0.5,
["crude-oil"]=10,
["petroleum-gas"]=4,
["heavy-oil"]=7,
["light-oil"]=5,
["lubricant"]=8,

--[[ Team competition
["msi-ore-solaz"]= 30,
["msi-ore-bludaz"]= 15,
["msi-ore-uvaz"]= 20,
["uvaz-plate"]= 50,]]

-- warp drive
["wdm-ore-warponium"]= 20,


--- MOD compatibility
-- Industrial Revolution 3
["helium-gas"]=5,
["air-gas"]=2,
["nitrogen-fluid"]=2,
["rubber-wood"]=3,
["charcoal"]=3,
["bitumen"]=3,
["lead-pure"]= 15,
["nickel-pure"]= 19,
["chromium-pure"]= 15,
["platinum-pure"]= 27,
["chromium-ingot"]= 20,
["nickel-ingot"]= 19,
["platinum-ingot"]= 27,
["rubber-natural"]=3,
["carbon-plate"]=40,
["tin-ore"]= 3,
["glass-ingot"]= 5,
["gold-ore"]= 20,
["iron-ingot"]= 5,
["copper-ingot"]= 5,
["tin-ingot"]= 6,
["gold-ingot"]= 23,
["steel-ingot"]= 30,
["bronze-ingot"]= 15,
["titanium-powder"]= 12,
["titanium-ingot"]= 25,
["lead-ingot"]= 15,
["ruby-gem"]= 80,
["diamond-gem"]= 200,
["sulfur"]=50,


--Space Exploration   with adds from dOOm
["sand"]= 2,
["glass"]= 10,
["se-cryonite"]= 9,
["se-vulcanite"]= 8,
["se-beryllium-ore"]= 10,
["se-holmium-ore"]= 10,
["se-iridium-ore"]= 10,
["se-vitamelange"]= 10,
["se-naquium-ore"]= 30,
["se-satellite-telemetry"]= 1000,
["se-arcosphere"]= 1500000,
["se-arcosphere-a"]= 1500000,
["se-arcosphere-b"]= 1500000,
["se-arcosphere-c"]= 1500000,
["se-arcosphere-d"]= 1500000,
["se-arcosphere-e"]= 1500000,
["se-arcosphere-f"]= 1500000,
["se-arcosphere-g"]= 1500000,
["se-arcosphere-h"]= 1500000,
["se-star-probe-data"]= 2000,
["se-belt-probe-data"]= 3200,
["se-void-probe-data"]= 5500,
["se-deep-space-transport-belt"]= 1800,
["se-deep-space-belt-black"]= 1800,
["se-observation-frame-gammaray"]= 1800,
["se-observation-frame-infrared"]= 1500,
["se-observation-frame-microwave"]= 1500,
["se-observation-frame-radio"]= 1500,
["se-observation-frame-uv"]= 1500,
["se-observation-frame-visible"]= 1500,
["se-observation-frame-xray"]= 1800,
["se-astrometric-data"]= 20000,
["se-conductivity-data"]=5000,
["se-electromagnetic-field-data"]=5000,
["se-quantum-phenomenon-data"]= 4000,
["se-atomic-data"]= 4000,
["se-significant-data"]= 115000,
["se-biological-insight"]= 2000,
["se-astronomic-insight"]= 30000,
["se-energy-insight"]= 30000,
["se-material-insight"]= 22000,
["se-space-water"]= 13,
["se-bio-sludge"]= 20,
["se-space-coolant-hot"]= 35,
["se-space-coolant-supercooled"]= 90,
["se-space-coolant-warm"]= 50,
["se-space-coolant-cold"]= 65,
["se-nutrient-gel"]= 25,
["se-methane-gas"]= 15,

-- Bobs / Angels
["slag"]= 0.5, 
["angels-ore1"]= 2, -- saphirite
["angels-ore2"]= 2, -- ?
["angels-ore3"]= 2, -- stira
["angels-ore4"]= 2, -- crotin
["angels-ore5"]= 2,  -- rubyte
["angels-ore6"]= 2,  -- bobmoni
["angels-ore1-crushed"]= 1, 
["angels-ore2-crushed"]= 1,  
["angels-ore3-crushed"]= 1,  
["angels-ore4-crushed"]= 1,  
["angels-ore5-crushed"]= 1,  
["angels-ore6-crushed"]= 1,  
["crushed-stone"]=1,
["lead-ore"]=2,
["quartz"]=3,
["nickel-ore"]=2,
["ingot-tin"]= 5,
["tin-plate"]= 25,
["solder"]=25,

--["gold-ore"]=3, -- sent by fleeyuu
["silver-ore"]=2,
["tungsten-ore"]=3,
["zinc-ore"]=3,
["bauxite-or"]=3,
["rutile-ore"]=2,
["cobalt-ore"]=4,
["nickel-plate"]=8,
["gold-plate"]=10,
["zinc-plate"]=11,
["aluminium-plate"]=7,
["silicon"]=7,
["cobalt-plate"]=70,
["alumina"]=5,
["lithium-perchlorate"]=60,
["gem-ore"]=3,
["salt"]=2,
["sodium-hydroxide"]=1,
["resin"]=2,
["rubber"]=3,
["ruby-ore"]=3,
["sapphire-ore"]=3,
["emerald-ore"]=3,
["amethyst-ore"]=3,
["topaz-ore"]=3,
["diamond-ore"]=3,
["hydrogen"]=1,
["deuterium"]=4,
["oxygen"]=0.5,
["chlorine"]=1,
["hydrogen-chloride"]=2,
["sulfur-dioxide"]=2,
["hydrogen-sulfide"]=2,
["nitrogen-dioxide"]=2,
["nitric-acid"]=2,
["tungstic-acid"]=2,
["ferric-chloride-solution"]=2,
["liquid-fuel"]=3,
["lithia-water"]=2,
["pure-water"]=1,
["heavy-water"]=1,
["enriched-fuel"]=6,

-- Krastorio 2
["biomass"]=10,
["raw-rare-metals"]=10,
["raw-imersite"]=25,
["mineral-water"]=1,

-- Yuoki
["y-res1"]=2,
["y-res2"]=2,
["y-crush-yres1"]=3,
["y-crush-yres2"]=3,
["y-unicomp-a2"]=5,

-- Bio Industries
["stone-crushed"]=1,
["wood-charcoal"]=3,
["bi-seed"]=3,
["bi-ash"]=3,
["liquid-air"]=0.1,
["nitrogen"]=0.2,


-- Exotic Industries
["ei_iron-chunk"]=2,
["ei_copper-chunk"]=2,
["ei_coal-chunk"]=2,
["ei_gold-chunk"]=10,
["ei_lead-chunk"]=2,
["ei_neodym-chunk"]=6,
["ei_sulfur-chunk"]=10,
["ei_uranium-chunk"]=14,
["ei_poor-iron-chunk"]=2,
["ei_poor-copper-chunk"]=2,
["ei_moon-rock"]=10,
["ei_sulf-rock"]=5,
["ei_mars-rock"]=15,
["ei_uran-rock"]=18,
["ei_exotic-rock"]=20,
["ei_fluorite"]=3,
["ei_glass"]= 5,
["ei_iron-ingot"]= 5,
["ei_copper-ingot"]= 5,
["ei_gold-ingot"]= 23,
["ei_steel-ingot"]= 30,
["ei_lead-ingot"]= 15,
["ei_neodym-ingot"]=30,
["ei_energy-crystal"]=100,
["ei_high-energy-crystal"]=3000,
["ei_alien-seed"]=10,
["ei_alien-resin"]=10,
["ei_hydrogen"]=0.2,
["ei_oxigen-gas"]=0.2,
["ei_nitrogen-gas"]=1,
["ei_ammonia-gas"]=2,
["ei_dinitrogen-tetroxide-gas"]=2,
["ei_space-data"]=3000,
["ei_sun-data"]=5000,
["ei_gas-giant-data"]=4000,
["ei_black-hole-data"]=10000,


-- 248k
["el_materials_ceramic"]=23,
["el_dirty_water"]=0.05,
["el_aluminium_item"]=8,
["el_materials_ALK"]=100,
["fi_materials_gold"]=20,
["fi_materials_neodym"]=30,
["fi_materials_GFK"]=28,
["fi_materials_titan"]=25,
["el_acidic_water"]=3,
["el_energy_crystal_item"]=120,
["fi_acid_gas"]=2,

}
local bm = 50

Basic_Item_Prices["crude-oil-barrel"]= 30 + Basic_Item_Prices["crude-oil"] * bm
Basic_Item_Prices["heavy-oil-barrel"]=30 + Basic_Item_Prices["heavy-oil"] * bm
Basic_Item_Prices["light-oil-barrel"]=30 + Basic_Item_Prices["light-oil"] * bm
Basic_Item_Prices["lubricant-barrel"]=30 + Basic_Item_Prices["lubricant"] * bm
Basic_Item_Prices["petroleum-gas-barrel"]=30 + Basic_Item_Prices["petroleum-gas"] * bm
Basic_Item_Prices["sulfuric-acid-barrel"]=30 + 7 * bm




function Pricing_create_all_items_list(only_item_plus_recipe)
local Items_List = {}
for k,o in pairs (prototypes.item) do 
	if not in_list(Items_List,o.name) then
		if (not only_item_plus_recipe) or (prototypes.recipe[o.name]) then 
			if not in_list(Excluded_recipes, o.name) then
				table.insert(Items_List,o.name) 
				if Basic_Item_Prices[o.name] then storage.Priced_Items[o.name] = Basic_Item_Prices[o.name] end
				end
			end
	end 
	end
return Items_List
end




function Pricing_Add_Item_Price(name)

local notPriced = {}
if storage.Priced_Items[name] == nil and Basic_Item_Prices[name] == nil then table.insert(notPriced,name) end

if debug_prices then Log('   ===inicio===>  '.. name) end

while #notPriced > 0 do

local Tprice = 0 
 local RecipeName = notPriced[#notPriced]
if debug_prices then Log(' *not priced > '.. RecipeName) end 

 if prototypes.recipe[RecipeName] then
	if debug_prices then Log(' >found recipe for: '.. RecipeName) end 

    local recipe = prototypes.recipe[RecipeName]
	local ingred = recipe.ingredients 
	local tti    = #ingred
	local energy = recipe.energy
	local found = true	
	local exit_now = false
	
	-- excluded part names
	for k=1,#Excluded_recipes_part_names do if string.find(recipe.name, Excluded_recipes_part_names[k]) then  exit_now = true break end end
	
		if not exit_now then
		for k,i in pairs (ingred) do
			
			local nome = i.name
			local tipo = i.type
			local qt   = i.amount
	
		--	if tipo=='item' then -- item or fluid
			   local price = storage.Priced_Items[nome] 
			   if not price then  price = Basic_Item_Prices[nome] end 
				
			--	if tipo~='item' and price == nil then
			--		price = 5 
			--		if debug_prices then Log('!! No price for non item: ' .. nome .. ' - now it is $'..price) end 
			--		end
					
			   
				if  price == nil then 
					if debug_prices then Log(' !no price for ingredient: '.. nome) end 
					if not in_list (notPriced, nome) then 
						table.insert(notPriced,nome) -- adiciona no fim da fila
						else
						exit_now = true
						if debug_prices or debug_lost_items then Log(' infinite loop detected - exiting because of '.. name ..  ' --dupe cause->'..nome) end 
						end
					found=false
					break
					else
					Tprice=math.ceil( Tprice+ (price * qt)+(2*tti) + energy / energy_div )
					if debug_prices then Log(' $ found price for: '.. nome .. ' $'..price) end 
					end

		--		else -- FLUIDS
	--			Tprice = Tprice + 15
		--		end -- tipo item
			
			end -- for k ingredients
			end --exitnow
	
	if found then
	
		local results = 1
		if recipe.products and recipe.products[1] and recipe.products[1].amount and recipe.products[1].amount>1 then
			results = recipe.products[1].amount end
	
		storage.Priced_Items[RecipeName]=math.ceil(Tprice / results)
		table.remove(notPriced,#notPriced)
		
			if debug_prices then Log(' $$$$$>>> total for: '.. RecipeName .. ' $$ '..Tprice) end 
		end -- found
		
	if exit_now	then break end
		
    else
	
	if debug_prices then Log(' !!!!!!!! NOT POSSIBLE - EXITING recipe '.. RecipeName) end 
	break
	end -- tem recipe
	
 end -- notPriced

end


function Pricing_Create_Prices_List(only_item_plus_recipe)
storage.Priced_Items = {}
local Items_List = Pricing_create_all_items_list(only_item_plus_recipe) --- get prototype names  item==recipe name    ==> to Items_List

for I, name in pairs (Items_List) do
    Pricing_Add_Item_Price(name)
   end
  
-- remove what is not an item
for name,price in pairs (storage.Priced_Items) do
	if not prototypes.item[name] then storage.Priced_Items[name]=nil end
	end
  

-- ADD REQUIRED MINIMAL PRICES
for name,price in pairs (must_have_prices) do 
	storage.Priced_Items[name] = storage.Priced_Items[name] or price
	end

local Sorted_Item_Prices = {}
for k,v in Sort_a_Table(storage.Priced_Items, function(t,a,b) return t[b] > t[a] end) do
    table.insert (Sorted_Item_Prices, {name=k, price=v})
	if log_all_price_table then Log(k .. ' = ' ..v) end
end
 
 
storage.Sorted_Item_Prices = Sorted_Item_Prices
--Pricing_Reset_Market_initial_prices()
end


-- this can be used for flutuant prices
function Pricing_Reset_Market_initial_prices()
storage.Actual_Market_Prices = {}

for k=1,#storage.Sorted_Item_Prices do
	local name = storage.Sorted_Item_Prices[k].name
	local price = storage.Sorted_Item_Prices[k].price
	storage.Actual_Market_Prices[name]=price
	end
end

function is_excluded_recipe(name)
return in_list(Excluded_recipes,name)
end


function get_itens_to_pay_for_price(force, price, quant, except)
local never = {"uranium-fuel-cell", "satellite"}
local items, cost
local tries = 20
while tries > 0 do
items = {}
local vmin= math.floor (price/500)
if quant<2 then vmin= math.floor (price/10) end 

local opt = {}

for k,i in pairs (storage.Sorted_Item_Prices) do

	if force.recipes[i.name] and force.recipes[i.name].enabled and 
	 (not force.recipes[i.name].hidden) and 
	  i.price>=vmin and (not in_list(never,i.name)) and
	   (not in_list(ship_tiles,i.name)) then 
	   table.insert (opt,i) end
	end
if #opt<5 then 
	opt = {}
	for k,i in pairs (storage.Sorted_Item_Prices) do
		if  force.recipes[i.name] and  force.recipes[i.name].enabled and (not force.recipes[i.name].hidden) and (not in_list(ship_tiles,i.name)) and (not in_list(never,i.name))  then table.insert (opt,i) end
		end
	end

cost = 0
local max_quant = 400

if except then
	if type(except)=='string' then except={except} end
	for x=#opt,1,-1 do 
		for y=1,#except do 
		if string.find(opt[x].name,except[y]) then table.remove(opt,x) break end end
		end
	end

while #items<quant and #opt>1 and cost<price do
	local r = math.random(#opt)
	local o = opt[r]
	local n,p = o.name,o.price
	local stack = prototypes.item[n].stack_size  -- default inv size = 60 max 
	local q = math.min(((price-cost) / p ) / 2, max_quant )
	if q>stack*6 then q=stack*6 end -- using a limit of 6 stacks max
	q = math.random (math.ceil(q/2), math.ceil(q))
		if cost + q*p<price then
			cost = cost + q*p
			table.insert (items,{name=n,count=q})
			end
	table.remove (opt,r)
	end
tries = tries -1 
if cost<price*1.2 and cost>price*0.7 then break end
end
--game.print("price " .. price  .. "     cost " ..cost )
return items
end




function get_market_itens_for_force(force, forb_items, minimum_value, allow_disabled)
if not minimum_value then minimum_value=1 end
local opt = {}
if not forb_items then forb_items = {} end

for k,i  in pairs (storage.Sorted_Item_Prices) do
	if (force.recipes[i.name] and force.recipes[i.name].enabled and (not force.recipes[i.name].hidden)) or 
	   (allow_disabled or (not force.recipes[i.name]))
		then 
		local allow = (not string.find(i.name, 'barrel')) or force.technologies['fluid-handling'].researched 
		if i.price<=65500 and i.price>=minimum_value and allow then 
			if not in_list(forb_items,i.name) then table.insert (opt,{name=i.name,price=i.price}) end
			end
		end
	end
return opt
end


-- returns true if reset was needed cause item was removed
function IP_check_reset_prices(only_item_plus_recipe)
	if not storage.Sorted_Item_Prices then Pricing_Create_Prices_List(only_item_plus_recipe)
	else
	for k=1, #storage.Sorted_Item_Prices do
		local n = storage.Sorted_Item_Prices[k].name
		if (not prototypes.item[n]) or is_excluded_recipe(n) then
			Pricing_Create_Prices_List(only_item_plus_recipe)
			return true
			end
		end
	end
end



