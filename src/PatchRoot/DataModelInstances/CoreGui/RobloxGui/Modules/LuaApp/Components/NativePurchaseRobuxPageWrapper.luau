local _ = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local v10 = require(l_Modules_0.LuaApp.Components.GenericNativePageWrapper);
local v11 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v12 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v13 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v14 = require(l_Modules_0.LuaApp.Components.WebViewStub);
local v15 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.GetRobuxBalance);
local v16 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v17 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v18 = require(l_CorePackages_0.Roact);
local v19 = require(l_CorePackages_0.RoactRodux);
local v20 = v18.PureComponent:extend("NativePurchaseRobuxPageWrapper");
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
v20.defaultProps = {
    economyGetBalance = v15, 
    memStorageService = l_MemStorageService_0
};
v20.didMount = function(v22)
    v22.props.economyGetBalance(v22.props.networking):andThen(function(v23)
        local v24 = not not v23 and v23.responseBody.robux or "--";
        v22.props.memStorageService:SetItem(v4.RobuxBalance, v24);
        v22.props.memStorageService:SetItem(v4.RobuxBalanceLocalized, (v22.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", l_NumberLocalization_0.localize(v24, v22.props.localization:GetLocale()) or "--")));
    end);
    v22.connection = v22.props.memStorageService:bind(v4.RefreshRobuxBalance, function(_)
        v22.props.economyGetBalance(v22.props.networking):andThen(function(v26)
            local v27 = not not v26 and v26.responseBody.robux or "--";
            v22.props.memStorageService:SetItem(v4.RobuxBalance, v27);
            v22.props.memStorageService:SetItem(v4.RobuxBalanceLocalized, (v22.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", l_NumberLocalization_0.localize(v27, v22.props.localization:GetLocale()) or "--")));
        end);
    end);
end;
v20.willUnmount = function(v28)
    if v28.connection ~= nil then
        v28.connection:Disconnect();
        v28.connection = nil;
    end;
    if v28.props.nativeProductId then
        v28.props.onNativePurchaseAttempt(v28.props.networking, v28.props.nativeProductId);
    end;
end;
v20.render = function(v29)
    local l_isVisible_0 = v29.props.isVisible;
    local l_DisplayOrder_0 = v29.props.DisplayOrder;
    local l_url_0 = v29.props.url;
    local _ = v29.props.onClose;
    local l_transitionAnimation_0 = v29.props.transitionAnimation;
    if not l_default_0.isEnabled() then
        return v18.createElement(v10, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationType = v11.PURCHASE_ROBUX, 
            titleTextLocalizationKey = "Feature.BuyRobux.Heading.Banner", 
            transitionAnimation = l_transitionAnimation_0
        });
    elseif not v21() then
        return v18.createElement(v14, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0
        });
    else
        return v18.createElement(v12, {
            url = l_url_0, 
            titleKey = "Feature.BuyRobux.Heading.Banner", 
            windowType = v13.Dialog, 
            transitionAnimation = l_transitionAnimation_0, 
            overlayProps = {
                isVisible = l_isVisible_0, 
                DisplayOrder = l_DisplayOrder_0
            }
        });
    end;
end;
return (v19.connect(function(v35, _)
    return {
        nativeProductId = v35.NativePurchase.nativeProductId
    };
end, function(v37)
    return {
        onNativePurchaseAttempt = function(v38, v39)
            v37(v17(v38, v39, v16.Polling));
        end
    };
end)((l_RoactServices_0.connect({
    localization = v6, 
    networking = v8
})(v20))));
