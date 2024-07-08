local l_Parent_0 = script.Parent.Parent.Parent;
local _ = game:GetService("ContextActionService");
local v2 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_Roact_0 = v2.Roact;
local l_IAPExperience_0 = v2.IAPExperience;
local l_SubscriptionPurchaseFlow_0 = l_IAPExperience_0.PurchaseFlow.SubscriptionPurchaseFlow;
local l_SubscriptionPurchaseFlowState_0 = l_IAPExperience_0.PurchaseFlow.SubscriptionPurchaseFlowState;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local v8 = require(l_Parent_0.Enums.PromptState);
local v9 = require(l_Parent_0.Enums.PurchaseError);
local v10 = l_Roact_0.PureComponent:extend(script.Name);
v10.init = function(v11)
    v11.confirmButtonPressed = function()
        local l_props_0 = v11.props;
        local l_promptState_0 = l_props_0.promptState;
        if l_promptState_0 == v8.PromptSubscriptionPurchase then
            l_props_0.promptSubscriptionPurchase();
            return ;
        elseif l_promptState_0 == v8.PurchaseComplete then
            l_props_0.endPurchase();
            return ;
        elseif l_promptState_0 == v8.Error then
            l_props_0.endPurchase();
            return ;
        else
            return ;
        end;
    end;
    v11.cancelButtonPressed = function()
        v11.props.endPurchase();
    end;
end;
v10.getFlowState = function(v14)
    local l_promptState_1 = v14.props.promptState;
    if l_promptState_1 == v8.PromptSubscriptionPurchase then
        return l_SubscriptionPurchaseFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v8.Error then
        return l_SubscriptionPurchaseFlowState_0.Error;
    else
        return l_SubscriptionPurchaseFlowState_0.None;
    end;
end;
v10.getErrorType = function(v16)
    local l_props_1 = v16.props;
    if l_props_1.purchaseError == v9.AlreadySubscribed then
        return l_PurchaseErrorType_0.AlreadySubscribed;
    elseif l_props_1.purchaseError == v9.SubscriptionExceededUserSpendLimit then
        return l_PurchaseErrorType_0.SubscriptionExceededUserSpendLimit;
    elseif l_props_1.purchaseError == v9.SubscriptionUnsupportedLocale then
        return l_PurchaseErrorType_0.SubscriptionUnsupportedLocale;
    elseif l_props_1.purchaseError == v9.RestrictedUser then
        return l_PurchaseErrorType_0.RestrictedUser;
    elseif l_props_1.purchaseError == v9.SubscriptionPurchasePlatformNotSupported then
        return l_PurchaseErrorType_0.SubscriptionPurchasePlatformNotSupported;
    elseif l_props_1.purchaseError == v9.SubscriptionInvalidSaleLocation then
        return l_PurchaseErrorType_0.SubscriptionInvalidSaleLocation;
    elseif l_props_1.purchaseError == v9.SubscriptionNotForSale then
        return l_PurchaseErrorType_0.SubscriptionNotForSale;
    elseif l_props_1.purchaseError == v9.VpcRequired then
        return l_PurchaseErrorType_0.VpcRequired;
    elseif l_props_1.purchaseError == v9.ExceedParentalSpendLimit then
        return l_PurchaseErrorType_0.ExceedParentalSpendLimit;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v10.render = function(v18)
    local l_props_2 = v18.props;
    return l_Roact_0.createElement(l_SubscriptionPurchaseFlow_0, {
        screenSize = l_props_2.screenSize, 
        purchaseState = v18:getFlowState(), 
        errorType = v18:getErrorType(), 
        subscriptionId = l_props_2.subscriptionId, 
        name = l_props_2.name, 
        subscriptionProviderId = l_props_2.subscriptionProviderId, 
        subscriptionProviderName = l_props_2.subscriptionProviderName, 
        priceTier = l_props_2.priceTier, 
        displayPrice = l_props_2.displayPrice, 
        period = l_props_2.period, 
        disclaimerText = l_props_2.disclaimerText, 
        description = l_props_2.description, 
        itemIcon = l_props_2.itemIcon, 
        primaryPaymentMethod = l_props_2.primaryPaymentMethod, 
        secondaryPaymentMethod = l_props_2.secondaryPaymentMethod, 
        acceptControllerIcon = if not l_props_2.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
        isTestingMode = l_props_2.isTestingMode, 
        purchaseSubscription = l_props_2.promptSubscriptionPurchase, 
        cancelPurchase = l_props_2.endPurchase, 
        flowComplete = l_props_2.endPurchase, 
        onAnalyticEvent = l_props_2.onAnalyticEvent, 
        eventPrefix = "InGame"
    });
end;
return v10;
