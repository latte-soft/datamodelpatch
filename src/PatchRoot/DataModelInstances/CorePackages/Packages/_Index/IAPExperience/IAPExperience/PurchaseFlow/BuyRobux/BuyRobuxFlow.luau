local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Parent.Roact);
local v4 = require(l_Parent_0.BuyRobuxFlowState);
local v5 = require(l_Parent_1.Generic.Constants);
local v6 = require(l_Parent_1.Generic.LoadingOverlay);
local v7 = require(l_Parent_1.Generic.LoadingOverlayState);
local v8 = require(l_Parent_1.BuyRobux.BuyRobuxPage);
local v9 = require(l_Parent_1.Generic.PurchaseErrorPrompt);
local v10 = require(l_Parent_1.Generic.U13ConfirmPrompt);
local v11 = require(l_Parent_1.Utility.getModalShownEventData);
local v12 = require(l_Parent_1.Utility.getUserInputEventData);
local v13 = v3.Component:extend(script.Name);
v13.init = function(v14)
    local _ = v14.props;
    v14.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
end;
v13.didUpdate = function(v16, v17, _)
    local l_props_1 = v16.props;
    if v17.purchaseState ~= l_props_1.purchaseState then
        v16:reportModalShown();
        v16:dispatchAndRenderModal(l_props_1);
    end;
end;
v13.dispatchAndRenderModal = function(v20, v21)
    if v21.purchaseState == v4.Error then
        v21.dispatchCentralOverlay(v5.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
            shouldAnimate = v21.shouldAnimate, 
            shouldShow = v21.purchaseState == v4.Error, 
            renderChildren = function()
                return v3.createElement(v9, {
                    screenSize = v21.screenSize, 
                    errorType = v21.errorType, 
                    doneControllerIcon = v21.acceptControllerIcon, 
                    doneActivated = function()
                        v20:reportUserInput("Done");
                        v21.flowComplete();
                        v21.dispatchCentralOverlay();
                    end
                });
            end
        });
        return ;
    elseif v21.purchaseState == v4.PurchaseWarning then
        v21.dispatchCentralOverlay(v5.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
            shouldAnimate = v21.shouldAnimate, 
            shouldShow = v21.purchaseState == v4.PurchaseWarning, 
            renderChildren = function()
                return v3.createElement(v10, {
                    screenSize = v21.screenSize, 
                    modalType = v21.u13ConfirmType, 
                    doneActivated = function()
                        v20:reportUserInput("Confirm");
                        v21.acceptPurchaseWarning();
                        v21.dispatchCentralOverlay();
                    end, 
                    cancelActivated = function()
                        v20:reportUserInput("Cancel");
                        v21.cancelPurchase();
                        v21.dispatchCentralOverlay();
                    end
                });
            end
        });
        return ;
    else
        return ;
    end;
end;
v13.reportModalShown = function(v22)
    local l_props_2 = v22.props;
    local l_state_0 = v22.state;
    if v22.props.onAnalyticEvent then
        l_props_2.onAnalyticEvent("UserPurchaseFlow", (v11(l_state_0.analyticId, "", "BuyRobux", v4.toRawValue(l_props_2.purchaseState))));
        return ;
    else
        return ;
    end;
end;
v13.reportUserInput = function(v25, v26)
    local l_props_3 = v25.props;
    local l_state_1 = v25.state;
    if v25.props.onAnalyticEvent then
        l_props_3.onAnalyticEvent("UserPurchaseFlow", (v12(l_state_1.analyticId, "", "BuyRobux", v4.toRawValue(l_props_3.purchaseState), v26)));
        return ;
    else
        return ;
    end;
end;
v13.purchaseStateToOverlayState = function(_, v30)
    if v30 == v4.Loading then
        return v7.Loading;
    elseif v30 == v4.RobuxPurchasePending then
        return v7.PurchasingRobux;
    elseif v30 == v4.RobuxGrantPending then
        return v7.WaitingForRobux;
    elseif v30 == v4.PurchaseWarning then
        return v7.None;
    elseif v30 == v4.PurchaseWarning then
        return v7.None;
    elseif v30 == v4.None then
        return v7.None;
    else
        return nil;
    end;
end;
v13.render = function(v31)
    local l_props_4 = v31.props;
    local l_state_2 = v31.state;
    local l_purchaseState_0 = l_props_4.purchaseState;
    local v35 = v31:purchaseStateToOverlayState(l_props_4.purchaseState);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        BuyRobuxFrame = v3.createElement(v8, {
            showCloseButton = l_props_4.showCloseButton, 
            showBackground = l_props_4.showBackground, 
            isConsoleSize = l_props_4.isConsoleSize, 
            robuxBalance = l_props_4.robuxBalance, 
            robuxPackages = l_props_4.robuxPackages, 
            robuxPackageActivated = function(v36)
                v31:reportUserInput("Confirm");
                l_props_4.purchaseRobux(v36);
            end, 
            onPageClose = l_props_4.onPageClose, 
            hasNativePurchaseSucceeded = l_purchaseState_0 == v4.Succeed, 
            shouldAnimate = l_props_4.shouldAnimate, 
            analyticId = l_state_2.analyticId, 
            onAnalyticEvent = l_props_4.onAnalyticEvent
        }), 
        LoadingOverlay = v3.createElement(v6, {
            shouldAnimate = false, 
            showOverlay = v35 ~= nil, 
            loadingState = v35
        })
    });
end;
return v13;
