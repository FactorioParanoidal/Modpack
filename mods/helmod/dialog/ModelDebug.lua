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
---Build matrix
---@param matrix_panel LuaGuiElement
---@param matrix table
---@param pivot table
function ModelDebug:buildMatrix(matrix_panel, matrix, pivot)
  if matrix ~= nil then
    local num_col = #matrix[1]

    local matrix_table = GuiElement.add(matrix_panel, GuiTable("matrix_data"):column(num_col):style("helmod_table-odd"))
    matrix_table.vertical_centering = false
    
    for irow,row in pairs(matrix) do
      for icol,value in pairs(row) do
        local frame = GuiFlowH("cell", irow, icol):style("helmod_flow_horizontal")
        if pivot ~= nil then
          if matrix[1][icol].name == "T" then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored", GuiElement.color_button_default_ingredient, 2) end
          if pivot.x == icol then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored", GuiElement.color_button_edit, 2) end
          if pivot.y == irow then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored", GuiElement.color_button_none, 2) end
          if pivot.x == icol and pivot.y == irow then frame = GuiFrameH("cell", irow, icol):style("helmod_frame_colored", GuiElement.color_button_rest, 2) end
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
            local tooltip = {"", value.name}
            table.insert(tooltip, {"", "\n", "column: ", value.icol})
            local button = GuiElement.add(cell, GuiButtonSprite("cell_value"):sprite(value.type, value.name):tooltip(tooltip))
            GuiElement.infoTemperature(button, value, "helmod_label_overlay_m")
          end
        else
          GuiElement.add(cell, GuiLabel("cell_value"):caption(Format.formatNumber(value,4)))
        end
      end
    end
  end
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
  GuiElement.add(group1, GuiButton(self.classname, "change-stage", "initial"):sprite("menu", defines.sprites.expand_left_group.black, defines.sprites.expand_left_group.black):style("helmod_button_menu"):tooltip("Initial"))
  GuiElement.add(group1, GuiButton(self.classname, "change-stage", "previous"):sprite("menu", defines.sprites.expand_left.black, defines.sprites.expand_left.black):style("helmod_button_menu"):tooltip("Previous Step"))
  GuiElement.add(group1, GuiButton(self.classname, "change-stage", "next"):sprite("menu", defines.sprites.expand_right.black, defines.sprites.expand_right.black):style("helmod_button_menu"):tooltip("Next Step"))
  GuiElement.add(group1, GuiButton(self.classname, "change-stage", "final"):sprite("menu", defines.sprites.expand_right_group.black, defines.sprites.expand_right_group.black):style("helmod_button_menu"):tooltip("Final"))
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
      local ma_panel = GuiElement.add(scroll_panel, GuiFrameV("stage_panel"):style(helmod_frame_style.hidden):caption(runtime.name))
      self:buildMatrix(ma_panel, runtime.matrix, runtime.pivot)
    end
  end
end

-------------------------------------------------------------------------------
---Update display
function ModelDebug:updateDisplay()
  local content_panel = self:getInfoPanel()
  content_panel.clear()
end
