function dLog(what) -- data log
    log(serpent.block(what))
    end
    

function make_composite_icon_rb(icon1, tint1, icon2, tint2)
return {
	{icon=icon1,icon_size = 64, icon_mipmaps = 4, tint=tint1},
	{icon=icon2,icon_size = 64, icon_mipmaps = 4, tint=tint2,priority="medium",shift={8,8},scale=0.3}}
end


function add_technology_prerequisite(technology, prerequisite)
    if not data.raw.technology[technology].prerequisites then data.raw.technology[technology].prerequisites={} end
    if not in_list(data.raw.technology[technology].prerequisites, prerequisite) then
        table.insert(data.raw.technology[technology].prerequisites,prerequisite)
        end
    end
    
    function remove_technology_prerequisite(technology, prerequisite)
    if data.raw.technology[technology] and data.raw.technology[technology].prerequisites then 
    del_list(data.raw.technology[technology].prerequisites, prerequisite) 
    end
    end
    
    
    function add_recipe_unlock(technology, recipe)
      if data.raw.technology[technology] and data.raw.recipe[recipe] then
        local addit = true
        if not data.raw.technology[technology].effects then
          data.raw.technology[technology].effects = {}
        end
        for i, effect in pairs(data.raw.technology[technology].effects) do
          if effect.type == "unlock-recipe" and effect.recipe == recipe then addit = false end
        end
        if addit then table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe}) end
      else
        if not data.raw.technology[technology] then
          log("Technology " .. technology .. " does not exist.")
        end
        if not data.raw.recipe[recipe] then
          log("Recipe " .. recipe .. " does not exist.")
        end
      end
    end
    
    function update_science_pack_amount(technology, amount)
      if data.raw.technology[technology] then
        local new ={}	
        for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
            table.insert (new,{ingredient[1], ingredient[2] + amount})
        end
        data.raw.technology[technology].unit.ingredients = new
        end
    end
    
    
    function change_science_pack_amount(technology, pack, amount)
      if data.raw.technology[technology] then
        for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
            if ingredient[1]==pack then ingredient[2]=amount end
            end
        end
    end
    
    
    function add_new_science_pack(technology, pack, amount)
      if data.raw.technology[technology] and data.raw.tool[pack] then
        local addit = true
        for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
          if ingredient[1] == pack or ingredient.name == pack then addit = false end
        end
        if addit then table.insert(data.raw.technology[technology].unit.ingredients,{pack, amount}) end
      else
        if not data.raw.technology[technology] then
          log("Technology " .. technology .. " does not exist.")
        end
        if not data.raw.tool[pack] then
          log("Science pack " .. new .. " does not exist.")
        end
      end
    end
    
    function remove_science_pack(technology, pack)
      if data.raw.technology[technology] and data.raw.tool[pack] then
        local ingredients = table.deepcopy(data.raw.technology[technology].unit.ingredients)
        for i=#ingredients,1,-1 do
            local ingredient = ingredients[i]
            if ingredient[1] == pack or ingredient.name == pack then table.remove(data.raw.technology[technology].unit.ingredients,i) end
        end
        end
    end
    
    
    function remove_raw_ingredient(raw, name)
      if raw then
        for i=#raw,1,-1 do 
          if raw[i][1] == name or raw[i].name == name then table.remove(raw,i) end
        end
        end
    end


----------------
 
local is_sprite = function(array)
    return ((array.width and array.height) or (array.size)) and (array.filename or array.stripes or array.filenames)
  end
  
  function hack_tint(array, tint,check_runtime, only_layer_tint)
    for k, v in pairs (array) do
      if type(v) == "table" then
        if is_sprite(v) then
          if (not check_runtime) or v.apply_runtime_tint then
              if (not only_layer_tint) or v.tint then
              v.tint = tint
              if v.apply_runtime_tint then v.apply_runtime_tint = false end
              end
            --[[if v.hr_version then
              v.hr_version.apply_runtime_tint = false
              v.hr_version.tint = tint
            end]]
          end
        end
        hack_tint(v, tint, check_runtime)
      end
    end
  end
  
  function hack_scale(array, scale, skip_shift)
    for k, v in pairs (array) do
      if type(v) == "table" then
        if is_sprite(v) then
          v.scale = (v.scale or 1) * scale
          if v.shift then
              if not skip_shift then v.shift[1], v.shift[2] = v.shift[1] * scale, v.shift[2] * scale end
              end
        end
        if v.source_offset then
          v.source_offset[1] = v.source_offset[1] * scale
          v.source_offset[2] = v.source_offset[2] * scale
        end
        if v.projectile_center then
          v.projectile_center[1] = v.projectile_center[1] * scale
          v.projectile_center[2] = v.projectile_center[2] * scale
        end
        if v.projectile_creation_distance then
          v.projectile_creation_distance = v.projectile_creation_distance * scale
        end
        hack_scale(v, scale, skip_shift)
      end
    end
  end
  
    
  function scale_box(box, scale)
    box[1][1] = box[1][1] * scale
    box[1][2] = box[1][2] * scale
    box[2][1] = box[2][1] * scale
    box[2][2] = box[2][2] * scale
    return box
  end
 