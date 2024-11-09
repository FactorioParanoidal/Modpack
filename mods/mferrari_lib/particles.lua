local random = math.random
local ceil = math.ceil
local floor = math.floor


function create_stone_particles(surface, count, position,height_mp)
if not height_mp then height_mp=1 end
    for x=1,count do
        surface.create_particle{
            position = position,
            name = 'stone-particle-medium',
            movement = {random(-5, 5) * 0.01, random(-5, 5) * 0.01},
            frame_speed = 1,
            vertical_speed = random(12, 14) * 0.01,
            height = random(9, 11) * 0.1 * height_mp,
        }
    end
end


function create_spark_particles(surface, count, position,height_mp)
if not height_mp then height_mp=1 end
    for x=1,count do
        surface.create_particle{
            position = position,
            name = 'spark-particle',
            movement = {random(-5, 5) * 0.01, random(-5, 5) * 0.01},
            frame_speed = 0.3,
            vertical_speed = random(12, 14) * 0.01,
            height = random(9, 11) * 0.1 * height_mp,
        }
    end
end

function create_blood_particles(surface, count, position,height_mp)
if not height_mp then height_mp=1 end
    for x=1,count do
        surface.create_particle({
            position = position,
            name = 'blood-particle-carpet', --'blood-particle',
            movement = {random(-9, 9) * 0.01, random(-9, 9) * 0.01},
            frame_speed = 2,
            vertical_speed = random(2, 5) * 0.01,
            height = random(5, 15) * 0.1 * height_mp,
        })
    end
end

function create_red_blood_particles(surface, count, position,height_mp)
    if not height_mp then height_mp=1 end
        for x=1,count do
            surface.create_particle({
                position = position,
                name = 'mf-red-blood-particle', --'blood-particle',
                movement = {random(-9, 9) * 0.01, random(-9, 9) * 0.01},
                frame_speed = 2,
                vertical_speed = random(2, 5) * 0.01,
                height = random(5, 15) * 0.1 * height_mp,
            })
        end
    end
    

function create_guts_particles(surface, count, position,height_mp)
if not height_mp then height_mp=1 end
    for x=1,count do
		local n='guts-entrails-particle-small-medium'
		if math.random(3)==1 then n='guts-entrails-particle-big' end
        surface.create_particle({
            position = position,
            name = n,
            movement = {random(-9, 9) * 0.01, random(-9, 9) * 0.01},
            frame_speed = 2,
            vertical_speed = random(2, 5) * 0.01,
            height = random(5, 15) * 0.1 * height_mp,
        })
    end
end


function create_water_particles(surface, count, position,height_mp)
if not height_mp then height_mp=1 end
    for x=1,count do
        surface.create_particle({
            position = position,
            name = 'tintable-water-particle',
            movement = {random(-5, 5) * 0.01, random(-5, 5) * 0.01},
            frame_speed = 1,
            vertical_speed = random(10, 12) * 0.01,
            height = random(5, 15) * 0.1 *height_mp,
        })
    end
end


function create_remnants_particles(surface, count, position,height_mp)
if not height_mp then height_mp=1 end
    for x=1,count do
        surface.create_particle({
            position = position,
            name = 'explosion-remnants-particle',
            movement = {random(-5, 5) * 0.01, random(-5, 5) * 0.01},
            frame_speed = 1,
            vertical_speed = random(10, 12) * 0.01,
            height = random(5, 15) * 0.1 * height_mp,
        })
    end
end


--
local function create_ceiling_prototype(particle, x, y,height)
if not height then height=3 end
    return {
        name = particle,
        position = {x = x + random(0, 1), y = y + random(0, 1)},
        movement = {random(-5, 5) * 0.002, random(-5, 5) * 0.002},
        frame_speed = 1,
        vertical_speed = 0,
        height = height
    }
end


function create_ceiling_drops(surface, position,count)
    local x = position.x
    local y = position.y
    local smoke_scale = ceil(count/2)
    local stone_scale = count
   for i = 1, smoke_scale do
        surface.create_particle( create_ceiling_prototype('explosion-remnants-particle', x, y))
    end
    for i = smoke_scale + 1, smoke_scale + stone_scale do
        surface.create_particle( create_ceiling_prototype('stone-particle', x, y))
    end
end

function create_water_drops(surface, position,count,height)
    local x = position.x
    local y = position.y
    for i = 1, count do
        surface.create_particle( create_ceiling_prototype('water-particle', x, y,height))
    end
end
