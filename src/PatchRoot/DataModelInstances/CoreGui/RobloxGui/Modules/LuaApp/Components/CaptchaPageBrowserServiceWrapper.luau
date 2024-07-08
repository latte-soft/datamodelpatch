local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local v6 = require(l_Modules_0.Common.Roact);
local v7 = require(l_Modules_0.Common.RoactRodux);
local v8 = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v11 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v12 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v13 = require(l_Modules_0.LuaApp.Http.Url);
local v14 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v15 = tonumber(settings():GetFVariable("CaptchaTimeout"));
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigationCaptcha);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper);
local v18 = v6.PureComponent:extend("CaptchaPageBrowserServiceWrapper");
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
game:DefineFastFlag("UsingCaptchaCDN", false);
v18.defaultProps = {
    webViewVisible = true, 
    backNavigationDisabledWhileLoading = false
};
v18.init = function(v20)
    v20.state = {
        webViewVisible = v20.props.webViewVisible
    };
    v20.captchaSuccess = false;
    v20.captchaData = nil;
    v20.timerCancelled = false;
    if v20.props.backNavigationDisabledWhileLoading then
        v20.props.setBackNavigationDisabled(true);
    end;
    if v15 > 0 then
        spawn(function()
            local v21 = 0;
            while true do
                if v21 < v15 then
                    wait(1);
                    v21 = v21 + 1;
                    if v20.timerCancelled then
                        return ;
                    end;
                else
                    if v20.props.backNavigationDisabledWhileLoading then
                        v20.props.setBackNavigationDisabled(false);
                    end;
                    if v20.props.analytics ~= nil and v20.props.analytics.Diag ~= nil then
                        v20.props.analytics.Diag:reportCounter("CaptchaPageBrowserServiceWrapper_Timeout", 1);
                    end;
                    v20.props.navigation.goBack();
                    return ;
                end;
            end;
        end);
    end;
    v20.getPlatformString = function()
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v23 = "unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
            return "android";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "ios";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
            return "uwp";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
                v23 = "xbox";
            end;
            return v23;
        end;
    end;
    v20.getCaptchaDxBlob = function(v24, v25)
        if not (v25 ~= nil) or v25.dxBlob == nil then
            if v25.analytics ~= nil then
                v25.analytics.EventStream:setRBXEventStream("captcha", "captchaDxBlobNotSet", {
                    captchaType = v24
                });
            end;
            return "";
        else
            return v25.dxBlob;
        end;
    end;
    v20.getCaptchaId = function(v26)
        if not (v26 ~= nil) or v26.captchaId == nil then
            return "";
        else
            return v26.captchaId;
        end;
    end;
end;
v18.willUnmount = function(v27)
    v27.timerCancelled = true;
    local l_captchaCallback_0 = v27.props.captchaCallback;
    if not v27.captchaSuccess then
        v27.props.setCurrentToastMessage(v12.NetworkingError, "Authentication.Login.Response.SomethingWentWrong");
    end;
    if l_captchaCallback_0 then
        l_captchaCallback_0(v27.captchaSuccess, v27.captchaData);
    end;
end;
v18.render = function(v29)
    local l_isVisible_0 = v29.props.isVisible;
    local l_DisplayOrder_0 = v29.props.DisplayOrder;
    local l_captchaType_0 = v29.props.captchaType;
    local l_cvalueType_0 = v29.props.cvalueType;
    local l_cvalue_0 = v29.props.cvalue;
    local l_backNavigationDisabledWhileLoading_0 = v29.props.backNavigationDisabledWhileLoading;
    local v36 = nil;
    if l_captchaType_0 == "login" then
        local v37 = v29.getCaptchaDxBlob(l_captchaType_0, v29.props);
        v36 = string.format("%scaptcha/app/login?hybrid-return-token=1&credentialsType=%s&credentialsValue=%s&data-exchange-blob=%s", v13.WWW_URL, l_cvalueType_0, l_cvalue_0, v37);
        v36 = string.format("%scaptcha/app/login?hybrid-return-token=1&credentialsType=%s&credentialsValue=%s&data-exchange-blob=%s&hybrid-return-captcha-id=%s", v13.WWW_URL, l_cvalueType_0, l_cvalue_0, v37, (v29.getCaptchaId(v29.props)));
    else
        local v38 = v29.getCaptchaDxBlob(l_captchaType_0, v29.props);
        v36 = string.format("%scaptcha/app/signup?hybrid-return-token=1&data-exchange-blob=%s", v13.WWW_URL, v38);
        v36 = string.format("%scaptcha/app/signup?hybrid-return-token=1&data-exchange-blob=%s&hybrid-return-captcha-id=%s", v13.WWW_URL, v38, (v29.getCaptchaId(v29.props)));
    end;
    if game:GetFastFlag("UsingCaptchaCDN") then
        v36 = string.format("%s&appType=%s", string.gsub(string.gsub(v36, v13.WWW_URL, v13.STATIC_URL), "captcha/", "captcha/cdn/"), v29.getPlatformString());
    end;
    return v6.createElement(v9, {
        backNavigationHandledByParent = v16(), 
        isVisible = l_isVisible_0 and v29.state.webViewVisible, 
        modal = true, 
        webViewVisible = v29.state.webViewVisible, 
        displayOrder = l_DisplayOrder_0, 
        url = v36, 
        windowClosedCallback = function()
            if l_backNavigationDisabledWhileLoading_0 then
                v29.props.setBackNavigationDisabled(false);
            end;
            v29.timerCancelled = true;
            if not (v17() and l_default_0.isEnabled()) then
                v29.props.navigation.goBack();
            end;
        end, 
        javaScriptCallback = function(v39)
            if l_backNavigationDisabledWhileLoading_0 then
                v29.props.setBackNavigationDisabled(false);
            end;
            local v40 = l_HttpService_0:JSONDecode(v39);
            if not ((not (v40.moduleID == v14.Module.Navigation and v40.functionName == v14.Function.navigateToFeature) or not v40.params) or not v40.params.params) then
                v29.timerCancelled = true;
                if v29.props.analytics ~= nil and v29.props.analytics.Diag ~= nil then
                    v29.props.analytics.Diag:reportCounter("CaptchaPageBrowserServiceWrapper_NotTimeout", 1);
                end;
                if v40.params.params.feature == v14.Feature.CaptchaSuccess then
                    v29.captchaSuccess = true;
                    v29.captchaData = v40.params.params.captchaData;
                    v29.props.navigation.goBack();
                    return ;
                elseif v40.params.params.feature == v14.Feature.CaptchaShown then
                    v29:setState({
                        webViewVisible = true
                    });
                end;
            end;
        end
    });
end;
return v7.connect(nil, function(v41)
    return {
        setCurrentToastMessage = function(v42, v43)
            return v41(v10({
                toastType = v42, 
                toastMessage = v43
            }));
        end, 
        setBackNavigationDisabled = function(v44)
            return v41(v11(v44));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v19
})((v8.withNavigation(v18)))));
