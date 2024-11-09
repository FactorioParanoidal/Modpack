--[[ Copyright (c) 2018 Optera
 * Part of Re-Stack
 *
 * See LICENSE.md in the project directory for license information.
--]]

SelectItemByEntity("transport-belt", settings.startup["ReStack-belt"].value)
SelectItemByEntity("underground-belt", settings.startup["ReStack-belt"].value)
SelectItemByEntity("splitter", settings.startup["ReStack-belt"].value)
SelectItemByEntity("loader", settings.startup["ReStack-belt"].value)

SelectItemByEntity("pipe", settings.startup["ReStack-pipe"].value)
SelectItemByEntity("pipe-to-ground", settings.startup["ReStack-pipe"].value)

SelectItemByEntity("container", settings.startup["ReStack-container"].value)
SelectItemByEntity("logistic-container", settings.startup["ReStack-container"].value)

SelectItemByEntity("inserter", settings.startup["Rebulk-inserter"].value)

SelectItemByEntity("electric-pole", settings.startup["ReStack-electric-pole"].value)

SelectItemByEntity("roboport", settings.startup["ReStack-roboport"].value)

SelectItemByEntity("logistic-robot", settings.startup["ReStack-robot"].value)
SelectItemByEntity("construction-robot", settings.startup["ReStack-robot"].value)

for _, item in pairs(data.raw["rail-planner"]) do
  ReStack_Items[item.name] = {stack_size = settings.startup["ReStack-rail"].value, type = "rail"} -- inefficient but looks better in log
end

SelectItemByEntity("rail-signal", settings.startup["ReStack-rail-signal"].value, "rail-signal")
SelectItemByEntity("rail-chain-signal", settings.startup["ReStack-rail-signal"].value, "rail-signal")

SelectItemByEntity("train-stop", settings.startup["ReStack-train-stop"].value, "train-stop")

SelectItemByEntity("locomotive", settings.startup["ReStack-train-carriage"].value, "train-carriage")
SelectItemByEntity("cargo-wagon", settings.startup["ReStack-train-carriage"].value, "train-carriage")
SelectItemByEntity("fluid-wagon", settings.startup["ReStack-train-carriage"].value, "train-carriage")
SelectItemByEntity("artillery-wagon", settings.startup["ReStack-train-carriage"].value, "train-carriage")

SelectItemByEntity("car", settings.startup["ReStack-car"].value)

SelectItemByEntity("arithmetic-combinator", settings.startup["ReStack-combinator"].value)
SelectItemByEntity("decider-combinator", settings.startup["ReStack-combinator"].value)
SelectItemByEntity("constant-combinator", settings.startup["ReStack-combinator"].value)

ReStack_Items["red-wire"] = {stack_size = settings.startup["ReStack-wire"].value, type = "wire"}
ReStack_Items["green-wire"] = {stack_size = settings.startup["ReStack-wire"].value, type = "wire"}
ReStack_Items["copper-cable"] = {stack_size = settings.startup["ReStack-wire"].value, type = "wire"}
