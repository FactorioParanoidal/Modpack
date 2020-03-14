require("init")
require("prototypes.entity")
require("prototypes.groups")
require("prototypes.item")
require("prototypes.shortcuts")

if settings.startup["chest-stack-size"].value then
	local limits = MergingChests.Limits()
	for _, id in ipairs(MergingChests.MergableChestIds) do
		data.raw["item"][id].stack_size =
			math.max(data.raw["item"][id].stack_size, math.min(limits.area, limits.width * limits.height))
	end
end
