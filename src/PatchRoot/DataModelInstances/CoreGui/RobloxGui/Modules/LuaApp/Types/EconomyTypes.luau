local v0 = require(game:GetService("CorePackages").Packages.t);
return {
    PurchaseDetail = v0.strictInterface({
        expectedCurrency = v0.optional(v0.integer), 
        expectedPrice = v0.optional(v0.integer), 
        expectedSellerId = v0.optional(v0.integer), 
        expectedPromoId = v0.optional(v0.integer), 
        userAssetId = v0.optional(v0.integer), 
        saleLocationType = v0.optional(v0.union(v0.literal("Website"), v0.literal("Game")))
    })
};
