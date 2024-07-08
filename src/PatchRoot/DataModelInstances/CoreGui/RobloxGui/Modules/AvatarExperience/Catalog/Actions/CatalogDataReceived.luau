local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Rodux).makeActionCreator(script.Name, function(v2, v3, v4)
    v1.isType(v2, "number", "CatalogDataReceived expects categoryIndex");
    v1.isType(v3, "number", "CatalogDataReceived expects subcategoryIndex");
    v1.isType(v4, "table", "CatalogDataReceived expects sortResults");
    return {
        categoryIndex = v2, 
        subcategoryIndex = v3, 
        sortResults = v4
    };
end);
