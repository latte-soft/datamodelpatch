local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_CorePackages_0.RoactNavigation);
local l_withNavigation_0 = v10.withNavigation;
local l_LocaleProvider_0 = require(l_CorePackages_0.IAPExperience).Locale.LocaleProvider;
local _ = require(script.Parent.RobuxPackage);
local v14 = require(script.Parent.BuyRobuxOverlay);
local v15 = require(script.Parent.mapStateToProps);
local v16 = require(script.Parent.mapDispatchToProps);
local _ = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local _ = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v19 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v20 = require(script.Parent.Enum.BuyRobuxCounter);
local v21 = v3.PureComponent:extend(script.Name);
local _ = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default;
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixRobuxBalanceUpdateOnBuyRobuxPage);
v21.init = function(v26)
    local _ = v26.props;
    v26.endPurchase = function()
        v26.props.dispatchClearNativePurchaseResult();
    end;
    v26.sendAnalyticEvent = function(v28, v29, v30)
        v26.props.analytics.EventStream:setRBXEventStream(v28, v29, v30);
    end;
    v26.sendCounter = function(v31)
        v26.props.analytics.Diag:reportCounter(v31, 1);
    end;
    v26.dispatchFetchIAPPurchaseWarning = function(v32, v33)
        return v26.props.dispatchFetchIAPPurchaseWarning(v26.props.networking, v32, v33, v26.props.isPremium);
    end;
    v26.dispatchPostAckPurchaseWarning = function(v34)
        return v26.props.dispatchPostAckPurchaseWarning(v26.props.networking, v34);
    end;
    v26.onWillBlur = function()
        l_default_0:isAvailable():andThen(function(v35)
            if v35 then
                l_default_0:sendIAPEvent("BrowseProductEnd");
            end;
        end);
    end;
end;
v21.didMount = function(v36)
    local l_props_1 = v36.props;
    if not (v36.props.iapProductsFetchingStatus ~= v19.NotStarted) or v36.props.iapProductsFetchingStatus == v19.Failed then
        v36.props.dispatchFetchIAPProducts(v36.props.networking);
    end;
    if not (v36.props.nativeProductsFetchingStatus ~= v19.NotStarted) or v36.props.nativeProductsFetchingStatus == v19.Failed then
        v36.props.dispatchFetchNativeIAPProducts();
    end;
    l_default_0:isAvailable():andThen(function(v38)
        if v38 then
            l_default_0:sendIAPEvent("BrowseProductStart");
        end;
    end);
    if v25() then
        l_props_1.dispatchFetchUserBalance(v36.props.networking, (tostring(v36.props.userId)));
    end;
end;
v21.didUpdate = function(v39, v40)
    local l_props_2 = v39.props;
    if l_props_2.iapProductsFetchingStatus ~= v40.iapProductsFetchingStatus and l_props_2.iapProductsFetchingStatus == v19.Failed then
        v39.sendCounter(v20.toRawValue(v20.InvalidProducts));
    end;
    local v42 = false;
    if l_props_2.iapProductsFetchingStatus == v19.Done then
        v42 = l_props_2.nativeProductsFetchingStatus == v19.Done;
    end;
    if v42 and #l_props_2.robuxPackages == 0 then
        l_default_0:isAvailable():andThen(function(v43)
            if v43 then
                l_default_0:sendIAPEvent("ProductNotAvailable");
            end;
        end);
        v39.props.dispatchNavigateBack();
    end;
end;
v21.render = function(v44)
    local _ = v44.props;
    return v3.createElement(l_LocaleProvider_0, {
        locale = l_LocalizationService_0.RobloxLocaleId
    }, {
        navigationEvents = v3.createElement(v10.NavigationEvents, {
            onWillBlur = v44.onWillBlur
        }), 
        BuyRobuxOverlay = v3.createElement(v14, {
            screenSize = v44.props.screenSize, 
            networking = v44.props.networking, 
            robuxBalance = v44.props.robuxBalance, 
            robuxPackages = v44.props.robuxPackages, 
            iapPurchase = v44.props.iapPurchase, 
            iapProductsFetchingStatus = v44.props.iapProductsFetchingStatus, 
            nativeProductsFetchingStatus = v44.props.nativeProductsFetchingStatus, 
            dispatchFetchIAPPurchaseWarning = v44.dispatchFetchIAPPurchaseWarning, 
            dispatchPostAckPurchaseWarning = v44.dispatchPostAckPurchaseWarning, 
            dispatchCentralOverlay = v44.props.dispatchCentralOverlay, 
            endPurchase = v44.endPurchase, 
            promptRobux = v44.props.promptRobux, 
            sendAnalyticEvent = v44.sendAnalyticEvent, 
            sendCounter = v44.sendCounter, 
            eventPrefix = "", 
            onPageClose = v44.props.dispatchNavigateBack
        })
    });
end;
v21 = v4.connect(v15, v16)(v21);
if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
    v21 = l_RoactAppPolicy_0.connect(function(v46, _)
        return {
            enablePremiumUserFeatures = v46.getEnablePremiumUserFeatures()
        };
    end)(v21);
end;
return (l_withNavigation_0((l_RoactServices_0.connect({
    networking = v8, 
    analytics = v9, 
    linking = l_AppLinking_0
})(v21))));
