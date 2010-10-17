local _G = _G

local TL, TC, TR = 'TOPLEFT',    'TOP',    'TOPRIGHT'
local ML, MC, MR = 'LEFT',       'CENTER', 'RIGHT'
local BL, BC, BR = 'BOTTOMLEFT', 'BOTTOM', 'BOTTOMRIGHT'

local frame

local function zoomMinimap(frame, delta)
  if delta > 0 and Minimap:GetZoom() < 5 then
    Minimap:SetZoom(Minimap:GetZoom() + 1)
  elseif delta < 0 and Minimap:GetZoom() > 0 then
    Minimap:SetZoom(Minimap:GetZoom() - 1)
  end
end

frame = CreateFrame('Frame', 'idMinimapFrame', Minimap)
frame:SetAllPoints(Minimap)
frame:EnableMouseWheel(true)
frame:SetScript('OnMouseWheel', zoomMinimap)
frame:Show()

GameTimeFrame:Hide()
MinimapBorderTop:Hide()
MiniMapWorldMapButton:Hide()
MiniMapVoiceChatFrame:Hide()
MiniMapVoiceChatFrame:SetScript('OnShow', MiniMapVoiceChatFrame.Hide)
MiniMapWorldMapButton:Hide()
MinimapZoneTextButton:Hide()
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()

