if mods.boblogistics then
--data.raw.technology["logistic-system-2"].enabled = false
--data.raw.technology["logistic-system-3"].enabled = false
bobmods.lib.tech.remove_recipe_unlock("logistic-robotics", "requester-chest")
bobmods.lib.tech.add_recipe_unlock("logistic-robotics", "storage-chest")

bobmods.lib.tech.add_new_science_pack("logistic-system","logistic-science-pack",1)
bobmods.lib.tech.add_recipe_unlock("logistic-system","requester-chest")
bobmods.lib.tech.add_new_science_pack("logistic-silos","logistic-science-pack",1)
bobmods.lib.tech.add_new_science_pack("logistic-silos","production-science-pack",1)
bobmods.lib.tech.add_new_science_pack("angels-logistic-warehouses","logistic-science-pack",1)
bobmods.lib.tech.add_new_science_pack("angels-logistic-warehouses","production-science-pack",1)
bobmods.lib.tech.add_new_science_pack("angels-logistic-warehouses","utility-science-pack",1)
end