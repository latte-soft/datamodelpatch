local _ = game:GetService("AppStorageService");
local _ = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_GetFFlagEnableSwapToSourceButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSwapToSourceButton;
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GetLocale);
return function(v8)
    return v7(v8):andThen(function(v9)
        local v10 = v9[1];
        local v11 = nil;
        local v12 = nil;
        local v13 = nil;
        local v14 = nil;
        if v10 then
            v11 = v10.signupAndLogin.locale;
            v12 = v10.generalExperience.locale;
            v13 = v10.ugc.locale;
            v14 = nil;
            if l_GetFFlagEnableSwapToSourceButton_0() then
                v14 = v10.generalExperience.nativeName;
            end;
        end;
        return {
            signupAndLoginLocale = v11, 
            generalExperienceLocale = v12, 
            ugcLocale = v13, 
            generalExperienceLocaleNativeName = v14
        };
    end);
end;
