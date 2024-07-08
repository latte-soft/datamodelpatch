local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.getVRFloorOffset);
local l_useExternalEvent_0 = require(l_CorePackages_0.UIBlox).Core.Hooks.useExternalEvent;
return function()
    local v6, v7 = v3.useState(v4());
    l_useExternalEvent_0(l_VRService_0.UserCFrameChanged, function(v8)
        if v8 == Enum.UserCFrame.Floor then
            v7(v4());
        end;
    end);
    return v6;
end;
