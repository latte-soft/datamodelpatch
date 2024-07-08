local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Packages.t);
local v2 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v3 = require(l_Modules_0.LuaApp.Enum.DevSubPlanStatus);
local v4 = v1.union(v1.literal(v3.Open), v1.literal(v3.Closed), v1.literal(v3.Archived));
local v5 = v1.strictInterface({
    id = v1.number, 
    universeId = v1.number, 
    imageAssetId = v1.number, 
    status = v4, 
    name = v1.string, 
    description = v1.string, 
    priceInRobux = v1.number, 
    renewalPeriod = v1.literal("Monthly"), 
    created = v1.string, 
    updated = v1.string
});
local v6 = v1.strictInterface({
    id = v1.number, 
    name = v1.string
});
local v7 = v1.union(v1.literal(v2.Active), v1.literal(v2.Inactive));
local v8 = v1.strictInterface({
    id = v1.string, 
    planId = v1.number, 
    userId = v1.number, 
    status = v7, 
    isAutoRenewing = v1.boolean, 
    startDate = v1.string, 
    expirationDate = v1.string
});
return {
    PlanCheck = v5, 
    PlanStatusCheck = v4, 
    UniverseCheck = v6, 
    SubscriptionCheck = v8, 
    SubscriptionStatusCheck = v7, 
    SubscriptionsResponseCheck = v1.strictInterface({
        data = v1.array(v8), 
        auxiliaryData = v1.strictInterface({
            plans = v1.map(v1.string, v5), 
            universes = v1.map(v1.string, v6)
        }), 
        previousPageCursor = v1.optional(v1.string), 
        nextPageCursor = v1.optional(v1.string)
    }), 
    DevSubJsonCheck = v1.interface({
        id = v1.string, 
        status = v7, 
        isAutoRenewing = v1.boolean, 
        expirationDate = v1.string, 
        planData = v5, 
        gameData = v6
    })
};
