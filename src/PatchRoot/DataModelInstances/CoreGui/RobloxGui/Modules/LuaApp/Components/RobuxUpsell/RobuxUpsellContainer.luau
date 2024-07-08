local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local l_LocaleProvider_0 = require(l_CorePackages_0.IAPExperience).Locale.LocaleProvider;
local v13 = require(script.Parent.RobuxUpsellOverlay);
local v14 = require(script.Parent.mapStateToProps);
local v15 = require(script.Parent.mapDispatchToProps);
local v16 = require(script.Parent.Enum.RobuxUpsellTriggerContext);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v19 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v20 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagGuardTermOfUseByIsLinkAllowed);
local v23 = v4.PureComponent:extend(script.Name);
local v24 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
v23.init = function(v25)
    v25.openSecuritySettings = function()
        v25.endPurchase();
        v25.props.openSecuritySettings();
    end;
    v25.openBuyRobux = function()
        v25.endPurchase();
        v25.props.openBuyRobux();
    end;
    v25.endPurchase = function()
        v25.props.navigation.goBack();
        v25.props.endPurchase();
        if v25.props.onOverlayClosed then
            v25.props.onOverlayClosed();
        end;
    end;
    v25.sendAnalyticEvent = function(v26, v27, v28)
        v25.props.analytics.EventStream:setRBXEventStream(v26, v27, v28);
    end;
    v25.sendCounter = function(v29)
        local l_Diag_0 = v25.props.analytics.Diag;
        local v31 = v16.toRawValue(v25.props.triggerContext);
        l_Diag_0:reportCounter(v29, 1);
        l_Diag_0:reportCounter(v31 .. v29, 1);
        local v32 = v19.toRawValue(v20());
        l_Diag_0:reportCounter(v29 .. v32, 1);
        l_Diag_0:reportCounter(v31 .. v29 .. v32, 1);
    end;
    v25.handleOpenTermsOfUseOpen = function()
        if v25.props.disableWebViewSupport == true then
            v25.props.linking:openURL(v24.static.about.terms());
            return ;
        else
            v25.props.openTermsOfUse();
            return ;
        end;
    end;
end;
v23.isLinkAllowed = function(_)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v35 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
        v35 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
            v35 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Linux;
        end;
    end;
    return v35;
end;
v23.render = function(v36)
    return v4.createElement(l_LocaleProvider_0, {
        locale = l_LocalizationService_0.RobloxLocaleId
    }, {
        RobuxUpsellOverlay = v4.createElement(v13, {
            screenSize = v36.props.screenSize, 
            networking = v36.props.networking, 
            userId = v36.props.userId, 
            dispatchFetchRobuxProduct = function()
                return v36.props.dispatchFetchRobuxProduct(v36.props.networking, v36.props.userRobux, v36.props.priceInRobux);
            end, 
            dispatchFetchIAPPurchaseWarning = function(v37, v38)
                if not v21() then
                    return v36.props.dispatchFetchIAPPurchaseWarning(v36.props.networking, v37);
                else
                    return v36.props.dispatchFetchIAPPurchaseWarning(v36.props.networking, v37, v38, v36.props.isPremium);
                end;
            end, 
            dispatchPostAckPurchaseWarning = function(v39)
                return v36.props.dispatchPostAckPurchaseWarning(v36.props.networking, v39);
            end, 
            dispatchCentralOverlay = v36.props.dispatchCentralOverlay, 
            iapPurchase = v36.props.iapPurchase, 
            itemIcon = v36.props.itemIcon, 
            itemName = v36.props.itemName, 
            beforeRobuxBalance = v36.props.userRobux, 
            priceInRobux = v36.props.priceInRobux, 
            endPurchase = v36.endPurchase, 
            promptRobux = v36.props.promptRobux, 
            openTermsOfUse = if not v22() then v36.handleOpenTermsOfUseOpen else v36:isLinkAllowed() and v36.handleOpenTermsOfUseOpen or nil, 
            openSecuritySettings = v36.openSecuritySettings, 
            openBuyRobux = v36.openBuyRobux, 
            renderChallenge = v36.props.renderChallenge, 
            purchaseItem = v36.props.purchaseItem, 
            equipItem = v36.props.equipItem, 
            sendAnalyticEvent = v36.sendAnalyticEvent, 
            sendCounter = v36.sendCounter, 
            eventPrefix = v16.toRawValue(v36.props.triggerContext)
        })
    });
end;
return (l_withNavigation_0((v18((v17((l_RoactServices_0.connect({
    networking = v9, 
    analytics = v10, 
    linking = l_AppLinking_0
})((l_RoactAppPolicy_0.connect(function(v40, _)
    return {
        disableWebViewSupport = not v40.getWebViewSupport(), 
        enablePremiumUserFeatures = v40.getEnablePremiumUserFeatures()
    };
end)((v5.connect(v14, v15)(v23))))))))))));
