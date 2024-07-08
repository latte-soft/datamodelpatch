local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Promise);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v7 = require(l_CorePackages_0.IAPExperience);
local l_BuyRobuxFlow_0 = v7.PurchaseFlow.BuyRobuxFlow;
local l_BuyRobuxFlowState_0 = v7.PurchaseFlow.BuyRobuxFlowState;
local l_U13ConfirmType_0 = v7.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = v7.PurchaseFlow.PurchaseErrorType;
local v12 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v13 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local _ = require(script.Parent.RobuxPackage);
local v15 = require(script.Parent.Enum.BuyRobuxCounter);
local v16 = v3.PureComponent:extend(script.Name);
local v17 = l_GuiService_0:IsTenFootInterface();
v16.init = function(v18)
    v18.selectedRobuxPackage = nil;
    v18.resetState = v18.props.resetState or {
        purchaseWarningType = l_U13ConfirmType_0.None, 
        purchaseWarningFetchingStatus = v13.NotStarted, 
        purchaseWarningPostStatus = v13.NotStarted
    };
    v18.state = {
        purchaseWarningType = v18.resetState.purchaseWarningType, 
        purchaseWarningFetchingStatus = v18.resetState.purchaseWarningFetchingStatus, 
        purchaseWarningPostStatus = v18.resetState.purchaseWarningPostStatus
    };
    v18.failFlow = function(v19, v20)
        if v20 ~= nil then
            v18.sendCounter(v20);
        else
            v18.sendCounter(v15.PurchaseFailed);
        end;
        local v21 = {};
        if v19 ~= nil then
            v21 = v19;
        end;
    end;
    v18.purchaseRobux = function(v22)
        v18:setState(v18.resetState);
        v18.props.endPurchase();
        v18.selectedRobuxPackage = v22;
        v18:setState({
            purchaseWarningFetchingStatus = v13.Fetching
        });
        v18:dispatchFetchPurchaseWarning():andThen(function(v23)
            v18:setState({
                purchaseWarningFetchingStatus = v13.Done
            });
            if not v23 then
                v18:promptRobuxPurchase();
            end;
        end):catch(function()
            v18.failFlow({
                purchaseWarningFetchingStatus = v13.Failed
            }, nil);
        end);
    end;
    v18.acceptPurchaseWarning = function()
        v18:setState({
            purchaseWarningPostStatus = v13.Done
        });
        v18:dispatchPostAckPurchaseWarning();
        v18:promptRobuxPurchase();
    end;
    v18.cancelPurchase = function()
        v18.sendCounter(v15.PurchaseCanceled);
        v18.endPurchase();
    end;
    v18.endPurchase = function()
        v18.selectedRobuxPackage = nil;
        v18:setState(v18.resetState);
        v18.props.endPurchase();
    end;
    v18.sendAnalyticEvent = function(v24, v25)
        v18.props.sendAnalyticEvent(v18.props.eventPrefix .. "BuyRobux", v24, v25);
    end;
    v18.sendCounter = function(v26)
        v18.props.sendCounter(v15.toRawValue(v26));
    end;
    v18.getProductId = function(v27)
        for _, v29 in v18.props.robuxPackages, nil, nil do
            if v27 == v29.packageId then
                return v29.productId;
            end;
        end;
        return nil;
    end;
end;
v16.dispatchFetchPurchaseWarning = function(v30)
    local l_props_0 = v30.props;
    local _ = v30.state;
    return l_props_0.dispatchFetchIAPPurchaseWarning(v30.selectedRobuxPackage, v30.getProductId(v30.selectedRobuxPackage)):andThen(function(v33)
        local v34 = true;
        if v33 == v5.ResponseType.U13PaymentModal then
            v30.sendCounter(v15.ShowU13PaymentModal);
            v30:setState({
                purchaseWarningType = l_U13ConfirmType_0.U13PaymentModal
            });
        elseif v33 == v5.ResponseType.U13MonthlyThreshold1Modal then
            v30.sendCounter(v15.ShowU13MonthlyThreshold1Modal);
            v30:setState({
                purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold1Modal
            });
        elseif v33 == v5.ResponseType.U13MonthlyThreshold2Modal then
            v30.sendCounter(v15.ShownU13MonthlyThreshold2Modal);
            v30:setState({
                purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold2Modal
            });
        elseif v33 == v5.ResponseType.ParentalConsentWarningPaymentModal13To17 then
            v30.sendCounter(v15.ShownParentalConsentWarningPaymentModal13To17);
            v30:setState({
                purchaseWarningType = l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17
            });
        else
            v34 = false;
        end;
        return v4.resolve(v34);
    end);
end;
v16.dispatchPostAckPurchaseWarning = function(v35)
    local l_props_1 = v35.props;
    local l_state_1 = v35.state;
    local l_None_0 = v6.UserActionType.None;
    if l_state_1.purchaseWarningType == l_U13ConfirmType_0.U13PaymentModal then
        v35.sendCounter(v15.ConfirmU13PaymentModal);
        l_None_0 = v6.UserActionType.ConfirmedU13PaymentModal;
    elseif l_state_1.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold1Modal then
        v35.sendCounter(v15.ConfirmU13MonthlyThreshold1Modal);
        l_None_0 = v6.UserActionType.ConfirmedU13MonthlyThreshold1Modal;
    elseif l_state_1.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold2Modal then
        v35.sendCounter(v15.ConfirmU13MonthlyThreshold2Modal);
        l_None_0 = v6.UserActionType.ConfirmedU13MonthlyThreshold2Modal;
    elseif l_state_1.purchaseWarningType == l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17 then
        v35.sendCounter(v15.ConfirmParentalConsentWarningPaymentModal13To17);
        l_None_0 = v6.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17;
    end;
    return l_props_1.dispatchPostAckPurchaseWarning(l_None_0);
end;
v16.promptRobuxPurchase = function(v39)
    local l_props_2 = v39.props;
    local _ = v39.state;
    l_props_2.promptRobux(v39.props.networking, v39.selectedRobuxPackage, v39.getProductId(v39.selectedRobuxPackage));
end;
v16.getFlowState = function(v42)
    local l_state_3 = v42.state;
    local l_props_3 = v42.props;
    if l_props_3.iapProductsFetchingStatus ~= v13.Done then
        return l_BuyRobuxFlowState_0.Loading;
    elseif l_props_3.nativeProductsFetchingStatus ~= v13.Done then
        return l_BuyRobuxFlowState_0.Loading;
    elseif l_state_3.purchaseWarningFetchingStatus == v13.NotStarted then
        return l_BuyRobuxFlowState_0.BuyRobux;
    elseif l_state_3.purchaseWarningFetchingStatus ~= v13.Done then
        return l_BuyRobuxFlowState_0.Loading;
    elseif l_state_3.purchaseWarningType ~= l_U13ConfirmType_0.None and l_state_3.purchaseWarningPostStatus == v13.NotStarted then
        return l_BuyRobuxFlowState_0.PurchaseWarning;
    elseif not (l_props_3.iapPurchase.nativeProductId ~= nil) or l_props_3.iapPurchase.purchaseStatus == v12.Pending then
        return l_BuyRobuxFlowState_0.RobuxPurchasePending;
    elseif l_props_3.iapPurchase.purchaseStatus == v12.Polling then
        return l_BuyRobuxFlowState_0.RobuxGrantPending;
    elseif l_props_3.iapPurchase.purchaseStatus == v12.Failed then
        return l_BuyRobuxFlowState_0.Error;
    elseif l_props_3.iapPurchase.purchaseStatus == v12.Success then
        return l_BuyRobuxFlowState_0.Succeed;
    else
        return l_BuyRobuxFlowState_0.BuyRobux;
    end;
end;
v16.render = function(v45)
    local l_props_4 = v45.props;
    local _ = v45.state;
    return v3.createElement(l_BuyRobuxFlow_0, {
        screenSize = l_props_4.screenSize, 
        isConsoleSize = v17, 
        showBackground = not v17, 
        showCloseButton = not v17, 
        shouldAnimate = true, 
        robuxBalance = l_props_4.robuxBalance, 
        robuxPackages = l_props_4.robuxPackages, 
        purchaseState = v45:getFlowState(), 
        errorType = l_PurchaseErrorType_0.FailedRobuxPurchase, 
        u13ConfirmType = v45.state.purchaseWarningType, 
        purchaseRobux = v45.purchaseRobux, 
        acceptPurchaseWarning = v45.acceptPurchaseWarning, 
        cancelPurchase = v45.cancelPurchase, 
        flowComplete = v45.endPurchase, 
        onAnalyticEvent = v45.sendAnalyticEvent, 
        eventPrefix = l_props_4.eventPrefix, 
        onPageClose = l_props_4.onPageClose, 
        dispatchCentralOverlay = l_props_4.dispatchCentralOverlay
    });
end;
return v16;
