local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAvatarSceneRoute);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v3.createReducer(v5.new({}), {
    [v4.name] = function(_, v8)
        return v8.avatarRoute;
    end
});
