local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.ApiFetchIAPProducts);
return function(v1, _)
    local l_Subscriptions_0 = v1.IAPProducts.Subscriptions;
    return {
        screenSize = v1.ScreenSize, 
        subscriptionProduct = not not l_Subscriptions_0 and l_Subscriptions_0[1] or nil, 
        iapProductsFetchingStatus = v0.GetFetchingStatus(v1)
    };
end;
