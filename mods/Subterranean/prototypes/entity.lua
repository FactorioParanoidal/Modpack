-- Underground belts

local sub_belt_1 = table.deepcopy(data.raw["underground-belt"]["underground-belt"])
sub_belt_1.name = "subterranean-belt"
sub_belt_1.minable = {hardness = 0.2, mining_time = 2, result = "subterranean-belt"}
sub_belt_1.max_distance = 250
--sub_belt_1.flags = {"placeable-neutral", "player-creation","not-deconstructable"}   --drd
sub_belt_1.max_health = 100
sub_belt_1.structure.direction_in.sheet.tint = {r=1,g=0.3,b=0.1,a=1}
sub_belt_1.structure.direction_out.sheet.tint = {r=1,g=0.3,b=0.1,a=1}
--sub_belt_1.structure.direction_in.sheet.hr_version.tint = {r=1,g=0.3,b=0.1,a=1}
--sub_belt_1.structure.direction_out.sheet.hr_version.tint = {r=1,g=0.3,b=0.1,a=1}
sub_belt_1.speed = 1/32

data:extend{sub_belt_1}

local sub_belt_2 = table.deepcopy(data.raw["underground-belt"]["fast-underground-belt"])
sub_belt_2.name = "fast-subterranean-belt"
sub_belt_2.minable = {hardness = 0.2, mining_time = 2, result = "fast-subterranean-belt"}
sub_belt_2.max_distance = 250
--sub_belt_2.flags = {"placeable-neutral", "player-creation","not-deconstructable"}   --drd
sub_belt_2.max_health = 150
sub_belt_2.structure.direction_in.sheet.tint = {r=1,g=0.1,b=1,a=1}
sub_belt_2.structure.direction_out.sheet.tint = {r=1,g=0.1,b=1,a=1}
--sub_belt_2.structure.direction_in.sheet.hr_version.tint = {r=1,g=0.1,b=1,a=1}
--sub_belt_2.structure.direction_out.sheet.hr_version.tint = {r=1,g=0.1,b=1,a=1}
sub_belt_2.speed = 2/32

data:extend{sub_belt_2}

local sub_belt_3 = table.deepcopy(data.raw["underground-belt"]["express-underground-belt"])
sub_belt_3.name = "express-subterranean-belt"
sub_belt_3.minable = {hardness = 0.2, mining_time = 2, result = "express-subterranean-belt"}
sub_belt_3.max_distance = 250
--sub_belt_3.flags = {"placeable-neutral", "player-creation","not-deconstructable"}   --drd
sub_belt_3.max_health = 200
sub_belt_3.structure.direction_in.sheet.tint = {r=0,g=1,b=1,a=1}
sub_belt_3.structure.direction_out.sheet.tint = {r=0,g=1,b=1,a=1}
--sub_belt_3.structure.direction_in.sheet.hr_version.tint = {r=0,g=1,b=1,a=1}
--sub_belt_3.structure.direction_out.sheet.hr_version.tint = {r=0,g=1,b=1,a=1}
sub_belt_3.speed = 4/32

data:extend{sub_belt_3}

-- Pipe

local subPipe = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
--subPipe.flags = {"placeable-neutral", "player-creation",  "not-deconstructable"}   --drd
subPipe.name = "subterranean-pipe"
subPipe.minable = {hardness = 0.2, mining_time = 2, result = "subterranean-pipe"}
subPipe.max_distance = 250
subPipe.max_health = 200
subPipe.fluid_box.pipe_connections[2].max_underground_distance = 250

subPipe.pictures.up.tint = {r=0.3,g=0,b=0}
subPipe.pictures.left.tint = {r=0.3,g=0,b=0}
subPipe.pictures.right.tint = {r=0.3,g=0,b=0}
subPipe.pictures.down.tint = {r=0.3,g=0,b=0}

subPipe.pictures.up.hr_version.tint = {r=0.3,g=0,b=0}
subPipe.pictures.left.hr_version.tint = {r=0.3,g=0,b=0}
subPipe.pictures.right.hr_version.tint = {r=0.3,g=0,b=0}
subPipe.pictures.down.hr_version.tint = {r=0.3,g=0,b=0}

data:extend{subPipe}
