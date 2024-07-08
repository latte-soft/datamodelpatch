local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AppCommonLib").Parent;
local v3 = require(script.Parent.IsVRAppBuild);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_DeviceOrientationMode_0 = v4.DeviceOrientationMode;
local l_DeviceType_0 = v4.DeviceType;
return function(v7)
    if not v3() then
        if not l_GuiService_0:IsTenFootInterface() then
            local l_None_0 = Enum.Platform.None;
            pcall(function()
                l_None_0 = l_UserInputService_0:GetPlatform();
            end);
            if not (l_None_0 ~= Enum.Platform.Windows and l_None_0 ~= Enum.Platform.OSX) or l_None_0 == Enum.Platform.UWP then
                return l_DeviceType_0.Desktop;
            else
                if not (l_None_0 ~= Enum.Platform.IOS) or l_None_0 == Enum.Platform.Android then
                    if v7 == l_DeviceOrientationMode_0.Landscape then
                        return l_DeviceType_0.Tablet;
                    elseif v7 == l_DeviceOrientationMode_0.Portrait then
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
end;
