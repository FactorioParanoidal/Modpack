local AnotherTechnologyTreeResolvingStep = {}

local function filterTechnologyNameCandatePredicate(technology_name_candidate, mode,
													effect_ingredient_not_found_in_current_tree)
	local products = EvaluatingStepStatusHolder.getEffectResultsFromTechnologyStatus(mode,
		technology_name_candidate)
	return _table.contains_f(products,
		function(product)
			--[[	log('technology_name_candidate ' ..
				technology_name_candidate .. ',product.type ' .. product.type ..
				',product.name ' .. product.name)]]
			return effect_ingredient_not_found_in_current_tree.type == product.type and
				effect_ingredient_not_found_in_current_tree.name == product.name
		end)
end
local function filterAllAvaliableTechnologiesWithIngredient(all_found_technology_names,
															mode,
															effect_ingredient_not_found_in_current_tree)
	return _table.filter(all_found_technology_names,
		function(found_technology_name)
			return filterTechnologyNameCandatePredicate(found_technology_name, mode,
				effect_ingredient_not_found_in_current_tree)
		end)
end
local function raiseAnotherTreesHandlingError(effect_ingredient_not_found_in_current_tree, technology_name, mode,
											  available_technology_names_for_ingredients)
	local all_found_technology_names = EvaluatingStepStatusHolder.getAllTechnologyNames(mode)
	local available_technology_names_for_missed_ingredient =
		filterAllAvaliableTechnologiesWithIngredient(
			all_found_technology_names,
			mode,
			effect_ingredient_not_found_in_current_tree)
	log(Utils.dump_to_console(available_technology_names_for_missed_ingredient))
	_table.each(available_technology_names_for_missed_ingredient,
		function(available_technology_name_for_missed_ingredient)
			local units = EvaluatingStepStatusHolder.getUnitsFromTechnologyStatus(mode,
				available_technology_name_for_missed_ingredient)
			log(available_technology_name_for_missed_ingredient ..
				' has units ' ..
				Utils.dump_to_console(units))
		end)
	log(Utils.dump_to_console(data.raw["technology"][technology_name]))
	log(Utils.dump_to_console(EvaluatingStepStatusHolder.getUnitsFromTechnologyStatus(mode, technology_name)))
	log(Utils.dump_to_console(available_technology_names_for_ingredients))
	_table.each(available_technology_names_for_ingredients,
		function(available_technology_name_for_ingredients)
			log(available_technology_name_for_ingredients ..
				' is ' ..
				Utils.dump_to_console(data.raw["technology"][available_technology_name_for_ingredients]))
			log(technology_name ..
				' contains in tree of ' .. available_technology_name_for_ingredients .. ' in following technologies ' ..
				Utils.dump_to_console(EvaluatingStepStatusHolder.getOccursTechnologyInAnotherTechnologyTree(
					available_technology_name_for_ingredients, technology_name, mode)))
		end)
	error('for technology ' ..
		technology_name ..
		' keep unresolved ' .. effect_ingredient_not_found_in_current_tree.name .. ' ingredient dependency!')
end
local function handleNotFoundIngredentInAnotherTrees(effect_ingredient_not_found_in_current_tree, mode, technology_name,
													 technologyTreeUtil)
	local all_found_technology_names = EvaluatingStepStatusHolder.getTechnologyNamesWithCompatiableSciencePack(mode,
		technology_name)
	local available_technology_names_for_ingredients = filterAllAvaliableTechnologiesWithIngredient(
		all_found_technology_names,
		mode,
		effect_ingredient_not_found_in_current_tree)

	if _table.size(available_technology_names_for_ingredients) == 0 then
		raiseAnotherTreesHandlingError(effect_ingredient_not_found_in_current_tree, technology_name, mode,
			available_technology_names_for_ingredients)
	end
	for _, uncycled_tech_name_candidate in pairs(available_technology_names_for_ingredients) do
		if not technologyTreeUtil.haveTechnologyInTree(uncycled_tech_name_candidate, technology_name, mode)
		then
			EvaluatingStepStatusHolder.resolveNotFoundIngredientsFromTechnologyStatus(mode, technology_name,
				effect_ingredient_not_found_in_current_tree, uncycled_tech_name_candidate, false)
			return
		end
	end
	raiseAnotherTreesHandlingError(effect_ingredient_not_found_in_current_tree, technology_name, mode,
		available_technology_names_for_ingredients)
end


local function resolvingNotFoundIngredientsInAnotherTechnologyTree(mode, technology_name, technologyTreeUtil)
	local effect_ingredients_not_found_in_current_tree = EvaluatingStepStatusHolder
		.getNotFoundIngredientsFromTechnologyStatus(
			mode,
			technology_name)
	local loggable = _table.size(effect_ingredients_not_found_in_current_tree) > 0
	if (loggable) then
		log('mode ' ..
			mode ..
			' for ' ..
			technology_name ..
			' resolving not found ingredient start. Count unresolved ingredients: ' ..
			tostring(_table.size(effect_ingredients_not_found_in_current_tree)))
	end
	_table.each(effect_ingredients_not_found_in_current_tree,
		function(effect_ingredient_not_found_in_current_tree)
			handleNotFoundIngredentInAnotherTrees(effect_ingredient_not_found_in_current_tree, mode, technology_name,
				technologyTreeUtil)
		end)
	if (loggable) then
		log('mode ' .. mode .. ' for ' .. technology_name .. ' resolving not found ingredient end')
	end
end


AnotherTechnologyTreeResolvingStep.evaluate = function(technology_name, mode, technologyTreeUtil)
	if EvaluatingStepStatusHolder.isVisitedTechnology(mode, technology_name) then
		return
	end
	EvaluatingStepStatusHolder.markTechnologyAsVisited(mode, technology_name)
	-- защита от копирования зависимостей.
	local dependencies = EvaluatingStepStatusHolder.getTreeFromTechnologyStatus(mode, technology_name)

	resolvingNotFoundIngredientsInAnotherTechnologyTree(mode, technology_name, technologyTreeUtil)

	if not dependencies then
		return
	end
	_table.each(dependencies,
		function(dependency_name)
			AnotherTechnologyTreeResolvingStep.evaluate(dependency_name, mode, technologyTreeUtil)
		end)
end
return AnotherTechnologyTreeResolvingStep
