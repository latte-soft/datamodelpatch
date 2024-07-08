local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v5 = require(l_Parent_0.RobloxAppEnums);
local l_DeviceOrientationMode_0 = v5.DeviceOrientationMode;
local l_DeviceType_0 = v5.DeviceType;
local l_getDeviceType_0 = require(l_Parent_0.AppCommonLib).getDeviceType;
local l_GetFFlagLuaAppUseGetDeviceTypeHelper_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUseGetDeviceTypeHelper;
return function()
    local v11 = l_useSelector_0(function(v10)
        return v10.DeviceOrientation;
    end);
    if not l_GetFFlagLuaAppUseGetDeviceTypeHelper_0() then
        if not l_IsVRAppBuild_0() then
            if not l_GuiService_0:IsTenFootInterface() then
                local l_None_0 = Enum.Platform.None;
                pcall(function()
                    l_None_0 = l_UserInputService_0:GetPlatform();
                end);
                if not (l_None_0 ~= Enum.Platform.Windows and l_None_0 ~= Enum.Platform.OSX) or l_None_0 == Enum.Platform.UWP then
                    return l_DeviceType_0.Desktop;
                else
                    if not (l_None_0 ~= Enum.Platform.IOS) or l_None_0 == Enum.Platform.Android then
                        if v11 == l_DeviceOrientationMode_0.Landscape then
                            return l_DeviceType_0.Tablet;
                        elseif v11 == l_DeviceOrientationMode_0.Portrait then
                            return l_DeviceType_0.Phone;
                        end;
                    end;
                    return l_DeviceType_0.Unknown;
                end;
            else
                return l_DeviceType_0.Console;
            end;
        else
            return l_DeviceType_0.VR;
        end;
    else
        return l_getDeviceType_0(v11);
    end;
end;
