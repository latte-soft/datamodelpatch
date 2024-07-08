local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_DeviceOrientationMode_0 = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v2 = require(l_Modules_0.LuaApp.Actions.SetDeviceOrientation);
return function(v3, v4)
    v3 = v3 or l_DeviceOrientationMode_0.Portrait;
    assert(v3, "");
    if v4.type == v2.name then
        return v4.deviceOrientation;
    else
        return v3;
    end;
end;
