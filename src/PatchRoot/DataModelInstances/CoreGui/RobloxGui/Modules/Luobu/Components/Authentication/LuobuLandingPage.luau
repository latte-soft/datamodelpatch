local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v10 = require(l_CorePackages_0.UIBlox);
local v11 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v10.Style.withStyle;
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local v14 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v15 = require(l_Modules_0.LuaApp.Themes.Colors);
local v16 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v20 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v21 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v22 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_AuthenticationProtocol_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol;
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v25 = require(l_Modules_0.LuaApp.Components.WeChatButton);
local v26 = require(l_Modules_0.LuaApp.Components.QQButton);
local v27 = require(l_Modules_0.Luobu.Thunks.RequestMSDKLogin);
local v28 = require(l_Modules_0.Luobu.Thunks.RequestTokenAuthentication);
local v29 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local v30 = require(l_Modules_0.LuaApp.Http.Requests.FetchUpdatedUserAgreements);
local v31 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginInProgress);
local v32 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginErrMessageKey);
local v33 = require(l_Modules_0.Luobu.Actions.SetTokenAuthErrMessageKey);
local v34 = require(l_Modules_0.Luobu.Actions.SetMSDKLoginOpenId);
local v35 = require(l_Modules_0.Luobu.Actions.SetSignUpInfo);
local v36 = v2.PureComponent:extend("LuobuLandingPage");
v36.validateProps = v11.strictInterface({
    loginInProgress = v11.boolean, 
    MSDKLoginErrMessageKey = v11.optional(v11.string), 
    tokenAuthErrMessageKey = v11.optional(v11.string), 
    requestMSDKLogin = v11.callback, 
    requestTokenAuthentication = v11.callback, 
    launchLuobuApp = v11.callback, 
    setMSDKLoginInProgress = v11.callback, 
    setMSDKLoginOpenId = v11.callback, 
    setSignUpInfo = v11.callback, 
    resetMSDKLoginErrMessageKey = v11.callback, 
    resetTokenAuthErrMessageKey = v11.callback, 
    resetSignUpInfo = v11.callback, 
    navigateToSignUpPage = v11.callback, 
    navigateBack = v11.callback, 
    showUserAgreementsPrompt = v11.callback, 
    showAlert = v11.callback, 
    networking = v11.callback, 
    analytics = v11.table, 
    authAnalytics = v11.table, 
    appPolicy = v11.table, 
    guiService = v11.table
});
v36.init = function(v37)
    v37.resetErrorMessages = function()
        v37.props.resetMSDKLoginErrMessageKey();
        v37.props.resetTokenAuthErrMessageKey();
    end;
    v37.shutdownApp = function()
        v37.props.guiService:BroadcastNotification("", v22.NATIVE_EXIT);
    end;
    v37.onLogin = function(v38)
        local l_analytics_0 = v37.props.analytics;
        local l_networking_0 = v37.props.networking;
        local l_appPolicy_0 = v37.props.appPolicy;
        local l_setMSDKLoginInProgress_0 = v37.props.setMSDKLoginInProgress;
        local l_setMSDKLoginOpenId_0 = v37.props.setMSDKLoginOpenId;
        local l_setSignUpInfo_0 = v37.props.setSignUpInfo;
        local l_launchLuobuApp_0 = v37.props.launchLuobuApp;
        local l_requestMSDKLogin_0 = v37.props.requestMSDKLogin;
        local l_requestTokenAuthentication_0 = v37.props.requestTokenAuthentication;
        local l_navigateToSignUpPage_0 = v37.props.navigateToSignUpPage;
        local l_navigateBack_0 = v37.props.navigateBack;
        v37:resetErrorMessages();
        l_setMSDKLoginInProgress_0(true);
        local v50, v51 = l_requestMSDKLogin_0(l_analytics_0, v38, l_networking_0, l_appPolicy_0):await();
        if v50 then
            l_setMSDKLoginOpenId_0(v51.openId);
            local v52, v53 = l_requestTokenAuthentication_0(l_networking_0, l_analytics_0, v38, v51):await();
            if v52 then
                if v53.voucher then
                    l_setSignUpInfo_0(v53.displayName, v53.voucher, v38, v51.channelId);
                    l_navigateToSignUpPage_0();
                    return ;
                else
                    l_launchLuobuApp_0(l_networking_0, l_analytics_0, l_appPolicy_0);
                    return ;
                end;
            else
                l_setMSDKLoginInProgress_0(false);
                if l_appPolicy_0.useMSDKWebAuthentication() then
                    l_navigateBack_0();
                end;
                return ;
            end;
        else
            l_setMSDKLoginInProgress_0(false);
            return ;
        end;
    end;
    v37.onWeChatButtonActivated = function()
        if not v37.props.loginInProgress then
            v37.props.authAnalytics.reportQQButtonClicked(v14.Context.LuobuLandingPage);
            v37.onLogin(l_AuthenticationProtocol_0.AuthMethods.WECHAT);
            return ;
        else
            return ;
        end;
    end;
    v37.onQQButtonActivated = function()
        if not v37.props.loginInProgress then
            v37.props.authAnalytics.reportQQButtonClicked(v14.Context.LuobuLandingPage);
            v37.onLogin(l_AuthenticationProtocol_0.AuthMethods.QQ);
            return ;
        else
            return ;
        end;
    end;
end;
v36.willUnmount = function(v54)
    v54.props.setMSDKLoginInProgress(false);
end;
v36.didMount = function(v55)
    v55.props.resetSignUpInfo();
    local v56, v57 = v30(v55.props.networking, v55.props.analytics):await();
    if not (v56 and type(v57) == "table") or next(v57) == nil then
        v55.props.showAlert("CommonUI.Messages.Label.Alert", "Luobu.Authentication.Message.UnknownErrorTryAgain", "Application.ConnectionError.Action.Ok", v55.shutdownApp);
        return ;
    else
        v55.props.showUserAgreementsPrompt(v57);
        return ;
    end;
end;
v36.render = function(v58)
    local v59;
    if v58.props.MSDKLoginErrMessageKey ~= "" then
        v59 = v58.props.MSDKLoginErrMessageKey;
        if v59 then
            goto label0;
        end;
    end;
    v59 = false;
    if v58.props.tokenAuthErrMessageKey ~= "" then
        v59 = v58.props.tokenAuthErrMessageKey;
    end;
    ::label0::;
    return l_withStyle_0(function(v60)
        return v13({
            logInTextWeChat = "Authentication.Login.Action.WeChatLogin", 
            logInTextQQ = "Authentication.Login.Action.QQLogin", 
            antiAddictionText = "Luobu.Authentication.Login.Label.AntiAddictionText", 
            networkLicense = "Luobu.Authentication.Login.Label.NetworkLicense", 
            tokenAuthFailure = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain", 
            localizedError = v59 ~= "" and v59 or nil
        })(function(v61)
            local l_loginInProgress_0 = v58.props.loginInProgress;
            return v2.createElement(v24, {
                ContentAlign = v16.Top, 
                LuobuLogoEnabled = true
            }, {
                LandingPageContents = v2.createElement("Frame", {
                    Size = UDim2.new(1, -40, 0, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, 10), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 36)
                    }), 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, 0), 
                        MaxSize = Vector2.new(360, math.huge)
                    }), 
                    AntiAddictionText = v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        TextColor3 = v60.Theme.SystemPrimaryDefault.Color, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v61.antiAddictionText, 
                        TextTransparency = 0.5, 
                        TextSize = v60.Font.BaseSize * v60.Font.Footer.RelativeMinSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    ErrorText = v2.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        TextColor3 = v15.Red, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v61.localizedError or "", 
                        Font = v60.Font.Footer.Font, 
                        TextSize = v60.Font.BaseSize * v60.Font.Footer.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }, {
                        UISizeConstraint = v2.createElement("UISizeConstraint", {
                            MinSize = Vector2.new(0, 10)
                        })
                    }), 
                    WeChatButton = v2.createElement(v25, {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = v61.logInTextWeChat, 
                        TextSize = v60.Font.BaseSize * v60.Font.Header1.RelativeSize, 
                        Color = v60.Theme.ContextualPrimaryDefault.Color, 
                        Transparency = v60.Theme.ContextualPrimaryDefault.Transparency, 
                        isDisabled = l_loginInProgress_0, 
                        isLoading = l_loginInProgress_0, 
                        onActivated = v58.onWeChatButtonActivated
                    }), 
                    QQButton = v2.createElement(v26, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 48), 
                        Text = v61.logInTextQQ, 
                        TextSize = v60.Font.BaseSize * v60.Font.Header1.RelativeSize, 
                        Color = v60.Theme.TextLink.Color, 
                        Transparency = v60.Theme.TextLink.Transparency, 
                        isDisabled = l_loginInProgress_0, 
                        isLoading = l_loginInProgress_0, 
                        onActivated = v58.onQQButtonActivated
                    }), 
                    NetworkLicense = v2.createElement("TextLabel", {
                        LayoutOrder = 5, 
                        TextColor3 = v60.Theme.SystemPrimaryDefault.Color, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = v61.networkLicense, 
                        TextTransparency = 0.5, 
                        TextSize = v60.Font.BaseSize * v60.Font.Footer.RelativeMinSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
        end);
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v63, _)
    return {
        appPolicy = v63
    };
end)((l_RoactServices_0.connect({
    networking = v5, 
    analytics = v7, 
    authAnalytics = v8, 
    guiService = l_AppGuiService_0
})((v3.connect(function(v65, _)
    return {
        loginInProgress = v65.Luobu.MSDKAuth.loginInProgress, 
        MSDKLoginErrMessageKey = v65.Luobu.MSDKAuth.MSDKLoginErrMessageKey, 
        tokenAuthErrMessageKey = v65.Luobu.MSDKAuth.tokenAuthErrMessageKey
    };
end, function(v67)
    return {
        requestMSDKLogin = function(v68, v69, v70, v71)
            return v67(v27(v68, v69, v70, v71));
        end, 
        requestTokenAuthentication = function(v72, v73, v74, v75)
            return v67(v28(v72, v73, v74, v75));
        end, 
        launchLuobuApp = function(v76, v77, v78)
            return v67(v29(v76, v77, v78));
        end, 
        setMSDKLoginInProgress = function(v79)
            return v67(v31(v79));
        end, 
        resetMSDKLoginErrMessageKey = function()
            return v67(v32(""));
        end, 
        resetTokenAuthErrMessageKey = function()
            return v67(v33(""));
        end, 
        setMSDKLoginOpenId = function(v80)
            return v67(v34(v80));
        end, 
        setSignUpInfo = function(v81, v82, v83, v84)
            return v67(v35(v81, v82, v83, v84));
        end, 
        resetSignUpInfo = function()
            return v67(v35("", "", "", ""));
        end, 
        navigateToSignUpPage = function()
            return v67(v18({
                name = v17.LuobuSignUpPage
            }));
        end, 
        showUserAgreementsPrompt = function(v85)
            v67(v21(v20.UserAgreementsPrompt, {
                agreements = v85
            }));
        end, 
        navigateBack = function()
            v67(v19());
        end, 
        showAlert = function(v86, v87, v88, v89)
            v67(v21(v20.SimpleTextAlertPrompt, {
                titleKey = v86, 
                bodyTextKey = v87, 
                confirmButtonTextKey = v88, 
                confirmButtonCallback = v89
            }));
        end
    };
end)(v36))))));
