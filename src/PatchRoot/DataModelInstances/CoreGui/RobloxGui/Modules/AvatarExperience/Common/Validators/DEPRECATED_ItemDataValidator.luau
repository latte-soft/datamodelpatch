local v0 = require(game:GetService("CorePackages").Packages.t);
return v0.strictInterface({
    receivedCatalogData = v0.optional(v0.boolean), 
    receivedRecommendedData = v0.optional(v0.boolean), 
    receivedFromRecommendedData = v0.optional(v0.boolean), 
    receivedFromBundleItemData = v0.optional(v0.boolean), 
    receivedFromInventoryFetch = v0.optional(v0.boolean), 
    receivedFromOutfitDetails = v0.optional(v0.boolean), 
    receivedFromResaleData = v0.optional(v0.boolean), 
    receivedFromSortResults = v0.optional(v0.boolean), 
    receivedFromVersionData = v0.optional(v0.boolean), 
    receivedBundleDetails = v0.optional(v0.boolean), 
    receivedWidgetHydration = v0.optional(v0.boolean), 
    name = v0.string, 
    id = v0.string, 
    description = v0.optional(v0.string), 
    creatorName = v0.optional(v0.string), 
    assetType = v0.optional(v0.string), 
    bundleType = v0.optional(v0.string), 
    itemType = v0.optional(v0.string), 
    items = v0.optional(v0.array(v0.strictInterface({
        owned = v0.optional(v0.boolean), 
        id = v0.string, 
        name = v0.optional(v0.string), 
        type = v0.string
    }))), 
    priceInRobux = v0.optional(v0.integer), 
    creator = v0.optional(v0.strictInterface({
        id = v0.optional(v0.string), 
        name = v0.optional(v0.string), 
        type = v0.optional(v0.string), 
        targetId = v0.optional(v0.string), 
        hasVerifiedBadge = v0.optional(v0.boolean)
    })), 
    created = v0.optional(v0.string), 
    updated = v0.optional(v0.string), 
    genres = v0.optional(v0.array(v0.string)), 
    minimumMembershipLevel = v0.optional(v0.integer), 
    premiumPricing = v0.optional(v0.strictInterface({
        premiumDiscountPercentage = v0.optional(v0.number), 
        premiumPriceInRobux = v0.optional(v0.integer)
    })), 
    product = v0.optional(v0.strictInterface({
        id = v0.string, 
        type = v0.optional(v0.string), 
        isForSale = v0.optional(v0.boolean)
    })), 
    recommendedItemSummaries = v0.optional(v0.array(v0.strictInterface({
        id = v0.string, 
        type = v0.string, 
        subType = v0.string
    }))), 
    favoriteCount = v0.optional(v0.integer), 
    priceStatus = v0.optional(v0.string), 
    itemRestrictions = v0.optional(v0.map(v0.string, v0.boolean)), 
    tileRestrictionsMap = v0.optional(v0.map(v0.userdata, v0.boolean)), 
    itemStatus = v0.optional(v0.array(v0.string)), 
    lowestPrice = v0.optional(v0.integer), 
    numberRobloxHasAvailable = v0.optional(v0.integer), 
    totalQuantity = v0.optional(v0.integer), 
    resellerUserAssetIds = v0.optional(v0.array(v0.string)), 
    soldCount = v0.optional(v0.integer), 
    averagePrice = v0.optional(v0.integer), 
    originalPrice = v0.optional(v0.integer), 
    isForRent = v0.optional(v0.boolean), 
    isOwned = v0.optional(v0.boolean), 
    isPurchasable = v0.optional(v0.boolean), 
    isPublicDomain = v0.optional(v0.boolean), 
    expectedSellerId = v0.optional(v0.string), 
    collectibleItemId = v0.optional(v0.string), 
    saleLocationType = v0.optional(v0.string), 
    hasResellers = v0.optional(v0.boolean), 
    creatingUniverseId = v0.optional(v0.string)
});
