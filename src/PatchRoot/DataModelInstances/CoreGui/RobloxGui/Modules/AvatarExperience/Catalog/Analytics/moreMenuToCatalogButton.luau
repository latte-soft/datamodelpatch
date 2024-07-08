local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5)
    v2.isType(v5, "string", "moreMenuToCatalogButton event expects eventContext");
    v4:setRBXEventStream(v5, "moreMenuToCatalogButton", {
        feature = v3.AnalyticsTag
    });
end;
