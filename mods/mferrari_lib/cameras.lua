--[[ 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

			C A M E R A S

v 1.10  07/08/2023	 update cam position (projectiles)  2022 (cam size opt, screen cameras, fix active cam limits, removed position tracking)
v 1.2 07/2024 - accepts rendering object
v 2.0 10/24 - factorio2, chart, fixed a crash on closing cameras, added to lib
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  
  
** Usage: 
Add this file to mod root, and this to your control.lua events:
require "cameras"

**Globals** -each mod calling may set this:
mf_mod_name = eg. "Big-Monsters"
mf_camera_chart = true     - if camera should chart to location (factorio2 does not reveal by default)
mf_Camera_Default_Text=
mf_Camera_Default_Icon=

cam_on_init() ==>  on_init / on_changed
cam_on_tick(event) ==>  on_tick 
cam_on_gui_click(event) ==>  on_gui_click - on the last line of the event


** Create cameras with:
CreateCameraForConnectedPlayers(Object,Surface,Text,size,seconds,Zoom)
CreateCameraForForce(Force,Object,Surface,Text,size,seconds,Zoom)
CreateCameraForPlayer(player,Object,Surface,Text,size,AutoCloseTick,Zoom)


Parameters:
Object = may be an entity or a fixed position. If entity is a unit, camera will follow its position
Surface = optional. If object is entity, gets its surface. If Surface is nil and Object is not entity, gets nauvis
Text = nil or {text='Camera', color={r=1,g=1,b=1}}
size = nil or camera size
AutoCloseTick = nil or number - when it will be closed in game.tick
Zoom = nil or Camera Zoon value 

-- you may add these to load game settings (optional)
storage.disabled_player_camera[player.name]  (bool) -- per player
storage.enable_drag_camera[player.name] (bool) -- per player
storage.camera_size[player.name] (int) -- per player

storage.camera_count_limit (integer) - global
]]


--default values. May be changed by your mod
--mod_name="player_body_abduction"  - replaced by mf_mod_name in each mod requiring
Camera_Default_Zoon   = 0.65
Camera_Default_Size   = 230
Camera_Default_Text   = mf_Camera_Default_Text or ""
Camera_Default_Icon   = mf_Camera_Default_Icon or ""
Camera_Default_Time   = nil           -- Number - how many ticks it stays on screen. nil => undefined, 60 => 1 second
Camera_Count_Limit    = 5



require("__mferrari_lib__/mf_lib")


local function get_cam_gui(player)
local gui
if storage.enable_drag_camera and storage.enable_drag_camera[player.name] then
   gui = player.gui.screen 
   else
   gui = player.gui.left
   if not gui.mf_flow_cameras then gui.add({type="flow", name="mf_flow_cameras", direction="horizontal"})  end
   gui =player.gui.left.mf_flow_cameras 
   end
return gui
end





--## CAMERAS
-- Object may be an entity or a fixed position, if entity, camera will follow it
function CreateCameraForPlayer(player,Object,Surface,Text,size,AutoCloseTick,Zoom)
cam_player_list_validate_cams(player)
local cams = storage.active_player_cameras[player.name]
local limit = storage.camera_count_limit or Camera_Count_Limit
if #cams<Camera_Count_Limit then 
	if Zoom==nil then Zoom=Camera_Default_Zoon end
	if size==nil 
		then
		size=Camera_Default_Size 
		if storage.camera_size and storage.camera_size[player.name] then size=storage.camera_size[player.name] end
		end
	local tick=game.tick
	local gui = get_cam_gui(player)
	   gui.style.horizontally_stretchable = false

	while gui["mf_framecam"..tick] do tick=tick+1 end
	local frname="mf_framecam"..tick
	local frame = gui.add({ type="frame", name=frname, direction="vertical", tags={num=tick}}) 
	local title_table = frame.add{type="table", name="title_table", column_count=5, draw_horizontal_lines=false}
			title_table.style.horizontally_stretchable = true
			title_table.style.column_alignments[1] = "left"
			title_table.style.column_alignments[2] = "left"
			title_table.style.column_alignments[3] = "right"
			title_table.style.column_alignments[4] = "right"
			title_table.style.column_alignments[5] = "right"


	local position

	if (not AutoCloseTick) and Camera_Default_Time then AutoCloseTick=Camera_Default_Time end

	if Object and Object.valid and Object.position then --if its an entity
		Surface=Object.surface
		position=Object.position 
		local tabdata = {player=player, camframe=frame,tick=tick, entity=Object,autoclosetick=AutoCloseTick}
		table.insert(storage.mf_frame_cameras,tabdata)
		elseif Object.render then
			if rendering.is_valid(Object.render) then 
				position=rendering.get_target(Object.render).position
				Surface=rendering.get_surface(Object.render)
				local tabdata = {player=player, camframe=frame,tick=tick, entity=nil,render=Object.render, autoclosetick=AutoCloseTick}
				frame.tags.render=Object.render
				table.insert(storage.mf_frame_cameras,tabdata)
				end
			
		else -- if object is a position
		if Surface==nil then Surface=game.surfaces[1] end
		local tabdata = {player=player, camframe=frame,tick=tick, entity=nil,autoclosetick=AutoCloseTick}
		table.insert(storage.mf_frame_cameras,tabdata)
		position=Object 
		end 

	local Capt = Camera_Default_Text
	if Text then Capt = Text end

			
	local title_frame = title_table.add{type="frame", name="title_frame", caption=Camera_Default_Icon, style="ic_title_frame"} --
		
		title_frame.ignored_by_interaction = true	
		
--	local tab   = frame.add{type = "table", column_count = 4} 
	local title = title_table.add{type = "label", caption = Capt}
	
	title.style.font = "default-bold"
	title.style.maximal_width = math.max (size - 120,50)


	if gui==player.gui.screen then
		frame.auto_center = true 
		title.drag_target = frame
		title_table.drag_target = frame
		end
	
	local zoomin = title_table.add{name="mf_bt_camerazoomin"..tick, type="sprite-button", sprite = "utility/speed_up", style = "shortcut_bar_button_small"}
	local zoomout= title_table.add{name="mf_bt_camerazoomout"..tick,type="sprite-button", sprite = "utility/editor_speed_down", style = "shortcut_bar_button_small"}
	local closeb = title_table.add{name="mf_bt_cameraclose"..tick,  type="sprite-button", sprite = "utility/close_black", style = "shortcut_bar_button_small"}


	--if Text and Text.color then title.style.font_color = Text.color  end

	local surface_index = Surface.index
		
	local cam = frame.add({ type="camera", name="mf_camera"..tick, position = position, surface_index=surface_index, zoom = Zoom })
		  cam.style.width = size
		  cam.style.height = size
	  if Object and Object.valid and Object.position then cam.entity=Object end --if its an entity
		--frame.force_auto_center()
	table.insert (storage.active_player_cameras[player.name],frname)
end
end


function CreateCameraForConnectedPlayers(Object,Surface,Text,size,seconds,Zoom)
local AutoCloseTick
if seconds then AutoCloseTick = game.tick + seconds*60 end
	for p, pl in pairs(game.connected_players) do
		CreateCameraForPlayer(pl,Object,Surface,Text,size,AutoCloseTick,Zoom) 
		end
end

function CreateCameraForForce(Force,Object,Surface,Text,size,seconds,Zoom)
local AutoCloseTick
if seconds then AutoCloseTick = game.tick + seconds*60 end
	for p, pl in pairs(Force.connected_players) do
		if not storage.disabled_player_camera[pl.name] then CreateCameraForPlayer(pl,Object,Surface,Text,size,AutoCloseTick,Zoom) end
		end
end


function CloseAllCameras()
if #storage.mf_frame_cameras>0 then
	for K,tabdata in pairs (storage.mf_frame_cameras) do
		local frame = tabdata.camframe
		if frame and frame.valid then frame.destroy() end
		end
	storage.mf_frame_cameras = {}
	end
	
	
storage.active_player_cameras = {}	
end


function CloseAllCamerasForPlayer(player)
if #storage.mf_frame_cameras>0 then
	for K,tabdata in pairs (storage.mf_frame_cameras) do
		local frame = tabdata.camframe
		if frame and frame.valid and player==frame.gui.player then
			if frame and frame.valid then frame.destroy() end end
		end
	end
if storage.active_player_cameras[player.name] then storage.active_player_cameras[player.name] = {} end
end


local function get_gps_cam_tag(position,surface)
local r = '[gps='..math.floor(position.x)..','..math.floor(position.y)
if surface then r=r..','..surface.name end
r=r..']'
return r
end


-- Gui click
function CameraClose(player,gui)
local frame = gui.parent.parent
local name = frame.name
del_list(storage.active_player_cameras[player.name], name)
table.remove(storage.active_player_cameras[player.name],c)
frame.destroy()
end

function CameraZoomIn(player,gui,num)
local frame = gui.parent.parent
local cam = frame["mf_camera"..num]
local z = cam.zoom
if z>0.1 then cam.zoom = z - 0.05 end
end

function CameraZoomOut(player,gui,num)
local frame = gui.parent.parent
local cam = frame["mf_camera"..num]
local z = cam.zoom
if z<1 then cam.zoom = z + 0.1 end
end

function ClickCamera(player,gui,num)
local frame = gui.parent
local cam = frame["mf_camera"..num]
local surface = game.surfaces[cam.surface_index]
local position = cam.position
if cam.entity and cam.entity.valid then position = cam.entity.position end
player.print(get_gps_cam_tag(position,surface))
end

-- ************  EVENTS ********************************


function cam_on_gui_click(event)
if event and event.element and event.element.valid and event.player_index and game.players[event.player_index] then 
if event.element.get_mod()==mf_mod_name then
local player = game.players[event.player_index]
	local gui = event.element
	local name= gui.name
	if string.sub(name,1,17)=="mf_bt_cameraclose" then CameraClose(player,gui)
	elseif string.sub(name,1,18)=="mf_bt_camerazoomin" then CameraZoomIn(player,gui,string.sub(name,19,string.len(name)))
	elseif string.sub(name,1,19)=="mf_bt_camerazoomout" then CameraZoomOut(player,gui,string.sub(name,20,string.len(name)))
	elseif string.sub(name,1,9)=="mf_camera" then ClickCamera(player,gui,string.sub(name,10,string.len(name))) 
	end
end	
end
end


--#Camera Updates
function cam_on_tick(event)
if #storage.mf_frame_cameras>0 then
	for K=#storage.mf_frame_cameras,1,-1 do
		local frame = storage.mf_frame_cameras[K].camframe
		--local tick  = storage.mf_frame_cameras[K].tick
		--local entity = storage.mf_frame_cameras[K].entity
		local render = storage.mf_frame_cameras[K].render
		local player = storage.mf_frame_cameras[K].player
		local autoclosetick  = storage.mf_frame_cameras[K].autoclosetick
		if frame and frame.valid then
			if (autoclosetick and autoclosetick<game.tick) or (frame.tags and (not game.surfaces[frame["mf_camera".. frame.tags.num].surface_index]) ) then 
				table.remove(storage.mf_frame_cameras,K)
				frame.destroy()
				elseif frame.tags then
				local cam = frame["mf_camera".. frame.tags.num]
				if cam.entity and cam.entity.valid then cam.position = cam.entity.position end
				
				if render and render.valid then -- just a render object
					local position=rendering.target(render).position
					cam.position=position
					end
				
				if mf_camera_chart and game.tick%60==0 then
					if cam.position then player.force.chart(game.surfaces[cam.surface_index], GetAreaAroundPos(cam.position,20)) end
					end
				end
			end
		end
	end
end


function cam_on_init()
storage.mf_frame_cameras = storage.mf_frame_cameras or {}
storage.active_player_cameras = storage.active_player_cameras or {}
storage.disabled_player_camera = storage.disabled_player_camera or {}
storage.enable_drag_camera = storage.enable_drag_camera or {}
storage.camera_size = storage.camera_size or {}
end


local function cam_exists(player,cam_name)
if (player.gui.left.mf_flow_cameras and player.gui.left.mf_flow_cameras[cam_name]) or (player.gui.screen[cam_name]) then return true
else return false end
end


function cam_player_list_validate_cams(player)
if player and player.valid then
	storage.active_player_cameras[player.name] = storage.active_player_cameras[player.name] or {}
	for c=#storage.active_player_cameras[player.name],1,-1 do
		if not cam_exists(player,storage.active_player_cameras[player.name][c]) then
			table.remove(storage.active_player_cameras[player.name],c)
			end
		end
	end
end