local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local v1 = {
    new = function()
        return {};
    end
};
v1.mock = function()
    local v2 = v1.new();
    v2.creatorId = 1;
    v2.creatorName = "Roblox";
    v2.creatorType = "User";
    v2.itemRestrictions = {};
    v2.itemStatus = {};
    v2.lowestPrice = 1;
    v2.name = "Wings of Fire - Zara Larsson";
    v2.noPriceStatus = "nopriceStatus";
    v2.numberRemaining = 10;
    v2.premiumPricing = {
        premiumPriceInRobux = 5
    };
    v2.priceInRobux = 115;
    return v2;
end;
v1.fromJsonData = function(v3)
    local v4 = v1.new();
    v4.creatorId = v3.creatorId;
    v4.creatorName = v3.creatorName;
    v4.creatorType = v3.creatorType;
    v4.itemRestrictions = v3.itemRestrictions;
    v4.itemStatus = v3.itemStatus;
    v4.lowestPrice = v3.lowestPrice;
    v4.name = v3.name;
    v4.noPriceStatus = v3.noPriceStatus;
    v4.numberRemaining = v3.numberRemaining;
    v4.premiumPricing = not not v3.premiumPrice and {
        premiumPriceInRobux = v3.premiumPrice
    } or nil;
    v4.priceInRobux = v3.price;
    return v0.success(v4);
end;
return v1;
