-----------------------
-- Unit Functions--
-----------------------
if not JB_Functions then JB_Functions = {} end


	function call_radius(w_name,radius)
		if data.raw.turret[w_name] then
			data.raw.turret[w_name].call_for_help_radius = radius
		end
	end



	function pollution_attack(u_name,amount)
		if data.raw.unit[u_name] then
			data.raw.unit[u_name].pollution_to_join_attack = amount
		end
	end



--- Biters
function biter_run_animation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        width = 169,
        height = 114,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.714844, scale * -0.246094},
        scale = scale,
        stripes =
        {
         {
          filename = "__base__/graphics/entity/biter/biter-run-1.png",
          width_in_frames = 8,
          height_in_frames = 16
         },
         {
          filename = "__base__/graphics/entity/biter/biter-run-2.png",
          width_in_frames = 8,
          height_in_frames = 16
         }
        }
      },

      {
        filename = "__base__/graphics/entity/biter/biter-run-mask1.png",
        flags = { "mask" },
        width = 105,
        height = 81,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.117188, scale * -0.867188},
        scale = scale,
        tint = tint1
      },

      {
        filename = "__base__/graphics/entity/biter/biter-run-mask2.png",
        flags = { "mask" },
        line_length = 16,
        width = 95,
        height = 81,
        frame_count = 16,
        direction_count = 16,
        shift = {scale * 0.117188, scale * -0.855469},
        scale = scale,
        tint = tint2
      }
    }
  }
end



function Biter_Melee_Single_Attack(data)
  return
    {
      type = "projectile",
      range = data.range,
      cooldown = data.cooldown,
	  damage_modifier = data.damage_modifier or 1,
      ammo_category = "melee",
      ammo_type =   {
			category = "melee",
			target_type = "entity",
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				target_effects =
				{
				  type = "damage",
				  damage = { amount = data.damage_amount_1, type = data.damage_type_1}
				},
			  }
			}
		  },
      sound =  make_biter_roars(sound),
      animation = biterattackanimation(data.scale, data.tint1, data.tint2)
    }
	
end


function Biter_Melee_Double_Attack(data)
  return
    {
      type = "projectile",
      range = data.range,
      cooldown = data.cooldown,
	  damage_modifier = data.damage_modifier or 1,
      ammo_category = "melee",
      ammo_type =   {
			category = "melee",
			target_type = "entity",
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				target_effects =
				{
					{
					  type = "damage",
					  damage = { amount = data.damage_amount_1, type = data.damage_type_1}
					},
					{
					  type = "damage",
					  damage = { amount = data.damage_amount_2, type = data.damage_type_2}
					},
				}
			  }
			}
		  },
      sound =  make_biter_roars(sound),
      animation = biterattackanimation(data.scale, data.tint1, data.tint2)
    }
	
end


function JB_Functions.add_immunity(ent_type, immunity, amount)

	 if not ent_type.resistances then ent_type.resistances = {} end
	 table.insert(ent_type.resistances, {type = immunity, percent = amount})

end



function JB_Functions.add_immunity_only_to_entities_with_res(ent_type, immunity, amount)
	 --- Only add to entities the already has resistances.
	 if ent_type.resistances then 
		local Resist_being_Added = {type = immunity, percent = amount}
		
				local found = false
				for _, resistance in pairs(ent_type.resistances) do
					if resistance.type == Resist_being_Added.type and resistance.percent then
						if resistance.percent < Resist_being_Added.percent then
							resistance.percent = Resist_being_Added.percent
						end
						found = true
					end            
				end
				
				if not found then
					table.insert(ent_type.resistances, Resist_being_Added)
				end
				
	end

end



function JB_Functions.remove_immunity(ent_type, immunity, amount)
	if not ent_type.resistances then ent_type.resistances = {} end
	table.insert(ent_type.resistances, {type = immunity, percent = amount})
end





-- Adds a resistance of a single damage type to an entity
function JB_Functions.Add_Damage_Resists(D_Type, Raw, percent, weaknesstype)
	if data.raw["damage-type"][D_Type] ~= nil then
		local Resist_being_Added = {type = D_Type, percent = percent}
		if weaknesstype and weaknesstype==D_Type then Resist_being_Added = {type = D_Type, percent = -percent} end
	
		for i,d in pairs(Raw) do
			--- entity had no resistances, so add them.
			if d.resistances == nil then 
				d.resistances = {}
				table.insert(d.resistances, Resist_being_Added)
			else
				local found = false
				for _, resistance in pairs(d.resistances) do
					if resistance.type == Resist_being_Added.type and resistance.percent then
						if resistance.percent < Resist_being_Added.percent then
							resistance.percent = Resist_being_Added.percent
							if weaknesstype and weaknesstype==resistance.type then resistance.percent = -resistance.percent end
						end
						found = true
					end            
				end
				if not found then
					table.insert(d.resistances, Resist_being_Added)
				end
			end
		end
	end
end
	
	
-- Adds a resistance of all damage types to an item type
function JB_Functions.Add_ALL_Damage_Resists(Raw, Percent, weaknesstype)
	if Raw ~= nil then	
		for k, v in pairs(data.raw["damage-type"]) do
			JB_Functions.Add_Damage_Resists(v.name, Raw, Percent, weaknesstype)
		end
	end
end



-- Adds a resistance of a single damage type to an entity
local function Add_Damage_Resists_to_Units(D_Type, Raw, percent, weaknesstype)
	
	if data.raw["damage-type"][D_Type] ~= nil then
		local Resist_being_Added = {type = D_Type, percent = percent}
		if weaknesstype and weaknesstype==D_Type then Resist_being_Added = {type = D_Type, percent = -percent} end

		if Raw.resistances == nil then 
			Raw.resistances = {}
			table.insert(Raw.resistances, Resist_being_Added)
		else
			local found = false
			
			for _, resistance in pairs(Raw.resistances) do
				if resistance.type == Resist_being_Added.type and resistance.percent then
					if resistance.percent < Resist_being_Added.percent then
						resistance.percent = Resist_being_Added.percent
						if weaknesstype and weaknesstype==resistance.type then resistance.percent = -resistance.percent end						
					end
					found = true
					break
			
				elseif resistance.type == Resist_being_Added.type and resistance.percent < Resist_being_Added.percent then
					found = true
					table.insert(Raw.resistances, Resist_being_Added)
					break
				end
			end
				
			if not found then
				table.insert(Raw.resistances, Resist_being_Added)
			end
				
		end
	
	end

end
	

-- Adds a resistance of ALL damage types to an item type
function JB_Functions.Add_ALL_Damage_Resists_to_Unit_type(Raw, Percent,weaknesstype)
	--if Raw ~= nil then	
		for k, v in pairs(data.raw["damage-type"]) do
				Add_Damage_Resists_to_Units(v.name, Raw, Percent, weaknesstype)
		end
	--end
end
