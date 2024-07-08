local v0 = require(script.Parent.Parent.strict);
return v0({
    ABTests = v0({
        PRODUCT_PURCHASE = "AllUsers.Payments.ProductPurchaseABTest", 
        PRODUCT_PURCHASE_UPSELL = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTest", 
        PRODUCT_PURCHASE_UPSELL_UWP = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestUWP", 
        PRODUCT_PURCHASE_UPSELL_AMAZON = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestAmazon", 
        PRODUCT_PURCHASE_UPSELL_XBOX = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestXbox"
    }, "Constants.ABTests"), 
    PlatformPurchaseResult = v0({
        PurchaseResult_Error = -1, 
        PurchaseResult_Success = 0, 
        PurchaseResult_UserCancelled = 1, 
        PurchaseResult_ConsumeRequestFail = 2, 
        PurchaseResult_RobuxUpdated = 3, 
        PurcahseResult_NoActionNeeded = 4
    }, "Constants.PlatformPurchaseResult"), 
    PurchaseFailureReason = v0({
        TwoStepVerificationRequired = "TwoStepVerificationRequired", 
        EconomyDisabled = "EconomyDisabled"
    }, "Constants.TransactionStatus"), 
    ProductType = v0({
        CollectibleItem = "Collectible Item", 
        DeveloperProduct = "Developer Product"
    }, "Constants.ProductType")
}, "Constants");
