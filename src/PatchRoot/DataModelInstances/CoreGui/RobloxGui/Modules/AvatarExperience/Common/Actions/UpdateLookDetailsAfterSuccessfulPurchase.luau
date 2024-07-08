local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRefactorTryOnItems);
return v2.makeActionCreator(script.Name, function(v4, v5, v6)
    return {
        lookId = v4, 
        purchasedAssetIds = v5, 
        purchasedBundleIds = if not v3() then nil else v6
    };
end);
