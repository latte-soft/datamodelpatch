local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
return (v2.createReducer({
    shouldPlayEmoteInBackground = false
}, {
    [require(l_Modules_0.AvatarExperience.Common.Actions.SetPlayEmoteInBackground).name] = function(v4, v5)
        return v3.Dictionary.join(v4, {
            shouldPlayEmoteInBackground = v5.shouldPlayEmoteInBackground
        });
    end
}));
