
--- @class lib_direction
local lib_direction = {}

--- defines.direction.north
lib_direction.north = defines.direction.north
--- defines.direction.east
lib_direction.east = defines.direction.east
--- defines.direction.west
lib_direction.west = defines.direction.west
--- defines.direction.south
lib_direction.south = defines.direction.south
--- defines.direction.northeast
lib_direction.northeast = defines.direction.northeast
--- defines.direction.northwest
lib_direction.northwest = defines.direction.northwest
--- defines.direction.southeast
lib_direction.southeast = defines.direction.southeast
--- defines.direction.southwest
lib_direction.southwest = defines.direction.southwest

--- Calculate the opposite direction.
--- @param direction defines.direction
--- @return defines.direction
function lib_direction.opposite(direction)
  return (direction + 4) % 8 --[[@as defines.direction]]
end

--- Calculate the next four-way or eight-way direction.
--- @param direction defines.direction
--- @param eight_way? boolean
--- @return defines.direction
function lib_direction.next(direction, eight_way)
  return (direction + (eight_way and 1 or 2)) % 8 --[[@as defines.direction]]
end

--- Calculate the previous four-way or eight-way direction.
--- @param direction defines.direction
--- @param eight_way? boolean
--- @return defines.direction
function lib_direction.previous(direction, eight_way)
  return (direction + (eight_way and -1 or -2)) % 8 --[[@as defines.direction]]
end

--- Calculate an orientation from a direction.
--- @param direction defines.direction
--- @return RealOrientation
function lib_direction.to_orientation(direction)
  return direction / 8 --[[@as RealOrientation]]
end

--- Calculate a vector from a direction.
--- @param direction defines.direction
--- @param distance? number default: `1`
--- @return MapPosition
function lib_direction.to_vector(direction, distance)
  distance = distance or 1
  local x, y = 0, 0
  if direction == lib_direction.north then
    y = y - distance
  elseif direction == lib_direction.northeast then
    x, y = x + distance, y - distance
  elseif direction == lib_direction.east then
    x = x + distance
  elseif direction == lib_direction.southeast then
    x, y = x + distance, y + distance
  elseif direction == lib_direction.south then
    y = y + distance
  elseif direction == lib_direction.southwest then
    x, y = x - distance, y + distance
  elseif direction == lib_direction.west then
    x = x - distance
  elseif direction == lib_direction.northwest then
    x, y = x - distance, y - distance
  end
  return { x = x, y = y }
end

--- Calculate a two-dimensional vector from a cardinal direction.
--- @param direction defines.direction
--- @param longitudinal number Distance to move in the specified direction.
--- @param orthogonal number Distance to move perpendicular to the specified direction. A negative distance will move "left" and a positive distance will move "right" from the perspective of the direction.
--- @return MapPosition?
function lib_direction.to_vector_2d(direction, longitudinal, orthogonal)
  if direction == defines.direction.north then
    return { x = orthogonal, y = -longitudinal }
  elseif direction == defines.direction.south then
    return { x = -orthogonal, y = longitudinal }
  elseif direction == defines.direction.east then
    return { x = longitudinal, y = orthogonal }
  elseif direction == defines.direction.west then
    return { x = -longitudinal, y = -orthogonal }
  end
end




function math_round(num, divisor)
  divisor = divisor or 1
  if num >= 0 then
    return math.floor((num / divisor) + 0.5) * divisor
  else
    return math.ceil((num / divisor) - 0.5) * divisor
  end
end


--- Calculate the direction of travel from the source to the target.
--- @param source MapPosition
--- @param target MapPosition
--- @param round? boolean If true, round to the nearest `defines.direction`.
--- @return defines.direction
function lib_direction.from_positions(source, target, round)
  local deg = math.deg(math.atan2(target.y - source.y, target.x - source.x))
  local direction = (deg + 90) / 45
  if direction < 0 then
    direction = direction + 8
  end
  if round then
    direction = math_round(direction)
  end
  return direction --[[@as defines.direction]]
end

return lib_direction
