local Resistances = {
	boss_fire_only = {
	  {type = "fire", decrease = -5, percent = -80},
      {type = "physical", decrease = 20, percent = 60},
      {type = "impact", decrease = 20, percent = 90},
      {type = "explosion", decrease = 20, percent = 60},
      {type = "acid", decrease = 10, percent = 60},
      {type = "poison", decrease = 10, percent = 60},
      {type = "laser", decrease = 10, percent = 50},
	  {type = "electric", decrease = 10, percent = 50},
	  },
	  
	boss_physical_only = {
      {type = "physical", decrease = -10, percent = -30},
	  {type = "fire", decrease = 50, percent = 100},
      {type = "impact", decrease = 50, percent = 80},
      {type = "explosion", decrease = 10, percent = 95},
      {type = "acid", decrease = 10, percent = 60},
      {type = "poison", decrease = 10, percent = 80},
      {type = "laser", decrease = 20, percent = 80},
	  {type = "electric", decrease = 10, percent = 80},
	  },

	boss_explosion_only = {
	  {type = "fire", decrease = -10, percent = -10},
      {type = "physical", decrease = 40, percent = 95},
      {type = "impact", decrease = 20, percent = 80},
      {type = "explosion", decrease = -20, percent = -100},
      {type = "acid", decrease = 10, percent = 70},
      {type = "poison", decrease = 10, percent = 70},
      {type = "laser", decrease = 10, percent = 90},
	  {type = "electric", decrease = 10, percent = 80},
	  },

	boss_fireworm = {
	  
	  {type = "electric", decrease = -10, percent = -50},
      {type = "laser", decrease = -10, percent = -40},
      {type = "physical", decrease = 10, percent = 10},
	  {type = "fire", percent = 100},
      {type = "impact", percent = 100},
      {type = "explosion", decrease = 15, percent = 40},
      {type = "acid", percent = 10},
      {type = "poison", decrease = 10, percent = 10},
	  },
	  
}

if mods["Cold_biters"] then
	table.insert(Resistances.boss_fire_only,{type = "cold", decrease = 20, percent = 70})
	table.insert(Resistances.boss_fireworm,{type = "cold", decrease = -20, percent = -100})
	end


if data.raw["damage-type"]["bob-pierce"] then
	table.insert(Resistances.boss_fire_only,{type = "bob-pierce", decrease = 20, percent = 80})
	table.insert(Resistances.boss_fireworm,{type = "bob-pierce", decrease = 10, percent = 20})
	end

return Resistances
