local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator("Catalog-" .. script.Name, function(v3)
    v2.isType(v3, "boolean", "isUIFullView");
    return {
        isUIFullView = v3
    };
end);
