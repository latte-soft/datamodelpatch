local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7)
    v2.isType(v5, "string", "clickNavigationTab event expects eventContext");
    v2.isType(v6, "string", "clickNavigationTab event expects categoryName");
    v2.isType(v7, "string", "clickNavigationTab event expects subCategoryIndex");
    v4:setRBXEventStream(v5, "catalogNavButtonClick", {
        feature = v3.AnalyticsTag, 
        nav = v6, 
        subNav = v7
    });
end;
