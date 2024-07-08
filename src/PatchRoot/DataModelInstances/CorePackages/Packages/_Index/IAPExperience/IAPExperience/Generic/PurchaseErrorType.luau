local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.addRawValueMethodToEnum);
local v3 = require(l_Parent_1.enumerate);
local v4 = {
    None = "None", 
    Unknown = "Unknown", 
    AlreadyOwn = "AlreadyOwn", 
    FailedGrant = "FailedGrant", 
    FailedGrantUnknown = "FailedGrantUnknown", 
    Limited = "Limited", 
    NotEnoughRobux = "NotEnoughRobux", 
    NotForSale = "NotForSale", 
    NotForSaleExperience = "NotForSaleExperience", 
    PremiumOnly = "PremiumOnly", 
    ThirdPartyDisabled = "ThirdPartyDisabled", 
    Under13 = "Under13", 
    PremiumPlatformUnavailable = "PremiumPlatformUnavailable", 
    AlreadyPremium = "AlreadyPremium", 
    PurchaseLimit = "PurchaseLimit", 
    ParentalLimit = "ParentalLimit", 
    AlreadySubscribed = "AlreadySubscribed", 
    SubscriptionNotForSale = "SubscriptionNotForSale", 
    SubscriptionExceededUserSpendLimit = "SubscriptionExceededUserSpendLimit", 
    SubscriptionUnsupportedLocale = "SubscriptionUnsupportedLocale", 
    RestrictedUser = "RestrictedUser", 
    SubscriptionPurchasePlatformNotSupported = "SubscriptionPurchasePlatformNotSupported", 
    SubscriptionInvalidSaleLocation = "SubscriptionInvalidSaleLocation", 
    VpcRequired = "VpcRequired", 
    FailedRobuxPurchase = "FailedRobuxPurchase", 
    ExceedParentalSpendLimit = "ExceedParentalSpendLimit"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;
