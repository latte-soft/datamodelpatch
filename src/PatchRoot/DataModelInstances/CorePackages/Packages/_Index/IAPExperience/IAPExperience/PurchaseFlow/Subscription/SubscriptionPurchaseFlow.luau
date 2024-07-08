local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local l_PartialPageModal_0 = require(l_Parent_2.UIBlox).App.Dialog.Modal.PartialPageModal;
local v6 = require(l_Parent_0.SubscriptionPurchaseFlowState);
local v7 = require(l_Parent_1.Generic.Animator);
local v8 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v9 = require(l_Parent_1.Subscription.SubscriptionPurchasePrompt);
local v10 = require(l_Parent_1.Flags.getEnableSubscriptionPurchaseInstrumentation);
local v11 = require(l_Parent_1.Utility.formatSubscriptionPurchaseEventData);
local v12 = require(l_Parent_1.Flags.GetFFlagEnableRobloxCreditPurchase);
local v13 = v4.Component:extend(script.Name);
local v14 = require(l_Parent_1.Generic.PurchaseFlowType);
v13.init = function(v15)
    v15.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
end;
v13.didUpdate = function(v16, v17, _)
    if not (not (v17.purchaseState ~= v16.props.purchaseState) or not v10()) then
        v16:reportPurchaseEvent("ViewShown");
    end;
end;
v13.reportUserInput = function(v19, v20)
    if v10() then
        v19:reportPurchaseEvent("UserInput", v20);
        return ;
    else
        return ;
    end;
end;
v13.reportPurchaseEvent = function(v21, v22, v23)
    if v10() then
        local l_props_0 = v21.props;
        local _ = v21.state;
        if v21.props.onAnalyticEvent then
            l_props_0.onAnalyticEvent("SubscriptionPurchase", (v11(v21.state.analyticId, v22, v6.toRawValue(l_props_0.purchaseState), v23, l_props_0.subscriptionProviderId, l_props_0.subscriptionId, l_props_0.name, l_props_0.description, l_props_0.period, l_props_0.priceTier, l_props_0.displayPrice)));
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v13.render = function(v26)
    local l_props_1 = v26.props;
    local l_purchaseState_0 = l_props_1.purchaseState;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        SubscriptionPurchasePromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.PurchaseModal, 
            shouldAnimate = true, 
            animateDown = l_PartialPageModal_0:getMiddleContentWidth(l_props_1.screenSize.X) == 492, 
            renderChildren = function()
                return v4.createElement(v9, {
                    name = l_props_1.name, 
                    subscriptionProviderName = l_props_1.subscriptionProviderName, 
                    displayPrice = l_props_1.displayPrice, 
                    period = l_props_1.period, 
                    disclaimerText = l_props_1.disclaimerText, 
                    description = l_props_1.description, 
                    itemIcon = l_props_1.itemIcon, 
                    primaryPaymentMethod = if not v12() then nil else l_props_1.primaryPaymentMethod, 
                    secondaryPaymentMethod = if not v12() then nil else l_props_1.secondaryPaymentMethod, 
                    isTestingMode = l_props_1.isTestingMode, 
                    screenSize = l_props_1.screenSize, 
                    purchaseSubscriptionActivated = function(v29)
                        v26:reportUserInput("Subscribe");
                        l_props_1.purchaseSubscription(v29);
                        if l_props_1.isTestingMode then
                            l_props_1.flowComplete();
                        end;
                    end, 
                    cancelPurchaseActivated = function()
                        v26:reportUserInput("Cancel");
                        l_props_1.cancelPurchase();
                    end
                });
            end
        }), 
        PurchaseErrorPromptAnimator = v4.createElement(v7, {
            shouldShow = l_purchaseState_0 == v6.Error, 
            shouldAnimate = true, 
            renderChildren = function()
                return v4.createElement(v8, {
                    screenSize = l_props_1.screenSize, 
                    errorType = l_props_1.errorType, 
                    flowType = v14.Subscription, 
                    doneControllerIcon = l_props_1.acceptControllerIcon, 
                    doneActivated = function()
                        v26:reportUserInput("Done");
                        l_props_1.flowComplete();
                    end
                });
            end
        })
    });
end;
return v13;
