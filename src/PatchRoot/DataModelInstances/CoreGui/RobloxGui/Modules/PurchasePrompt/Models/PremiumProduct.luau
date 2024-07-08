local l_Parent_0 = script.Parent.Parent;
local l_t_0 = require(game:GetService("CorePackages").PurchasePromptDeps).t;
local _ = require(l_Parent_0.strict);
local v3 = l_t_0.interface({
    productId = l_t_0.number, 
    mobileProductId = l_t_0.string, 
    robuxAmount = l_t_0.number, 
    isSubscriptionOnly = l_t_0.boolean, 
    premiumFeatureTypeName = l_t_0.string, 
    description = l_t_0.string, 
    price = l_t_0.interface({
        amount = l_t_0.number, 
        currency = l_t_0.interface({
            currencySymbol = l_t_0.string
        })
    })
});
return function(v4)
    local v5, _ = v3(v4);
    if v5 then
        return {
            productId = v4.productId, 
            mobileProductId = v4.mobileProductId, 
            robuxAmount = v4.robuxAmount, 
            isSubscriptionOnly = v4.isSubscriptionOnly, 
            premiumFeatureTypeName = v4.premiumFeatureTypeName, 
            description = v4.description, 
            price = v4.price.amount, 
            currencySymbol = v4.price.currency.currencySymbol
        };
    else
        return nil;
    end;
end;
