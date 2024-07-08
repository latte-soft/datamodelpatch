local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Rodux);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarSettings);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
return v1.createReducer({
    ObtainedAvatarRules = false, 
    [v3.AvatarSettings.minDeltaBodyColorDifference] = 0, 
    [v3.AvatarSettings.scalesRules] = {
        height = {
            min = 0.9, 
            max = 1.05, 
            increment = 0.01
        }, 
        width = {
            min = 0.7, 
            max = 1, 
            increment = 0.01
        }, 
        head = {
            min = 0.95, 
            max = 1, 
            increment = 0.01
        }, 
        proportion = {
            min = 0, 
            max = 1, 
            increment = 0.01
        }, 
        bodyType = {
            min = 0, 
            max = 1, 
            increment = 0.01
        }
    }
}, {
    [v2.name] = function(_, v5)
        return {
            ObtainedAvatarRules = true, 
            [v3.AvatarSettings.scalesRules] = v5.scalesRules, 
            [v3.AvatarSettings.minDeltaBodyColorDifference] = v5.minimumDeltaEBodyColorDifference
        };
    end
});
