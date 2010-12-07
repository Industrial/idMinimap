local TL, TC, TR = 'TOPLEFT',    'TOP',    'TOPRIGHT'
local ML, MC, MR = 'LEFT',       'CENTER', 'RIGHT'
local BL, BC, BR = 'BOTTOMLEFT', 'BOTTOM', 'BOTTOMRIGHT'

local event_frame = CreateFrame('Frame')

local function zoom(frame, delta)
  if delta > 0 and Minimap:GetZoom() < 5 then
    Minimap:SetZoom(Minimap:GetZoom() + 1)
  elseif delta < 0 and Minimap:GetZoom() > 0 then
    Minimap:SetZoom(Minimap:GetZoom() - 1)
  end
end

local function open_tracking(frame, button, ...)
  if button == 'RightButton' then
    MiniMapTrackingButton:GetScript('OnClick')()
  else
    Minimap_OnClick(Minimap)
  end
end

local function enable()
  Minimap:EnableMouseWheel(true)
  Minimap:SetScript('OnMouseWheel', zoom)
  Minimap:SetScript('OnMouseUp', open_tracking)

  -- hide minimap elements
  GameTimeFrame:Hide() -- calendar
  TimeManagerClockButton:Hide()
  MiniMapTracking:Hide()
  MinimapBorderTop:Hide()
  MiniMapWorldMapButton:Hide()
  MiniMapVoiceChatFrame:Hide()
  MiniMapVoiceChatFrame:SetScript('OnShow', MiniMapVoiceChatFrame.Hide)
  MiniMapWorldMapButton:Hide()
  MinimapZoneTextButton:Hide()
  MinimapZoomIn:Hide()
  MinimapZoomOut:Hide()
end

event_frame:SetScript('OnEvent', function(frame, event, ...)
  if event == 'PLAYER_LOGIN' then
    enable()
  end
end)
event_frame:RegisterEvent('PLAYER_LOGIN')

