local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    screen = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen).None, 
    params = nil, 
    requestId = 0, 
    completedRequestId = 0
}, {
    [require(l_Modules_0.AvatarExperience.Common.Actions.ApplyNavigateIntoAvatarExperience).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            screen = v4.screen, 
            params = v4.params, 
            requestId = v3.requestId + 1
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Common.Actions.CompleteExternalNavigation).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            completedRequestId = v6.requestId
        });
    end
});
