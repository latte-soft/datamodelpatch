local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Rodux);
local _ = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Models.CollectibleInstance);
return v2.makeActionCreator(script.Name, function(v4, v5, v6)
    return {
        collectibleItemId = v4, 
        collectibleInstanceId = v5, 
        collectibleInstanceData = v6
    };
end);
