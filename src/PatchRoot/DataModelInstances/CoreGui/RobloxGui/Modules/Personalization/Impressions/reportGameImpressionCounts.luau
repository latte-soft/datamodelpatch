local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = "Other";
pcall(function()
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        v5 = "Android";
        return ;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        v5 = "iOS";
        return ;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        v5 = "Win";
        return ;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
        v5 = "UWP";
        return ;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        v5 = "Mac";
        return ;
    elseif not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
        v5 = "XBox";
        return ;
    else
        if not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4) or game:GetEngineFeature("PlatformEnumPS5") and l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
            v5 = "PS";
        end;
        return ;
    end;
end);
return function(v7, v8, v9, v10)
    if v7 and v7.Diag then
        if v8 then
            local v11 = "Other";
            if not (v8 ~= v4.Home) or v8 == v4.Games then
                if v10 == 1 then
                    v11 = "GamesList";
                elseif v8 == v4.Home then
                    v11 = "Home";
                else
                    assert(v8 == v4.Games);
                    v11 = "Games";
                end;
            elseif v8 == "recommended" then
                v11 = "GameDetail";
            elseif v8 == v4.SearchPage then
                v11 = "SearchPage";
            end;
            local l_v5_0 = v5;
            if l_IsVRAppBuild_0() then
                l_v5_0 = "VR";
            end;
            v7.Diag:reportCounterSimple(l_v5_0 .. "-GameImps-" .. v11, v9);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
