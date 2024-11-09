local OV = angelsmods.functions.OV
--set nuclear cell plate
local n_plate="iron-plate"
if mods["bobplates"] then
  n_plate="lead-plate"
elseif mods["angels-industries"] and angelsmods.industries.overhaul then
  n_plate="angels-plate-lead" --should only activate if not with bobs
end
--hide advanced uranium processing, as it is integrated into the normal cycle
data.raw.recipe["advanced-uranium-processing"].hidden=true

--Add ingredients to thermonuclear bomb
data.raw["recipe"]["thermonuclear-bomb"].ingredients = {{"rocket-control-unit", 200}}
--modules
if mods["bobmodules"] then
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"speed-module-6", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"productivity-module-6", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"effectivity-module-6", 3})
else
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"speed-module-3", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"productivity-module-3", 3})
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"efficiency-module-3", 3})
end
--fusion cores
if data.raw.item["fusion-reactor-equipment-2"] then
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"fusion-reactor-equipment-2", 1})
else
	table.insert(data.raw["recipe"]["thermonuclear-bomb"].ingredients, {"fission-reactor-equipment", 1})
end
---------------------------------------
-- ANGELS INDUSTRIES NUCLEAR UPDATES --
---------------------------------------
--something about replacing angels deuterium bomb result with the thermonuke etc...
if mods["angelsindustries"] and angelsmods.industries.overhaul then
  --fix recipes
  clowns.functions.replace_ing("angels-uranium-fuel-cell","iron-plate",n_plate,"ing")
  clowns.functions.replace_ing("advanced-thorium-nuclear-fuel-reprocessing|b","used-up-thorium-fuel-cell","used-up-angels-thorium-fuel-cell","ing")
  clowns.functions.replace_ing("advanced-thorium-nuclear-fuel-reprocessing","used-up-thorium-fuel-cell","used-up-AMOX-cell","ing")
  clowns.functions.replace_ing("thorium-nuclear-fuel-reprocessing","used-up-thorium-fuel-cell","used-up-AMOX-cell","ing")
  --==Hide fuel cell recipes==--
  --clowns uranium-fuel cell
  OV.remove_unlock("mixed-oxide", "mixed-oxide-fuel")
  OV.disable_technology("mixed-oxide-fuel")
  --clowns thorium-fuel cell
  OV.remove_unlock("thorium-mixed-oxide", "thorium-fuel-reprocessing")
  OV.disable_technology("thorium-fuel-reprocessing")
  angelsmods.functions.add_flag("used-up-thorium-fuel-cell", "hidden")
  --use angels version
  OV.global_replace_item("thorium-fuel-cell","angels-thorium-fuel-cell")
  OV.global_replace_item("used-up-thorium-fuel-cell","used-up-angels-thorium-fuel-cell")
end

--updates to the plutonium bomb
if data.raw.item["electronic-logic-board"] then 
  clowns.functions.replace_ing("plutonium-atomic-bomb","electronic-logic-board","rocket-control-unit","ing")
elseif data.raw.item["processing-unit"] then
  clowns.functions.replace_ing("plutonium-atomic-bomb","processing-unit","rocket-control-unit","ing")
end
--assuming bobs reprocessing recipe is well balanced (may be clobbered by angels)
data.raw.recipe["nuclear-fuel-reprocessing"].results=
{
	{type="item", name="plutonium-239", amount=3,probability=0.1},
	{type="item", name="uranium-238", amount=3},
}
--update nuclear fuel result metal
clowns.functions.add_to_table("nuclear-fuel-reprocessing",{type="item", name=n_plate, amount=5},"res")
--table.insert(data.raw.recipe["nuclear-fuel-reprocessing"].results, {type="item", name=n_plate, amount=5})

--lead replacement mixing settings
if settings.startup["reprocessing-overhaul"].value and data.raw.item["lead-oxide"] then --check setting and that the oxide exists
	local rec_chance= 1
	if data.raw.recipe["angels-roll-lead-converting"] then -- assuming full modules, assembly and coils
		rec_chance= 0.215
	elseif mods["bobmodules"] and mods["bobassembly"] then
		rec_chance= 0.4
	elseif mods["bobmodules"] and not mods["bobassembly"] then -- im sure someone is crazy enough...
		rec_chance= 0.52 -- balanced based on pure prod MK8 modules and vanilla MK3 AM
	elseif not mods["bobmodules"] and mods["bobassembly"] then -- highly possible, especially with space-exploration, not sure how to account for earendels modules yet
		rec_chance= 1.28 -- balanced based on vanilla modules in bobs MK6 AM
	else -- bare minimum mods (no modules, no assembly)
		rec_chance= 1.45 -- balanced based on vanilla modules and vanilla MK3 AM
	end
  --uranium updates
  clowns.functions.remove_res("nuclear-fuel-reprocessing",n_plate,"res")
  clowns.functions.add_to_table("nuclear-fuel-reprocessing",{type="item",name="lead-oxide",amount= 2,probability=rec_chance},"res")
  clowns.functions.add_to_table("advanced-nuclear-fuel-reprocessing",{type="item",name="lead-oxide",amount= 2,probability=rec_chance},"res")
  --table.insert(data.raw.recipe["nuclear-fuel-reprocessing"].results,{type="item",name="lead-oxide",amount= 2,probability=rec_chance})
  --table.insert(data.raw.recipe["advanced-nuclear-fuel-reprocessing"].results,{type="item",name="lead-oxide",amount= 2,probability=rec_chance})
  --thorium updates
  if data.raw.item["thorium-ore"] then
    angelsmods.functions.allow_productivity("mixed-oxide")
    angelsmods.functions.allow_productivity("thorium-mixed-oxide")
    clowns.functions.remove_res("thorium-fuel-reprocessing",n_plate,"res")
    if data.raw.recipe["advanced-thorium-nuclear-fuel-reprocessing"] then
      clowns.functions.add_to_table("advanced-thorium-nuclear-fuel-reprocessing",{type="item",name="lead-oxide",amount= 2,probability=rec_chance},"res")
      clowns.functions.add_to_table("advanced-thorium-nuclear-fuel-reprocessing|b",{type="item",name="lead-oxide",amount= 2,probability=rec_chance},"res")
      --table.insert(data.raw.recipe["advanced-thorium-nuclear-fuel-reprocessing"].results,{type="item",name="lead-oxide",amount= 2,probability=rec_chance})
      --table.insert(data.raw.recipe["advanced-thorium-nuclear-fuel-reprocessing|b"].results,{type="item",name="lead-oxide",amount= 2,probability=rec_chance})
    end
    if data.raw.recipe["thorium-fuel-reprocessing"] then
      clowns.functions.add_to_table("thorium-fuel-reprocessing",{type="item",name="lead-oxide",amount= 2,probability=rec_chance},"res")
      --table.insert(data.raw.recipe["thorium-fuel-reprocessing"].results,{type="item",name="lead-oxide",amount= 2,probability=rec_chance})
    end
  else
    clowns.functions.add_to_table("advanced-nuclear-fuel-reprocessing-2",{type="item",name="lead-oxide",amount= 2,probability=rec_chance},"res")
    --table.insert(data.raw.recipe["advanced-nuclear-fuel-reprocessing-2"].results,{type="item",name="lead-oxide",amount= 2,probability=rec_chance})
  end
end
----------------------------------------
-- ANGELS INDUSTRIES GROUPING UPDATES --
----------------------------------------
if mods["angelsindustries"] then
  --nuclear reactor fuel group updates
	data.raw["item-subgroup"]["clowns-uranium-centrifuging"].group = "angels-power"
	data.raw["item-subgroup"]["clowns-uranium-centrifuging"].order = "d[clowns]-ac[centrifuging]"
	data.raw["item-subgroup"]["clowns-nuclear-fuels"].group = "angels-power"
	data.raw["item-subgroup"]["clowns-nuclear-fuels"].order = "d[clowns]-ab[fuels]"
	data.raw["item-subgroup"]["clowns-nuclear-cells"].group = "angels-power"
  data.raw["item-subgroup"]["clowns-nuclear-cells"].order = "d[clowns]-ad[cells]"
  data.raw["item-subgroup"]["clowns-nuclear-isotopes"].group = "angels-power"
  data.raw["item-subgroup"]["clowns-nuclear-isotopes"].order = "d[clowns]-ae[isotopes]"

  --set ingedient limit higher...
  data.raw["assembling-machine"]["centrifuge"].ingredient_count=5
  if mods["bobassembly"] and settings.startup["bobmods-assembly-centrifuge"].value then
    data.raw["assembling-machine"]["centrifuge-2"].ingredient_count=5
    data.raw["assembling-machine"]["centrifuge-3"].ingredient_count=5
  end
  if settings.startup["MCP_enable_centrifuges"].value then
    data.raw["assembling-machine"]["centrifuge-mk2"].ingredient_count=5
    data.raw["assembling-machine"]["centrifuge-mk3"].ingredient_count=5
  end
  --thermal/train fuel updates
  data.raw["item-subgroup"]["clowns-nuclear-fuels"].group = "angels-power"
  data.raw["item-subgroup"]["clowns-nuclear-fuels"].order = "d[clowns]-ac[centrifuging]"
  OV.patch_recipes({
      {name = "thorium-purification",results = {{type = "item", name = "plutonium-239", amount = 1, probability=0.15}}},
  })
end
--fix odd interactions
data.raw.recipe["uranium-fuel-cell"].ingredients =
{
  {type="item", name=n_plate, amount=10}, --enforce lead plate
  {type="item", name="35%-uranium", amount=20},
}
data.raw.recipe["mixed-oxide"].ingredients =
{
  {type="item", name=n_plate, amount=2}, --enforce lead plate
  {type="item", name="uranium-238", amount=2},
  {type="item", name="plutonium-239", amount=2}
}

--globally override plutonium to be consistent 
OV.global_replace_item("plutonium-240","plutonium-239")
--execute functions after being called
OV.execute()