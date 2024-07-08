local _ = script.Parent.Parent;
return (require(game:GetService("CorePackages").PurchasePromptDeps).Rodux.combineReducers({
    promptRequest = require(script.Parent.PromptRequestReducer), 
    purchaseFlow = require(script.Parent.PurchaseFlowReducer), 
    productInfo = require(script.Parent.ProductInfoReducer), 
    premiumProductInfo = require(script.Parent.PremiumProductsReducer), 
    nativeUpsell = require(script.Parent.NativeUpsellReducer), 
    promptState = require(script.Parent.PromptStateReducer), 
    purchaseError = require(script.Parent.PurchaseErrorReducer), 
    accountInfo = require(script.Parent.AccountInfoReducer), 
    purchasingStartTime = require(script.Parent.PurchasingStartTimeReducer), 
    hasCompletedPurchase = require(script.Parent.HasCompletedPurchaseReducer), 
    gamepadEnabled = require(script.Parent.GamepadEnabledReducer), 
    abVariations = require(script.Parent.ABVariationReducer), 
    windowState = require(script.Parent.WindowStateReducer), 
    buttonState = require(script.Parent.ButtonStateReducer), 
    subscriptionPurchaseInfo = require(script.Parent.SubscriptionPurchaseInfoReducer)
}));
