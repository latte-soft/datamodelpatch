local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.Promise);
local v4 = require(l_CorePackages_0.IAPExperience);
local l_PremiumUpsellFlow_0 = v4.PurchaseFlow.PremiumUpsellFlow;
local l_PremiumUpsellFlowState_0 = v4.PurchaseFlow.PremiumUpsellFlowState;
local l_PurchaseErrorType_0 = v4.PurchaseFlow.PurchaseErrorType;
local _ = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v9 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v10 = require(script.Parent.Enum.PremiumUpsellCounter);
local _ = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local _ = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v13 = v2.PureComponent:extend(script.Name);
v13.init = function(v14)
    v14.state = {
        errorType = l_PurchaseErrorType_0.None
    };
    v14.failFlow = function(v15, v16)
        v14.sendCounter(v10.Failed);
        local v17 = {};
        if v16 ~= nil then
            v17 = v16;
        end;
        if v15 ~= nil then
            v17.errorType = v15;
        else
            v17.errorType = l_PurchaseErrorType_0.Unknown;
        end;
        v14:setState(v17);
    end;
    v14.purchasePremium = function()
        v14.sendCounter(v10.Confirmed);
        v14.props.promptPremium();
    end;
    v14.cancelPurchase = function()
        v14.sendCounter(v10.Cancelled);
        v14.props.cancelPurchase();
    end;
    v14.flowComplete = function()
        v14.props.endPurchase();
    end;
    v14.sendAnalyticEvent = function(v18, v19)
        v14.props.sendAnalyticEvent(v14.props.eventPrefix .. "PremiumUpsell", v18, v19);
    end;
    v14.sendCounter = function(v20)
        v14.props.sendCounter(v10.toRawValue(v20));
    end;
end;
v13.didMount = function(v21)
    v21.sendCounter(v10.Shown);
end;
v13.didUpdate = function(v22, v23)
    local l_props_0 = v22.props;
    if l_props_0.iapProductsFetchingStatus ~= v23.iapProductsFetchingStatus and l_props_0.iapProductsFetchingStatus == v9.Failed then
        v22.sendCounter(v10.InvalidProducts);
        v22.failFlow();
    end;
end;
v13.getFlowState = function(v25)
    local l_state_0 = v25.state;
    local l_props_1 = v25.props;
    if l_state_0.errorType ~= l_PurchaseErrorType_0.None then
        return l_PremiumUpsellFlowState_0.Error;
    elseif l_props_1.iapProductsFetchingStatus ~= v9.Done then
        return l_PremiumUpsellFlowState_0.None;
    elseif l_props_1.robuxPrice ~= nil then
        return l_PremiumUpsellFlowState_0.PurchaseModal;
    else
        return l_PremiumUpsellFlowState_0.Error;
    end;
end;
v13.getErrorType = function(v28)
    local l_state_1 = v28.state;
    local _ = v28.props;
    return l_state_1.errorType;
end;
v13.render = function(v31)
    local l_props_3 = v31.props;
    local _ = v31.state;
    return v2.createElement(l_PremiumUpsellFlow_0, {
        screenSize = l_props_3.screenSize, 
        currencySymbol = l_props_3.currencySymbol, 
        robuxPrice = l_props_3.robuxPrice, 
        robuxAmount = l_props_3.robuxAmount, 
        purchaseState = v31:getFlowState(), 
        errorType = v31:getErrorType(), 
        purchasePremium = v31.purchasePremium, 
        cancelPurchase = v31.cancelPurchase, 
        flowComplete = v31.flowComplete, 
        onAnalyticEvent = v31.sendAnalyticEvent, 
        eventPrefix = l_props_3.eventPrefix, 
        dispatchCentralOverlay = l_props_3.dispatchCentralOverlay
    });
end;
return v13;
