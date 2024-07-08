local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_Roact_0 = v2.Roact;
local l_IAPExperience_0 = v2.IAPExperience;
local l_PremiumUpsellFlow_0 = l_IAPExperience_0.PurchaseFlow.PremiumUpsellFlow;
local l_PremiumUpsellFlowState_0 = l_IAPExperience_0.PurchaseFlow.PremiumUpsellFlowState;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local v8 = require(l_Parent_0.Enums.PromptState);
local v9 = require(l_Parent_0.Enums.PurchaseError);
local v10 = l_Roact_0.PureComponent:extend(script.Name);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
v10.init = function(v12)
    v12.confirmButtonPressed = function()
        local l_props_0 = v12.props;
        local l_promptState_0 = l_props_0.promptState;
        if l_promptState_0 == v8.PremiumUpsell then
            l_props_0.promptPremiumPurchase();
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
    v12.cancelButtonPressed = function()
        v12.props.endPurchase();
    end;
end;
v10.didMount = function(v15)
    l_ContextActionService_0:BindCoreAction("PremiumPurchaseConfirmButtonBind", function(_, v17, _)
        if v17 == Enum.UserInputState.Begin then
            v15.confirmButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("PremiumPurchaseCancelButtonBind", function(_, v20, _)
        if v20 == Enum.UserInputState.Begin then
            v15.cancelButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonB);
end;
v10.willUnmount = function(_)
    l_ContextActionService_0:UnbindCoreAction("PremiumPurchaseConfirmButtonBind");
    l_ContextActionService_0:UnbindCoreAction("PremiumPurchaseCancelButtonBind");
end;
v10.getFlowState = function(v23)
    local l_promptState_1 = v23.props.promptState;
    if l_promptState_1 == v8.PremiumUpsell then
        return l_PremiumUpsellFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v8.Error then
        return l_PremiumUpsellFlowState_0.Error;
    else
        return l_PremiumUpsellFlowState_0.None;
    end;
end;
v10.getErrorType = function(v25)
    local l_props_1 = v25.props;
    if l_props_1.purchaseError == v9.AlreadyPremium then
        return l_PurchaseErrorType_0.AlreadyPremium;
    elseif l_props_1.purchaseError == v9.PremiumUnavailablePlatform then
        return l_PurchaseErrorType_0.PremiumPlatformUnavailable;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v10.render = function(v27)
    local l_props_2 = v27.props;
    return l_Roact_0.createElement(l_PremiumUpsellFlow_0, {
        screenSize = l_props_2.screenSize, 
        isCatalog = false, 
        currencySymbol = l_props_2.currencySymbol, 
        robuxPrice = l_props_2.robuxPrice, 
        robuxAmount = l_props_2.robuxAmount, 
        purchaseState = v27:getFlowState(), 
        errorType = v27:getErrorType(), 
        acceptControllerIcon = if not l_props_2.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
        purchasePremium = l_props_2.promptPremiumPurchase, 
        cancelPurchase = l_props_2.endPurchase, 
        flowComplete = l_props_2.endPurchase, 
        onAnalyticEvent = l_props_2.onAnalyticEvent, 
        eventPrefix = "InGame"
    });
end;
return v10;
