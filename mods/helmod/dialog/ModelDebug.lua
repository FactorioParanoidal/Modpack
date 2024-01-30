-------------------------------------------------------------------------------
---Class to build ModelDebug panel
---@class ModelDebug
ModelDebug = newclass(FormModel)

local display_panel = nil

-------------------------------------------------------------------------------
---Initialization
function ModelDebug:onInit()
  self.panelCaption = "Model Debug"
end

-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function ModelDebug:onStyle(styles, width_main, height_main)
  styles.flow_panel = {
    width = width_main,
    minimal_height = 200,
    maximal_height = height_main
    }
end

-------------------------------------------------------------------------------
---On Bind Dispatcher
function ModelDebug:onBind()
  Dispatcher:bind("on_gui_refresh", self, self.update)
end

-------------------------------------------------------------------------------
---Get or create info panel
---@return LuaGuiElement
function ModelDebug:getInfoPanel()
  local flow_panel, content_panel, menu_panel = self:getPanel()
  if content_panel["info-panel"] ~= nil and content_panel["info-panel"].valid then
    return content_panel["info-panel"]
  end
  local panel = GuiElement.add(content_panel, GuiFrameV("info-panel"):style(helmod_frame_style.panel))
  panel.style.horizontally_stretchable = true
  return  panel
end

-------------------------------------------------------------------------------
---On event
---@param event LuaEvent
function ModelDebug:onEvent(event)
  local _, block = self:getParameterObjects()
  if block ~= nil and block.runtimes ~= nil then
    local runtimes = block.runtimes
    if event.action == "change-stage" then
      local stage = User.getParameter("model_stage") or 1
      if event.item1 == "initial" then stage = 1 end
      if event.item1 == "previous" and stage > 1 then stage = stage - 1 end
      if event.item1 == "next" and stage < #runtimes then stage = stage + 1 end
      if event.item1 == "final" then stage = #runtimes end
      User.setParameter("model_stage", stage)
    end
    self:onUpdate(event)
  end
end

-------------------------------------------------------------------------------
---On before open
---@param event LuaEvent
function ModelDebug:onBeforeOpen(event)
    FormModel.onBeforeOpen(self, event)
    local model, block = self:getParameterObjects()
    ModelCompute.computeBlock(block)
end
-------------------------------------------------------------------------------
---On update
---@param event LuaEvent
function ModelDebug:onUpdate(event)
  self:updateHeader(event)
  self:updateDebugPanel(event)
end

-------------------------------------------------------------------------------
---Update information
---@param event LuaEvent
function ModelDebug:updateHeader(event)
  local action_panel = self:getMenuPanel()
  action_panel.clear()
  local group1 = GuiElement.add(action_panel, GuiFlowH("group1"))
    GuiElement.add(group1,
        GuiButton(self.classname, "change-stage", "initial"):sprite("menu", defines.sprites.expand_left_group.black,
            defines.sprites.expand_left_group.black):style("helmod_button_menu"):tooltip("Initial"))
    GuiElement.add(group1,
        GuiButton(self.classname, "change-stage", "previous"):sprite("menu", defines.sprites.expand_left.black,
            defines.sprites.expand_left.black):style("helmod_button_menu"):tooltip("Previous Step"))
    GuiElement.add(group1,
        GuiButton(self.classname, "change-stage", "next"):sprite("menu", defines.sprites.expand_right.black,
            defines.sprites.expand_right.black):style("helmod_button_menu"):tooltip("Next Step"))
    GuiElement.add(group1,
        GuiButton(self.classname, "change-stage", "final"):sprite("menu", defines.sprites.expand_right_group.black,
            defines.sprites.expand_right_group.black):style("helmod_button_menu"):tooltip("Final"))
end

-------------------------------------------------------------------------------
---Add cell header
---@param guiTable LuaGuiElement
---@param name string
---@param caption string
function ModelDebug:addCellHeader(guiTable, name, caption)
  local cell = GuiElement.add(guiTable, GuiFlowH("header", name))
  GuiElement.add(cell, GuiLabel("label"):caption(caption))
end

-------------------------------------------------------------------------------
---Update debug panel
---@param event LuaEvent
function ModelDebug:updateDebugPanel(event)
  local info_panel = self:getInfoPanel()
  local model, block = self:getParameterObjects()

  if block ~= nil then
    info_panel.clear()
    
    if block.runtimes ~= nil then
      local scroll_panel = GuiElement.add(info_panel, GuiScroll("scroll_stage"))
      scroll_panel.style.horizontally_squashable = true
      scroll_panel.style.horizontally_stretchable = true
      local stage = User.getParameter("model_stage") or 1
      if block.runtimes[stage] == nil then
        stage = 1
        User.setParameter("model_stage", stage)
      end
      local runtime = block.runtimes[stage]
            local ma_panel = GuiElement.add(scroll_panel,
                GuiFrameV("stage_panel"):style(helmod_frame_style.hidden):caption(runtime.name))
            local solver_selected = User.getParameter("solver_selected") or "normal"
            if solver_selected == "normal" then
                self:buildTableSolver(ma_panel, runtime.matrix, runtime.pivot)
            else
                self:buildTableSolverMatrix(ma_panel, runtime.matrix, runtime.pivot)
            end
        end
    end
end

-------------------------------------------------------------------------------
---Build matrix
---@param matrix_panel LuaGuiElement
---@param matrix table
---@param pivot table
function ModelDebug:buildTableSolver(matrix_panel, matrix, pivot)
    if matrix ~= nil then
        local num_col = #matrix[1]

        local matrix_table = GuiElement.add(matrix_panel,
            GuiTable("matrix_data"):column(num_col):style("helmod_table-odd"))
        matrix_table.vertical_centering = false

        for irow, row in pairs(matrix) do
            for icol, value in pairs(row) do
                local frame = GuiFlowH("cell", irow, icol):style("helmod_flow_horizontal")
                if pivot ~= nil then
                    if matrix[1][icol].name == "T" then frame = GuiFrameH("cell", irow, icol):style(
                        "helmod_frame_colored", GuiElement.color_button_default_ingredient, 2) end
                    if pivot.x == icol then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored",
                            GuiElement.color_button_edit, 2) end
                    if pivot.y == irow then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored",
                            GuiElement.color_button_none, 2) end
                    if pivot.x == icol and pivot.y == irow then frame = GuiFrameH("cell", irow, icol):style(
                        "helmod_frame_colored", GuiElement.color_button_rest, 2) end
                end
                local cell = GuiElement.add(matrix_table, frame)
                cell.style.horizontally_stretchable = true
                cell.style.vertically_stretchable = true
                if type(value) == "table" then
                    if value.type == "none" then
                        GuiElement.add(cell, GuiLabel("cell_value"):caption(value.name):tooltip(value.tooltip))
                    elseif value.type == "contraint" then
                        GuiElement.add(cell, GuiLabel("cell_value"):caption(value))
                    else
                        local tooltip = { "", value.name }
                        table.insert(tooltip, { "", "\n", "column: ", value.icol })
                        local button = GuiElement.add(cell,
                            GuiButtonSprite("cell_value"):sprite(value.type, value.name):tooltip(tooltip))
                        GuiElement.infoTemperature(button, value, "helmod_label_overlay_m")
                    end
                else
                    local gui_label = GuiLabel("cell_value"):caption(Format.formatNumber(value, 4))
                    if cell_value ~= 0 then
                        gui_label:style("heading_2_label")
                    end
                    GuiElement.add(cell, gui_label)
                end
            end
        end
    end
end

function ModelDebug:getFrameColored(irow, icol, pivot)
    local frame = GuiFlowH("cell", irow, icol):style("helmod_flow_horizontal")
    if pivot ~= nil then
        if pivot.x == icol then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored",
                GuiElement.color_button_edit, 2) end
        if pivot.y == irow then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored",
                GuiElement.color_button_none, 2) end
        if pivot.x == icol and pivot.y == irow then frame = GuiFrameH("cell", irow, icol):style(
            "helmod_frame_colored", GuiElement.color_button_rest, 2) end
    end
    return frame
end

function ModelDebug:getCellHeader(matrix_table, frame, header)
    local cell = GuiElement.add(matrix_table, frame)
    cell.style.horizontally_stretchable = true
    cell.style.vertically_stretchable = true
    if header.type == "none" then
        GuiElement.add(cell, GuiLabel("cell_value"):caption(header.name):tooltip(header.tooltip))
    elseif header.type == "contraint" then
        GuiElement.add(cell, GuiLabel("cell_value"):caption(header))
    elseif header.product ~= nil then
        local tooltip = { "", header.product.name }
        table.insert(tooltip, { "", "\n", "column: ", header.icol })
        local button = GuiElement.add(cell,
            GuiButtonSprite("cell_value"):sprite(header.product.type, header.product.name):tooltip(tooltip))
        GuiElement.infoTemperature(button, header.product, "helmod_label_overlay_m")
    else
        local tooltip = { "", header.name }
        local button = GuiElement.add(cell,
            GuiButtonSprite("cell_value"):sprite(header.type, header.name):tooltip(tooltip))
        GuiElement.infoTemperature(button, header, "helmod_label_overlay_m")
    end
end

function ModelDebug:getCellValue(matrix_table, frame, cell_value)
    local cell = GuiElement.add(matrix_table, frame)
    cell.style.horizontally_stretchable = true
    cell.style.vertically_stretchable = true
    local gui_label = GuiLabel("cell_value"):caption(Format.formatNumber(cell_value, 4))
    if cell_value ~= 0 then
        gui_label:style("heading_2_label")
    end
    GuiElement.add(cell, gui_label)
end
-------------------------------------------------------------------------------
---Build matrix
---@param matrix_panel LuaGuiElement
---@param matrix table
---@param pivot table
function ModelDebug:buildTableSolverMatrix(matrix_panel, matrix, pivot)
    if matrix ~= nil then
        local parameter_columns = {}
        table.insert(parameter_columns, {type="none", name="Cn", tooltip="Contraint", property="contraint"})
        table.insert(parameter_columns, {type="none", name="FC", tooltip="Factory Count", property="factory_count"})
        table.insert(parameter_columns, {type="none", name="FS", tooltip="Factory Speed", property="factory_speed"})
        table.insert(parameter_columns, {type="none", name="RC", tooltip="Recipe Count", property="recipe_count"})
        table.insert(parameter_columns, {type="none", name="RP", tooltip="Recipe Production", property="recipe_production"})
        table.insert(parameter_columns, {type="none", name="RE", tooltip="Recipe Energy", property="recipe_energy"})
        --table.insert(parameter_columns, {type="none", name="Coefficient", property="coefficient"})
        local num_col = #matrix.columns + #parameter_columns + 1

        local matrix_table = GuiElement.add(matrix_panel, GuiTable("matrix_data"):column(num_col):style("helmod_table-odd"))
        matrix_table.vertical_centering = false

        local frame = self:getFrameColored(0, 0, nil)
        self:getCellHeader(matrix_table, frame, {type="none", name="Base"})

        for icol, parameter_column in pairs(parameter_columns) do
            local frame = self:getFrameColored(0, -icol, nil)
            self:getCellHeader(matrix_table, frame, parameter_column)
        end

        for icol, column in pairs(matrix.columns) do
            local frame = self:getFrameColored(0, icol, nil)
            self:getCellHeader(matrix_table, frame, column)
        end

        for irow, row in pairs(matrix.rows) do
            local header = matrix.headers[irow]
            if header == nil then
                header = {type="none", name="z"}
            end
            local frame = self:getFrameColored(irow, 0, nil)
            self:getCellHeader(matrix_table, frame, header)

            local parameters = matrix.parameters[irow] or {}
            for icol, parameter_column in pairs(parameter_columns) do
                local property_value = parameters[parameter_column.property] or 0
                local frame = self:getFrameColored(irow, -icol, nil)
                if type(property_value) == "number" then
                    self:getCellValue(matrix_table, frame, property_value)
                else
                    self:getCellValue(matrix_table, frame, 0)              
                end
            end

            for icol, column in pairs(matrix.columns) do
                local cell_value = row[icol] or 0
                local frame = self:getFrameColored(irow, icol, pivot)
                self:getCellValue(matrix_table, frame, cell_value)
            end
    end
  end
end

-------------------------------------------------------------------------------
---Update display
function ModelDebug:updateDisplay()
  local content_panel = self:getInfoPanel()
  content_panel.clear()
end
