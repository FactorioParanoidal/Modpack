local floor, ceil = math.floor, math.ceil
local min, max = math.min, math.max

local mpp_util = require("mpp.mpp_util")

---@class Layout
local layout = {}

layout.name = "Base"
layout.translation = {"mpp.settings_layout_choice_base"}

---@diagnostic disable-next-line: missing-fields
layout.defaults = {}
layout.defaults.miner = "electric-mining-drill"
layout.defaults.belt = "transport-belt"
layout.defaults.pole = "medium-electric-pole"
layout.defaults.logistics = "passive-provider-chest"
layout.defaults.pipe = "pipe"

---@diagnostic disable-next-line: missing-fields
layout.restrictions = {}
layout.restrictions.miner_available = true
layout.restrictions.miner_size = {0, 10}
layout.restrictions.miner_radius = {0, 20}
layout.restrictions.belt_available = true
layout.restrictions.uses_underground_belts = false
layout.restrictions.pole_available = true
layout.restrictions.pole_omittable = true
layout.restrictions.pole_width = {1, 1}
layout.restrictions.pole_length = {5, 10e3}
layout.restrictions.pole_supply_area = {2.5, 10e3}
layout.restrictions.lamp_available = true
layout.restrictions.coverage_tuning = false
layout.restrictions.logistics_available = false
layout.restrictions.landfill_omit_available = true
layout.restrictions.start_alignment_tuning = false
layout.restrictions.deconstruction_omit_available = true
layout.restrictions.module_available = false
layout.restrictions.pipe_available = false
layout.restrictions.placement_info_available = false
layout.restrictions.lane_filling_info_available = false

--- Called from script.on_load
--- ONLY FOR SETMETATABLE USE
---@param self Layout
---@param state State
function layout:on_load(state) end

---@param proto MinerStruct
function layout:restriction_miner(proto)
	return true
end

--- Validate the selection
---@param self Layout
---@param state State
function layout:validate(state)
	local r = self.restrictions
	return true
end

---Layout-specific state initialisation
---@param self Layout
---@param state State
function layout:initialize(state)
	state.miner = mpp_util.miner_struct(state.miner_choice)
	state.pole = mpp_util.pole_struct(state.pole_choice)
	if layout.restrictions.belt_available then
		state.belt = mpp_util.belt_struct(state.belt_choice)
	end
end

---Starting step
---@param self Layout
---@param state State
---@return CallbackState
function layout:start(state)
	return false
end

---Probably too much indirection at this point
---@param self Layout
---@param state State
function layout:tick(state)
	state.tick = state.tick + 1
	return self[state._callback](self, state)
end

---@param self Layout
---@param state State
function layout:deconstruct_previous_ghosts(state)
	local next_step = "initialize_grid"
	if state._previous_state == nil or state._previous_state._collected_ghosts == nil then
		return next_step
	end

	local force, player = state.player.force, state.player
	for _, ghost in pairs(state._previous_state._collected_ghosts) do
		if ghost.valid then
			ghost.order_deconstruction(force, player)
		end
	end

	return next_step
end

return layout
