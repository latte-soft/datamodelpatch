local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator("Catalog-" .. script.Name, function(v3, v4)
    v2.isTypeOrNil(v3, "number", "SetCategoryAndSubCategory expects category");
    v2.isTypeOrNil(v4, "number", "SetCategoryAndSubCategory expects subcategory");
    return {
        category = v3, 
        subcategory = v4
    };
end);
