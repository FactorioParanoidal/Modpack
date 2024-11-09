for i, force in pairs(game.forces) do 
	if force.technologies["steel-processing"].researched then 
		force.recipes["mini-steel-chest"].enabled = true
	end
    if force.technologies["construction-robotics"].researched then 
        force.recipes["mini-logistic-chest-passive-provider"].enabled = true
        force.recipes["mini-logistic-chest-storage"].enabled = true
    end
    if force.technologies["logistic-system"].researched then 
        force.recipes["active-provider-chest"].enabled = true
        force.recipes["buffer-chest"].enabled = true
        force.recipes["requester-chest"].enabled = true
    end
end