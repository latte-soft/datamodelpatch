local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
local v3 = require(l_Modules_0.LuaApp.Reducers.Navigation);
local v4 = require(l_CorePackages_0.Cryo);
return {
    mockAvatarExperienceState = function(v5)
        return (v4.Dictionary.join({
            AvatarExperience = v2(nil, {}), 
            TopBar = {
                topBarHeight = 0, 
                statusBarHeight = 0
            }, 
            TabBarVisible = false, 
            Navigation = v3(nil, {}), 
            GlobalGuiInset = {
                left = 0, 
                top = 0, 
                right = 0, 
                bottom = 0
            }, 
            ScreenSize = Vector2.new(1000, 1000), 
            FetchingStatus = {}
        }, v5 or {}));
    end
};
