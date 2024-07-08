local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonStatus);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonErrorOccurred);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return (v2.createReducer({
    enabled = false, 
    errorOccurred = false
}, {
    [v4.name] = function(v7, v8)
        return (v1.Dictionary.join(v7, {
            enabled = v8.status
        }));
    end, 
    [v5.name] = function(v9, v10)
        return (v1.Dictionary.join(v9, {
            errorOccurred = v10.errorOccurred
        }));
    end
}));
