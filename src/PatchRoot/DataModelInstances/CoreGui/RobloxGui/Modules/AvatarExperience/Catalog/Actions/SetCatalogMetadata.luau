local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3)
    v2.isType(v3, "table", "SetCatalogMetadata expects 'metadata' to be a table.");
    return {
        metadata = v3
    };
end);
