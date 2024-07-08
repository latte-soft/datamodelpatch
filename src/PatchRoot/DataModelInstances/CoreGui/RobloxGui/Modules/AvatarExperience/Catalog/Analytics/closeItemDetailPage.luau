local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7)
    v2.isType(v6, "string", "closeItemDetailPage event expects itemId");
    v2.isType(v7, "string", "closeItemDetailPage event expects itemType");
    v4:setRBXEventStream(v5, "swipeDownItemDetailPage", {
        feature = v3.AnalyticsTag, 
        itemID = v6, 
        itemType = v7
    });
end;
