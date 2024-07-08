local l_Parent_0 = script.Parent.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_AssetService_0 = game:GetService("AssetService");
local v4 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_Roact_0 = v4.Roact;
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_IAPExperience_0 = v4.IAPExperience;
local l_RobuxUpsellFlow_0 = l_IAPExperience_0.PurchaseFlow.RobuxUpsellFlow;
local l_RobuxUpsellFlowState_0 = l_IAPExperience_0.PurchaseFlow.RobuxUpsellFlowState;
local l_U13ConfirmType_0 = l_IAPExperience_0.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = l_IAPExperience_0.PurchaseFlow.PurchaseErrorType;
local v12 = require(l_Parent_0.Enums.PromptState);
local v13 = require(l_Parent_0.Enums.PurchaseError);
local v14 = require(l_Parent_0.connectToStore);
local v15 = l_Roact_0.PureComponent:extend(script.Name);
local v16 = require(l_Parent_0.Flags.GetFFlagDisablePurchasePromptFunctionForMaquettes);
local v17 = require(l_Parent_0.Flags.GetFFlagEnableAvatarCreationFeePurchase);
local v18 = require(l_Parent_0.Enums.PaymentPlatform);
local v19 = require(l_Parent_0.Utils.getPaymentPlatform);
local v20 = require(l_Parent_0.Services.ExternalSettings);
v15.init = function(v21)
    v21.state = {
        canAcceptInput = false
    };
    v21.dispatchFetchPurchaseWarning = function()
        return v21.props.dispatchFetchPurchaseWarning(v21.props.robuxProviderId);
    end;
    v21.promptRobuxPurchase = function()
        local l_props_0 = v21.props;
        v21.props.promptRobuxPurchase(v21.props.networking, l_props_0.robuxProviderId, l_props_0.robuxProductId);
    end;
    v21.onDelayedInputComplete = function()
        v21:setState({
            canAcceptInput = true
        });
    end;
    v21.canAcceptInput = function()
        local l_state_0 = v21.state;
        if (not l_Players_0 or not l_Players_0.LocalPlayer) or not l_Players_0.LocalPlayer.GameplayPaused then
            return l_state_0.canAcceptInput;
        else
            return false;
        end;
    end;
    v21.confirmButtonPressed = function()
        local l_props_1 = v21.props;
        local l_promptState_0 = l_props_1.promptState;
        local l_purchaseError_0 = l_props_1.purchaseError;
        if v21.canAcceptInput() then
            if l_promptState_0 == v12.RobuxUpsell then
                l_props_1.dispatchFetchPurchaseWarning();
                return ;
            elseif l_promptState_0 == v12.LargeRobuxUpsell then
                l_props_1.openRobuxStore();
                return ;
            elseif not ((l_promptState_0 ~= v12.U13PaymentModal and l_promptState_0 ~= v12.U13MonthlyThreshold1Modal) and l_promptState_0 ~= v12.U13MonthlyThreshold2Modal) or l_promptState_0 == v12.ParentalConsentWarningPaymentModal13To17 then
                l_props_1.promptRobuxPurchase();
                return ;
            elseif l_promptState_0 == v12.PurchaseComplete then
                l_props_1.endPurchase();
                return ;
            elseif l_promptState_0 == v12.Error then
                if not (l_purchaseError_0 ~= v13.TwoFactorNeeded) or l_purchaseError_0 == v13.TwoFactorNeededSettings then
                    l_props_1.openSecuritySettings();
                    return ;
                else
                    l_props_1.endPurchase();
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v21.cancelButtonPressed = function()
        v21.props.endPurchase();
    end;
end;
v15.didMount = function(v27)
    l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v29, _)
        if v29 == Enum.UserInputState.Begin then
            v27.confirmButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v32, _)
        if v32 == Enum.UserInputState.Begin then
            v27.cancelButtonPressed();
        end;
    end, false, Enum.KeyCode.ButtonB);
end;
v15.willUnmount = function(_)
    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
end;
v15.getFlowState = function(v35)
    local l_props_2 = v35.props;
    local l_promptState_1 = l_props_2.promptState;
    local l_purchaseError_1 = l_props_2.purchaseError;
    if l_promptState_1 == v12.RobuxUpsell then
        return l_RobuxUpsellFlowState_0.PurchaseModal;
    elseif l_promptState_1 == v12.LargeRobuxUpsell then
        return l_RobuxUpsellFlowState_0.LargeRobuxPurchaseModal;
    elseif l_promptState_1 == v12.PurchaseInProgress then
        return l_RobuxUpsellFlowState_0.ItemPurchasePending;
    elseif l_promptState_1 == v12.UpsellInProgress then
        return l_RobuxUpsellFlowState_0.RobuxPurchasePending;
    elseif l_promptState_1 == v12.PollingBalance then
        return l_RobuxUpsellFlowState_0.RobuxGrantPending;
    elseif l_promptState_1 == v12.U13PaymentModal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v12.U13MonthlyThreshold1Modal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v12.U13MonthlyThreshold2Modal then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif l_promptState_1 == v12.PurchaseComplete then
        return l_RobuxUpsellFlowState_0.Success;
    elseif l_promptState_1 == v12.Error then
        if not (l_purchaseError_1 ~= v13.TwoFactorNeeded) or l_purchaseError_1 == v13.TwoFactorNeededSettings then
            return l_RobuxUpsellFlowState_0.TwoStepRequired;
        else
            return l_RobuxUpsellFlowState_0.Error;
        end;
    else
        return l_RobuxUpsellFlowState_0.None;
    end;
end;
v15.getU13ConfirmType = function(v39)
    local l_promptState_2 = v39.props.promptState;
    if l_promptState_2 == v12.U13PaymentModal then
        return l_U13ConfirmType_0.U13PaymentModal;
    elseif l_promptState_2 == v12.U13MonthlyThreshold1Modal then
        return l_U13ConfirmType_0.U13MonthlyThreshold1Modal;
    elseif l_promptState_2 == v12.U13MonthlyThreshold2Modal then
        return l_U13ConfirmType_0.U13MonthlyThreshold2Modal;
    elseif l_promptState_2 == v12.ParentalConsentWarningPaymentModal13To17 then
        return l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17;
    else
        return l_U13ConfirmType_0.None;
    end;
end;
v15.getErrorType = function(v41)
    local l_props_3 = v41.props;
    if l_props_3.purchaseError == v13.AlreadyOwn then
        return l_PurchaseErrorType_0.AlreadyOwn;
    elseif not (l_props_3.purchaseError ~= v13.NotEnoughRobux and l_props_3.purchaseError ~= v13.NotEnoughRobuxXbox) or l_props_3.purchaseError == v13.NotEnoughRobuxNoUpsell then
        return l_PurchaseErrorType_0.NotEnoughRobux;
    elseif l_props_3.purchaseError == v13.Limited then
        return l_PurchaseErrorType_0.Limited;
    elseif l_props_3.purchaseError == v13.NotForSale then
        return l_PurchaseErrorType_0.NotForSale;
    elseif l_props_3.purchaseError == v13.NotForSaleHere then
        return l_PurchaseErrorType_0.NotForSaleExperience;
    elseif l_props_3.purchaseError == v13.PremiumOnly then
        return l_PurchaseErrorType_0.PremiumOnly;
    elseif l_props_3.purchaseError == v13.ThirdPartyDisabled then
        return l_PurchaseErrorType_0.ThirdPartyDisabled;
    elseif l_props_3.purchaseError == v13.Under13 then
        return l_PurchaseErrorType_0.Under13;
    elseif l_props_3.purchaseError == v13.InvalidFunds then
        return l_PurchaseErrorType_0.FailedGrant;
    elseif l_props_3.purchaseError == v13.InvalidFundsUnknown then
        return l_PurchaseErrorType_0.FailedGrantUnknown;
    else
        return l_PurchaseErrorType_0.Unknown;
    end;
end;
v15.render = function(v43)
    local l_props_4 = v43.props;
    return l_Roact_0.createElement(l_RobuxUpsellFlow_0, {
        screenSize = l_props_4.screenSize, 
        shouldAnimate = true, 
        isDelayedInput = true, 
        onDelayedInputComplete = v43.onDelayedInputComplete, 
        model = if not l_props_4.serializedModel then nil else l_AssetService_0:DeserializeInstance(l_props_4.serializedModel), 
        itemIcon = l_props_4.itemIcon, 
        itemName = l_props_4.itemName, 
        itemRobuxCost = l_props_4.itemRobuxCost, 
        iapRobuxAmount = l_props_4.iapRobuxAmount, 
        beforeRobuxBalance = l_props_4.beforeRobuxBalance, 
        purchaseState = v43:getFlowState(), 
        errorType = v43:getErrorType(), 
        u13ConfirmType = v43:getU13ConfirmType(), 
        acceptControllerIcon = if not l_props_4.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
        cancelControllerIcon = if not l_props_4.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
        purchaseRobux = v43.dispatchFetchPurchaseWarning, 
        acceptPurchaseWarning = v43.promptRobuxPurchase, 
        openBuyRobux = l_props_4.openRobuxStore, 
        showTermsOfUse = l_props_4.openTermsOfUse, 
        openSecuritySettings = l_props_4.openSecuritySettings, 
        cancelPurchase = l_props_4.endPurchase, 
        flowComplete = l_props_4.endPurchase, 
        onAnalyticEvent = l_props_4.onAnalyticEvent, 
        eventPrefix = "InGame", 
        isQuest = v16() and v19(v20.new().getPlatform()) == v18.Maquettes
    });
end;
if v17() then
    v15 = v14(function(v45)
        return {
            serializedModel = v45.promptRequest.serializedModel
        };
    end, nil)(v15);
end;
return v15;
