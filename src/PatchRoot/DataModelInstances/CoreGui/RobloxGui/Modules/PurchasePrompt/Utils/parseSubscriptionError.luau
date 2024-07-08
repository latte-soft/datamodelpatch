local v0 = require(script.Parent.Parent.Enums.PurchaseError);
return function(v1)
    if v1 == "UserHasSpendLimitSet" then
        return v0.SubscriptionExceededUserSpendLimit;
    elseif v1 == "UnsupportedLocale" then
        return v0.SubscriptionUnsupportedLocale;
    elseif v1 == "RestrictedUser" then
        return v0.RestrictedUser;
    elseif v1 == "PurchasePlatformNotSupported" then
        return v0.SubscriptionPurchasePlatformNotSupported;
    elseif v1 == "InvalidSaleLocation" then
        return v0.SubscriptionInvalidSaleLocation;
    elseif v1 == "UserAlreadySubscribed" then
        return v0.AlreadySubscribed;
    elseif v1 == "ProductNotForSale" then
        return v0.SubscriptionNotForSale;
    elseif v1 == "VpcRequired" then
        return v0.VpcRequired;
    elseif v1 == "ExceedParentalSpendLimit" then
        return v0.ExceedParentalSpendLimit;
    else
        return v0.UnknownFailure;
    end;
end;
