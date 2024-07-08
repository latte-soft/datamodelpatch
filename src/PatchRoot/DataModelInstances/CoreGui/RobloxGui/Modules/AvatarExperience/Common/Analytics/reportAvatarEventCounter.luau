local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v3 = require(script.Parent.getAvatarEventCounterNameWithPlatform);
return function(v4, v5)
    if not v2() then
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
            v5 = "Android" .. v5;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            v5 = "IOS" .. v5;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            v5 = "Windows" .. v5;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            v5 = "OSX" .. v5;
        elseif not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4) or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
            v5 = "PlayStation" .. v5;
        end;
    else
        v5 = v3(v5);
    end;
    v4.Diag:reportCounter(v5, 1);
end;
