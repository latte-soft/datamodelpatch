local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7, v8)
    v2.isType(v5, "string", "clickSubButton event expects eventContext to be a string");
    v2.isType(v6, "string", "clickSubButton event expects categoryName to be a string");
    v2.isType(v7, "string", "clickSubButton event expects subCategoryName to be a string");
    v2.isType(v8, "string", "clickSubButton event expects subButtonName to be a string");
    v4:sendEventDeferred(v5, "avatarEditorSubButtonClick", {
        feature = v3.AnalyticsTag, 
        nav = v6, 
        subNav = v7, 
        subButton = v8
    });
end;
