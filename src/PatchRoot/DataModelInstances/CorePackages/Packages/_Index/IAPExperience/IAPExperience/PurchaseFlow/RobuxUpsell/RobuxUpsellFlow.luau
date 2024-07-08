local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v4 = require(l_Parent_1.Parent.Roact);
local v5 = require(l_Parent_0.RobuxUpsellFlowState);
local v6 = require(l_Parent_1.Generic.Animator);
local v7 = require(l_Parent_1.Generic.Constants);
local v8 = require(l_Parent_1.Generic.LoadingOverlay);
local v9 = require(l_Parent_1.Generic.LoadingOverlayState);
local v10 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v11 = require(l_Parent_1.Generic.U13ConfirmPrompt);
local v12 = require(l_Parent_1.Generic.TwoStepReqPrompt);
local v13 = require(l_Parent_1.Generic.InsufficientRobuxPrompt);
local v14 = require(l_Parent_1.ProductPurchaseRobuxUpsell.InsufficientRobuxProductPrompt);
local v15 = require(l_Parent_1.Generic.LeaveRobloxPrompt);
local v16 = require(l_Parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellSuccessPrompt);
local v17 = require(l_Parent_1.ProductPurchaseRobuxUpsell.RobuxUpsellPrompt);
local v18 = require(l_Parent_1.Utility.getModalShownEventData);
local v19 = require(l_Parent_1.Utility.getUserInputEventData);
local v20 = require(l_Parent_1.Flags.getEnableCentralOverlayForUpsellPrompt);
local v21 = v4.Component:extend(script.Name);
v21.init = function(v22)
    v22.state = {
        analyticId = l_HttpService_0:GenerateGUID(false), 
        isDelayedInput = v22.props.isDelayedInput, 
        enableInputDelayed = false
    };
    v22.closeModal = function()
        local l_props_0 = v22.props;
        v22:reportUserInput("Cancel");
        l_props_0.cancelPurchase();
        v22:closeCentralOverlay();
        v22:UnbindActions();
    end;
end;
v21.didUpdate = function(v24, v25, _)
    local l_props_1 = v24.props;
    if v25.purchaseState ~= l_props_1.purchaseState then
        v24:reportModalShown();
        v24:dispatchCentralOverlayAndRenderModal(l_props_1);
    end;
end;
v21.UnbindActions = function(v28)
    if not (not v20() or not v28.props.dispatchCentralOverlay) then
        l_ContextActionService_0:UnbindAction(v7.CLOSE_MODAL_ACTION);
    end;
end;
v21.BindCancelAction = function(v29)
    if not (not v20() or not v29.props.dispatchCentralOverlay) then
        l_ContextActionService_0:BindAction(v7.CLOSE_MODAL_ACTION, v29.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
end;
v21.closeCentralOverlay = function(v30)
    local l_props_2 = v30.props;
    if not (not v20() or not l_props_2.dispatchCentralOverlay) then
        l_props_2.dispatchCentralOverlay();
    end;
end;
v21.constructRobuxUpsellPromptAnimatorObj = function(v32)
    local l_props_3 = v32.props;
    local l_state_0 = v32.state;
    v32:BindCancelAction();
    return {
        shouldAnimate = l_props_3.shouldAnimate, 
        shouldShow = l_props_3.purchaseState == v5.PurchaseModal, 
        onShown = not not l_props_3.isDelayedInput and function()
            v32:setState({
                enableInputDelayed = true
            });
            delay(3, function()
                v32:setState({
                    isDelayedInput = false, 
                    enableInputDelayed = false
                });
                if l_props_3.onDelayedInputComplete then
                    l_props_3.onDelayedInputComplete();
                end;
            end);
        end or nil, 
        onHidden = not not l_props_3.isDelayedInput and function()
            v32:setState({
                isDelayedInput = l_props_3.isDelayedInput, 
                enableInputDelayed = false
            });
        end or nil, 
        renderChildren = function()
            return v4.createElement(v17, {
                screenSize = l_props_3.screenSize, 
                isDelayedInput = l_state_0.isDelayedInput, 
                enableInputDelayed = l_state_0.enableInputDelayed, 
                model = l_props_3.model, 
                itemIcon = l_props_3.itemIcon, 
                itemName = l_props_3.itemName, 
                itemRobuxCost = l_props_3.itemRobuxCost, 
                robuxCostStr = l_props_3.iapCostStr, 
                robuxPurchaseAmount = l_props_3.iapRobuxAmount, 
                balanceAmount = l_props_3.beforeRobuxBalance, 
                buyItemControllerIcon = l_props_3.acceptControllerIcon, 
                cancelControllerIcon = l_props_3.cancelControllerIcon, 
                buyItemActivated = function()
                    v32:reportUserInput("Buy");
                    l_props_3.purchaseRobux();
                    v32:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function()
                    v32:reportUserInput("Cancel");
                    l_props_3.cancelPurchase();
                    v32:closeCentralOverlay();
                end, 
                termsOfUseActivated = not not l_props_3.showTermsOfUse and function()
                    v32:reportUserInput("TermsOfService");
                    l_props_3.showTermsOfUse();
                end or nil, 
                isQuest = v32.props.isQuest
            });
        end
    };
end;
v21.constructU13ConfirmPromptAnimatorObj = function(v35)
    local l_props_4 = v35.props;
    v35:BindCancelAction();
    return {
        shouldAnimate = l_props_4.shouldAnimate, 
        shouldShow = l_props_4.purchaseState == v5.PurchaseWarning, 
        renderChildren = function()
            return v4.createElement(v11, {
                screenSize = l_props_4.screenSize, 
                modalType = l_props_4.u13ConfirmType, 
                doneControllerIcon = l_props_4.acceptControllerIcon, 
                cancelControllerIcon = l_props_4.cancelControllerIcon, 
                doneActivated = function()
                    v35:reportUserInput("Confirm");
                    l_props_4.acceptPurchaseWarning();
                    v35:closeCentralOverlay();
                end, 
                cancelActivated = function()
                    v35:reportUserInput("Cancel");
                    l_props_4.cancelPurchase();
                    v35:closeCentralOverlay();
                end
            });
        end
    };
end;
v21.constructPurchaseErrorPromptAnimatorObj = function(v37)
    local l_props_5 = v37.props;
    v37:BindCancelAction();
    return {
        shouldAnimate = l_props_5.shouldAnimate, 
        shouldShow = l_props_5.purchaseState == v5.Error, 
        renderChildren = function()
            return v4.createElement(v10, {
                screenSize = l_props_5.screenSize, 
                errorType = l_props_5.errorType, 
                doneControllerIcon = l_props_5.acceptControllerIcon, 
                doneActivated = function()
                    v37:reportUserInput("Done");
                    l_props_5.flowComplete();
                    v37:closeCentralOverlay();
                end
            });
        end
    };
end;
v21.constructTwoStepRequiredAnimatorObj = function(v39)
    local l_props_6 = v39.props;
    v39:BindCancelAction();
    return {
        shouldAnimate = l_props_6.shouldAnimate, 
        shouldShow = l_props_6.purchaseState == v5.TwoStepRequired, 
        renderChildren = function()
            return v4.createElement(v12, {
                screenSize = l_props_6.screenSize, 
                doneControllerIcon = l_props_6.acceptControllerIcon, 
                openSecuritySettings = function()
                    v39:reportUserInput("GoToSecuritySettings");
                    l_props_6.openSecuritySettings();
                    l_props_6.flowComplete();
                    v39:closeCentralOverlay();
                end, 
                closePrompt = function()
                    v39:reportUserInput("Cancel");
                    l_props_6.flowComplete();
                    v39:closeCentralOverlay();
                end
            });
        end
    };
end;
v21.constructRobuxUpsellSuccessPromptAnimatorObj = function(v41)
    local l_props_7 = v41.props;
    v41:BindCancelAction();
    return {
        shouldAnimate = l_props_7.shouldAnimate, 
        shouldShow = l_props_7.purchaseState == v5.Success, 
        renderChildren = function()
            return v4.createElement(v16, {
                screenSize = l_props_7.screenSize, 
                model = l_props_7.model, 
                itemIcon = l_props_7.itemIcon, 
                itemName = l_props_7.itemName, 
                balance = (l_props_7.iapRobuxAmount + l_props_7.beforeRobuxBalance) - l_props_7.itemRobuxCost, 
                confirmControllerIcon = l_props_7.acceptControllerIcon, 
                cancelControllerIcon = l_props_7.cancelControllerIcon, 
                doneActivated = function()
                    v41:reportUserInput("Done");
                    l_props_7.flowComplete();
                    v41:closeCentralOverlay();
                end, 
                equipActivated = not not l_props_7.equipItem and function()
                    v41:reportUserInput("Equip");
                    l_props_7.equipItem();
                    v41:closeCentralOverlay();
                end or nil
            });
        end
    };
end;
v21.constructInsufficientRobuxAnimatorObj = function(v43)
    local l_props_8 = v43.props;
    v43:BindCancelAction();
    return {
        shouldAnimate = l_props_8.shouldAnimate, 
        shouldShow = l_props_8.purchaseState == v5.GenericPurchaseModal, 
        renderChildren = function()
            return v4.createElement(v13, {
                screenSize = l_props_8.screenSize, 
                robuxBalance = l_props_8.beforeRobuxBalance, 
                buyRobux = function()
                    v43:reportUserInput("Buy Robux");
                    l_props_8.openBuyRobux();
                    l_props_8.flowComplete();
                    v43:closeCentralOverlay();
                end, 
                closePrompt = function()
                    v43:reportUserInput("Cancel");
                    l_props_8.flowComplete();
                    v43:closeCentralOverlay();
                end
            });
        end
    };
end;
v21.constructInsufficientRobuxProductAnimatorObj = function(v45)
    local l_props_9 = v45.props;
    v45:BindCancelAction();
    return {
        shouldAnimate = l_props_9.shouldAnimate, 
        shouldShow = l_props_9.purchaseState == v5.LargeRobuxPurchaseModal, 
        renderChildren = function()
            return v4.createElement(v14, {
                screenSize = l_props_9.screenSize, 
                model = l_props_9.model, 
                itemIcon = l_props_9.itemIcon, 
                itemName = l_props_9.itemName, 
                itemRobuxCost = l_props_9.itemRobuxCost, 
                balanceAmount = l_props_9.beforeRobuxBalance, 
                acceptControllerIcon = l_props_9.acceptControllerIcon, 
                cancelControllerIcon = l_props_9.cancelControllerIcon, 
                robuxStoreActivated = function()
                    v45:reportUserInput("Go to Robux store");
                    l_props_9.openBuyRobux();
                    v45:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function()
                    v45:reportUserInput("Cancel");
                    l_props_9.flowComplete();
                    v45:closeCentralOverlay();
                end
            });
        end
    };
end;
v21.constructLeaveRobloxPromptAnimatorObj = function(v47)
    local l_props_10 = v47.props;
    v47:BindCancelAction();
    return {
        shouldAnimate = l_props_10.shouldAnimate, 
        shouldShow = l_props_10.purchaseState == v5.LeaveRobloxWarning, 
        renderChildren = function()
            return v4.createElement(v15, {
                screenSize = l_props_10.screenSize, 
                cancelActivated = function()
                    v47:closeCentralOverlay();
                end, 
                continueActivated = function()
                    l_props_10.openVngShop();
                end
            });
        end
    };
end;
v21.dispatchCentralOverlayAndRenderModal = function(v49, v50)
    if v20() and v50.dispatchCentralOverlay then
        local l_purchaseState_0 = v50.purchaseState;
        if l_purchaseState_0 == v5.PurchaseModal then
            v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructRobuxUpsellPromptAnimatorObj());
            return ;
        else
            if l_purchaseState_0 == v5.PurchaseWarning then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructU13ConfirmPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v5.Error then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructPurchaseErrorPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v5.TwoStepRequired then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructTwoStepRequiredAnimatorObj());
            end;
            if l_purchaseState_0 == v5.Success then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructRobuxUpsellSuccessPromptAnimatorObj());
            end;
            if l_purchaseState_0 == v5.GenericPurchaseModal then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructInsufficientRobuxAnimatorObj());
            end;
            if l_purchaseState_0 == v5.LargeRobuxPurchaseModal then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructInsufficientRobuxProductAnimatorObj());
            end;
            if l_purchaseState_0 == v5.LeaveRobloxWarning then
                v50.dispatchCentralOverlay(v7.CENTRAL_OVERLAY_TYPE_ANIMATOR, v49:constructLeaveRobloxPromptAnimatorObj());
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v21.reportModalShown = function(v52)
    local l_props_11 = v52.props;
    local l_state_1 = v52.state;
    if v52.props.onAnalyticEvent then
        l_props_11.onAnalyticEvent("UserPurchaseFlow", (v18(l_state_1.analyticId, l_props_11.eventPrefix, "RobuxUpsell", v5.toRawValue(l_props_11.purchaseState))));
        return ;
    else
        return ;
    end;
end;
v21.reportUserInput = function(v55, v56)
    local l_props_12 = v55.props;
    local l_state_2 = v55.state;
    if v55.props.onAnalyticEvent then
        l_props_12.onAnalyticEvent("UserPurchaseFlow", (v19(l_state_2.analyticId, l_props_12.eventPrefix, "RobuxUpsell", v5.toRawValue(l_props_12.purchaseState), v56)));
        return ;
    else
        return ;
    end;
end;
v21.purchaseStateToOverlayState = function(_, v60)
    if v60 == v5.Loading then
        return v9.Loading;
    elseif v60 == v5.RobuxPurchasePending then
        return v9.PurchasingRobux;
    elseif v60 == v5.RobuxGrantPending then
        return v9.WaitingForRobux;
    elseif v60 == v5.ItemPurchasePending then
        return v9.PurchasingItem;
    elseif v60 == v5.None then
        return nil;
    else
        return v9.None;
    end;
end;
v21.getChildrenElements = function(v61)
    local _ = v61.props;
    return {
        RobuxUpsellPromptAnimator = v4.createElement(v6, v61:constructRobuxUpsellPromptAnimatorObj()), 
        U13ConfirmPromptAnimator = v4.createElement(v6, v61:constructU13ConfirmPromptAnimatorObj()), 
        PurchaseErrorPromptAnimator = v4.createElement(v6, v61:constructPurchaseErrorPromptAnimatorObj()), 
        TwoStepRequiredAnimator = v4.createElement(v6, v61:constructTwoStepRequiredAnimatorObj()), 
        RobuxUpsellSuccessPromptAnimator = v4.createElement(v6, v61:constructRobuxUpsellSuccessPromptAnimatorObj()), 
        InsufficientRobuxAnimator = v4.createElement(v6, v61:constructInsufficientRobuxAnimatorObj()), 
        InsufficientRobuxProductAnimator = v4.createElement(v6, v61:constructInsufficientRobuxProductAnimatorObj())
    };
end;
v21.render = function(v63)
    local l_props_14 = v63.props;
    local v65 = {};
    if not (v20() and l_props_14.dispatchCentralOverlay) then
        v65 = v63:getChildrenElements();
    end;
    return v4.createElement(v8, {
        shouldAnimate = l_props_14.shouldAnimate, 
        loadingState = v63:purchaseStateToOverlayState(l_props_14.purchaseState)
    }, v65);
end;
return v21;
