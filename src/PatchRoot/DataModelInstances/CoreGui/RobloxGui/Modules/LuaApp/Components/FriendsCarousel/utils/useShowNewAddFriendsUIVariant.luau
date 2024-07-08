local l_useUserExperiment_0 = require(game:GetService("CorePackages").Packages.RoactAppExperiment).useUserExperiment;
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Experiment.AppUserLayers);
return function()
    return l_useUserExperiment_0({
        v1.SocialFriendsLayer
    }, function(v2)
        return (v2[v1.SocialFriendsLayer] or {}).social_onboarding_variant == "newUIAddFriendsEntry";
    end);
end;
