local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v2.makeActionCreator(script.Name, function(v4, v5)
    v3.isType(v4, "string", "assetId");
    v3.isType(v5, "table", "userAssetIds");
    return {
        assetId = v4, 
        userAssetIds = v5
    };
end);
