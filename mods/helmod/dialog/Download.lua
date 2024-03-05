-------------------------------------------------------------------------------
---Class to build Download panel
---@class Download
Download = newclass(FormModel)

local transfert_mode = nil

-------------------------------------------------------------------------------
---Initialization
function Download:onInit()
  self.panelCaption = ({"helmod_download-panel.title"})
end

-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function Download:onStyle(styles, width_main, height_main)
  styles.flow_panel = nil
end

-------------------------------------------------------------------------------
---On event
---@param event LuaEvent
function Download:onEvent(event)
  ---import
  if event.action == "download-model" then
    local download_panel = event.element.parent
    local text_box = download_panel["data-text"]
    local data_table = Converter.read(text_box.text)
    if data_table ~= nil then
      local model = Model.newModel()
      model.time = data_table.time
      ModelBuilder.copyModel(model, data_table)
      ModelCompute.update(model)
      Controller:send("on_gui_refresh", event)
    end
  end
end

-------------------------------------------------------------------------------
---On update
---@param event LuaEvent
function Download:onUpdate(event)
  self:updateDownload(event)
end

-------------------------------------------------------------------------------
---Update about Download
---@param event LuaEvent
function Download:updateDownload(event)
  local model = self:getParameterObjects()
  local data_string = ""
  ---export
  if event.item2 == "upload" then
    local download_panel = self:getFramePanel("upload")
    download_panel.clear()
    data_string = Converter.write(model)
    local text_box = GuiElement.add(download_panel, GuiTextBox("data-text"):text(data_string))
  end
  ---import
  if event.item2 == "download" then
    local download_panel = self:getFramePanel("download")
    download_panel.clear()
    local text_box = GuiElement.add(download_panel, GuiTextBox("data-text"):text(data_string))
    GuiElement.add(download_panel, GuiButton(self.classname, "download-model", "download"):style("helmod_button_default"):caption({"helmod_common.download"}))
  end
end