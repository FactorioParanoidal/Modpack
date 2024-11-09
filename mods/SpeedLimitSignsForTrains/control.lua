require "util"
require "utils.set"
require "utils.train"

function onInit()
    global.trains_lookup = {}
    global.last_built_sign = {}
end

function onConfigurationChanged(data)
    -- remove old unused variables
    global.trains = nil
    global.slowers = nil
    global.unslowers = nil

    -- enable recipes if tech is already researched
    for k, v in pairs(game.forces) do
        if v.technologies["automated-rail-transportation"].researched then
            v.recipes["electronic-train-limit"].enabled = true
            v.recipes["electronic-train-unlimit"].enabled = true
        end
    end
    
    -- reset our globals for safety
    local our_mod = data.mod_changes["SpeedLimitSignsForTrains"]
    
    if our_mod and our_mod.old_version ~= our_mod.new_version then
        global.trains_lookup = {}
        global.last_built_sign = {}
    end
end

script.on_init(onInit)
script.on_configuration_changed(onConfigurationChanged)

function getBoundingBox(position, radius)
    return {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}}
end

function isTrainArriving(train)
    return train.state == defines.train_state.arrive_station or train.state == defines.train_state.arrive_signal
end

function shouldBrakeTrain(train, allowed_speed)
    -- for train braking before station or signal we're adding additional ~10 km/h to the target speed
    -- this way it will not roll slowly for a half of minute before reaching the station/signal
    return not train.manual_mode and ((not isTrainArriving(train) and math.abs(train.speed) >= allowed_speed) or (isTrainArriving(train) and math.abs(train.speed) >= allowed_speed + 0.05))
end

function calcDeceleration(train)
    local abs_speed = math.abs(train.speed)
    local factor = 1

    if isTrainArriving(train) then
        factor = 0.75
    end
	
	factor = factor * 10.0 -- line added to decellerate much quicker

    if abs_speed > 0.6 then
        factor = 0.005*factor
    elseif abs_speed > 0.3 then
        factor =  0.0075*factor
    else
        factor = 0.01*factor
    end
	
	return math.min(1, factor) -- line added to avoid factors > 1 which would turn around the train
end

function calcTickSpeed(speed)
    -- convert from speed in kph to speed in meters per tick
    -- frame = 60 ticks/s
    -- 60 m/s = 1 m/frame = 216 km/h
    -- additional 0.4 is some experimental correction
    return speed / 216.4
end

function processSignsForTrain(twrap)
    -- first locomotive of the train moving in proper direction
    local loco = nil

    if twrap.train.speed > 0 and twrap.front_loco then
        loco = twrap.front_loco
    elseif twrap.train.speed < 0 and twrap.back_loco then
        loco = twrap.back_loco
    else
        -- invalid setup, no locomotive in the movement direction of train
        return
    end

    lst = loco.surface.find_entities_filtered{area = getBoundingBox(loco.position, 2), type = "constant-combinator"}
    for i, ent in pairs(lst) do
        if ent.name == "placed-train-limit" and isOnLeft(ent.position, loco.position, getCardinal(loco.orientation)) then
            local limit_value = getLimitIndication(ent)
            
            if limit_value and limit_value >= 5 and limit_value <= 500 then
                twrap.limit = calcTickSpeed(limit_value)
            end
            
            return
        elseif ent.name == "placed-train-unlimit" and isOnLeft(ent.position, loco.position, getCardinal(loco.orientation)) then
            local circuit_signal = readCircuitSignal(ent, {type = "item", name = "train-unlimit"})
            
            if circuit_signal == nil or circuit_signal > 0 then
                twrap.limit = false
            end
            
            return
        end
    end

    local area = getBoundingBox(loco.position, twrap.train.speed * 10 + 1)

    if loco.surface.count_entities_filtered{area = area, type = "constant-combinator", count = 1} == 0 then
        twrap.deactivation = 6
    end
end

script.on_event(defines.events.on_tick, function(event)
    for i=#global.trains_lookup,1,-1 do
        local twrap = global.trains_lookup[i]

        if not twrap.train.valid then
            table.remove(global.trains_lookup, i)
        else
            -- process signs and deactivation for this train
            if twrap.deactivation == 0 and twrap.train.speed ~= 0 then
                processSignsForTrain(twrap)
            elseif twrap.deactivation > 0 then
                 twrap.deactivation = twrap.deactivation - 1
            elseif twrap.deactivation < 0 then
                twrap.deactivation = 0
            end

            -- decelerate the train if needed
            if twrap.limit and twrap.train.speed ~= 0 and shouldBrakeTrain(twrap.train, twrap.limit) then
                local decel = calcDeceleration(twrap.train)
				
                if twrap.train.speed > 0 then
					if (twrap.train.speed - decel) > 0 then
						twrap.train.speed = math.max(twrap.train.speed - decel, twrap.limit)
					else
						twrap.train.speed = twrap.limit
					end
                else
					if (twrap.train.speed + decel) < 0 then
						twrap.train.speed = math.min(twrap.train.speed + decel, -twrap.limit)
					else
						twrap.train.speed = -twrap.limit
					end
                end
            end
        end
    end
end)

function onTrainState(event)
    for k, v in pairs(global.trains_lookup) do
        if not v.train.valid then
            table.remove(global.trains_lookup, i)
        elseif v.train == event.train then
            if v.train.manual_mode then
                v.limit = false
            end
            
            return
        end
    end

    local front_loco = nil
    local back_loco = nil
    
    if #event.train.locomotives.front_movers > 0 then
        front_loco = event.train.locomotives.front_movers[1]
    end
    
    if #event.train.locomotives.back_movers > 0 then
        back_loco = event.train.locomotives.back_movers[#event.train.locomotives.back_movers]
    end
    
    table.insert(global.trains_lookup, {
        train=event.train, deactivation=0, limit=false, front_loco=front_loco, back_loco=back_loco
    })
end

function readCircuitSignal(entity, signal_type)
    local sign_value = 0

    local red_network = entity.get_circuit_network(defines.wire_type.red)
    local green_network = entity.get_circuit_network(defines.wire_type.green)
   
    if not red_network and not green_network then
        return nil
    end
    
    if red_network then
        sign_value = sign_value + red_network.get_signal(signal_type)
    end

    if green_network then
        sign_value = sign_value + green_network.get_signal(signal_type)
    end

    return sign_value
end

function getLimitIndication(entity, red_network, green_network)
    local sign_value = entity.get_or_create_control_behavior().get_signal(1).count
    
    if sign_value ~= nil and sign_value ~= 0 then
        return sign_value
    else
        return readCircuitSignal(entity, {type = "item", name = "train-limit"})
    end
end

function setLimitIndication(entity, value)
    if not entity or not entity.valid then
        return false
    end
    
    entity.get_or_create_control_behavior().set_signal(1, 
        {count = value, signal = {type = "item", name = "train-limit"}})
    
    return true
end

function onBuiltEntity(event)
    local player = nil
    
    if event.player_index then
        player = game.players[event.player_index]
    end

    if event.created_entity.name == "placed-train-limit" then
        event.created_entity.operable = false
        
        if player then
            setLimitIndication(event.created_entity, 20)

            local frame = player.gui.center["tsl-value"]

            if not frame then
                global.last_built_sign[event.player_index] = event.created_entity

                frame = player.gui.center.add{type="frame", name="tsl-value", caption={"gui-limit-title"}, direction="horizontal"}
                frame.add{type="button", name="tsl-value-20", caption={"gui-20"}}
                frame.add{type="button", name="tsl-value-30", caption={"gui-30"}}
                frame.add{type="button", name="tsl-value-40", caption={"gui-40"}}
                frame.add{type="button", name="tsl-value-50", caption={"gui-50"}}
                frame.add{type="button", name="tsl-value-80", caption={"gui-80"}}
                frame.add{type="button", name="tsl-value-100", caption={"gui-100"}}
                frame.add{type="button", name="tsl-value-other", caption={"gui-other"}}
                frame.add{type="button", name="tsl-value-circuit", caption={"gui-circuit"}}
            end
        end
    elseif event.created_entity.name == "placed-train-unlimit" then
        event.created_entity.operable = false
    end
end

function onGuiClick(event)
    local player = game.players[event.player_index]
	local frame = player.gui.center["tsl-value"]
    local manual_frame = player.gui.center["tsl-manual-value"]
    
    if manual_frame and event.element.parent == manual_frame then
        if event.element.name == "tsl-manual-ok" then
            local limit_value = tonumber(manual_frame["tsl-manual-input"].text)
            
            if not limit_value or limit_value < 5 or limit_value > 500 or limit_value % 1 ~= 0 then
                manual_frame["tsl-manual-input"].text = ""
                player.print({"gui-invalid-limit"})
                return
            end

            if not setLimitIndication(global.last_built_sign[event.player_index], limit_value) then
                player.print({"gui-set-failed"})
            end
            
            global.last_built_sign[event.player_index] = nil
            
            manual_frame.destroy()
        end
    elseif frame and event.element.parent == frame then
        local limit_value = nil

        if event.element.name == "tsl-value-other" then
            frame.destroy()

            manual_frame = player.gui.center.add{type="frame", name="tsl-manual-value", caption={"gui-limit-manual"}, direction="vertical"}
            manual_frame.add{type="label", caption={"gui-limit-value"}}
            manual_frame.add{type="textfield", name="tsl-manual-input"}
            manual_frame.add{type="button", name="tsl-manual-ok", caption={"gui-ok"}}
            return
        elseif event.element.name == "tsl-value-20" then
            limit_value = 20
        elseif event.element.name == "tsl-value-30" then
            limit_value = 30
        elseif event.element.name == "tsl-value-40" then
            limit_value = 40
        elseif event.element.name == "tsl-value-50" then
            limit_value = 50
        elseif event.element.name == "tsl-value-80" then
            limit_value = 80
        elseif event.element.name == "tsl-value-100" then
            limit_value = 100
        elseif event.element.name == "tsl-value-circuit" then
            limit_value = 0
        else
            return
        end

        if not setLimitIndication(global.last_built_sign[event.player_index], limit_value) then
            player.print({"gui-set-failed"})
        end

        global.last_built_sign[event.player_index] = nil
        
        frame.destroy()
    end
end

function onPlayerJoinedGame(event)
    local player = game.players[event.player_index]
	local frame = player.gui.center["tsl-value"]
    local manual_frame = player.gui.center["tsl-manual-value"]
    
    if frame then
        frame.destroy()
    end
    
    if manual_frame then
        manual_frame.destroy()
    end
end

function onPlayerLeft(event)
    global.last_built_sign[event.player_index] = nil
end

script.on_event(defines.events.on_train_changed_state, onTrainState)
script.on_event(defines.events.on_built_entity, onBuiltEntity)
script.on_event(defines.events.on_robot_built_entity, onBuiltEntity)
script.on_event(defines.events.on_gui_click, onGuiClick)
script.on_event(defines.events.on_player_joined_game, onPlayerJoinedGame)
script.on_event(defines.events.on_player_left_game, onPlayerLeft)
