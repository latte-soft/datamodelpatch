local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCategoryAndSubcategory);
return function(v4, v5, v6)
    return function(v7)
        v2.isTypeOrNil(v4, "number", "SetCategoryAndSubcategory thunk expects category");
        v2.isTypeOrNil(v5, "number", "SetCategoryAndSubcategory thunk expects subcategory");
        v2.isType(v6, "table", "SetCategory thunk expects analytics");
        v7:dispatch(v3(v4, v5));
        v6.clickNavigationTab(v7:getState().AvatarExperience.Catalog.Categories.category, v7:getState().AvatarExperience.Catalog.Categories.subcategory);
    end;
end;
