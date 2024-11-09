if settings.startup["coppermine-bob-module-nerfed-modules"].value then
  -- Search every recipe for the ones we want to modify DrD all file
  for name, item in pairs(data.raw.module) do
    local subgroup = item.subgroup

    local level_string = item.name:match("%d+")
    local level = 1

    if level_string then
      level = tonumber(level_string)
    end

    if subgroup == "speed-module" then
      item.effect = {
        speed = {bonus = 0.1 * level},
        consumption = {bonus = 0.175 * level}
      }
    end

    if subgroup == "efficiency-module" then
      item.effect = {
        speed = {bonus = -0.04 * level},
        consumption = {bonus = -0.1 * level}
      }
    end

    if subgroup == "productivity-module" then
      item.effect = {
        productivity = {bonus = 0.05 * level},
        consumption = {bonus = 0.2 * level * level},
        pollution = {bonus = 0.15 * level},
        speed = {bonus = -0.1 * level}
      }
    end

    if subgroup == "raw-speed-module" then
      item.effect = {
        speed = {bonus = 0.1 * level},
        consumption = {bonus = 0.1 * level}
      }
    end

    if subgroup == "raw-productivity-module" then
      item.effect = {
        productivity = {bonus = 0.05 * level},
        consumption = {bonus = 0.1 * level * level},
        pollution = {bonus = 0.05 * level},
        speed = {bonus = -0.05 * level}
      }
    end

    if subgroup == "god-module" then
      item.effect = {
        productivity = {bonus = 0.1 * level},
        consumption = {bonus = -0.1 * level},
        pollution = {bonus = -0.1 * level},
        speed = {bonus = 0.1 * level}
      }
    end

    --if subgroup == "god-module" then
    --  item.effect = {
    --    productivity = {bonus = 0.1 * level},
    --  }
    --end
  end
end
