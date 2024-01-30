-------------------------------------------------------------------------------
---Description of the module.
---@class Solver
Solver = newclass(function(base)
    base.debug_col = 11
    base.col_start = 9
    base.row_input = 2
    base.col_M = 2
    base.col_Cn = 3
    base.col_F = 4
    base.col_S = 5
    base.col_R = 6
    base.col_P = 7
    base.col_E = 8
    base.col_C = 9
end)

-------------------------------------------------------------------------------
---Clone la matrice
---@param M table
---@return table
function Solver:clone(M)
    local Mx = {}
    local num_row = rawlen(M)
    local num_col = rawlen(M[1])
    for irow, row in pairs(M) do
      Mx[irow] = {}
        for icol, col in pairs(row) do
        Mx[irow][icol] = col
      end
    end
    return Mx
end
  
-------------------------------------------------------------------------------
---Prepare la matrice
---@param M table
---@return table
function Solver:prepare(M)
    local Mx = self:clone(M)
    local irow = 1
    local row = {}
    ---ajoute la ligne Z avec Z=-input
    for icol, cell in pairs(Mx[self.row_input]) do
      if icol > self.col_start then
            Mx[#Mx][icol] = 0 - cell
      end
    end
    return Mx
end

-------------------------------------------------------------------------------
---Finalise la matrice
---@param M table
---@return table
function Solver:finalize(M)
    ---finalize la ligne Z reinject le input Z=Z+input
    for icol, cell in pairs(M[#M]) do
      if icol > self.col_start then
        M[#M][icol] = M[#M][icol] + M[self.row_input][icol]
      end
    end
    return M
end

-------------------------------------------------------------------------------
---Add runtime
---@param debug boolean
---@param runtime table
---@param name string
---@param matrix table
---@param pivot table
function Solver:addRuntime(debug, runtime, name, matrix, pivot)
    if debug == true then
        table.insert(runtime, { name = name, matrix = self:clone(matrix), pivot = pivot })
    end
end

-------------------------------------------------------------------------------
---Ajoute la ligne State
---state = 0 => produit
---state = 1 => produit pilotant
---state = 2 => produit restant
---state = 3 => produit surplus
---@param M table
---@return table
function Solver:appendState(M)
    local srow = {}
    for irow, row in pairs(M) do
      if irow > self.row_input and irow < #M then
            for icol, cell in pairs(row) do
          if srow[icol] == nil then
                    table.insert(srow, 0)
          end
          if icol > self.col_start then
            if cell < 0 then
              srow[icol] = 2
            end
            if cell > 0 and srow[icol] ~= 2 then
              srow[icol] = 1
            end
          end
        end
      end
    end
    local zrow = M[#M]
    for icol, cell in pairs(zrow) do
      if icol > self.col_start then
        if cell > 0 and srow[icol] == 2 then
          srow[icol] = 3
        end
      end
    end
    srow[1] = { name = "State", type = "none" }
    table.insert(M, srow)
    return M
end

-------------------------------------------------------------------------------
---Return a matrix of block
---@param block table
---@param debug boolean
---@return table
function Solver:solve(block, debug)
    local mC, runtimes

    local ok, err = pcall(function()
        local mA = Solver.getBlockMatrix(block)
        if mA ~= nil then
            mC, runtimes = self:solveMatrix(mA, debug, block.by_factory, block.time)
        end
    end)
    if not (ok) then
        if block.solver == true and block.by_factory ~= true then
            Player.print("Matrix solver can not find solution!")
        else
            Player.print("Algebraic solver can not find solution!")
        end
        if debug then
            Player.print(err)
        end
    end
    if debug then
        block.runtimes = runtimes
    else
        block.runtimes = nil
    end

    if mC ~= nil then
        ---remove temperature convert lines
        for i = #mC, 1, -1 do
            if mC[i][1].name == "helmod-temperature-convert" then
                table.remove(mC, i)
            end
        end

        ---ratio pour le calcul du nombre de block
        local ratio = 1
        ---calcul ordonnee sur les recipes du block
        local row_index = self.row_input + 1
        local sorter = function(t, a, b) return t[b].index > t[a].index end
        if block.by_product == false then
            sorter = function(t, a, b) return t[b].index < t[a].index end
        end

        local recipes = block.recipes
        for _, recipe in spairs(recipes, sorter) do
            if mC[row_index][self.col_R] > 0 then
                recipe.count = mC[row_index][self.col_R]
                recipe.production = mC[row_index][self.col_P]
            else
                recipe.count = 0
            end
            row_index = row_index + 1
            ---calcul dependant du recipe count
            if recipe.type == "energy" then
                ModelCompute.computeEnergyFactory(recipe)
            else
                ModelCompute.computeFactory(recipe)
            end

            block.power = block.power + recipe.energy_total
            block.pollution_total = block.pollution_total + recipe.pollution_total

            if type(recipe.factory.limit) == "number" and recipe.factory.limit > 0 then
                local currentRatio = recipe.factory.limit / recipe.factory.count
                if currentRatio < ratio then
                    ratio = currentRatio
                    ---block number
                    block.count = recipe.factory.count / recipe.factory.limit
                    ---subblock energy
                    if block.count ~= nil and block.count > 0 then
                    end
                end
            end
        end

        if block.count <= 1 then
            block.count = 1
            block.limit_energy = nil
            block.limit_pollution = nil
            block.limit_building = nil
            for _, recipe in spairs(recipes, function(t, a, b) return t[b].index > t[a].index end) do
                recipe.factory.limit_count = nil
                recipe.beacon.limit_count = nil
                recipe.limit_energy = nil
                recipe.limit_pollution = nil
            end
        else
            block.limit_energy = block.power / block.count
            block.limit_pollution = block.pollution_total / block.count
            for _, recipe in spairs(recipes, function(t, a, b) return t[b].index > t[a].index end) do
                recipe.factory.limit_count = recipe.factory.count / block.count
                recipe.beacon.limit_count = recipe.beacon.count / block.count
                recipe.limit_energy = recipe.energy_total / block.count
                recipe.limit_pollution = recipe.pollution_total / block.count
            end
        end
        ---state = 0 => produit
        ---state = 1 => produit pilotant
        ---state = 2 => produit restant
        ---state = 3 => produit surplus

        ---finalisation du bloc
        for icol, state in pairs(mC[#mC]) do
            if icol > self.col_start then
                local Z = math.abs(mC[#mC - 1][icol])
                local product_header = mC[1][icol]
                local product_key = product_header.key
                local product = Product(product_header):clone()
                product.count = Z
                product.state = state
                if block.by_product == false then
                    if state == 1 or state == 3 then
                        ---element produit
                        if block.ingredients[product_key] ~= nil then
                            block.ingredients[product_key].count = block.ingredients[product_key].count +
                            product.count
                            block.ingredients[product_key].state = state
                        end
                        if block.products[product_key] ~= nil then
                            block.products[product_key].state = 0
                        end
                    else
                        ---element ingredient
                        if block.products[product_key] ~= nil then
                            block.products[product_key].count = block.products[product_key].count + product.count
                            block.products[product_key].state = state
                        end
                        if block.ingredients[product_key] ~= nil then
                            block.ingredients[product_key].state = state
                        end
                    end
                else
                    if state == 1 or state == 3 then
                        ---element produit
                        if block.products[product_key] ~= nil then
                            block.products[product_key].count = block.products[product_key].count + product.count
                            block.products[product_key].state = state
                        end
                        if block.ingredients[product_key] ~= nil then
                            block.ingredients[product_key].state = 0
                        end
                    else
                        ---element ingredient
                        if block.ingredients[product_key] ~= nil then
                            block.ingredients[product_key].count = block.ingredients[product_key].count +
                            product.count
                            block.ingredients[product_key].state = state
                        end
                        if block.products[product_key] ~= nil then
                            block.products[product_key].state = state
                        end
                    end
                end
            end
        end
    end

    return block
end

-------------------------------------------------------------------------------
---Return a matrix of block
---@param block table
---@return table
function Solver.getBlockMatrix(block)
    local recipes = block.recipes
    if recipes ~= nil then
        local row_headers = {}
        local col_headers = {}
        local col_index = {}
        local rows = {}

        col_headers["B"] = { index = 1, name = "B", type = "none", tooltip = "Base" }           ---Base
        col_headers["M"] = { index = 1, name = "M", type = "none", tooltip = "Matrix calculation" } ---Matrix calculation
        col_headers["Cn"] = { index = 1, name = "Cn", type = "none", tooltip = "Contraint" }    ---Contraint
        col_headers["F"] = { index = 1, name = "F", type = "none", tooltip = "Number factory" } ---Number factory
        col_headers["S"] = { index = 1, name = "S", type = "none", tooltip = "Speed factory" }  ---Speed factory
        col_headers["R"] = { index = 1, name = "R", type = "none", tooltip = "Count recipe" }   ---Count recipe
        col_headers["P"] = { index = 1, name = "P", type = "none", tooltip = "Production" }     ---Production
        col_headers["E"] = { index = 1, name = "E", type = "none", tooltip = "Energy" }         ---Energy
        col_headers["C"] = { index = 1, name = "C", type = "none", tooltip = "Coefficient" }    ---Coefficient ou resultat
        ---begin loop recipes
        local factor = 1
        local sorter = function(t, a, b) return t[b].index > t[a].index end
        if block.by_product == false then
            factor = -factor
            sorter = function(t, a, b) return t[b].index < t[a].index end
        end

        for _, recipe in spairs(recipes, sorter) do
            recipe.base_time = block.time
            ModelCompute.computeModuleEffects(recipe)
            if recipe.type == "energy" then
                ModelCompute.computeEnergyFactory(recipe)
            else
                ModelCompute.computeFactory(recipe)
            end
            local row = {}

            local row_valid = false
            local recipe_prototype = RecipePrototype(recipe)
            local lua_recipe = recipe_prototype:native()

            ---la recette n'existe plus
            if recipe_prototype:native() == nil then return end

            ---prepare le taux de production
            local production = 1
            if not (block.solver == true) and recipe.production ~= nil then production = recipe.production end
            local row_header = { name = recipe.name, type = recipe.type, tooltip = recipe.name .. "\nRecette" }
            table.insert(row_headers, row_header)
            row["B"] = row_header
            row["M"] = 0 --recipe.matrix_solver or 0
            if recipe.contraint ~= nil then
                row["Cn"] = { type = recipe.contraint.type, name = recipe.contraint.name }
            else
                row["Cn"] = 0
            end
            row["F"] = recipe.factory.input or 0
            row["S"] = recipe.factory.speed or 0
            row["R"] = 0
            row["P"] = production
            row["E"] = recipe_prototype:getEnergy(recipe.factory)
            row["C"] = 0

            ---preparation
            local lua_products = {}
            local lua_ingredients = {}
            for i, lua_product in pairs(recipe_prototype:getProducts(recipe.factory)) do
                local product = Product(lua_product)
                local product_key = product:getTableKey()
                local count = product:getAmount(recipe)
                lua_products[product_key] = {
                    name = lua_product.name,
                    type = lua_product.type,
                    count = count,
                    temperature = lua_product.temperature,
                    minimum_temperature = lua_product.minimum_temperature,
                    maximum_temperature = lua_product.maximum_temperature
                }
            end
            for i, lua_ingredient in pairs(recipe_prototype:getIngredients(recipe.factory)) do
                local ingredient = Product(lua_ingredient)
                local ingredient_key = ingredient:getTableKey()
                local count = ingredient:getAmount()
                ---si constant compte comme un produit (recipe rocket)
                if lua_ingredient.constant then
                    count = ingredient:getAmount(recipe)
                end
                if lua_ingredients[ingredient_key] == nil then
                    lua_ingredients[ingredient_key] = {
                        name = lua_ingredient.name,
                        type = lua_ingredient.type,
                        count = count,
                        temperature = lua_ingredient.temperature,
                        minimum_temperature = lua_ingredient.minimum_temperature,
                        maximum_temperature = lua_ingredient.maximum_temperature
                    }
                else
                    lua_ingredients[ingredient_key].count = lua_ingredients[ingredient_key].count + count
                end
            end

            if not (block.by_product == false) then
                ---prepare header products
                for name, lua_product in pairs(lua_products) do
                    local product = Product(lua_product)
                    local product_key = product:getTableKey()
                    local index = 1
                    if col_index[product_key] ~= nil then
                        index = col_index[product_key]
                    end
                    col_index[product_key] = index

                    local col_name = product_key .. index
                    local col_header = {
                        index = index,
                        key = product_key,
                        name = lua_product.name,
                        type = lua_product.type,
                        is_ingredient = false,
                        tooltip = col_name .. "\nProduit",
                        temperature = lua_product.temperature,
                        minimum_temperature = lua_product.minimum_temperature,
                        maximum_temperature = lua_product.maximum_temperature
                    }
                    col_headers[col_name] = col_header
                    row[col_name] = lua_product.count * factor
                    row_valid = true
                    if row["Cn"] ~= 0 and row["Cn"].name == name then
                        row["Cn"].name = col_name
                    end
                end
                ---prepare header ingredients
                for name, lua_ingredient in pairs(lua_ingredients) do
                    local ingredient = Product(lua_ingredient)
                    local ingredient_key = ingredient:getTableKey()
                    local index = 1
                    ---cas normal de l'ingredient n'existant pas du cote produit
                    if col_index[ingredient_key] ~= nil and lua_products[ingredient_key] == nil then
                        index = col_index[ingredient_key]
                    end
                    ---cas de l'ingredient existant du cote produit
                    if col_index[ingredient_key] ~= nil and lua_products[ingredient_key] ~= nil then
                        ---cas de la valeur equivalente, on creer un nouveau element
                        if lua_products[ingredient_key].count == lua_ingredients[ingredient_key].count or recipe.type == "resource" or recipe.type == "energy" then
                            index = col_index[ingredient_key] + 1
                        else
                            index = col_index[ingredient_key]
                        end
                    end
                    col_index[ingredient_key] = index

                    local col_name = ingredient_key .. index
                    local col_header = {
                        index = index,
                        key = ingredient_key,
                        name = lua_ingredient.name,
                        type = lua_ingredient
                            .type,
                        is_ingredient = true,
                        tooltip = col_name .. "\nIngredient",
                        temperature = lua_ingredient.temperature,
                        minimum_temperature = lua_ingredient.minimum_temperature,
                        maximum_temperature = lua_ingredient.maximum_temperature
                    }
                    col_headers[col_name] = col_header
                    row[col_name] = (row[col_name] or 0) - lua_ingredients[ingredient_key].count * factor
                    row_valid = true
                end
            else
                ---prepare header ingredients
                for name, lua_ingredient in pairs(lua_ingredients) do
                    local ingredient = Product(lua_ingredient)
                    local ingredient_key = ingredient:getTableKey()
                    local index = 1
                    ---cas normal de l'ingredient n'existant pas du cote produit
                    if col_index[ingredient_key] ~= nil then
                        index = col_index[ingredient_key]
                    end
                    col_index[ingredient_key] = index

                    local col_name = ingredient_key .. index
                    local col_header = {
                        index = index,
                        key = ingredient_key,
                        name = lua_ingredient.name,
                        type = lua_ingredient
                            .type,
                        is_ingredient = true,
                        tooltip = col_name .. "\nIngredient",
                        temperature = lua_ingredient.temperature,
                        minimum_temperature = lua_ingredient.minimum_temperature,
                        maximum_temperature = lua_ingredient.maximum_temperature
                    }
                    col_headers[col_name] = col_header
                    row[col_name] = -lua_ingredients[name].count * factor
                    row_valid = true
                    if row["Cn"] ~= 0 and row["Cn"].name == name then
                        row["Cn"].name = col_name
                    end
                end
                ---prepare header products
                for name, lua_product in pairs(lua_products) do
                    local product = Product(lua_product)
                    local product_key = product:getTableKey()
                    local index = 1
                    if col_index[product_key] ~= nil then
                        index = col_index[product_key]
                    end
                    ---cas du produit existant du cote ingredient
                    if col_index[product_key] ~= nil and lua_ingredients[product_key] ~= nil then
                        ---cas de la valeur equivalente, on creer un nouveau element
                        if lua_products[product_key].count == lua_ingredients[product_key].count or recipe.type == "resource" or recipe.type == "energy" then
                            index = col_index[product_key] + 1
                        else
                            index = col_index[product_key]
                        end
                    end
                    col_index[product_key] = index

                    local col_name = product_key .. index
                    local col_header = {
                        index = index,
                        key = product_key,
                        name = lua_product.name,
                        type = lua_product.type,
                        is_ingredient = false,
                        tooltip = col_name .. "\nProduit",
                        temperature = lua_product.temperature,
                        minimum_temperature = lua_product.minimum_temperature,
                        maximum_temperature = lua_product.maximum_temperature
                    }
                    col_headers[col_name] = col_header
                    row[col_name] = (row[col_name] or 0) + lua_product.count * factor
                    row_valid = true
                end
            end
            if row_valid then
                table.insert(rows, row)
            end
        end

        ---end loop recipes

        ---on bluid A correctement
        local mA = {}
        ---bluid header
        local rowH = {}
        local col_cn = 3
        for column, header in pairs(col_headers) do
            table.insert(rowH, header)
        end
        table.insert(mA, rowH)
        ---bluid value
        for _, row in pairs(rows) do
            local colx = 1
            local rowA = {}
            for column, _ in pairs(col_headers) do
                if column == "Cn" then
                    col_cn = colx
                end
                if row[column] ~= nil then
                    table.insert(rowA, row[column])
                else
                    table.insert(rowA, 0)
                end
                if type(row["Cn"]) == "table" and row["Cn"].name == column then
                    if row["Cn"].type == "master" then
                        rowA[col_cn] = colx
                    else
                        rowA[col_cn] = -colx
                    end
                end
                colx = colx + 1
            end
            if type(rowA[col_cn]) == "table" then
                rowA[col_cn] = 0
            end
            table.insert(mA, rowA)
        end

        local row_input = {}
        local row_z = {}
        local input_ready = {}
        local block_elements = block.products
        if block.by_product == false then
            block_elements = block.ingredients
        end
        for column, col_header in pairs(col_headers) do
            if col_header.name == "B" then
                table.insert(row_input, { name = "Input", type = "none" })
                table.insert(row_z, { name = "Z", type = "none" })
            else
                if block_elements ~= nil and block_elements[col_header.key] ~= nil and not (input_ready[col_header.key]) and col_header.index == 1 then
                    table.insert(row_input, block_elements[col_header.key].input or 0)
                    input_ready[col_header.key] = true
                else
                    table.insert(row_input, 0)
                end
                table.insert(row_z, 0)
            end
        end

        for icol, col_header in pairs(mA[1]) do
            col_header.icol = icol
        end

        table.insert(mA, 2, row_input)
        mA = Solver.linkTemperatureFluid(mA, block.by_product)
        table.insert(mA, row_z)
        return mA
    end
end

-------------------------------------------------------------------------------
---Link Temperature Fluid
---@param mA table
---@param by_product boolean
---@return table
function Solver.linkTemperatureFluid(mA, by_product)
    ---Create blank row
    local template_row = {}
    table.insert(template_row, { name = "helmod-temperature-convert", tooltip = "", type = "recipe" }) --B
    table.insert(template_row, 0)                                                                    -- M
    table.insert(template_row, 0)                                                                    -- Cn
    table.insert(template_row, 0)                                                                    -- F
    table.insert(template_row, 1)                                                                    -- S
    table.insert(template_row, 0)                                                                    -- R
    table.insert(template_row, 1)                                                                    -- P
    table.insert(template_row, 1)                                                                    -- E
    table.insert(template_row, 0)                                                                    -- C
    for icol, col_header in pairs(mA[1]) do
        if col_header.key then
            table.insert(template_row, 0)
        end
    end

    local mA2 = {}
    local block_ingredient_fluids = {}
    local block_product_fluids = {}

    for irow, row in pairs(mA) do
        if irow > 2 then
            local ingredient_fluids = {}
            local product_fluids = {}

            for icol, cell in pairs(row) do
                local col_header = mA[1][icol]
                if (col_header.key ~= nil) and (col_header.type == "fluid") then
                    if cell > 0 then
                        block_product_fluids[col_header.name] = block_product_fluids[col_header.name] or {}
                        block_product_fluids[col_header.name][col_header.key] = col_header
                        product_fluids[col_header.key] = col_header
                    elseif cell < 0 then
                        ingredient_fluids[col_header.key] = col_header
                    end
                end
            end

            ---Convert any Z into product
            for product_key, product in pairs(product_fluids) do
                local linked_fluids = block_ingredient_fluids[product.name] or {}
                for ingredient_key, ingredient in pairs(linked_fluids) do
                    if Solver.checkLinkedTemperatureFluid(product, ingredient, by_product) then
                        local new_row = table.clone(template_row)
                        new_row[product.icol] = -1
                        new_row[ingredient.icol] = 1
                        table.insert(mA2, new_row)
                    end
                end
            end

            table.insert(mA2, table.clone(row))

            ---Convert any overflow product back into Z
            for product_key, product in pairs(product_fluids) do
                local linked_fluids = block_ingredient_fluids[product.name] or {}
                for ingredient_key, ingredient in pairs(linked_fluids) do
                    if Solver.checkLinkedTemperatureFluid(product, ingredient, by_product) then
                        local new_row = table.clone(template_row)
                        new_row[product.icol] = 1
                        new_row[ingredient.icol] = -1
                        table.insert(mA2, new_row)
                    end
                end
            end

            ---If an ingredient has already been made in this block
            ---Convert any Z into ingredient
            ---Convert any unmet ingredient back into Z
            for ingredient_key, ingredient in pairs(ingredient_fluids) do
                block_ingredient_fluids[ingredient.name] = block_ingredient_fluids[ingredient.name] or {}
                block_ingredient_fluids[ingredient.name][ingredient.key] = ingredient

                local linked_fluids = block_product_fluids[ingredient.name] or {}
                for product_key, product in pairs(linked_fluids) do
                    if Solver.checkLinkedTemperatureFluid(product, ingredient, by_product) then
                        local new_row = table.clone(template_row)
                        new_row[product.icol] = -1
                        new_row[ingredient.icol] = 1
                        table.insert(mA2, new_row)
                        local new_row = table.clone(template_row)
                        new_row[product.icol] = 1
                        new_row[ingredient.icol] = -1
                        table.insert(mA2, new_row)
                    end
                end
            end
        else
            table.insert(mA2, table.clone(row))
        end
    end

    return mA2
end

-------------------------------------------------------------------------------
---Check Linked Temperature Fluid
---@param item1 table
---@param item2 table
---@param by_product boolean
---@return boolean
function Solver.checkLinkedTemperatureFluid(item1, item2, by_product)
    local result = false

    local product, ingredient
    if by_product ~= false then
        product = item1
        ingredient = item2
    else
        product = item2
        ingredient = item1
    end

    if product.key ~= ingredient.key then
        local T = product.temperature
        local T2 = ingredient.temperature
        local T2min = ingredient.minimum_temperature
        local T2max = ingredient.maximum_temperature
        if T ~= nil or T2 ~= nil or T2min ~= nil or T2max ~= nil then
            ---traitement seulement si une temperature
            if T2min == nil and T2max == nil then
                ---Temperature sans intervale
                if T == nil or T2 == nil or T2 == T then
                    result = true
                end
            else
                ---Temperature avec intervale
                ---securise les valeurs
                T = T or 25
                T2min = T2min or -defines.constant.max_float
                T2max = T2max or defines.constant.max_float
                if T >= T2min and T <= T2max then
                    result = true
                end
            end
        end
    end

    return result
end
