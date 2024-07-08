local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppTempCommon_0 = l_CorePackages_0.AppTempCommon;
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v4 = require(l_ShareGame_0.Constants);
local v5 = require(l_ShareGame_0.Actions.SetDeviceLayout);
local v6 = require(l_AppTempCommon_0.LuaApp.Actions.SetDeviceOrientation);
local v7 = require(l_ShareGame_0.Actions.SetIsSmallTouchScreen);
return function(v8, v9)
    v8 = v8 or {
        DeviceLayout = v4.DeviceLayout.DESKTOP, 
        DeviceOrientation = v4.DeviceOrientation.INVALID, 
        IsSmallTouchScreen = false
    };
    if v9.type == v6.name then
        return (l_Immutable_0.Set(v8, "DeviceOrientation", v9.deviceOrientation));
    elseif v9.type == v5.name then
        return (l_Immutable_0.Set(v8, "DeviceLayout", v9.deviceLayout));
    else
        if v9.type == v7.name then
            v8 = l_Immutable_0.Set(v8, "IsSmallTouchScreen", v9.isSmallTouchScreen);
        end;
        return v8;
    end;
end;
