local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
return require(l_CorePackages_0.Rodux).makeActionCreator(script.Name, function(v2, v3, v4)
    return {
        bundleId = v2, 
        bundleTypeId = v3, 
        recommendedItems = v4
    };
end);
