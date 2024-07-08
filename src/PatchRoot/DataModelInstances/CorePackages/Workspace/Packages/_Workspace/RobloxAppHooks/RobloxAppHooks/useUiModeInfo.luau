local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v3 = require(l_Parent_0.RobloxAppEnums);
local l_DeviceType_0 = v3.DeviceType;
local l_UiMode_0 = v3.UiMode;
local v6 = require(script.Parent.useDeviceType);
local v7 = {
    [l_DeviceType_0.Desktop] = l_UiMode_0.Unknown, 
    [l_DeviceType_0.Tablet] = l_UiMode_0.Unknown, 
    [l_DeviceType_0.Phone] = l_UiMode_0.Unknown, 
    [l_DeviceType_0.Console] = l_UiMode_0.TenFoot, 
    [l_DeviceType_0.VR] = l_UiMode_0.VR
};
return function()
    local v8 = v6();
    local v9 = v7[v8] or l_UiMode_0.Unknown;
    return (v1.useMemo(function()
        return {
            deviceType = v8, 
            uiMode = v9
        };
    end, l_dependencyArray_0(v8, v9)));
end;
