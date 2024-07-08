local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3, v4)
    v2.isType(v3, "string", "userAssetId");
    v2.isTypeOrNil(v4, "number", "priceInRobux");
    return {
        userAssetId = v3, 
        priceInRobux = v4
    };
end);
