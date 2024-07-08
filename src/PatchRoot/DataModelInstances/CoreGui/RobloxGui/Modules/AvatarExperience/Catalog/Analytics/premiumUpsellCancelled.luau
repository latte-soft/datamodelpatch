local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
return function(v1, v2, v3)
    v0.isType(v2, "string", "premiumUpsellCancelled event expects assetId");
    v0.isType(v3, "boolean", "premiumUpsellCancelled event expects isBundle");
    v1:setRBXEventStream("PremiumUpsell", not v3 and "AssetPremiumUpsellCanceled" or "BundlePremiumUpsellCanceled", {
        BundleID = v2, 
        Location = "Catalog"
    });
end;
