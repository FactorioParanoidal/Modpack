function W93_UpdateTechKrastorio2()

data.raw["technology"]["w93-modular-turrets"].prerequisites = {"gun-turret", "military-2", "engine", "concrete"}
data.raw["technology"]["w93-modular-turrets"].unit.ingredients = {{"basic-tech-card", 1}, {"automation-science-pack", 1}, {"logistic-science-pack", 1}}
data.raw["technology"]["w93-modular-turrets2"].prerequisites = {"w93-modular-turrets", "electric-engine", "low-density-structure"}
data.raw["technology"]["w93-modular-turrets2"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}}
data.raw["technology"]["w93-modular-turrets-gatling"].prerequisites = {"w93-modular-turrets", "electric-engine", "military-3"}
data.raw["technology"]["w93-modular-turrets-gatling"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}}
data.raw["technology"]["w93-modular-turrets-lcannon"].prerequisites = {"w93-modular-turrets", "military-science-pack"}
data.raw["technology"]["w93-modular-turrets-lcannon"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"military-science-pack", 1}}
if data.raw["technology"]["speed-module"] then
	data.raw["technology"]["w93-modular-turrets-dcannon"].prerequisites = {"w93-modular-turrets-lcannon", "military-3", "speed-module"}
	data.raw["technology"]["w93-modular-turrets-plaser"].prerequisites = {"w93-modular-turrets", "military-3", "laser", "speed-module"}
elseif data.raw["technology"]["speed-m"] then
	data.raw["technology"]["w93-modular-turrets-dcannon"].prerequisites = {"w93-modular-turrets-lcannon", "military-3", "speed-m"}
	data.raw["technology"]["w93-modular-turrets-plaser"].prerequisites = {"w93-modular-turrets", "military-3", "laser", "speed-m"}
end
data.raw["technology"]["w93-modular-turrets-dcannon"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}}
data.raw["technology"]["w93-modular-turrets-hcannon"].prerequisites = {"w93-modular-turrets-dcannon", "military-4", "tank"}
data.raw["technology"]["w93-modular-turrets-hcannon"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}, {"utility-science-pack",1}}
data.raw["technology"]["w93-modular-turrets-rocket"].prerequisites = {"w93-modular-turrets", "explosive-rocketry"}
data.raw["technology"]["w93-modular-turrets-rocket"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}}
if data.raw["technology"]["efficiency-module"] then
	data.raw["technology"]["w93-modular-turrets-tlaser"].prerequisites = {"w93-modular-turrets-plaser", "military-4", "kr-lithium-sulfur-battery", "kr-quarry-minerals-extraction", "efficiency-module"}
elseif data.raw["technology"]["eco-m"] then
	data.raw["technology"]["w93-modular-turrets-tlaser"].prerequisites = {"w93-modular-turrets-plaser", "military-4", "kr-lithium-sulfur-battery", "kr-quarry-minerals-extraction", "eco-m"}
end
data.raw["technology"]["w93-modular-turrets-plaser"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}}
data.raw["technology"]["w93-modular-turrets-tlaser"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}, {"utility-science-pack",1}}
data.raw["technology"]["w93-modular-turrets-beam"].prerequisites = {"w93-modular-turrets-tlaser", "uranium-processing", "space-science-pack"}
data.raw["technology"]["w93-modular-turrets-beam"].unit.ingredients = {{"utility-science-pack",1}, {"space-science-pack",1}}

if settings.startup["enable-radars"].value == true then
	if data.raw["technology"]["efficiency-module-2"] and data.raw["technology"]["speed-module-2"] then
		data.raw["technology"]["w93-modular-turrets-radar"].prerequisites = {"w93-modular-turrets2", "efficiency-module-2", "speed-module-2", "utility-science-pack"}
		data.raw["technology"]["w93-modular-turrets-radar"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}, {"utility-science-pack",1}}
	elseif data.raw["technology"]["custom-m"] then
		data.raw["technology"]["w93-modular-turrets-radar"].prerequisites = {"w93-modular-turrets2", "custom-m", "utility-science-pack"}
		data.raw["technology"]["w93-modular-turrets-radar"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"military-science-pack", 1}, {"utility-science-pack",1}}
	end
end

if data.raw["technology"]["physical-projectile-damage-1"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-1"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.25})
end
if data.raw["technology"]["physical-projectile-damage-2"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-2"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.25})
end
if data.raw["technology"]["physical-projectile-damage-3"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-3"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.25})
end
if data.raw["technology"]["physical-projectile-damage-4"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-4"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.35})
end
if data.raw["technology"]["physical-projectile-damage-5"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-5"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.35})
end
if data.raw["technology"]["physical-projectile-damage-6"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-6"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.35})
end
if data.raw["technology"]["physical-projectile-damage-7"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-7"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.1})
end
if data.raw["technology"]["physical-projectile-damage-11"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-11"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.1})
end
if data.raw["technology"]["physical-projectile-damage-16"] then
	table.insert(data.raw["technology"]["physical-projectile-damage-16"].effects, {type = "turret-attack", turret_id = "scattergun-turret", modifier = 0.1})
end

end