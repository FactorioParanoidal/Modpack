
-- reactor dies = nuclear explostion
script.on_event(defines.events.on_entity_died, function(event)
local entity = event.entity
local force = entity.force
	entity.surface.create_entity{name = "nuke-explosion", position = entity.position, force=force}
end
,{{filter = "type", type = "fusion-reactor"}, {filter = "type", type = "reactor"}}
)
