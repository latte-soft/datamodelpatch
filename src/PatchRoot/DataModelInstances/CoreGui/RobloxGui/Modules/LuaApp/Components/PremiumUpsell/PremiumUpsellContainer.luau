local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_LocaleProvider_0 = require(l_CorePackages_0.IAPExperience).Locale.LocaleProvider;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v9 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v10 = require(script.Parent.PremiumUpsellOverlay);
local v11 = require(script.Parent.Enum.PremiumUpsellTriggerContext);
local v12 = require(script.Parent.mapStateToProps);
local v13 = require(script.Parent.mapDispatchToProps);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v16 = v3.PureComponent:extend(script.Name);
v16.init = function(v17)
    v17.closeCentralOverlay = function()
        v17.props.navigation.goBack();
    end;
    v17.promptPremium = function()
        v17.endPurchase();
        v17.props.promptPremium();
    end;
    v17.cancelPurchase = function()
        v17.endPurchase();
        if v17.props.onCancel then
            v17.props.onCancel();
        end;
    end;
    v17.endPurchase = function()
        v17.props.navigation.goBack();
        if v17.props.onOverlayClosed then
            v17.props.onOverlayClosed();
        end;
    end;
    v17.sendAnalyticEvent = function(v18, v19, v20)
        v17.props.analytics.EventStream:setRBXEventStream(v18, v19, v20);
    end;
    v17.sendCounter = function(v21)
        local l_Diag_0 = v17.props.analytics.Diag;
        local v23 = v11.toRawValue(v17.props.triggerContext);
        l_Diag_0:reportCounter(v21, 1);
        l_Diag_0:reportCounter(v23 .. v21, 1);
    end;
end;
v16.didMount = function(v24)
    if not (v24.props.iapProductsFetchingStatus ~= v9.NotStarted) or v24.props.iapProductsFetchingStatus == v9.Failed then
        v24.props.dispatchFetchIAPProducts(v24.props.networking);
    end;
end;
v16.render = function(v25)
    return v3.createElement(l_LocaleProvider_0, {
        locale = l_LocalizationService_0.RobloxLocaleId
    }, {
        PremiumUpsellOverlay = v3.createElement(v10, {
            screenSize = v25.props.screenSize, 
            currencySymbol = if not v25.props.subscriptionProduct then nil else v25.props.subscriptionProduct.currencySymbol, 
            robuxPrice = if not v25.props.subscriptionProduct then nil else v25.props.subscriptionProduct.price, 
            robuxAmount = if not v25.props.subscriptionProduct then nil else v25.props.subscriptionProduct.robuxAmount, 
            iapProductsFetchingStatus = v25.props.iapProductsFetchingStatus, 
            promptPremium = v25.promptPremium, 
            cancelPurchase = v25.cancelPurchase, 
            endPurchase = v25.endPurchase, 
            sendAnalyticEvent = v25.sendAnalyticEvent, 
            sendCounter = v25.sendCounter, 
            eventPrefix = v11.toRawValue(v25.props.triggerContext), 
            dispatchCentralOverlay = v25.props.dispatchCentralOverlay
        })
    });
end;
return (v15((v14((l_RoactServices_0.connect({
    networking = v7, 
    analytics = v8
})((v4.connect(v12, v13)(v16))))))));
