data:extend(
{
  {
    type = "recipe",
    name = "stone-pipe", --DrD
	minable = {hardness = 0.1, mining_time = 0.3, result = "pipe"},
	enabled = false, --DrD
	hidden = true,
    ingredients =
    {
      {"stone-brick", 1},
    },
    result = "stone-pipe",
  },

  {
    type = "recipe",
    name = "stone-pipe-to-ground",
	minable = {hardness = 0.1, mining_time = 0.3, result = "pipe-to-ground"},
	enabled = false, --DrD
	hidden = true, --DrD
    ingredients =
    {
      {"stone-pipe", 10},
      {"stone-brick", 5},
    },
    result_count = 2,
    result = "stone-pipe-to-ground",
  }
 }
)
--data.raw["pipe"]["stone-pipe"].minable = {hardness = 0.1, mining_time = 0.3, result = "pipe"}
--data.raw["pipe"]["stone-pipe-to-ground"].minable = {hardness = 0.1, mining_time = 0.3, result = "pipe-to-ground"}



data.raw.technology["air-compressor-1"].hidden = true
data.raw.technology["air-compressor-1"].enabled = false
data.raw.technology["air-compressor-1"].effects = nil

data.raw.technology["air-compressor-2"]= nil
data.raw.technology["air-compressor-3"]= nil
data.raw.technology["air-compressor-4"]= nil

data.raw.technology["water-bore-1"]= nil
data.raw.technology["water-bore-2"]= nil
data.raw.technology["water-bore-3"]= nil
data.raw.technology["water-bore-4"]= nil

--[[if data.raw["generator"]["fluid-generator"] then
data.raw.recipe["fluid-generator"].hidden = true
data.raw.recipe["fluid-generator-2"].hidden = true
data.raw.recipe["fluid-generator-3"].hidden = true

data.raw["generator"]["fluid-generator"].minable = {hardness = 0.1, mining_time = 0.3, result = "oil-steam-boiler"}
data.raw["generator"]["fluid-generator-2"].minable = {hardness = 0.1, mining_time = 0.3, result = "oil-steam-boiler"}
data.raw["generator"]["fluid-generator-3"].minable = {hardness = 0.1, mining_time = 0.3, result = "oil-steam-boiler"}
end]]

if data.raw["generator"]["hydrazine-generator"] then
data.raw.recipe["hydrazine-generator"].normal.ingredients =
      {
        --{"fluid-generator-3", 1}, --DrD
        {"processing-unit", 10},
        {"steel-plate", 55},
        {"iron-gear-wheel", 20},
		{"pipe", 20}
      }
data.raw.recipe["hydrazine-generator"].expensive.ingredients =
      {
        --{"fluid-generator-3", 1}, --DrD
        {"processing-unit", 10},
        {"steel-plate", 55},
        {"iron-gear-wheel", 20},
		{"pipe", 20}
      }
end

if data.raw.recipe["oil-boiler"] then
data.raw.recipe["oil-boiler"].hidden = true
data.raw.recipe["oil-boiler-2"].hidden = true
data.raw.recipe["oil-boiler-3"].hidden = true
data.raw.recipe["oil-boiler-4"].hidden = true
end