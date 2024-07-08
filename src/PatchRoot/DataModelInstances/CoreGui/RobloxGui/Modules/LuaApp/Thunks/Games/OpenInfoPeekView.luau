local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_Modules_0.LuaApp.Enum.OverlayType);
local _ = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local l_getDeviceType_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).getDeviceType;
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
return function(v8, v9)
    return function(v10)
        local v11 = l_getDeviceType_0(v10:getState().DeviceOrientation);
        if v11 ~= l_DeviceType_0.Phone and v11 ~= l_DeviceType_0.Tablet then
            return ;
        else
            v10:dispatch(v4({
                name = v5.InfoPeekView, 
                extraProps = {
                    title = v8, 
                    body = v9
                }
            }));
            return ;
        end;
    end;
end;
