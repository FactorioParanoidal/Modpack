require("prototypes.items")
require("prototypes.recipes")

table.insert(data.raw["technology"]["automated-rail-transportation"].effects, {type="unlock-recipe", recipe="electronic-train-limit"})
table.insert(data.raw["technology"]["automated-rail-transportation"].effects, {type="unlock-recipe", recipe="electronic-train-unlimit"})
