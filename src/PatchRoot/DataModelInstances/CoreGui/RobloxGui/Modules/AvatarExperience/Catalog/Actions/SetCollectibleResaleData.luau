local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3, v4)
    v2.isType(v3, "string", "SetCollectibleResaleData expects collectibleItemId");
    v2.isType(v4, "table", "SetCollectibleResaleData expects resaleData");
    return {
        collectibleItemId = v3, 
        resaleData = v4
    };
end);
