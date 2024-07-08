local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v4, v5, v6, v7, v8, v9)
    v2.isType(v5, "string", "purchaseBundle event expects eventContext");
    v2.isType(v6, "string", "purchaseBundle event expects itemId");
    v2.isType(v7, "string", "purchaseBundle event expects itemSubType");
    v2.isTypeOrNil(v8, "number", "purchaseBundle event expects priceInRobux");
    v2.isTypeOrNil(v9, "boolean", "purchaseAsset event expects fromProfile");
    v4:setRBXEventStream(v5, "purchaseBundle", {
        feature = not not v9 and v3.ProfileAnalyticsTag or v3.AnalyticsTag, 
        itemID = v6, 
        itemSubType = v7, 
        priceInRobux = v8
    });
end;
