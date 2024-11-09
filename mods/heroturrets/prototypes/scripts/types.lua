--todo check entity creation ammo_category = "cannon-shell" if so record max dist and update ammo
log("Creating Types")
if not heroturrets.defines then require ("prototypes.scripts.defines") end

local starts_with  = heroturrets.util.starts_with
local ends_with  = heroturrets.util.ends_with
local ends_with  = heroturrets.util.ends_with
local get_name_for = heroturrets.util.get_name_for
local table_contains = heroturrets.util.table.contains
local table_remove = heroturrets.util.table.remove
local create_icon = heroturrets.util.create_icon
local convert_to_string = heroturrets.util.convert_to_string

local tech = data.raw["technology"]

local raw_items = {"item","accumulator","active-defense-equipment","ammo","ammo-turret","arithmetic-combinator","armor","artillery-turret","artillery-wagon","assembling-machine","battery-equipment","beacon","belt-immunity-equipment","boiler","capsule","car","cargo-wagon","combat-robot","constant-combinator","construction-robot","container","decider-combinator","electric-pole","electric-turret","energy-shield-equipment","fluid-wagon","furnace","gate","generator","generator-equipment","gun","heat-pipe","inserter","item","locomotive","logistic-container","logistic-robot","market","mining-drill","module","night-vision-equipment","offshore-pump","pipe","pipe-to-ground","power-switch","programmable-speaker","projectile","pump","radar","rail-chain-signal","rail-planner","rail-signal","reactor","repair-tool","resource","roboport","roboport-equipment","rocket-silo","solar-panel","solar-panel-equipment","splitter","storage-tank","legacy-straight-rail","tool","train-stop","transport-belt","underground-belt","wall"}

data:extend({{
    type = "item-group",
    name = "hero_group",
    order = "z",
    icon = "__bobwarfare__/graphics/icons/technology/plasma-turrets.png",
    icon_size = 128,
    icon_mipmaps = 2,
    localised_name = "Hero Turrets"
  },
  {
    type = "item-subgroup",
    name = "hero_subgroup",
    group = "hero_group",
    order = "e",
    localised_name = "Hero Turrets"
}})




--honk
local types_with_items = {}
for category, prototypes in pairs(data.raw) do
  local name, prototype = next(prototypes)
  if name and prototype.stack_size then table.insert(types_with_items, category) end
end
--end honk

local item_list = nil

local local_get_item = function(name)
	--[[if item_list == nil then
		item_list = {}
		for r = 1, #raw_items do local raw = raw_items[r]	
			for name,item in pairs(data.raw[raw]) do			
				if item ~= nil and item.name ~= nil then	
					if table_contains(item_list,item.name) then
						if item_list[item.name].icon_size == nil and item.icon_size ~= nil and (item.place_result ~= nil or item.stack_size ~= nil) then
                            if item.place_result ~= nil then
                                item_list[item.place_result] = item
                            else
							    item_list[item.name] = item
                            end
						end
					elseif item.place_result ~= nil then
                        item_list[item.place_result] = item
                    else
                        item_list[item.name] = item
					end
				end
			end
		end
	end]]
    --honk
    if item_list == nil then
		item_list = {}
		for _, category in pairs(types_with_items) do
			for name,item in pairs(data.raw[category]) do
				if item.place_result ~= nil then
					local placed = item.place_result
					if item_list[placed] then
						--log("item entity place collision: "..name.." "..placed)
						if placed == name then
							item_list[placed] = item
						end						
					else
						item_list[placed] = item
					end
				end
			end
		end
	end
    --end honk
	return item_list[name]
    end


local is_nesw = function(entity)
	if entity == nil then return false end
    if entity.base_picture == nil then return false end
    if entity.base_picture.north == nil then return false end
    if entity.base_picture.north.layers == nil then return false end
    if entity.base_picture.east == nil then return false end
    if entity.base_picture.east.layers == nil then return false end
    if entity.base_picture.south == nil then return false end
    if entity.base_picture.south.layers == nil then return false end
    if entity.base_picture.west == nil then return false end
    if entity.base_picture.west.layers == nil then return false end
    return true
    end

local is_unkown_nesw = function(entity)
	if entity == nil then return false end
    local left = nil        
    local top = nil

    local box = entity.drawing_box
    if box == nil then box = entity.selection_box end
    if box == nil then box = entity.collision_box end

    if (entity.type == "ammo-turret" or entity.type == "electric-turret") and entity.base_picture == nil and box ~= nil then   
        return true
    end
    return false
    end

local get_badge = function(rank,top,left,rc)
    local tint = {r=1.0,g=1.0,b=1.0,a=1}
    if rank > 8 then
        tint = {r=1.0,g=0.5,b=0.15,a=1}
        rank = rank - 8
    elseif rank > 4 then 
        tint = {r=1.0,g=0.15,b=0.15,a=1}
        rank = rank - 4
    end
    local img = {
                    filename = "__heroturrets__/graphics/entity/turret/hero-"..rank.."-base.png",
                    priority = "high",
                    width = 23,
                    height = 24,
                    direction_count = 1,
                    frame_count = 1,
                    repeat_count = rc,
                    shift = util.by_pixel((left)*-1,top+(24/3)),
                    tint = tint,
                    hr_version =
                    {
                        filename = "__heroturrets__/graphics/entity/turret/hr-hero-"..rank.."-base.png",
                        priority = "high",
                        line_length = 1,
                        width = 46,
                        height = 48,
                        frame_count = 1,
                        direction_count = 1,
                        repeat_count = rc,
                        shift = util.by_pixel((left)*-1,top+(48/3)),
                        tint = tint,
                        scale = 0.5
                    }
                }
    return img
    end

--[[
   Update as military upgrades effect adds 
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = x
      } 
      note the turret-id
]]
local update_fluid_turret_tech = function(entity, name,rank)
    log("Updating tech for refined flammables" .. " for "..entity.name)
    for _, tech in pairs(tech) do
        if tech.name:match("^refined%-flammables%-") and tech.effects then            
            local effect = nil
            for _, eff in pairs(tech.effects) do
                if eff.type == "turret-attack" and eff.turret_id == entity.name then
                    effect = table.deepcopy(eff)
                end
            end
            if effect ~= nil then 
                log("Adding tech for "..tech.name .. " for "..entity.name)
                table.insert(tech.effects, {type="turret-attack", turret_id = name, modifier = effect.modifier*(1+(0.25*rank)) })
            else
                log("Missing tech for "..tech.name .. " for "..entity.name)
            end
        end
    end
    end

local update_ammo_turret_tech_old = function(entity, name, rank)
    log("Updating tech for physical projectile damage")
    for _, tech in pairs(tech) do
        if tech.name:match("^physical%-projectile%-damage%-") and tech.effects then
            local effect = nil
            for _, eff in pairs(tech.effects) do
                if eff.type == "turret-attack" and eff.turret_id == entity.name then
                    effect = table.deepcopy(eff)
                end
            end
            if effect ~= nil then 
                log("Adding tech for "..tech.name .. " for "..entity.name)
                table.insert(tech.effects, {type="turret-attack", turret_id = name, modifier = effect.modifier*(1+(0.25*rank))})
            else 
                log("Missing tech for "..tech.name .. " for "..entity.name)
            end
        end
    end
    end

 local update_ammo_turret_tech = function(entity, name)
    for _, tech in pairs(tech) do
        if tech.effects then
            local effect = nil
            for _, eff in pairs(tech.effects) do
                if eff.type == "turret-attack" then
                    if eff.turret_id == entity.name then
                        effect = eff
                    elseif eff.turret_id == name then
                        effect = nil
                    end
                end
            end
            if effect ~= nil then
                table.insert(tech.effects, {type="turret-attack", turret_id = name, modifier = effect.modifier})
            end
        end
    end
end

local local_create_turret_with_tags = function(turret)
    local name_with_tags = turret.item.name.."-with-tags"
    
    local item_with_tags = table.deepcopy(turret.item)
    item_with_tags.type = "item-with-tags"
    item_with_tags.name = name_with_tags
    item_with_tags.localised_name = turret.item.localised_name
    item_with_tags.localised_description = turret.item.localised_desc
    item_with_tags.localised_description = turret.item.localised_desc
    item_with_tags.order = (turret.item.order or "["..turret.item.name.."]")..".tag"
    turret.entity.minable.result = name_with_tags
    data:extend({item_with_tags})
    end


local cannon_ammo_ranges = {}
local local_create_turret = function(turret,rank,rank_string,mod)
        local tint = {r=1.0,g=1.0,b=1.0,a=1.0}
        local ir = rank
        if ir > 8 then
            tint = {r=1.0,g=0.5,b=0.15,a=1.0}
            ir = ir - 8
        elseif ir > 4 then 
            tint = {r=1.0,g=0.15,b=0.15,a=1.0}
            ir = ir - 4
        end

        local base_icon = 
		{   
           {
            icon = "__heroturrets__/graphics/icons/hero-"..ir.."-icon.png",
			icon_size = 64,
            icon_mipmaps = 4,
            tint = tint
           }
		}
        local localised_name = get_name_for(turret.item,""," "..rank_string)
        local localised_desc = get_name_for(turret.item,""," "..rank_string)
        local new_icon = create_icon(base_icon, nil, {from = turret.item})
        local rev = {}
        for i=#new_icon, 1, -1 do
	        rev[#rev+1] = new_icon[i]
        end
        new_icon = rev
        local item_name = "hero-turret-"..rank.."-for-"..turret.item.name
        local entity_name = "hero-turret-"..rank.."-for-"..turret.entity.name
        local recipe_name = "hero-turret-"..rank.."-for-"..turret.recipe.name
        log("Creating "..entity_name)
        local name_with_tags = item_name.."-with-tags"        
        
        local place_name = entity_name
        local mine_name = item_name
        local place_name_with_tags = item_name
        local mine_name_with_tags = name_with_tags
        if settings.startup["heroturrets-allow-artillery-turrets"].value == false and turret.entity.type == "artillery-turret" then
            place_name = turret.entity.name
            place_name_with_tags = turret.item.name
            mine_name = turret.item.name
            mine_name_with_tags = turret.item.name
        end

        local item = {
            type = "item",
            name = item_name,
            localised_name = localised_name,
            localised_description = localised_desc,
            icon = false,
            icons = new_icon,
            icon_size = 64,
            --hide_from_player_crafting = true,
            -- flags = {"hidden"},

            subgroup = "hero_subgroup",
            order = (turret.item.order or "["..turret.item.name.."]").."["..rank.."]",
            place_result = place_name,            
            stack_size = turret.item.stack_size or 1
        }
        
        local item_with_tags = {
            type = "item-with-tags",
            name = name_with_tags,
            localised_name = localised_name,
            localised_description = localised_desc,
            icon = false,
            icons = new_icon,
            icon_size = 64,
            --hide_from_player_crafting = true,
            subgroup = "hero_subgroup",
            order = (turret.item.order or "["..turret.item.name.."]").."["..rank.."].tag",
            place_result = place_name,
            stack_size = turret.item.stack_size or 1
            
        }
        
        local recipe = nil
        --if turret.recipe ~= nil  then
            recipe = {
                type = "recipe",
                name = recipe_name,
                localised_name = localised_name,
                localised_description = localised_desc,
                icon = false,
                icons = new_icon,
                icon_size = 64,
                enabled = false,
                energy = turret.recipe.energy,
                category = turret.recipe.category,
                subgroup = turret.recipe.subgroup,
                hide_from_player_crafting = true,
                ingredients =
                {
	                {turret.item.name, 1},
                },
                result = item_name
            }
       -- end
        local entity = table.deepcopy(turret.entity)
        entity.name = entity_name
        entity.max_health = (math.floor((entity.max_health*mod)/10)*10)
        if entity.rotation_speed ~= nil then entity.rotation_speed = entity.rotation_speed*mod end
        --if entity.turret_rotation_speed ~= nil then entity.turret_rotation_speed = entity.turret_rotation_speed*mod end
        if entity.preparing_speed ~= nil then entity.preparing_speed = entity.preparing_speed*mod end
        if entity.attacking_speed ~= nil then entity.attacking_speed = entity.attacking_speed*mod end
        if entity.prepare_range ~= nil then entity.prepare_range = entity.prepare_range*mod end
        if entity.turret_rotation_speed ~= nil then entity.turret_rotation_speed = entity.turret_rotation_speed*mod end
        if entity.manual_range_modifier ~= nil then entity.manual_range_modifier = entity.manual_range_modifier*mod end
        if entity.turn_after_shooting_cooldown ~= nil then 
            entity.turn_after_shooting_cooldown = entity.turn_after_shooting_cooldown / mod
            entity.turn_after_shooting_cooldown = math.min(180,math.max(entity.turn_after_shooting_cooldown,10))
        end
        local m_range = nil
        if entity.attack_parameters ~= nil then
            if entity.attack_parameters.cooldown ~= nil then entity.attack_parameters.cooldown = entity.attack_parameters.cooldown / mod end
            if entity.attack_parameters.range ~= nil then entity.attack_parameters.range = entity.attack_parameters.range * mod end
            --if entity.attack_parameters.min_range ~= nil then entity.attack_parameters.min_range = entity.attack_parameters.min_range * (1-(mod-1)) end
			if entity.attack_parameters.ammo_type ~= nil and entity.attack_parameters.ammo_type.action ~= nil then
                if entity.attack_parameters.ammo_type.action.action_delivery ~= nil  and entity.attack_parameters.ammo_type.action.action_delivery.max_length ~= nil then
                    entity.attack_parameters.ammo_type.action.action_delivery.max_length  = entity.attack_parameters.ammo_type.action.action_delivery.max_length  * mod
                    m_range = entity.attack_parameters.ammo_type.action.action_delivery.max_length
                    
                    if entity.attack_parameters.ammo_category ~= nil then                       
                        if cannon_ammo_ranges[entity.attack_parameters.ammo_category] == nil then
                            cannon_ammo_ranges[entity.attack_parameters.ammo_category] = m_range
                        elseif cannon_ammo_ranges[entity.attack_parameters.ammo_category]<m_range then
                            cannon_ammo_ranges[entity.attack_parameters.ammo_category] = m_range
                        end
                    elseif entity.attack_parameters.ammo_categories ~= nil then
                        for i=1, #entity.attack_parameters.ammo_categories do
                            local c = entity.attack_parameters.ammo_categories[i]
                            if cannon_ammo_ranges[c] == nil then
                                cannon_ammo_ranges[c] = m_range
                            elseif cannon_ammo_ranges[c]<m_range then
                                cannon_ammo_ranges[c] = m_range
                            end
                        end
                    end
                end
                if entity.attack_parameters.ammo_type.action.action_delivery ~= nil  and entity.attack_parameters.ammo_type.action.action_delivery.max_range ~= nil then
                    entity.attack_parameters.ammo_type.action.action_delivery.max_range  = entity.attack_parameters.ammo_type.action.action_delivery.max_range  * mod
                    m_range = entity.attack_parameters.ammo_type.action.action_delivery.max_range
                    if entity.attack_parameters.ammo_category ~= nil then                       
                        if cannon_ammo_ranges[entity.attack_parameters.ammo_category] == nil then
                            cannon_ammo_ranges[entity.attack_parameters.ammo_category] = m_range
                        elseif cannon_ammo_ranges[entity.attack_parameters.ammo_category]<m_range then
                            cannon_ammo_ranges[entity.attack_parameters.ammo_category] = m_range
                        end
                    elseif entity.attack_parameters.ammo_categories ~= nil then
                        for i=1, #entity.attack_parameters.ammo_categories do
                            local c = entity.attack_parameters.ammo_categories[i]
                            if cannon_ammo_ranges[c] == nil then
                                cannon_ammo_ranges[c] = m_range
                            elseif cannon_ammo_ranges[c]<m_range then
                                cannon_ammo_ranges[c] = m_range
                            end
                        end
                    end
                end
                if entity.attack_parameters.ammo_type.action.range ~= nil then --drd
                    entity.attack_parameters.ammo_type.action.range  = entity.attack_parameters.ammo_type.action.range  * mod 
                end 
                if entity.attack_parameters.ammo_type.action.width ~= nil then 
                    entity.attack_parameters.ammo_type.action.width  = entity.attack_parameters.ammo_type.action.width  * mod 
                end --drd
            elseif entity.attack_parameters.ammo_category ~= nil and entity.attack_parameters.range ~= nil then
                if cannon_ammo_ranges[entity.attack_parameters.ammo_category] == nil then
                    cannon_ammo_ranges[entity.attack_parameters.ammo_category] = entity.attack_parameters.range
                elseif cannon_ammo_ranges[entity.attack_parameters.ammo_category]<entity.attack_parameters.range then
                    cannon_ammo_ranges[entity.attack_parameters.ammo_category] = entity.attack_parameters.range
                end
            elseif entity.attack_parameters.ammo_categories ~= nil and entity.attack_parameters.range ~= nil then
                for i=1, #entity.attack_parameters.ammo_categories do
                    local c = entity.attack_parameters.ammo_categories[i]
                    if cannon_ammo_ranges[c] == nil then
                        cannon_ammo_ranges[c] = entity.attack_parameters.range
                    elseif cannon_ammo_ranges[c]<entity.attack_parameters.range then
                        cannon_ammo_ranges[c] = entity.attack_parameters.range
                    end
                end
            end
        end

        if entity.gun ~= nil then
            local gun = table.deepcopy(data.raw["gun"][entity.gun])
            if gun.attack_parameters ~= nil then
                local gun_name = "hero-turret-gun-"..rank.."-for-" ..entity.gun
                if gun.attack_parameters.cooldown ~= nil then gun.attack_parameters.cooldown = gun.attack_parameters.cooldown / mod end
                if gun.attack_parameters.range ~= nil then gun.attack_parameters.range = gun.attack_parameters.range * mod end
                gun.name = gun_name
                gun.localised_name = localised_name
                gun.localised_desc = localised_desc
               -- log("NEW_______________________________________")
               -- log(serpent.block(gun))
               --  log("FROM______________________________________")
               --  log(serpent.block(data.raw["gun"][entity.gun]))
                data:extend({gun})
                entity.gun = gun_name
            end
        end
        entity.localised_name = localised_name
        entity.localised_description = localised_desc
        
        local left = nil        
        local top = nil

        local box = entity.drawing_box
        if box == nil then box = entity.selection_box end
        if box == nil then box = entity.collision_box end
        if box ~= nil then
            left = (math.abs(box[1][1])*32)/2
            top = (math.abs(box[1][2])*32)/2
        end

        --if (entity.cannon_base_pictures ~= nil and entity.cannon_base_pictures.layers ~= nil and entity.cannon_base_pictures.layers[1].direction_count = 256) then            
        --    table.insert(entity.cannon_base_pictures.layers,get_cannon_badge(rank))
        --else

        if is_nesw(entity) then
            if left == nil then left = entity.base_picture.north.layers[1].width/2 end
            if top == nil then top = entity.base_picture.north.layers[1].height/2 end
            table.insert(entity.base_picture.north.layers,get_badge(rank,top,left,entity.base_picture.north.layers[1].repeat_count or 1))

            if left == nil then left = entity.base_picture.east.layers[1].width/2 end
            if top == nil then top = entity.base_picture.east.layers[1].height/2 end
            table.insert(entity.base_picture.east.layers,get_badge(rank,top,left,entity.base_picture.north.layers[1].repeat_count or 1))

            if left == nil then left = entity.base_picture.south.layers[1].width/2 end
            if top == nil then top = entity.base_picture.south.layers[1].height/2 end
            table.insert(entity.base_picture.south.layers,get_badge(rank,top,left,entity.base_picture.north.layers[1].repeat_count or 1))

            if left == nil then left = entity.base_picture.west.layers[1].width/2 end
            if top == nil then top = entity.base_picture.west.layers[1].height/2 end
            table.insert(entity.base_picture.west.layers,get_badge(rank,top,left,entity.base_picture.north.layers[1].repeat_count or 1))
        elseif is_unkown_nesw(entity) and left ~=nil and top ~= nil then
            entity.base_picture = {
                layers = {
                    get_badge(rank,top,left,1)
				}
			}
        else
            if left == nil then left = entity.base_picture.layers[1].width/2 end
            if left == nil then top = entity.base_picture.layers[1].height/2 end
            
            table.insert(entity.base_picture.layers,get_badge(rank,top,left,entity.base_picture.layers[1].repeat_count or 1))
        end

        if turret.entity.fast_replaceable_group == nil then
            turret.entity.fast_replaceable_group = turret.entity.name
            entity.fast_replaceable_group = turret.entity.name
            if settings.startup["heroturrets-allow-artillery-turrets"].value == false and turret.entity.type == "artillery-turret" then

            else
                if turret.entity.next_upgrade == nil then turret.entity.next_upgrade = entity_name end
            end
        else
            if settings.startup["heroturrets-allow-artillery-turrets"].value == false and turret.entity.type == "artillery-turret" then
            else
                if turret.entity.next_upgrade == nil then turret.entity.next_upgrade = entity_name end
            end
        end
        
        if entity.type == "ammo-turret" then update_ammo_turret_tech(turret.entity, entity_name, rank) end
        if entity.type == "fluid-turret" then update_fluid_turret_tech(turret.entity, entity_name, rank) end
        if settings.startup["heroturrets-kill-counter"].value == "Exact" then   
            entity.minable.result = mine_name_with_tags
            data:extend({item_with_tags,item,recipe,entity})
        elseif settings.startup["heroturrets-kill-counter"].value == "Disable" then
            entity.minable.result = turret.item.name
            data:extend({item,recipe,entity})
        else
            entity.minable.result = mine_name
            data:extend({item,recipe,entity})
        end
   end

local local_trim = function(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end
local local_split = function(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            local n_str = local_trim(str)
            if #n_str > 0 and #n_str < 26 and table_contains(t,n_str) == false then
                table.insert(t, n_str)
            end
        end
        return t
end

local local_get_names = function()
    local names = {"Private 1st Class","Corporal","Sergeant","General"}
    if  settings.startup["heroturrets-use-csv"].value ~= true then return names end
    local custom_string = settings.startup["heroturrets-csv-names"].value 
    if custom_string == nil then return names end
    custom_string = local_trim(custom_string)

    if #custom_string == 0 then return names end
    local custom = local_split(custom_string,",")
    if #custom < 4 then return names end
    return custom
end

local local_get_recipe = function(name)
    local r = data.raw["recipe"][name]
    if r == nil then
        for name,recipe in pairs(data.raw["recipe"]) do	
            if recipe.result == name then return recipe end
        end
    end
    return nil
end

local local_create_turrets = function()  --personal-laser-defense-equipment  "active-defense-equipment"
    local turret_types = {"ammo-turret", "fluid-turret","electric-turret", "artillery-turret"} --"active-defense-equipment"} --, "artillery-wagon"}
    local guns = {}
    for at = 1, #turret_types do local tt = turret_types[at]
        for name, entity in pairs(data.raw[tt]) do	
            local left = nil        
            local top = nil

            local box = entity.drawing_box
            if box == nil then box = entity.selection_box end
            if box == nil then box = entity.collision_box end
            if box ~= nil then
             left = (math.abs(box[1][1])*32)/2
             top = (math.abs(box[1][2])*32)/2
            end
            --[[if entity ~= nil and entity.name ~= nil and entity.type == "active-defense-equipment" and entity.name == "personal-laser-defense-equipment" then
                local recipe = local_get_recipe(entity.name)
                if recipe == nil then log("Missing recipie") end
                local item = local_get_item(entity.name)       
                if item == nil then log("Missing item") end
                if recipe == nil and item ~= nil then recipe = data.raw["recipe"][item.name] end
                if recipe ~= nil and item ~= nil and entity.minable.result ==  item.name then
                    table.insert(guns,
                    {
                        item = item,
                        entity = entity,
                        recipe = recipe,
					})
                end

            else]]
            if entity ~= nil and entity.name ~= nil and entity.type ~= "active-defense-equipment"                   
				    and starts_with(entity.name,"creative-mod") == false
                    and starts_with(entity.name,"se-meteor") == false
                    
                    and starts_with(entity.name,"vehicle-gun-turret") == false
                    and starts_with(entity.name,"vehicle-rocket-turret") == false
                    and ends_with(entity.name,"shield-dome") == false
				    and entity.subgroup~="enemies" 
                    and (is_nesw(entity) or (entity.base_picture ~= nil and entity.base_picture.layers ~= nil) or (is_unkown_nesw(entity) and left ~=nil and top ~= nil)) -- or (entity.cannon_base_pictures ~= nil and entity.cannon_base_pictures.layers ~= nil and entity.cannon_base_pictures.layers[1].direction_count == 256))
                    and entity.max_health > 1 
                    and entity.minable ~= nil and entity.minable.result ~= nil then

                    local recipe = local_get_recipe(entity.name)
                    if recipe == nil then log("Missing recipie") end
                    local item = local_get_item(entity.name)       
                    if item == nil then log("Missing item") end
                    if item ~= nil and entity.minable.result ~= item.name then log("Mining result mismatch") end
                    if recipe == nil and item ~= nil then recipe = data.raw["recipe"][item.name] end
                    --if entity.name == "shotgun-ammo-turret-rampant-arsenal" then
                    if recipe ~= nil and item ~= nil and entity.minable.result ==  item.name then
                        table.insert(guns,
                        {
                            item = item,
                            entity = entity,
                            recipe = recipe,
					    })
                    end
                    
            end
        end
    end

    local percent = 1 + (settings.startup["heroturrets-setting-level-buff-modifier"].value/100)
    for k = 1, #guns do local item = guns[k]
        if settings.startup["heroturrets-kill-counter"].value == "Exact" then     
            local_create_turret_with_tags(item)
        end

       local names = local_get_names()
       local inc = (0.5*percent)/#names       
       for j = 1, #names do
           
           local_create_turret(item,j,names[j],1+(inc*j))
       end

       -- local_create_turret(item,1,"Private 1st Class",1.125*percent)
       -- local_create_turret(item,2,"Corporal",1.25*percent)
       -- local_create_turret(item,3,"Sergeant",1.375*percent)
       -- local_create_turret(item,4,"General",1.5*percent)
    end

    end

local local_update_ammo_ranges = function()    
    for k,_ in pairs(data.raw["ammo"]) do         
        
        if data.raw["ammo"][k].ammo_type ~= nil and data.raw["ammo"][k].ammo_type.category ~= nil and cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category] ~= nil then
         --extra tests only looking at updating cannon ammo for now
         --data.raw["ammo"][k].ammo_type.category == "cannon-shell" 
            --and 
           -- log(serpent.block(data.raw["ammo"][k]))
            if data.raw["ammo"][k].ammo_type.action ~= nil then
                if #data.raw["ammo"][k].ammo_type.action>0 then
                    for j=1, #data.raw["ammo"][k].ammo_type.action do
                        if data.raw["ammo"][k].ammo_type.action[j].action_delivery ~= nil then
                            if data.raw["ammo"][k].ammo_type.action[j].action_delivery.max_range ~= nil 
                            and data.raw["ammo"][k].ammo_type.action[j].action_delivery.max_range < cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category] then
                                data.raw["ammo"][k].ammo_type.action[j].action_delivery.max_range = cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category]
                                log("updated "..data.raw["ammo"][k].name.." range to "..cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category])
                            end
                        end
                    end
                else
                    if data.raw["ammo"][k].ammo_type.action.action_delivery ~= nil then
                        if data.raw["ammo"][k].ammo_type.action.action_delivery.max_range ~= nil 
                        and data.raw["ammo"][k].ammo_type.action.action_delivery.max_range < cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category] then
                            data.raw["ammo"][k].ammo_type.action.action_delivery.max_range = cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category]
                            log("updated "..data.raw["ammo"][k].name.." range to "..cannon_ammo_ranges[data.raw["ammo"][k].ammo_type.category])
                        end
                    end
                end
            end
        end
    end

end

if data ~= nil and data_final_fixes == true then
    local_create_turrets()
    local_update_ammo_ranges()
end
