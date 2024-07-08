local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = require(l_CorePackages_0.Cryo);
local v12 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v12.App.Button.Button;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local v15 = require(l_Modules_0.LuaApp.AppPage);
local v16 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v18 = require(l_Modules_0.LuaApp.Components.Authentication.TenFootLogoWithContentsLayout);
local v19 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local v20 = require(l_Modules_0.LuaApp.Components.SecondaryButtonRetheme);
local v21 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v22 = require(l_Modules_0.LuaApp.FitChildren);
local v23 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchSignUpBundles);
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.VideoWithContentsLayout);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVideoLanding);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v31 = require(l_Modules_0.LuaApp.Components.Authentication.useLandingPageNavigationBindings);
local v32 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v33 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v34 = require(l_Modules_0.LuaApp.FlagSettings);
local v35 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitcher);
local _ = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.GetAccountsList);
local v37 = require(l_Modules_0.LuaApp.Flags.FFlagShouldLinkBrowserTrackerToDevice);
local v38 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v39 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v40 = require(l_Modules_0.LuaApp.Flags.FFlagBypassIXPKoreaCompliance);
local v41 = require(l_Modules_0.LuaApp.Flags.FFlagBypassGUACKoreaCompliance);
local v42 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaLoginRevamp);
local v43 = require(l_Modules_0.LuaApp.Http.Requests.PostAssociateBrowserTrackerToDevice);
local v44 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtLandingEnabled);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v46 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDoraemonLanding);
local v47 = require(l_Modules_0.LuaApp.Flags.GetFStringDoraemonGameId);
local v48 = require(l_Modules_0.LuaApp.Experiment.AppBtidLayers);
local v49 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v50 = require(l_Modules_0.LuaApp.Flags.GetFFlagMultiPageSignupDevOverride);
local v51 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v52 = v2.PureComponent:extend("LandingPage");
v52.init = function(v53)
    v53.state = {
        shouldShowAccountSwitcherButton = false, 
        isFromDoraemonLink = false
    };
    local v54 = l_LinkingProtocol_0:getLastLuaURL();
    if not (not (v54 and tostring((v47())) ~= nil) or not string.find(v54, v47())) then
        v53:setState({
            isFromDoraemonLink = true
        });
    end;
    v53.navigateToSignUp = function()
        local l_networking_0 = v53.props.networking;
        local l_analytics_0 = v53.props.analytics;
        local l_fetchSignUpBundles_0 = v53.props.fetchSignUpBundles;
        local l_navigateToSinglePageSignUp_0 = v53.props.navigateToSinglePageSignUp;
        local l_navigateToBirthdayPage_0 = v53.props.navigateToBirthdayPage;
        l_analytics_0.reportSignUpButtonClicked(v33.Context.LandingScreen);
        if not v50() and not v53.props.shouldShowMultipageSignupDirectionalTest then
            if not v34.SinglePageSignUpEnabled() then
                l_fetchSignUpBundles_0(l_networking_0);
                l_navigateToBirthdayPage_0();
                return ;
            else
                l_navigateToSinglePageSignUp_0();
                return ;
            end;
        else
            l_navigateToBirthdayPage_0();
            return ;
        end;
    end;
    v53.openAccountSwitcher = function()
        if v38 == true then
            local v60 = v24.getAccountBlob();
            local function v63(v61)
                local v62 = false;
                if v61 ~= nil then
                    v62 = v61 > 0;
                end;
                v53:setState({
                    shouldShowAccountSwitcherButton = v62
                });
            end;
            if v60 and v60 ~= "" then
                v53.props.showAccountSwitcher(v53.props.networking, v63, v53.props.analytics);
            end;
        end;
    end;
    v53.getShouldShowKISAAgreements = function()
        return (v39 and (v53.props.useKoreaKISAUserAgreementPopup or v41)) and (v53.props.shouldShowKoreanKISASignUpFlow or v40);
    end;
    if v37() then
        v43(v53.props.networking):catch(function()
        end);
    end;
end;
v52.render = function(v64)
    return v9({
        signUpText = "Authentication.SignUp.Label.SignUp", 
        logInText = "Authentication.Login.Action.LogInCapitalized", 
        switchAccountsText = "Authentication.AccountSwitch.Action.SwitchAccount", 
        doraemonExperienceText = "Feature.Landing.Heading.DoraemonExperience"
    })(function(v65)
        local l_LandingPage_0 = v64.props.tokens.LuaApps.LandingPage;
        local v67 = v64.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        local v68 = if not v67 then v17 else v18;
        local v69 = ((v46() and v64.state.isFromDoraemonLink) and v64.props.doraemonExperimentEnabled) and v64.props.formFactor == l_FormFactor_0.COMPACT;
        local v70 = v26() and v64.props.landingVideoEnabled;
        if v70 then
            v68 = v25;
        end;
        local l_createElement_0 = v2.createElement;
        local l_v68_0 = v68;
        local v73 = {
            ContentAlign = if not v67 and v64.props.formFactor == l_FormFactor_0.COMPACT then v32.Bottom else v32.Top, 
            ref = v64.props.eventHandlerRef, 
            VNAgeBadgeEnabled = v64.props.showVNGAge12Badge, 
            IsDoraemonLanding = v69, 
            screenSize = if not v26() then nil else v64.props.screenSize, 
            statusBarHeight = if not v26() then nil else v64.props.statusBarHeight, 
            globalGuiInset = if not v26() then nil else v64.props.globalGuiInset, 
            formFactor = if not v26() then nil else v64.props.formFactor
        };
        local v74 = {};
        local l_createElement_1 = v2.createElement;
        local l_FitFrame_0 = v22.FitFrame;
        local v77 = {
            Size = UDim2.new(1, -40, 0, 0), 
            fitAxis = v22.FitAxis.Height, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            ref = v64.props.ref
        };
        local v78 = {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, l_LandingPage_0.contentPadding), 
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
                MaxSize = Vector2.new(l_LandingPage_0.buttonWidth, math.huge)
            }), 
            DoraemonText = if not v69 then nil else v2.createElement("TextLabel", {
                LayoutOrder = 0, 
                Size = UDim2.new(1, 0, 0, l_LandingPage_0.buttonHeight), 
                Text = v65.doraemonExperienceText, 
                TextColor3 = v64.props.tokens.Semantic.Color.Text.Emphasis.Color3, 
                TextSize = v64.props.tokens.Semantic.Typography.Subheader.FontSize * 1.5, 
                Font = v64.props.tokens.Semantic.Typography.Subheader.Font, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom, 
                BackgroundTransparency = 1
            }), 
            SignUpButton = if v69 or v70 then v2.createElement(l_Button_0, {
                layoutOrder = 1, 
                size = UDim2.new(1, 0, 0, l_LandingPage_0.buttonHeight), 
                text = v65.signUpText, 
                onActivated = v64.navigateToSignUp, 
                buttonType = l_ButtonType_0.PrimaryContextual
            }) else v2.createElement(v19, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, l_LandingPage_0.buttonHeight), 
                Text = v65.signUpText, 
                onActivated = v64.navigateToSignUp, 
                TextSize = if not v67 then nil else l_LandingPage_0.buttonTextSize
            })
        };
        local v79 = false;
        if v38 == true then
            v79 = v64.state.shouldShowAccountSwitcherButton and v2.createElement(v20, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_LandingPage_0.buttonHeight), 
                Text = v65.switchAccountsText, 
                TextSize = if not v67 then nil else l_LandingPage_0.buttonTextSize, 
                onActivated = function()
                    v64.props.analytics.reportSwitchAccountButtonClicked(v33.Context.LandingScreen);
                    v64.openAccountSwitcher();
                end
            });
        end;
        v78.AccountSwitchButton = v79;
        v78.LoginButton = if v69 then v2.createElement(l_Button_0, {
            layoutOrder = 3, 
            size = UDim2.new(1, 0, 0, l_LandingPage_0.buttonHeight), 
            text = v65.logInText, 
            onActivated = function()
                v64.props.analytics.reportLogInButtonClicked(v33.Context.LandingScreen);
                v64.props.gotoLogin();
            end, 
            buttonType = l_ButtonType_0.PrimarySystem
        }) else v2.createElement(v20, {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, l_LandingPage_0.buttonHeight), 
            Text = v65.logInText, 
            TextSize = if not v67 then nil else l_LandingPage_0.buttonTextSize, 
            onActivated = function()
                v64.props.analytics.reportLogInButtonClicked(v33.Context.LandingScreen);
                v64.props.gotoLogin();
            end
        });
        v78.DisclaimerLinks = if (v64.props.useVNGUserAgreementPopup or v64.getShouldShowKISAAgreements()) or v67 then nil else v2.createElement(v21, {
            LayoutOrder = 4
        });
        v74.LandingPageContents = l_createElement_1(l_FitFrame_0, v77, v78);
        return l_createElement_0(l_v68_0, v73, v74);
    end);
end;
v52.didMount = function(v80)
    v80.openAccountSwitcher();
    if not v26() then
        v80.props.analytics.reportAuthPageload(v33.Context.LandingScreenVideo, (tostring(false)));
    else
        v80.props.analytics.reportAuthPageload(v33.Context.LandingScreenVideo, (tostring(true)));
    end;
    v80.props.loggingProtocol:logEventOnce("landing_page_did_mount");
    if v44() then
        v80.props.analytics.reportAuthPageload(v33.Context.LandingScreen, (l_LinkingProtocol_0:getLastLuaURL()));
    end;
end;
local v91 = l_RoactServices_0.connect({
    networking = v7, 
    guiService = l_AppGuiService_0, 
    analytics = v8, 
    loggingProtocol = l_AppLogging_0
})((l_RoactAppPolicy_0.connect(function(v81, _)
    return {
        showVNGAge12Badge = v81.getShowVNGAge12Badge(), 
        useVNGUserAgreementPopup = v81.getUseVNGUserAgreementPopup(), 
        useKoreaKISAUserAgreementPopup = v81.getUseKoreaKISAUserAgreementPopup()
    };
end)((v3.connect(function(v83, _)
    return {
        formFactor = v83.FormFactor, 
        screenSize = v83.ScreenSize, 
        statusBarHeight = v83.TopBar.statusBarHeight, 
        globalGuiInset = v83.GlobalGuiInset
    };
end, function(v85)
    return {
        fetchSignUpBundles = function(v86)
            return v85(v23.Fetch(v86));
        end, 
        navigateToSinglePageSignUp = function()
            v85(v16({
                name = v15.SinglePageSignUp
            }));
        end, 
        navigateToBirthdayPage = function()
            v85(v16({
                name = v15.Birthday
            }));
        end, 
        gotoLogin = function()
            if not v42 then
                v85(v16({
                    name = v15.Login
                }));
                return ;
            else
                v85(v16({
                    name = v15.LoginV2
                }));
                return ;
            end;
        end, 
        showAccountSwitcher = function(v87, v88, v89)
            v85(v35(true, v87, v33.Origin.LandingScreen, v89)):andThen(function(v90)
                if not (not (v90 ~= nil) or not v88) then
                    v88(v90);
                end;
            end);
        end
    };
end)(v52)))));
v52 = function(v92)
    return v2.createElement(v91, v11.Dictionary.join({
        uiModeInfo = l_useUiModeInfo_0(), 
        tokens = l_useDesignTokens_0(), 
        eventHandlerRef = v31()
    }, v92));
end;
if not (not v46() and not v26()) then
    v52 = v49.connectBrowserTrackerLayer({
        v48.LandingLayer
    }, function(v93, _)
        local v95 = v93[v48.LandingLayer] or {};
        return {
            doraemonExperimentEnabled = v95.doraemonExperimentEnabled, 
            landingVideoEnabled = v95.landingVideoEnabled
        };
    end)(v52);
end;
if not (not v51() and not v39) then
    v52 = v49.connectBrowserTrackerLayer({
        v48.SignupLayer
    }, function(v96, _)
        local v98 = v96[v48.SignupLayer] or {};
        return {
            shouldShowMultipageSignupDirectionalTest = v98.shouldShowMultipageSignupDirectionalTest, 
            shouldShowKoreanKISASignUpFlow = v98.shouldShowKoreanKISASignUpFlow
        };
    end)(v52);
end;
return v52;
