local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.RobloxAppEnums);
local l_CentralOverlayType_0 = v1.CentralOverlayType;
local l_AppPage_0 = v1.AppPage;
local l_DeviceType_0 = v1.DeviceType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_getDeviceType_0 = require(l_Parent_0.AppCommonLib).getDeviceType;
local l_GetFFlagLuaAppUseGetDeviceTypeHelper_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUseGetDeviceTypeHelper;
return function(v9)
    return function(v10)
        local v11 = nil;
        if not l_GetFFlagLuaAppUseGetDeviceTypeHelper_0() then
            v11 = v9;
        else
            local v12 = l_getDeviceType_0(v10:getState().DeviceOrientation);
            local v13 = true;
            if v12 ~= l_DeviceType_0.Phone then
                v13 = v12 == l_DeviceType_0.Tablet;
            end;
            v11 = v13;
        end;
        if not v11 then
            v10:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.SponsoredTooltip));
            return ;
        else
            v10:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.SponsoredTooltipPeekView
            }));
            return ;
        end;
    end;
end;
