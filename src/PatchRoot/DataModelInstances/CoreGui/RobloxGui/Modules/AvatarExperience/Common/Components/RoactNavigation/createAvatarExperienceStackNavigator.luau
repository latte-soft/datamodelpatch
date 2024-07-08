local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.RoactNavigation);
local l_createNavigator_0 = v2.createNavigator;
local l_RobloxStackView_0 = v2.RobloxStackView;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceStackRouter);
return function(v6, v7)
    return l_createNavigator_0(l_RobloxStackView_0, v5(v6, v7), v7 or {});
end;
