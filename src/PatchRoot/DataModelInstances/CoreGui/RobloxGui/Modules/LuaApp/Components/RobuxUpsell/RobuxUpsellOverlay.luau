local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.IAPExperience);
local l_RobuxUpsellFlow_0 = v4.PurchaseFlow.RobuxUpsellFlow;
local l_RobuxUpsellFlowState_0 = v4.PurchaseFlow.RobuxUpsellFlowState;
local l_U13ConfirmType_0 = v4.PurchaseFlow.U13ConfirmType;
local l_PurchaseErrorType_0 = v4.PurchaseFlow.PurchaseErrorType;
local v9 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepSpendFrictionRequests);
local v10 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local _ = require(l_Modules_0.LuaApp.Thunks.ApiFetchRobuxProduct);
local v12 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v13 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local _ = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v15 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local v16 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v18 = require(script.Parent.Enum.RobuxUpsellCounter);
local v19 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v20 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev);
local v23 = v2.PureComponent:extend(script.Name);
v23.init = function(v24)
    v24.state = {
        errorType = l_PurchaseErrorType_0.None, 
        robuxProduct = nil, 
        robuxProductFetchingStatus = v17.NotStarted, 
        purchaseWarningType = l_U13ConfirmType_0.None, 
        purchaseWarningFetchingStatus = v17.NotStarted, 
        purchaseWarningPostStatus = v17.NotStarted, 
        twoStepRequired = false, 
        itemPurchaseFetchingStatus = v17.NotStarted
    };
    v24.failFlow = function(v25, v26, v27)
        if v27 ~= nil then
            v24.sendCounter(v27);
        else
            v24.sendCounter(v18.UpsellFailed);
        end;
        local v28 = {};
        if v26 ~= nil then
            v28 = v26;
        end;
        if v25 ~= nil then
            v28.errorType = v25;
        else
            v28.errorType = l_PurchaseErrorType_0.Unknown;
        end;
        v24:setState(v28);
    end;
    v24.getRobuxUpsellProduct = function()
        v24:setState({
            robuxProductFetchingStatus = v17.Fetching
        });
        v24:dispatchFetchRobuxProduct():andThen(function()
            v24:setState({
                robuxProductFetchingStatus = v17.Done
            });
        end, function()
            v24:setState({
                robuxProductFetchingStatus = v17.Done
            });
        end);
    end;
    v24.attemptRobuxUpsell = function()
        v24:setState({
            purchaseWarningFetchingStatus = v17.Fetching
        });
        v24:dispatchFetchPurchaseWarning():andThen(function(v29)
            v24:setState({
                purchaseWarningFetchingStatus = v17.Done
            });
            if not v29 then
                v24:promptRobuxPurchase();
            end;
        end):catch(function()
            v24.failFlow(nil, {
                purchaseWarningFetchingStatus = v17.Failed
            });
        end);
    end;
    v24.acceptPurchaseWarning = function()
        v24:setState({
            purchaseWarningPostStatus = v17.Done
        });
        v24:dispatchPostAckPurchaseWarning();
        v24:promptRobuxPurchase();
    end;
    v24.attemptPurchaseItem = function()
        v24:setState({
            itemPurchaseFetchingStatus = v17.Fetching
        });
        v24:purchaseItem():andThen(function(v30)
            if v30 then
                v24:setState({
                    itemPurchaseFetchingStatus = v17.Done
                });
            end;
        end, function()
            v24.failFlow(nil, {
                itemPurchaseFetchingStatus = v17.Failed
            }, v18.UpsellFailedTwoStep);
        end);
    end;
    v24.showTwoStepRequiredPrompt = function()
        v24:setState({
            twoStepRequired = true
        });
    end;
    v24.openSecuritySettings = function()
        v24.props.openSecuritySettings();
    end;
    v24.openBuyRobux = function()
        v24.props.openBuyRobux();
    end;
    v24.cancelPurchase = function()
        v24.sendCounter(v18.UpsellCancelled);
        v24.props.endPurchase();
    end;
    v24.sendErrorEvent = function(v31)
        v24.props.sendAnalyticEvent(v24.props.eventPrefix .. "RobuxUpsell", "RobuxUpsellError", v31);
    end;
    v24.sendAnalyticEvent = function(v32, v33)
        v24.props.sendAnalyticEvent(v24.props.eventPrefix .. "RobuxUpsell", v32, v33);
    end;
    v24.sendCounter = function(v34)
        local v35 = v18.toRawValue(v34);
        v24.props.sendCounter(v35);
        local l_robuxProduct_0 = v24.state.robuxProduct;
        if l_robuxProduct_0 ~= nil and l_robuxProduct_0.robuxAmount ~= nil then
            v24.props.sendCounter(v35 .. tostring(l_robuxProduct_0.robuxAmount));
        end;
    end;
end;
v23.dispatchFetchRobuxProduct = function(v37)
    return v37.props.dispatchFetchRobuxProduct():andThen(function(v38)
        if v38 ~= nil then
            v37:setState({
                robuxProduct = v38
            });
            return v3.resolve();
        else
            return v3.reject();
        end;
    end);
end;
v23.dispatchFetchPurchaseWarning = function(v39)
    local l_props_0 = v39.props;
    local l_robuxProduct_1 = v39.state.robuxProduct;
    if l_robuxProduct_1 ~= nil then
        return l_props_0.dispatchFetchIAPPurchaseWarning(l_robuxProduct_1.providerId, l_robuxProduct_1.productId):andThen(function(v42)
            local v43 = true;
            if v42 == v10.ResponseType.U13PaymentModal then
                v39.sendCounter(v18.ShowU13PaymentModal);
                v39:setState({
                    purchaseWarningType = l_U13ConfirmType_0.U13PaymentModal
                });
            elseif v42 == v10.ResponseType.U13MonthlyThreshold1Modal then
                v39.sendCounter(v18.ShowU13MonthlyThreshold1Modal);
                v39:setState({
                    purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold1Modal
                });
            elseif v42 == v10.ResponseType.U13MonthlyThreshold2Modal then
                v39.sendCounter(v18.ShownU13MonthlyThreshold2Modal);
                v39:setState({
                    purchaseWarningType = l_U13ConfirmType_0.U13MonthlyThreshold2Modal
                });
            elseif v42 == v10.ResponseType.ParentalConsentWarningPaymentModal13To17 then
                v39.sendCounter(v18.ShownParentalConsentWarningPaymentModal13To17);
                v39:setState({
                    purchaseWarningType = l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17
                });
            else
                v43 = false;
            end;
            return v3.resolve(v43);
        end);
    else
        return ;
    end;
end;
v23.dispatchPostAckPurchaseWarning = function(v44)
    local l_props_1 = v44.props;
    local l_state_0 = v44.state;
    local l_None_0 = v12.UserActionType.None;
    if l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13PaymentModal then
        v44.sendCounter(v18.ConfirmU13PaymentModal);
        l_None_0 = v12.UserActionType.ConfirmedU13PaymentModal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold1Modal then
        v44.sendCounter(v18.ConfirmU13MonthlyThreshold1Modal);
        l_None_0 = v12.UserActionType.ConfirmedU13MonthlyThreshold1Modal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.U13MonthlyThreshold2Modal then
        v44.sendCounter(v18.ConfirmU13MonthlyThreshold2Modal);
        l_None_0 = v12.UserActionType.ConfirmedU13MonthlyThreshold2Modal;
    elseif l_state_0.purchaseWarningType == l_U13ConfirmType_0.ParentalConsentWarningPaymentModal13To17 then
        v44.sendCounter(v18.ConfirmParentalConsentWarningPaymentModal13To17);
        l_None_0 = v12.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17;
    end;
    return l_props_1.dispatchPostAckPurchaseWarning(l_None_0);
end;
v23.promptRobuxPurchase = function(v48)
    local l_props_2 = v48.props;
    local l_robuxProduct_2 = v48.state.robuxProduct;
    if l_robuxProduct_2 ~= nil then
        l_props_2.promptRobux(v48.props.networking, l_robuxProduct_2.providerId, l_robuxProduct_2.productId);
    end;
end;
v23.purchaseItem = function(v51)
    return v51.props.purchaseItem():andThen(function(v52)
        local l_purchased_0 = v52.purchased;
        local l_is2SVEnabled_0 = v52.is2SVEnabled;
        local l_challengeToken_0 = v52.challengeToken;
        if not l_purchased_0 then
            if l_is2SVEnabled_0 == false then
                v51.sendCounter(v18.ShownEnableTwoStepAuth);
                v51.showTwoStepRequiredPrompt();
                return v3.resolve(true);
            elseif not l_challengeToken_0 then
                v51.sendCounter(v18.FailedShowTwoStepAuth);
                return v3.reject();
            else
                v51.sendCounter(v18.ShownTwoStepAuth);
                v51:renderTwoStepChallenge(l_challengeToken_0);
                return v3.resolve(false);
            end;
        else
            v51.sendCounter(v18.UpsellSuccess);
            return v3.resolve(true);
        end;
    end, function()
        v51.sendCounter(v18.FailedShowTwoStepAuthUnknown);
        return v3.reject();
    end);
end;
v23.renderTwoStepChallenge = function(v56, v57)
    local l_props_3 = v56.props;
    local l_networking_0 = l_props_3.networking;
    local l_userId_0 = l_props_3.userId;
    if v21() then
        wait(v22());
    end;
    l_props_3.renderChallenge({
        challengeType = v13.TwoStepVerification, 
        challengeParameters = {
            actionType = v15.RobuxSpend, 
            challengeId = v57, 
            userId = l_userId_0, 
            onChallengeCompleted = function(v61)
                v56.sendCounter(v18.CompletedTwoStepAuth);
                return v9.redeem(l_networking_0, tostring(v57), v61.verificationToken):andThen(function(_)
                    v56.attemptPurchaseItem();
                end, function(_)
                    v56.failFlow();
                end);
            end, 
            onChallengeInvalidated = function(_)
                v56.sendCounter(v18.InvalidatedTwoStepAuth);
                v56.failFlow();
            end
        }, 
        onChallengeAbandoned = function()
            v56.sendCounter(v18.AbandonedTwoStepAuth);
            v56.failFlow();
        end, 
        onChallengeLoadFailed = function()
            v56.sendCounter(v18.LoadFailedTwoStepAuth);
            v56.failFlow();
        end, 
        forceWebViewVisible = true
    }, false);
end;
v23.didMount = function(v65)
    if v65.state.robuxProductFetchingStatus == v17.NotStarted then
        v65.sendCounter(v18.UpsellShown);
        v65.getRobuxUpsellProduct();
    end;
end;
v23.didUpdate = function(v66, v67, v68)
    local l_state_1 = v66.state;
    local l_props_4 = v66.props;
    if v68.robuxProductFetchingStatus ~= l_state_1.robuxProductFetchingStatus and l_state_1.robuxProductFetchingStatus == v17.Done then
        if l_state_1.robuxProduct ~= nil then
            v66.sendCounter(v18.UpsellModalShown);
        else
            v66.sendCounter(v18.UpsellGenericModalShown);
        end;
    end;
    if l_props_4.iapPurchase ~= v67.iapPurchase then
        if l_props_4.iapPurchase.purchaseStatus == v16.Success and l_state_1.itemPurchaseFetchingStatus == v17.NotStarted then
            v66.attemptPurchaseItem();
        end;
        if v67.iapPurchase.purchaseStatus ~= l_props_4.iapPurchase.purchaseStatus and l_props_4.iapPurchase.purchaseStatus == v16.Failed then
            v66.sendCounter(v18.UpsellFailedNativePurchase);
        end;
    end;
end;
v23.getFlowState = function(v71)
    local l_state_2 = v71.state;
    local l_props_5 = v71.props;
    if l_state_2.errorType ~= l_PurchaseErrorType_0.None then
        return l_RobuxUpsellFlowState_0.Error;
    elseif l_state_2.robuxProductFetchingStatus ~= v17.Done then
        return l_RobuxUpsellFlowState_0.Loading;
    elseif l_state_2.purchaseWarningFetchingStatus == v17.NotStarted then
        if l_state_2.robuxProduct ~= nil then
            return l_RobuxUpsellFlowState_0.PurchaseModal;
        else
            return l_RobuxUpsellFlowState_0.GenericPurchaseModal;
        end;
    elseif l_state_2.purchaseWarningFetchingStatus ~= v17.Done then
        return l_RobuxUpsellFlowState_0.Loading;
    elseif l_state_2.purchaseWarningType ~= l_U13ConfirmType_0.None and l_state_2.purchaseWarningPostStatus == v17.NotStarted then
        return l_RobuxUpsellFlowState_0.PurchaseWarning;
    elseif not (l_props_5.iapPurchase.nativeProductId ~= nil) or l_props_5.iapPurchase.purchaseStatus == v16.Pending then
        return l_RobuxUpsellFlowState_0.RobuxPurchasePending;
    elseif l_props_5.iapPurchase.purchaseStatus == v16.Polling then
        return l_RobuxUpsellFlowState_0.RobuxGrantPending;
    elseif l_props_5.iapPurchase.purchaseStatus == v16.Failed then
        return l_RobuxUpsellFlowState_0.Error;
    elseif not (l_state_2.itemPurchaseFetchingStatus ~= v17.NotStarted) or l_state_2.itemPurchaseFetchingStatus == v17.Fetching then
        return l_RobuxUpsellFlowState_0.ItemPurchasePending;
    elseif not l_state_2.twoStepRequired then
        if l_state_2.itemPurchaseFetchingStatus == v17.Done then
            return l_RobuxUpsellFlowState_0.Success;
        else
            return l_RobuxUpsellFlowState_0.Error;
        end;
    else
        return l_RobuxUpsellFlowState_0.TwoStepRequired;
    end;
end;
v23.getErrorType = function(v74)
    local l_state_3 = v74.state;
    local l_props_6 = v74.props;
    if l_props_6.iapPurchase and l_props_6.iapPurchase.purchaseStatus == v16.Failed then
        if v20() == v19.Web then
            return l_PurchaseErrorType_0.FailedGrantUnknown;
        else
            return l_PurchaseErrorType_0.FailedGrant;
        end;
    else
        return l_state_3.errorType;
    end;
end;
v23.render = function(v77)
    local l_props_7 = v77.props;
    local l_state_4 = v77.state;
    local l_robuxProduct_3 = l_state_4.robuxProduct;
    return v2.createElement(l_RobuxUpsellFlow_0, {
        screenSize = l_props_7.screenSize, 
        itemIcon = l_props_7.itemIcon, 
        itemName = l_props_7.itemName, 
        itemRobuxCost = l_props_7.priceInRobux, 
        iapRobuxAmount = not not l_robuxProduct_3 and l_robuxProduct_3.robuxAmount or nil, 
        beforeRobuxBalance = l_props_7.beforeRobuxBalance, 
        purchaseState = v77:getFlowState(), 
        errorType = v77:getErrorType(), 
        u13ConfirmType = l_state_4.purchaseWarningType, 
        acceptControllerIcon = nil, 
        cancelControllerIcon = nil, 
        purchaseRobux = v77.attemptRobuxUpsell, 
        acceptPurchaseWarning = v77.acceptPurchaseWarning, 
        cancelPurchase = v77.cancelPurchase, 
        openSecuritySettings = v77.openSecuritySettings, 
        openBuyRobux = v77.openBuyRobux, 
        showTermsOfUse = v77.props.openTermsOfUse, 
        equipItem = l_props_7.equipItem, 
        flowComplete = l_props_7.endPurchase, 
        onAnalyticEvent = v77.sendAnalyticEvent, 
        eventPrefix = l_props_7.eventPrefix, 
        dispatchCentralOverlay = l_props_7.dispatchCentralOverlay
    });
end;
return v23;
