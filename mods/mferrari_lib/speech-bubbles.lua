-- v 1.2  -- custom hs-speech-bubble using unit_number 10/12/2021, 
--v 2.0   10/2024

function Entity_Speak(entity,text,seconds)
	if entity and entity.valid then 
		local id = entity.unit_number
		if storage.entity_speech[id] then 
			storage.entity_speech[id].bubble.destroy()
			storage.entity_speech[id] = nil
			end
			local bubble = entity.surface.create_entity({
				name= "mf_speech_bubble", --"compi-speech-bubble",
				text= "[font=default-large-bold]".. text .."[/font]",
				position={0,0},
				source=entity })
			storage.entity_speech[id] = {}
			storage.entity_speech[id].bubble=bubble
			if seconds and seconds>0 then storage.entity_speech[id].tick=game.tick+seconds*60 end
		end
	
	end


script.on_nth_tick(61, function (event)
	for k, entity_speech in pairs (storage.entity_speech) do
		local bubble = entity_speech.bubble
		local tick   = entity_speech.tick
		if tick and game.tick >= tick then 
			bubble.destroy()
			entity_speech=nil
			end
		end
end)

function clear_speach_bubble(entity)
	if entity and entity.valid then 
		local id = entity.unit_number
		if storage.entity_speech[id] and storage.entity_speech[id].bubble and storage.entity_speech[id].bubble.valid then 
			storage.entity_speech[id].bubble.destroy()
			storage.entity_speech[id] = nil
			end
		end
	end