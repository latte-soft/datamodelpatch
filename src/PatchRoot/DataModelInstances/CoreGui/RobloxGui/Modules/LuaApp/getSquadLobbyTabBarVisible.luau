local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v4 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
return function(v5)
    local l_None_0 = Enum.Platform.None;
    pcall(function()
        l_None_0 = l_UserInputService_0:GetPlatform();
    end);
    if not (l_None_0 ~= Enum.Platform.IOS) or l_None_0 == Enum.Platform.Android then
        if v5.FormFactor == l_FormFactor_0.WIDE then
            return v4.Visible;
        else
            return v4.Hidden;
        end;
    else
        return v4.PolicyDependent;
    end;
end;
