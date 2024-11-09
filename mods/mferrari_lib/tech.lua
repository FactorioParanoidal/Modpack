
function tech_has_prereq(force,tech)
    if force.technologies[tech] then 
    local valid = not force.technologies[tech].researched
    local pre = game.technology_prototypes[tech].prerequisites
    if valid then	
    for k,req in pairs (pre) do
        if not force.technologies[req.name].researched then 
            valid=false
            break
            end
        end end
    return valid
    end
    end
    
    
function get_tech_level(force,techname)
    local level = 1
    while true do 
        if not (force.technologies[techname..'-'..level] and force.technologies[techname..'-'..level].researched) then break end
        level=level+1
        end
    return level-1
end
    

-- research utils
function is_multilevel(technology)
    if technology.object_name == "LuaTechnology" then
      technology = technology.prototype
    end
    return technology.level ~= technology.max_level
  end
  --- @param technology LuaTechnology
  --- @param level uint
  --- @return double
  function get_research_progress(technology, level)
    local force = technology.force
    local current_research = force.current_research
    if current_research and current_research.name == technology.name then
      if not is_multilevel(technology) or technology.level == level then
        return force.research_progress
      else
        return 0
      end
    else
      return force.get_saved_technology_progress(technology) or 0
    end
  end
  function get_research_unit_count(technology, level)
    local formula = technology.research_unit_count_formula
    if formula then
      local level = level or technology.level
      return math.floor(helpers.evaluate_expression(formula, { l = level, L = level }))
    else
      return math.floor(technology.research_unit_count) --[[@as double]]
    end
  end