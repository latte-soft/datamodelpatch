local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Roact);
local l_PartialPageModal_0 = require(l_Parent_2.UIBlox).App.Dialog.Modal.PartialPageModal;
local v7 = require(l_Parent_0.PremiumUpsellFlowState);
local v8 = require(l_Parent_1.Generic.Animator);
local v9 = require(l_Parent_1.Generic.Constants);
local v10 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v11 = require(l_Parent_1.PremiumUpsell.PremiumUpsellPrompt);
local v12 = require(l_Parent_1.Utility.getModalShownEventData);
local v13 = require(l_Parent_1.Utility.getUserInputEventData);
local v14 = require(l_Parent_1.Flags.getEnableCentralOverlayForUpsellPrompt);
local v15 = game:DefineFastFlag("CompleteFlowInStudioAccept", false);
local v16 = v5.Component:extend(script.Name);
v16.init = function(v17)
    local _ = v17.props;
    v17.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    v17.closeModal = function()
        local l_props_1 = v17.props;
        v17:reportUserInput("Cancel");
        l_props_1.cancelPurchase();
        v17:closeCentralOverlay();
        v17:UnbindActions();
    end;
end;
v16.didUpdate = function(v20, v21, _)
    local l_props_2 = v20.props;
    if v21.purchaseState ~= l_props_2.purchaseState then
        v20:reportModalShown();
        v20:dispatchCentralOverlayAndRenderModal(l_props_2);
    end;
end;
v16.UnbindActions = function(v24)
    if not (not v14() or not v24.props.dispatchCentralOverlay) then
        l_ContextActionService_0:UnbindAction(v9.CLOSE_MODAL_ACTION);
    end;
end;
v16.BindCancelAction = function(v25)
    if not (not v14() or not v25.props.dispatchCentralOverlay) then
        l_ContextActionService_0:BindAction(v9.CLOSE_MODAL_ACTION, v25.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end;
end;
v16.closeCentralOverlay = function(v26)
    local l_props_3 = v26.props;
    if not (not v14() or not l_props_3.dispatchCentralOverlay) then
        l_props_3.dispatchCentralOverlay();
    end;
end;
v16.constructPremiumUpsellPromptAnimatorObj = function(v28)
    local l_props_4 = v28.props;
    return {
        shouldShow = l_props_4.purchaseState == v7.PurchaseModal, 
        shouldAnimate = true, 
        animateDown = l_PartialPageModal_0:getMiddleContentWidth(l_props_4.screenSize.X) == 492, 
        renderChildren = function()
            return v5.createElement(v11, {
                screenSize = l_props_4.screenSize, 
                isCatalog = l_props_4.isCatalog, 
                currencySymbol = l_props_4.currencySymbol, 
                robuxPrice = l_props_4.robuxPrice, 
                robuxAmount = l_props_4.robuxAmount, 
                acceptControllerIcon = l_props_4.acceptControllerIcon, 
                purchasePremiumActivated = function()
                    v28:reportUserInput("Subscribe");
                    l_props_4.purchasePremium();
                    if not (not v15 or not game:GetService("RunService"):IsStudio()) then
                        l_props_4.flowComplete();
                    end;
                    v28:closeCentralOverlay();
                end, 
                cancelPurchaseActivated = function()
                    v28:reportUserInput("Cancel");
                    l_props_4.cancelPurchase();
                    v28:closeCentralOverlay();
                end
            });
        end
    };
end;
v16.constructPurchaseErrorPromptAnimatorObj = function(v30)
    local l_props_5 = v30.props;
    return {
        shouldShow = l_props_5.purchaseState == v7.Error, 
        shouldAnimate = true, 
        renderChildren = function()
            return v5.createElement(v10, {
                screenSize = l_props_5.screenSize, 
                errorType = l_props_5.errorType, 
                doneControllerIcon = l_props_5.acceptControllerIcon, 
                doneActivated = function()
                    v30:reportUserInput("Done");
                    l_props_5.flowComplete();
                    v30:closeCentralOverlay();
                end
            });
        end
    };
end;
v16.dispatchCentralOverlayAndRenderModal = function(v32, v33)
    if v14() and v33.dispatchCentralOverlay then
        local l_purchaseState_0 = v33.purchaseState;
        if l_purchaseState_0 == v7.PurchaseModal then
            v33.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v32:constructPremiumUpsellPromptAnimatorObj());
        end;
        if l_purchaseState_0 == v7.Error then
            v33.dispatchCentralOverlay(v9.CENTRAL_OVERLAY_TYPE_ANIMATOR, v32:constructPurchaseErrorPromptAnimatorObj());
        end;
        return ;
    else
        return ;
    end;
end;
v16.reportModalShown = function(v35)
    local l_props_6 = v35.props;
    local l_state_0 = v35.state;
    if v35.props.onAnalyticEvent then
        l_props_6.onAnalyticEvent("UserPurchaseFlow", (v12(l_state_0.analyticId, l_props_6.eventPrefix, "PremiumUpsell", v7.toRawValue(l_props_6.purchaseState))));
        return ;
    else
        return ;
    end;
end;
v16.reportUserInput = function(v38, v39)
    local l_props_7 = v38.props;
    local l_state_1 = v38.state;
    if v38.props.onAnalyticEvent then
        l_props_7.onAnalyticEvent("UserPurchaseFlow", (v13(l_state_1.analyticId, l_props_7.eventPrefix, "PremiumUpsell", v7.toRawValue(l_props_7.purchaseState), v39)));
        return ;
    else
        return ;
    end;
end;
v16.getChildrenElements = function(v42)
    local _ = v42.props;
    return {
        PremiumUpsellPromptAnimator = v5.createElement(v8, v42:constructPremiumUpsellPromptAnimatorObj()), 
        PurchaseErrorPromptAnimator = v5.createElement(v8, v42:constructPurchaseErrorPromptAnimatorObj())
    };
end;
v16.render = function(v44)
    local l_props_9 = v44.props;
    local v46 = {};
    if not (v14() and l_props_9.dispatchCentralOverlay) then
        v46 = v44:getChildrenElements();
    end;
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v46);
end;
return v16;
