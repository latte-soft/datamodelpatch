local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLuaBuyRobuxPage);
local v2 = require(l_Modules_0.LuaApp.Util.getHasQuestUserAgent);
local v3 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppMaquettesDisableProductIdConversion);
local v4 = {
    new = function()
        return {
            productId = 0, 
            mobileProductId = "", 
            robuxAmount = 0, 
            requiresPremium = false, 
            isSubscription = false, 
            description = "", 
            price = 0, 
            currencySymbol = ""
        };
    end
};
v4.mock = function()
    return (v4.new());
end;
v4.fromJsonData = function(v5, v6)
    local v7 = v4.new();
    if v1() then
        v7.productId = v5.productId;
    end;
    v7.mobileProductId = v6 == Enum.Platform.Android and string.lower(v5.mobileProductId) or v5.mobileProductId;
    if not (not v3() or not v2()) then
        v7.mobileProductId = v5.mobileProductId;
    end;
    v7.robuxAmount = v5.robuxAmount;
    v7.requiresPremium = v5.isSubscriptionOnly;
    v7.isSubscription = v5.premiumFeatureTypeName == "Subscription";
    v7.description = v5.description;
    v7.price = v5.price.amount;
    v7.currencySymbol = v5.price.currency.currencySymbol;
    return v7;
end;
return v4;
