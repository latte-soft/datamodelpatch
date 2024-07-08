local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local v14 = require(l_Modules_0.LuaApp.Components.LoadingBar);
local v15 = require(l_Modules_0.LuaApp.Components.FitImageTextButton);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchAccountSettings);
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v18 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v19 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v23 = v5.PureComponent:extend("WeChatLoginWrapper");
v23.init = function(v24)
    v24.state = {
        showingBrowser = true, 
        hasAuthenticated = false
    };
    v24.openWWWLogin = function()
        l_BrowserService_0:OpenWeChatAuthWindow();
        v24:setState({
            showingBrowser = true
        });
    end;
    v24.onBrowserWindowClosed = function()
        v24:setState({
            showingBrowser = false
        });
    end;
    v24.onAuthTokenUpdated = function()
        v24.props.launchApp(v24.props.networking, v24.props.omniRecommendationsRequest, v24.props.analytics, v24.props.appPolicy);
    end;
    v24.onJavascriptCallback = function(v25)
        local v26 = l_HttpService_0:JSONDecode(v25);
        if v26.moduleID ~= "Navigation" then
            return ;
        elseif v26.functionName ~= "navigateToFeature" then
            return ;
        else
            local l_feature_0 = v26.params.params.feature;
            if not (l_feature_0 ~= "login") or l_feature_0 == "signUp" then
                l_BrowserService_0:CopyAuthCookieFromBrowserToEngine();
                l_BrowserService_0:CloseBrowserWindow();
                spawn(function()
                    v24:setState({
                        hasAuthenticated = true
                    });
                end);
            end;
            return ;
        end;
    end;
end;
v23.didMount = function(_)
    l_BrowserService_0:OpenWeChatAuthWindow();
end;
v23.render = function(v29)
    local l_appTheme_0 = v29.props.appTheme;
    local l_localization_0 = v29.props.localization;
    local v32 = {
        BrowserWindowClosedConnection = v5.createElement(v11, {
            event = l_BrowserService_0.BrowserWindowClosed, 
            callback = v29.onBrowserWindowClosed
        }), 
        AuthCookieCopiedToEngineConnection = v5.createElement(v11, {
            event = l_BrowserService_0.AuthCookieCopiedToEngine, 
            callback = v29.onAuthTokenUpdated
        }), 
        JavaScriptCallbackConnection = v5.createElement(v11, {
            event = l_BrowserService_0.JavaScriptCallback, 
            callback = v29.onJavascriptCallback
        })
    };
    local function v34(v33)
        if not v29.state.showingBrowser and not v29.state.hasAuthenticated then
            v32.LoginButton = v5.createElement(v15, {
                backgroundColor = l_appTheme_0.Authentication.WeChatButton.Background.Color, 
                backgroundImage = "LuaApp/buttons/buttonFill", 
                sliceCenter = Rect.new(8, 8, 9, 9), 
                maxWidth = 200, 
                minWidth = 50, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                horizontalPadding = 30, 
                verticalPadding = 9, 
                iconRightPadding = 5, 
                text = v33.loginText, 
                textColor = l_appTheme_0.Authentication.WeChatButton.Text.Color, 
                textFont = l_appTheme_0.Authentication.WeChatButton.Text.Font, 
                textSize = l_appTheme_0.Authentication.WeChatButton.Text.Size, 
                onActivated = v29.openWWWLogin
            });
        else
            v32.LoadingBar = v5.createElement(v14);
        end;
        return v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v4.Color.GRAY4, 
            ZIndex = 1
        }, v32);
    end;
    if not v21() then
        return v34({
            loginText = l_localization_0:Format("Authentication.Login.Action.WeChatLogin")
        });
    else
        return v13({
            loginText = "Authentication.Login.Action.WeChatLogin"
        })(v34);
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v35, _)
    return {
        appPolicy = v35
    };
end)((l_RoactServices_0.connect({
    networking = v8, 
    analytics = v9, 
    localization = v10, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})((v6.connect(function(_, _)
    return {};
end, function(v39)
    return {
        fetchAccountSettings = function(v40, v41, v42)
            v39(v16(v40, v41, v42));
        end, 
        launchApp = function(v43, v44, v45, v46)
            v39(v17(v43, v44, v45, v46, v18.Login));
        end
    };
end)((v19(v23))))))));
