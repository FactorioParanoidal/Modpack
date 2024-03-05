data:extend({
  {
    type = "item",
    name = "motor",
	icon = "__aai-industry__/graphics/icons/motor.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "intermediate-product",
    order = "g[engine-unit]-a[motor]",
    stack_size = 50,
  },
  {
    type = "item",
    name = "electric-motor",
	icon = "__aai-industry__/graphics/icons/electric-motor.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "intermediate-product",
    order = "g[engine-unit]-b[electric-motor]",
    stack_size = 50,
  },  
  {
    type = "item",
    name = "burner-lab",
    icon = "__aai-industry__/graphics/icons/burner-lab.png",
    icon_size = 64, icon_mipmaps = 1,
    flags = data.raw.item.lab.flags,
    subgroup = data.raw.item.lab.subgroup,
    order = data.raw.item.lab.order,
    stack_size = data.raw.item.lab.stack_size,
    place_result = "burner-lab",
  },
  {
    type = "item",
    name = "burner-assembling-machine",
    icon = "__aai-industry__/graphics/icons/burner-assembling-machine.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "bob-assembly-machine",
    order = "a[assembling-machine-0]",
    place_result = "assembling-machine-0",
    flags = data.raw.item["assembling-machine-1"].flags,
    --subgroup = data.raw.item["assembling-machine-1"].subgroup,
    --order = data.raw.item["assembling-machine-1"].order .. "-a",
    stack_size = data.raw.item["assembling-machine-1"].stack_size,
    place_result = "burner-assembling-machine",
  },
  {
    type = "item",
    name = "burner-turbine",
    icon = "__aai-industry__/graphics/icons/burner-turbine.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "energy",
    order = "a-a",
    place_result = "burner-turbine",
    stack_size = 10
  },
  
  -- Burner filter Inserter  ---From DRD
  {
    type = "item",
    name = "burner-filter-inserter",
    icon = "__aai-industry__/graphics/icons/burner-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 1,
    --flags = {},
	subgroup = "bob-logistic-tier-0",
    order = "d[inserter]-1[burner-filter-inserter]",
    place_result = "burner-filter-inserter",
    stack_size = 50
  },
})
data.raw.item["assembling-machine-1"].order = data.raw.item["assembling-machine-1"].order .. "-b"
