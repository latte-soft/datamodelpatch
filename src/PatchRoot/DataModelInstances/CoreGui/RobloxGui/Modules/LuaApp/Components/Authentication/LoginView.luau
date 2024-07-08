local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("ProximityPromptService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local _ = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v10 = require(l_CorePackages_0.Cryo);
local l_Common_0 = l_Modules_0.Common;
local v12 = require(l_Common_0.Roact);
local v13 = require(l_Common_0.RoactRodux);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local _ = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v20 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v23 = require(l_Modules_0.LuaApp.AppPage);
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.Login);
local v25 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByCode);
local v26 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByPasskey);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByOtp);
local v28 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v29 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v30 = require(l_Modules_0.LuaApp.Thunks.Authentication.StartPasskeyAuthentication);
local v31 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v32 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt);
local v33 = require(l_Modules_0.LuaApp.Actions.Authentication.SetLoginResult);
local v34 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v35 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v36 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v37 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v38 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSelector);
local v39 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v40 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenEmailOtp);
local v41 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v42 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v43 = require(l_Modules_0.LuaApp.Http.Requests.AuthCanVerifyCredentials);
local v44 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v45 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v46 = require(l_Modules_0.LuaApp.Components.Authentication.DualLoginWithContentsLayout);
local l_isStringEmail_0 = v20.Utils.isStringEmail;
local l_isStringPhone_0 = v20.Utils.isStringPhone;
local v49 = require(l_Modules_0.LuaApp.Util.Base64);
local v50 = require(l_Modules_0.LuaApp.Components.Authentication.CredentialLoginContainer);
local v51 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt);
local v52 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v53 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v54 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v55 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local _ = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v57 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v58 = require(l_Modules_0.LuaApp.Enum.CredentialType);
local v59 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v59.Style.withStyle;
local v61 = require(l_Modules_0.LuaApp.withLocalization);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v63 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v64 = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local v65 = require(l_Modules_0.LuaApp.Experiment.AppBtidLayers);
local v66 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v67 = require(l_Modules_0.LuaApp.Constants);
local v68 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_LinkButton_0 = v59.App.Button.LinkButton;
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local _ = require(l_Modules_0.LuaApp.Components.Authentication.NewAppAvailableInteractiveAlert);
local v72 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableAlternateXDLStrings);
local v73 = require(l_Modules_0.LuaApp.FlagSettings);
local v74 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v75 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseNewTwoStepFlowOnLogin);
local v76 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev);
local v77 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev);
local v78 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v79 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v80 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepRequests);
local v81 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers);
local v82 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v83 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableDesktopDualLoginABTest;
local v85 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v87 = require(l_Modules_0.LuaApp.Flags.GetFIntLoginViewBottomPaddingPx);
local v88 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin);
local v89 = require(l_Modules_0.LuaApp.Flags.GetFFlagShouldUsePeekViewForLoginDisambiguation);
local v90 = require(l_Modules_0.LuaApp.Flags.GetFFlagShouldEnableOtpDisambiguationPeekViewFix);
local v91 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCredentialsProtocolPasswords);
local v92 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtLoginEnabled);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v98 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v99 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay);
local v100 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v101 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v102 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
game:DefineFastFlag("LuaLoginManualCredentialValidation", false);
game:DefineFastFlag("EnablePlayerAppLoginPageExperiments", false);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v104 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
local v105 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local _ = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
local _ = require(l_Modules_0.TopBar.Flags.FFlagEnableGamepadMenuSelector);
local _ = require(l_Modules_0.LuaApp.Components.EventReceivers.CsatSurveyConstants);
local l_MemStorageService_1 = game:GetService("MemStorageService");
local v110 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v111 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local _ = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache);
local v113 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local _ = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
local _ = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v117 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal);
local v118 = require(l_Modules_0.LuaApp.Flags.GetFStringVNGDownloadNowUrl);
local v119 = v12.PureComponent:extend("LoginView");
local v120 = v87();
local v121 = {
    CValue = 1, 
    Password = 2
};
v119.init = function(v122)
    v122.cvalueRef = v12.createRef();
    v122.passwordRef = v12.createRef();
    v122.loginButtonRef = v12.createRef();
    v122.forgotLinkRef = v12.createRef();
    v122.crossDeviceButtonRef = v12.createRef();
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v55.CredentialValue);
    if v100 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem(v55.AccountBlob);
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            l_l_AppStorageService_0_Item_0 = "";
        end;
    end;
    local v125, v126 = v12.createBinding(l_l_AppStorageService_0_Item_0);
    v122.cvalueText = v125;
    v122.updateCValueText = v126;
    v125, v126 = v12.createBinding("");
    v122.passwordText = v125;
    v122.updatePasswordText = v126;
    v122.state = {
        errorKey = "", 
        localizedErrorMessage = nil, 
        errorCode = -1, 
        loginButtonDisabled = true, 
        isLoginInProgress = false, 
        forceLoginByUsername = false, 
        forgotLinkFocused = false, 
        quickLoginButtonTextOverride = "", 
        isDesktopDualLoginEnabled = false, 
        isLoginByOtp = false, 
        otpSessionToken = "", 
        otpCode = "", 
        isCredentialsProtocolRegisterPasswordAvailable = false
    };
    v122.errorHandlingInfoList = {
        [v53.IncorrectCValueOrPassword] = {
            textBoxesToClear = {
                v121.Password
            }, 
            newFocusedTextBox = v121.Password
        }, 
        [v53.CValueAndPasswordRequired] = {
            textBoxesToClear = {
                v121.Password
            }, 
            newFocusedTextBox = v121.Password
        }, 
        [v53.AccountLocked] = {
            textBoxesToClear = {
                v121.Password
            }
        }, 
        [v53.MoreThanOneUsername] = {
            textBoxesToClear = {
                v121.CValue, 
                v121.Password
            }, 
            newFocusedTextBox = v121.CValue, 
            forceLoginByUsername = true
        }, 
        [v53.AccountNotVerified] = {
            textBoxesToClear = {
                v121.CValue, 
                v121.Password
            }, 
            forceLoginByUsername = true
        }
    };
    v122.isAlreadyAuthenticated = v104.fromLocalStorage().userId ~= -1;
    resetDefaultTheme = function()
        local v127 = v98.getAuthenticatedTheme();
        if v127 ~= "" then
            l_MemStorageService_1:Fire(v111.ThemeUpdate, v127);
        end;
    end;
    v122.updateIsLoginInProgress = function(v128)
        spawn(function()
            local l_isLoginInProgress_0 = v122.state.isLoginInProgress;
            if v122.isMounted and l_isLoginInProgress_0 ~= v128 then
                v122:setState({
                    isLoginInProgress = v128
                });
            end;
        end);
    end;
    v122.onTextBoxesChanged = function(v130)
        if not (not v122.cvalueRef.current or not v122.passwordRef.current) and v122.isMounted then
            local v131 = v130.Text:gsub("\t", "");
            if v130.Text ~= v131 then
                v130.Text = v131;
            end;
            local l_v122_0 = v122;
            local v133 = {};
            local v134 = true;
            if #v122.cvalueRef.current.Text ~= 0 then
                v134 = #v122.passwordRef.current.Text == 0;
            end;
            v133.loginButtonDisabled = v134;
            v133.errorKey = #v130.Text == 0 and v122.state.errorKey or "";
            v133.errorCode = -1;
            l_v122_0:setState(v133);
            return ;
        else
            return ;
        end;
    end;
    v122.unfocusTextBoxes = function()
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 and (not (l_l_UserInputService_0_FocusedTextBox_0 ~= v122.cvalueRef.current) or l_l_UserInputService_0_FocusedTextBox_0 == v122.passwordRef.current) then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    v122.handleCaptchaResult = function(v136, v137)
        if not v136 then
            v122.updateIsLoginInProgress(false);
            return ;
        else
            v122.handleLoginWithFormData(v137);
            return ;
        end;
    end;
    v122.getCaptchaResultHandlerWithCode = function(v138, v139)
        return function(v140, v141)
            if not v140 then
                v122.updateIsLoginInProgress(false);
                return ;
            else
                v122.handleLoginWithCode(v138, v139, v141);
                return ;
            end;
        end;
    end;
    v122.getSecurityQuestionsLoginWithCodeCallback = function(v142, v143)
        return function(v144)
            v122.handleLoginWithCode(v142, v143, nil, v144);
        end;
    end;
    v122.getSecurityQuestionsLoginWithOtpCallback = function()
        return function(v145)
            v122.handleLoginWithOtp(v145, nil);
        end;
    end;
    v122.getSecurityQuestionsLoginWithFormDataCallback = function()
        return function(v146)
            v122.handleLoginWithFormData(nil, v146);
        end;
    end;
    v122.canVerifyCredentials = function(v147, v148, v149)
        return v43(v122.props.networking, v147, v148, v149):andThen(function(v150)
            return (v150 and v150.responseBody) and v150.responseBody.canSend;
        end, function()
            return false;
        end);
    end;
    v122.handleLoginWithCode = function(v151, v152, v153, v154)
        v122.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_0 = v122.props.setBackNavigationDisabled;
        v122.unfocusTextBoxes();
        l_setBackNavigationDisabled_0(true);
        return v122.props.loginByCode(v122.props.networking, v151, v152, v122.getCaptchaResultHandlerWithCode(v151, v152), v153, v122.getSecurityQuestionsLoginWithCodeCallback(v151, v152), v154):andThen(function(v156)
            v122.handleLoginResult(v156, nil);
        end, function(v157)
            if v157.errorCode ~= v53.Captcha then
                v63(v64.FailureAuthCode, 1);
            end;
            v122.handleLoginError(v157, v151, v152);
        end);
    end;
    v122.handleLoginWithPasskey = function(v158, v159)
        v122.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_1 = v122.props.setBackNavigationDisabled;
        v122.unfocusTextBoxes();
        l_setBackNavigationDisabled_1(true);
        return v122.props.loginByPasskey(v122.props.networking, v158, v159):andThen(function(v161)
            v122.handleLoginResult(v161, nil);
        end, function(v162)
            v122.handleLoginError(v162, v158);
        end);
    end;
    v122.showPasskeyLoginPopup = function()
        return v122.props.startPasskeyAuthentication(v122.props.networking):andThen(function(v163)
            local v164 = l_HttpService_0:JSONDecode(v163.authenticationOptions);
            local l_sessionId_0 = v163.sessionId;
            local v166 = tonumber(v164.publicKey.timeout);
            v164.keyType = "platform";
            v164.deviceBoundOnly = true;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v164.publicKey.challenge = v49.FromUrlSafeBase64(v164.publicKey.challenge);
            end;
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, l_HttpService_0:JSONEncode(v164), v166):andThen(function(v167)
                local v168 = l_HttpService_0:JSONDecode(v167);
                if not (v168 ~= nil) or next(v168) == nil then
                    l_Logger_0:info("Passkey credential signing failed. No result returned.");
                    return ;
                elseif v168.errorCode ~= nil then
                    l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v168.errorCode, v168.errorMsg);
                    return ;
                else
                    l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                    v168.id = v49.ToUrlSafeBase64(v168.id);
                    v168.rawId = v49.ToUrlSafeBase64(v168.rawId);
                    v168.response.signature = v49.ToUrlSafeBase64(v168.response.signature);
                    v168.response.userHandle = v49.ToUrlSafeBase64(v168.response.userHandle);
                    v168.response.authenticatorData = v49.ToUrlSafeBase64(v168.response.authenticatorData);
                    v168.response.clientDataJSON = v49.ToUrlSafeBase64(v168.response.clientDataJSON);
                    v122.handleLoginWithPasskey(v168, l_sessionId_0);
                    return ;
                end;
            end, function(v169)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v169);
            end);
        end, function(v170)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v170.errorCode);
        end);
    end;
    v122.showGenericCredentialLoginPopup = function(v171, v172)
        if v171 or v172 then
            local l_networking_0 = v122.props.networking;
            local l_startPasskeyAuthentication_0 = v122.props.startPasskeyAuthentication;
            local v175 = nil;
            local v176 = nil;
            local v177 = nil;
            local v178 = {};
            if v171 then
                l_startPasskeyAuthentication_0(l_networking_0):andThen(function(v179)
                    v175 = l_HttpService_0:JSONDecode(v179.authenticationOptions);
                    v176 = v179.sessionId;
                    v177 = tonumber(v175.publicKey.timeout);
                    v175.keyType = "platform";
                    v175.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v175.publicKey.challenge = v49.FromUrlSafeBase64(v175.publicKey.challenge);
                    end;
                    local _ = l_HttpService_0:JSONEncode(v175);
                end, function(v181)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v181.errorCode);
                end):await();
                if v175 ~= nil then
                    v178.FIDO2 = v175;
                end;
            end;
            if v172 then
                v178.password = {};
            end;
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, l_HttpService_0:JSONEncode(v178), v177 / 1000):andThen(function(v182)
                local v183 = l_HttpService_0:JSONDecode(v182);
                if not (v183 ~= nil and v183.response ~= nil) or v183.credentialType == nil then
                    l_Logger_0:info("Generic credential fetch failed. No result returned.");
                    return ;
                elseif v183.response.errorCode ~= nil then
                    l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v183.response.errorCode, v183.response.errorMsg);
                    return ;
                elseif v183.credentialType == l_default_0.CredentialsTypes.password then
                    local l_username_0 = v183.response.username;
                    local l_password_0 = v183.response.password;
                    v122.updateCValueText(l_username_0);
                    v122.updatePasswordText(l_password_0);
                    v122.props.authAnalytics.reportAuthButtonClick(v66.Context.CMPasswordLogin, v66.Button.SelectPassword);
                    v122.updateIsLoginInProgress(true);
                    v122.handleLoginWithFormData(nil, nil, nil, true);
                    return ;
                else
                    if v183.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        v183.response.id = v49.ToUrlSafeBase64(v183.response.id);
                        v183.response.rawId = v49.ToUrlSafeBase64(v183.response.rawId);
                        v183.response.response.signature = v49.ToUrlSafeBase64(v183.response.response.signature);
                        v183.response.response.userHandle = v49.ToUrlSafeBase64(v183.response.response.userHandle);
                        v183.response.response.authenticatorData = v49.ToUrlSafeBase64(v183.response.response.authenticatorData);
                        v183.response.response.clientDataJSON = v49.ToUrlSafeBase64(v183.response.response.clientDataJSON);
                        v122.handleLoginWithPasskey(v183.response, v176);
                    end;
                    return ;
                end;
            end, function(v186)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v186);
            end);
        else
            return ;
        end;
    end;
    v122.handleLoginWithOtp = function(v187, v188)
        if v88() or not v122.props.isLoginWithOtpEnabled then
            v122.updateIsLoginInProgress(true);
            local l_setBackNavigationDisabled_2 = v122.props.setBackNavigationDisabled;
            v122.unfocusTextBoxes();
            l_setBackNavigationDisabled_2(true);
            return v122.props.loginByOtp(v122.props.networking, v122.state.otpSessionToken, v122.state.otpCode, v122.getSecurityQuestionsLoginWithOtpCallback(), v187, v188):andThen(function(v190)
                v122.handleLoginResult(v190, nil);
            end, function(v191)
                v122.handleLoginError(v191, v122.state.otpSessionToken, v122.state.otpCode);
                return v191.errorKey;
            end);
        else
            return ;
        end;
    end;
    v122.validateFormCredentials = function(v192)
        return #v192:gsub("%s+", "") > 0;
    end;
    v122.handleLoginWithFormData = function(v193, v194, v195, v196)
        if v122.cvalueRef.current and v122.passwordRef.current then
            local l_Text_0 = v122.cvalueRef.current.Text;
            local l_Text_1 = v122.passwordRef.current.Text;
            if not game:GetFastFlag("LuaLoginManualCredentialValidation") or v122.validateFormCredentials(l_Text_0) then
                local l_setBackNavigationDisabled_3 = v122.props.setBackNavigationDisabled;
                v122.unfocusTextBoxes();
                l_setBackNavigationDisabled_3(true);
                return v122.props.login(v122.props.networking, l_Text_0, l_Text_1, v122.handleCaptchaResult, v193, v122.getSecurityQuestionsLoginWithFormDataCallback(), v194, v195, v122.state.forceLoginByUsername):andThen(function(v200)
                    l_AppStorageService_0:SetItem(v55.CredentialValue, l_Text_0);
                    l_AppStorageService_0:flush();
                    if v196 then
                        v122.props.authAnalytics.reportAuthFormInteraction(v66.Context.CMPasswordLogin, nil, "success");
                    end;
                    local v201 = if v196 then nil else l_HttpService_0:JSONEncode({
                        cvalue = l_Text_0, 
                        password = l_Text_1, 
                        authType = "login"
                    });
                    if not v75(v200.user.id) then
                        if v201 then
                            l_MemStorageService_1:Fire(v111.AuthenticatedCredentials, v201);
                        end;
                        v122.handleLoginResult(v200, nil);
                        return ;
                    else
                        v122.handleLoginResult(v200, v201);
                        return ;
                    end;
                end, function(v202)
                    if v196 then
                        v122.props.authAnalytics.reportAuthFormInteraction(v66.Context.CMPasswordLogin, nil, "error");
                    end;
                    v122.handleLoginError(v202, l_Text_0, l_Text_1);
                end);
            else
                v122.handleLoginError({
                    errorKey = "Authentication.Login.Response.IncorrectUsernamePassword", 
                    errorCode = v53.IncorrectCValueOrPassword
                }, l_Text_0, l_Text_1);
                v122.updateCValueText("");
                return ;
            end;
        else
            return ;
        end;
    end;
    v122.renderSecurityQuestions = function(_, _, v205, v206)
        v122.props.renderChallenge({
            challengeType = v74.SecurityQuestions, 
            challengeParameters = {
                sessionId = v206.sessionId, 
                userId = v206.userId, 
                onChallengeCompleted = function(v207)
                    v205({
                        sessionId = v206.sessionId, 
                        redemptionToken = v207.redemptionToken
                    });
                end, 
                onChallengeInvalidated = function(v208)
                    v122.updateIsLoginInProgress(false);
                    if v122.isMounted then
                        if v208.errorCode ~= 0 then
                            v122:setState({
                                errorKey = false, 
                                localizedErrorMessage = v208.errorMessage
                            });
                            return ;
                        else
                            v122:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function()
                v122.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function()
                v122.updateIsLoginInProgress(false);
                if v122.isMounted then
                    v122:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v122.renderTwoStepChallenge = function(v209, v210)
        local l_launchApp_0 = v122.props.launchApp;
        local l_networking_1 = v122.props.networking;
        local l_appPolicy_0 = v122.props.appPolicy;
        local l_analytics_0 = v122.props.analytics;
        local l_omniRecommendationsRequest_0 = v122.props.omniRecommendationsRequest;
        local l_ticket_0 = v209.twoStepVerificationData.ticket;
        local l_id_0 = v209.user.id;
        local l_handleLoginCompletionWithAccountSwitching_0 = v122.props.handleLoginCompletionWithAccountSwitching;
        local l_clearApp_0 = v122.props.clearApp;
        if v76() then
            wait(v77());
        end;
        v122.props.renderChallenge({
            challengeType = v74.TwoStepVerification, 
            challengeParameters = {
                actionType = v83.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true, 
                onChallengeCompleted = function(v220)
                    v80.login(l_networking_1, l_id_0, l_ticket_0, v220.verificationToken, v220.rememberDevice):andThen(function(v221)
                        v63(v64.Success, 1);
                        if not v100 then
                            l_launchApp_0(l_networking_1, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0);
                            return ;
                        else
                            l_handleLoginCompletionWithAccountSwitching_0(l_networking_1, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0, v221.responseBody.accountBlob, l_clearApp_0, l_launchApp_0);
                            return ;
                        end;
                    end, function()
                        if v210 then
                            l_MemStorageService_1:Fire(v111.AuthenticatedCredentials, v210);
                        end;
                        v63(v64.Failure, 1);
                        v63(v64.FailureUnknownError, 1);
                        v122.updateIsLoginInProgress(false);
                        if v122.isMounted then
                            v122:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end);
                end, 
                onChallengeInvalidated = function(v222)
                    v122.updateIsLoginInProgress(false);
                    if v122.isMounted then
                        if v222.errorCode ~= 0 then
                            v122:setState({
                                errorKey = false, 
                                localizedErrorMessage = v222.errorMessage
                            });
                            return ;
                        else
                            v122:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function()
                v122.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function()
                v122.updateIsLoginInProgress(false);
                if v122.isMounted then
                    v122:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v122.handleMultipleUsersPerCredentialError = function(v223)
        local v224 = "";
        if not v122.state.isLoginByOtp then
            if not l_isStringEmail_0(v122.props.cvalue) then
                if l_isStringPhone_0(v122.props.cvalue) then
                    v224 = v66.Context.DisambiguationPhone;
                end;
            else
                v224 = v66.Context.DisambiguationEmail;
            end;
        else
            v224 = v66.Context.DisambiguationOTP;
        end;
        local v226 = {
            origin = v66.Context.Login, 
            context = v224, 
            users = v223, 
            onAccountSelection = function(v225)
                if not v122.state.isLoginByOtp then
                    v122.handleLoginWithFormData(nil, nil, v225);
                    return ;
                else
                    v122.handleLoginWithOtp(nil, v225);
                    return ;
                end;
            end, 
            onAccountSelectionAbandoned = function()
                v122.updateIsLoginInProgress(false);
                v122.state.otpSessionToken = "";
                v122.state.otpCode = "";
                v122.state.isLoginByOtp = false;
                v122.props.closeCentralOverlay();
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle", 
            helpTextKey = "Authentication.Login.Description.AccountSelectorHelp", 
            screenSize = v122.props.screenSize
        };
        if not (not v90() or not v89()) then
            v122.props.closeCentralOverlay();
        end;
        v122.props.openAccountSelector(v226);
    end;
    v122.handleLoginResult = function(v227, v228)
        v122.props.setBackNavigationDisabled(false);
        local l_setLoginResult_0 = v122.props.setLoginResult;
        local l_gotoTwoStep_0 = v122.props.gotoTwoStep;
        local l_launchApp_1 = v122.props.launchApp;
        local l_networking_2 = v122.props.networking;
        local l_appPolicy_1 = v122.props.appPolicy;
        local l_analytics_1 = v122.props.analytics;
        local l_omniRecommendationsRequest_1 = v122.props.omniRecommendationsRequest;
        if v122.passwordRef.current then
            v122.passwordRef.current.Text = "";
        end;
        local l_clearApp_1 = v122.props.clearApp;
        local l_handleLoginCompletionWithAccountSwitching_1 = v122.props.handleLoginCompletionWithAccountSwitching;
        if not v28.hasTwoStepData(v227) then
            if v228 then
                l_MemStorageService_1:Fire(v111.AuthenticatedCredentials, v228);
                if not (not v91() or not v122.state.isCredentialsProtocolRegisterPasswordAvailable) then
                    v122.credentialsProtocolRegisterPassword(v228);
                end;
            end;
            v63(v64.Success, 1);
            if not v100 then
                l_launchApp_1(l_networking_2, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1);
            else
                l_handleLoginCompletionWithAccountSwitching_1(l_networking_2, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1, v227.accountBlob, l_clearApp_1, l_launchApp_1);
            end;
        else
            l_setLoginResult_0(v227);
            v63(v64.FailureTwoStepVerification, 1);
            if not v75(v227.user.id) then
                v122.updateIsLoginInProgress(false);
                l_gotoTwoStep_0();
            else
                spawn(function()
                    v122.renderTwoStepChallenge(v227, v228);
                end);
            end;
        end;
        if v85() then
            v122.props.closeCentralOverlay();
        end;
    end;
    v122.credentialsProtocolRegisterPassword = function(v238)
        v238 = l_HttpService_0:JSONDecode(v238);
        if not (v238.cvalue ~= nil) or v238.password == nil then
            return ;
        else
            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, l_HttpService_0:JSONEncode({
                username = v238.cvalue, 
                password = v238.password
            }), 120):andThen(function(v239)
                if v239.errorCode == nil then
                    v122.props.authAnalytics.reportAuthButtonClick(v66.Context.CMPasswordLogin, v66.Button.SavePassword);
                    l_Logger_0:info("Successfully registered password.");
                    return ;
                else
                    l_Logger_0:warning("Error registering password: ", v239.errorMsg);
                    return ;
                end;
            end, function(v240)
                l_Logger_0:warning("Error registering password: ", v240);
            end);
        end;
    end;
    v122.logoutAllLoggedInUsersCallback = function()
        local l_networking_3 = v122.props.networking;
        local v242 = v98.getAccountBlob();
        local v243 = v104.fromLocalStorage().userId ~= -1;
        v122:setState({
            errorKey = false, 
            loginButtonDisabled = true, 
            isLoginInProgress = false
        });
        v81(l_networking_3, v242):await();
        if v243 == true then
            v122.props.resetAppState();
            l_AppStorageService_0:SetItem(v55.CredentialValue, "");
            l_AppStorageService_0:flush();
            v122.props.logoutWithoutShowConfirmation(l_networking_3, l_GuiService_0);
        end;
        v122:setState({
            loginButtonDisabled = false
        });
        v122.props.closeCentralOverlay();
    end;
    v122.handleLoginError = function(v244, v245, v246)
        v122.props.setBackNavigationDisabled(false);
        local l_forceLoginByUsername_0 = v122.state.forceLoginByUsername;
        local v248 = v122.errorHandlingInfoList[v244.errorCode];
        if v248 then
            l_forceLoginByUsername_0 = v248.forceLoginByUsername or l_forceLoginByUsername_0;
        end;
        local v249 = false;
        local v250 = v85() and v244.errorCode == v53.MultipleUsersPerCredential;
        local v251 = v78() and v244.errorCode == v53.SecurityQuestions;
        if (v250 or v251) or v244.errorCode == v53.Captcha then
            v249 = true;
        end;
        v63(v64.Failure, 1);
        if v244.errorCode == v53.Captcha then
            v63(v64.FailureCaptcha, 1);
        elseif v244.errorCode == v53.IncorrectCValueOrPassword then
            v63(v64.FailureCredentials, 1);
        elseif v244.errorCode == v53.AccountLocked then
            v63(v64.FailurePasswordReset, 1);
        elseif v244.errorCode == v53.CTypeNotSupported then
            v63(v64.FailureBadRequest, 1);
        elseif v244.errorCode == v53.CValueAndPasswordRequired then
            v63(v64.FailureBadRequest, 1);
        elseif not v251 then
            if not v250 then
                if v244.HttpError == Enum.HttpError.OK and v244.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                    v63(v64.FailureThrottled, 1);
                elseif v244.HttpError == Enum.HttpError.OK and v244.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
                    v63(v64.FailureTimeout, 1);
                elseif v244.HttpError == Enum.HttpError.OK and v244.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                    v63(v64.FailureBadRequest, 1);
                elseif v244.HttpError == Enum.HttpError.OK and v244.StatusCode == l_StatusCodes_0.NOT_FOUND then
                    v63(v64.FailureNotFound, 1);
                elseif v244.HttpError == Enum.HttpError.OK and v244.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                    v63(v64.FailureInternalServerError, 1);
                else
                    v63(v64.FailureUnknownError, 1);
                end;
            else
                v63(v64.FailureMultipleUsersPerCredential, 1);
            end;
        else
            v63(v64.FailureSecurityQuestions, 1);
        end;
        if v100 == true and v244.errorCode == v53.EmptyAccountSwitchBlobRequired then
            v122:setState({
                errorKey = false
            });
            v122.props.openAccountSwitchingErrorOverlay("Authentication.AccountSwitch.Header.LogoutAllAccounts", "Authentication.AccountSwitch.Description.LogoutConfirmation", "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v122.logoutAllLoggedInUsersCallback, v122.props.closeCentralOverlay, v67.Auth.AccountSwitcherLoginEmptyBlobRequiredError);
        end;
        if v100 == true and v244.errorCode == v53.ParentEmptyAccountSwitchBlobRequired then
            v122:setState({
                errorKey = false
            });
            v122.props.openAccountSwitchingErrorOverlay("Authentication.AccountSwitch.Header.LogoutAllAccounts", "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v122.logoutAllLoggedInUsersCallback, v122.props.closeCentralOverlay, v67.Auth.AccountSwitcherParentLoginEmptyBlobRequiredError);
        end;
        if v244.errorCode == v53.AccountLocked then
            v122.props.openPasswordResetPrompt();
        end;
        if not ((not (v244.errorCode == v53.AccountNotVerified) or not l_isStringEmail_0(v245)) or not v122.canVerifyCredentials(v58.Email, v245, v246)) then
            v122.props.openEmailVerificationPrompt(v245, v246, v122.closeVerificationEmailModal);
        end;
        if not (not (v117() and v244.errorCode == v53.GlobalAppAccessDeniedVNG) or not v122.isMounted) then
            v122.props.openNewAppAvailableModal(function()
                v122.props.linking:openURL((v118()));
            end);
        end;
        if not ((not (v78() and v244.errorCode == v53.SecurityQuestions) or not v244.securityQuestionsData) or not v244.securityQuestionsCallback) then
            task.spawn(function()
                if v122.isMounted then
                    v122.renderSecurityQuestions(v245, v246, v244.securityQuestionsCallback, v244.securityQuestionsData);
                end;
            end);
        end;
        if not (not v250 or not v244.usersData) then
            v122.handleMultipleUsersPerCredentialError(v244.usersData);
        end;
        spawn(function()
            if v122.isMounted then
                v122:setState({
                    errorKey = v244.errorKey, 
                    errorCode = v244.errorCode, 
                    forceLoginByUsername = l_forceLoginByUsername_0
                });
            end;
        end);
        v122.updateIsLoginInProgress(v249);
    end;
    v122.onLoginButtonActivated = function()
        if not v122.state.loginButtonDisabled then
            if not v122.state.isLoginInProgress then
                v122.updateIsLoginInProgress(true);
                v122.props.authAnalytics.reportLogInButtonClicked(v66.Context.LoginScreen);
                v122.handleLoginWithFormData();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v122.onForgetButtonActivated = function()
        if not v122.state.isLoginInProgress then
            v122.unfocusTextBoxes();
            v122.props.authAnalytics.reportForgotPasswordButtonClicked(v66.Context.LoginScreen);
            v122.props.navigateToPage({
                name = v23.GenericWebPage, 
                detail = l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username", 
                extraProps = {
                    title = "", 
                    transitionAnimation = v52.SlideInFromRight
                }
            });
            return ;
        else
            return ;
        end;
    end;
    v122.onCrossDeviceLoginActivated = function()
        if not v122.state.isLoginInProgress then
            v122.unfocusTextBoxes();
            v122.props.authAnalytics.reportButtonClicked(v66.Context.Login, v66.Button.LoginOtherDevice);
            v122.props.openCrossDeviceLoginPrompt(v122.handleLoginWithCode);
            return ;
        else
            return ;
        end;
    end;
    v122.topButtonActivatedTracking = function()
        if v100 == true and v122.isAlreadyAuthenticated == true then
            resetDefaultTheme();
        end;
        v122.props.authAnalytics.reportDismissCornerXButtonClicked(v66.Context.LoginScreen);
    end;
    v122.onEmailOtpLoginAbandoned = function()
        v122.state.isLoginByOtp = false;
    end;
    v122.onEmailOtpLoginCompleted = function(v252, v253)
        v122.state.otpSessionToken = v252;
        v122.state.otpCode = v253;
        return v122.handleLoginWithOtp(nil, nil);
    end;
    v122.onEmailOtpLoginActivated = function()
        if not v122.state.isLoginInProgress then
            v122.unfocusTextBoxes();
            v122.props.openEmailOtp({
                origin = "login", 
                codeLength = 6, 
                enterEmailTitleKey = "Authentication.Login.Label.GetOneTimeCode", 
                enterEmailDescriptionKey = "Authentication.Login.Description.GetOneTimeCodeHelp", 
                enterCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode", 
                enterCodeDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2", 
                onSubmitCode = v122.onEmailOtpLoginCompleted, 
                onModalAbandoned = v122.onEmailOtpLoginAbandoned, 
                screenSize = v122.props.screenSize
            });
            v122.state.isLoginByOtp = true;
            v122.props.authAnalytics.reportButtonClicked(v66.Context.Login, v66.Button.OneTimePasscode);
            return ;
        else
            return ;
        end;
    end;
    v122.closeVerificationEmailModal = function(v254)
        if v122.isMounted then
            v122.updateCValueText(v254);
            if not (not (v254 ~= "") or not v122.passwordRef.current) then
                v122.passwordRef.current:CaptureFocus();
            end;
            v122:setState({
                errorCode = -1, 
                errorKey = "", 
                forceLoginByUsername = false
            });
        end;
    end;
    v122.events = {};
    v122.props.authAnalytics.reportScreenLoaded(v66.Context.LoginScreen);
end;
v119.didMount = function(v255)
    v255.isMounted = true;
    if v92() then
        v255.props.authAnalytics.reportAuthPageload(v66.Context.LoginScreen, (l_LinkingProtocol_0:getLastLuaURL()));
    end;
    if v100 == true and v255.isAlreadyAuthenticated == true then
        l_MemStorageService_1:Fire(v111.ThemeUpdate, "dark");
    end;
    local function v261(v256, v257)
        if v255.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            error("Input position is not supported in VR");
        end;
        local l_AbsolutePosition_0 = v257.AbsolutePosition;
        local l_AbsoluteSize_0 = v257.AbsoluteSize;
        local v260 = false;
        if l_AbsolutePosition_0.X < v256.X then
            v260 = false;
            if v256.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
                v260 = false;
                if l_AbsolutePosition_0.Y < v256.Y then
                    v260 = v256.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
                end;
            end;
        end;
        return v260;
    end;
    local function _(v262)
        if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            return v262.NextSelectionDown;
        else
            return v262.NextSelectionUp;
        end;
    end;
    local function v266()
        local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
        local v265 = if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then l_SelectedObject_0.NextSelectionUp else l_SelectedObject_0.NextSelectionDown;
        if not (not (v265 == v255.loginButtonRef.current) or not v255.state.loginButtonDisabled) then
            l_SelectedObject_0 = v265;
            v265 = if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then l_SelectedObject_0.NextSelectionUp else l_SelectedObject_0.NextSelectionDown;
        end;
        if v255.isMounted then
            v255:setState({
                forgotLinkFocused = v265 == v255.forgotLinkRef.current
            });
        end;
        return v265;
    end;
    table.insert(v255.events, l_UserInputService_0.InputBegan:connect(function(v267, _)
        if v255.props.currentPageName ~= v23.Login then
            return ;
        else
            if v267.UserInputType == Enum.UserInputType.Keyboard then
                if v267.KeyCode == Enum.KeyCode.Return then
                    if not v255.state.forgotLinkFocused then
                        v255.onLoginButtonActivated();
                        return ;
                    else
                        v255.onForgetButtonActivated();
                        return ;
                    end;
                elseif v267.KeyCode == Enum.KeyCode.Tab then
                    local l_SelectedObject_1 = l_GuiService_0.SelectedObject;
                    if l_SelectedObject_1 then
                        local v270 = v266();
                        if v270 then
                            if not (not l_SelectedObject_1:IsA("TextBox") or not l_SelectedObject_1.ManualFocusRelease) then
                                l_SelectedObject_1:ReleaseFocus();
                            end;
                            l_GuiService_0.SelectedObject = v270;
                            if v270:IsA("TextBox") then
                                v270:CaptureFocus();
                            end;
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                end;
            end;
            return ;
        end;
    end));
    table.insert(v255.events, l_UserInputService_0.InputEnded:connect(function(v271, _)
        if v255.props.currentPageName ~= v23.Login then
            return ;
        elseif v255.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            return ;
        else
            if not (v271.UserInputType ~= Enum.UserInputType.MouseButton1) or v271.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v271.Position;
                local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
                if v255.cvalueRef.current and v255.passwordRef.current then
                    if l_l_UserInputService_0_FocusedTextBox_1 then
                        local v275 = v261(l_Position_0, v255.cvalueRef.current);
                        local v276 = v261(l_Position_0, v255.passwordRef.current);
                        if not (l_l_UserInputService_0_FocusedTextBox_1 == v255.cvalueRef.current) or not v276 then
                            if not (l_l_UserInputService_0_FocusedTextBox_1 == v255.passwordRef.current) or not v275 then
                                if not (v275 or v276) and (not (l_l_UserInputService_0_FocusedTextBox_1 ~= v255.cvalueRef.current) or l_l_UserInputService_0_FocusedTextBox_1 == v255.passwordRef.current) then
                                    l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
                                end;
                            else
                                v255.passwordRef.current:ReleaseFocus();
                                v255.cvalueRef.current:CaptureFocus();
                                return ;
                            end;
                        else
                            v255.cvalueRef.current:ReleaseFocus();
                            v255.passwordRef.current:CaptureFocus();
                            return ;
                        end;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end;
            return ;
        end;
    end));
    table.insert(v255.events, l_UserInputService_0.TextBoxFocused:connect(function(v277)
        if v255.props.currentPageName ~= v23.Login then
            return ;
        elseif not v255.state.isLoginInProgress then
            l_GuiService_0.SelectedObject = v277;
            return ;
        else
            v277:ReleaseFocus();
            return ;
        end;
    end));
    table.insert(v255.events, l_UserInputService_0.TextBoxFocusReleased:connect(function(_)
        if v255.props.currentPageName ~= v23.Login then
            return ;
        else
            l_GuiService_0.SelectedObject = nil;
            return ;
        end;
    end));
    table.insert(v255.events, l_MemStorageService_1:bind(v111.AutoFillCredentials, function(v279)
        if v255.props.currentPageName ~= v23.Login then
            return ;
        elseif not v255.state.isLoginInProgress then
            local v280 = l_HttpService_0:JSONDecode(v279);
            if v280 then
                v255.updateCValueText(v280.cvalue);
                v255.updatePasswordText(v280.password);
            end;
            return ;
        else
            return ;
        end;
    end));
    if l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() then
        v44(v255.props.networking, "PlayerApp.Login", {
            "isDesktopDualLoginEnabled"
        }):andThen(function(v281)
            local v282 = v281 and v281.responseBody;
            if not (not v282 or not v255.isMounted) then
                local l_isDesktopDualLoginEnabled_0 = v282.isDesktopDualLoginEnabled;
                if l_isDesktopDualLoginEnabled_0 then
                    v255:setState({
                        isDesktopDualLoginEnabled = l_isDesktopDualLoginEnabled_0
                    });
                end;
            end;
        end, function()
        end);
    end;
    if not v91() then
        local v284 = false;
        do
            local l_v284_0 = v284;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v286)
                l_v284_0 = v286.isAvailable and v286.supportsDeviceBoundOnly;
                if l_v284_0 then
                    v255.showPasskeyLoginPopup();
                end;
            end):catch(function(v287)
                warn("Error checking if FIDO2 passkeys is available. Error: ", v287);
            end):finally(function()
                v255.props.authAnalytics.reportAuthPageload(v66.Context.PasskeyLogin, if l_v284_0 ~= nil then tostring(l_v284_0) else "timeout");
            end);
        end;
    else
        local v288 = false;
        local v289 = false;
        local v290 = false;
        do
            local l_v288_0, l_v289_0, l_v290_0 = v288, v289, v290;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v294)
                if v294.FIDO2 ~= nil then
                    l_v288_0 = v294.FIDO2.isAvailable and v294.FIDO2.supportsDeviceBoundOnly;
                    l_v289_0 = v294.password.isAvailable;
                    l_v290_0 = true;
                    if v255.isMounted then
                        v255:setState({
                            isCredentialsProtocolRegisterPasswordAvailable = l_v289_0
                        });
                    end;
                else
                    l_v288_0 = v294.isAvailable and v294.supportsDeviceBoundOnly;
                end;
                if not l_v290_0 then
                    if l_v288_0 then
                        v255.showPasskeyLoginPopup();
                    end;
                    return ;
                else
                    v255.showGenericCredentialLoginPopup(l_v288_0, l_v289_0);
                    return ;
                end;
            end):catch(function(v295)
                l_Logger_0:warning("Error checking for available credential types. Error: ", v295);
            end):finally(function()
                v255.props.authAnalytics.reportAuthPageload(v66.Context.CMPasswordLogin, (tostring(l_v289_0)));
                v255.props.authAnalytics.reportAuthPageload(v66.Context.PasskeyLogin, if l_v288_0 ~= nil then tostring(l_v288_0) else "timeout");
            end);
        end;
    end;
    if not (not game:GetFastFlag("EnablePlayerAppLoginPageExperiments") or not l_LocalizationService_0.RobloxLocaleId:match("^en")) then
        v44(v255.props.networking, "PlayerApp.Login", {
            "CrossDeviceButtonText"
        }):andThen(function(v296)
            local v297 = v296 and v296.responseBody;
            if not (not v297 or not v255.isMounted) then
                local l_CrossDeviceButtonText_0 = v297.CrossDeviceButtonText;
                if l_CrossDeviceButtonText_0 then
                    v255:setState({
                        quickLoginButtonTextOverride = l_CrossDeviceButtonText_0
                    });
                end;
            end;
        end, function()
        end);
    end;
    v255.props.loggingProtocol:logEventOnce("login_view_did_mount");
end;
v119.willUnmount = function(v299)
    if v100 == true and v299.isAlreadyAuthenticated == true then
        resetDefaultTheme();
    end;
    v299.unfocusTextBoxes();
    for _, v301 in ipairs(v299.events) do
        v301:Disconnect();
    end;
    v299.events = {};
    v299.isMounted = false;
end;
v119.didUpdate = function(v302, _, v304)
    if v302.state.errorCode == -1 then
        return ;
    else
        local l_isLoginInProgress_1 = v302.state.isLoginInProgress;
        if not (not v304.isLoginInProgress or l_isLoginInProgress_1) then
            local v306 = v302.errorHandlingInfoList[v302.state.errorCode];
            if v306 then
                if v306.textBoxesToClear then
                    for _, v308 in pairs(v306.textBoxesToClear) do
                        if v308 == v121.CValue then
                            v302.updateCValueText("");
                        elseif v308 == v121.Password then
                            v302.updatePasswordText("");
                        end;
                    end;
                end;
                if not (v306.newFocusedTextBox == v121.CValue) or not v302.cvalueRef.current then
                    if not (not (v306.newFocusedTextBox == v121.Password) or not v302.passwordRef.current) then
                        v302.passwordRef.current:CaptureFocus();
                    end;
                else
                    v302.cvalueRef.current:CaptureFocus();
                    return ;
                end;
            else
                return ;
            end;
        end;
        return ;
    end;
end;
v119.render = function(v309)
    local v310 = v309.state.errorKey ~= "" and v309.state.errorKey or nil;
    local v311 = v309.state.errorKey == false and v309.state.localizedErrorMessage or nil;
    local v312 = not v309.props.appPolicy.getWebViewSupport() and v309.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
    local v313 = true;
    if v309.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot then
        v313 = v309.props.uiModeInfo.uiMode == l_UiMode_0.VR;
    end;
    local v314 = v313 or v309.props.appPolicy.getEnableDualLogin() and (l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() and v309.state.isDesktopDualLoginEnabled);
    local v315 = v88() and v309.props.isLoginWithOtpEnabled;
    local v316 = v309.props.appPolicy.getUseVNGUserAgreementPopup();
    local v317 = v101 and v309.props.appPolicy.getUseKoreaKISAUserAgreementPopup();
    return l_withStyle_0(function(v318)
        local v319 = v73.CrossDeviceLoginRolloutEnabledForDevice() and not v314;
        if v309.props.appPolicy.getDisableRegularLogin() == false then
            v312 = false;
        end;
        return v61({
            localizedError = v310, 
            logInText = "Authentication.Login.Action.LogInCapitalized", 
            forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized", 
            cvaluePlaceholder = not v309.state.forceLoginByUsername and "Authentication.Login.Label.UsernameEmailPhone" or "Authentication.Login.Label.Username", 
            passwordPlaceholder = "CommonUI.Messages.Label.Password", 
            twoStepHeader = "Authentication.TwoStepVerification.Label.TwoStepVerification", 
            crossDeviceLoginHeader = not v72() and "Authentication.CrossDevice.Heading.QuickLogin" or "Authentication.CrossDevice.Action.LoginWithDevice", 
            orText = "CommonUI.Messages.Label.OR"
        })(function(v320)
            local v321 = v309.state.quickLoginButtonTextOverride ~= "" and v309.state.quickLoginButtonTextOverride or v320.crossDeviceLoginHeader;
            return v12.createElement(if not v313 then v45 else v46, {
                ContentAlign = v54.Top, 
                topButtonActivatedTracking = v309.topButtonActivatedTracking, 
                topButtonEnabled = not v309.state.isLoginInProgress, 
                statusBarHeight = v309.props.statusBarHeight, 
                globalGuiInset = v309.props.globalGuiInset, 
                screenSize = v309.props.screenSize, 
                isDualLayout = v314, 
                navigateBack = if not v313 then nil else v309.props.navigateBack
            }, {
                UIListLayout = not not v314 and v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) or v12.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                }), 
                Form = if not v314 then v12.createElement(v50, {
                    crossDeviceLoginEnabled = v319, 
                    quickLoginButtonText = v321, 
                    handleLoginWithFormDataCallback = v309.handleLoginWithFormData, 
                    updateIsLoginInProgress = v309.updateIsLoginInProgress, 
                    cvalueText = v309.cvalueText, 
                    passwordText = v309.passwordText, 
                    onTextBoxesChanged = v309.onTextBoxesChanged, 
                    cvalueRef = v309.cvalueRef, 
                    passwordRef = v309.passwordRef, 
                    loginButtonRef = v309.loginButtonRef, 
                    forgotLinkRef = v309.forgotLinkRef, 
                    crossDeviceButtonRef = v309.crossDeviceButtonRef, 
                    localizedError = v320.localizedError, 
                    localizedErrorMessage = v311, 
                    forceLoginByUsername = v309.state.forceLoginByUsername or v313, 
                    onCrossDeviceLoginActivated = v309.onCrossDeviceLoginActivated, 
                    onEmailOtpActivated = v309.onEmailOtpLoginActivated, 
                    loginButtonDisabled = v309.state.loginButtonDisabled, 
                    isLoginInProgress = v309.state.isLoginInProgress, 
                    authAnalytics = v309.props.authAnalytics, 
                    disableRegularLogin = v312, 
                    showLinkAccountText = v313, 
                    showForgotButton = (not v312 and v314) and not v313, 
                    onForgetButtonActivated = v309.onForgetButtonActivated, 
                    maxSizeX = not v314 and 360 or math.huge, 
                    showDisclaimerLinks = (v314 and not v313) and not (v316 or v317), 
                    showDisclaimerButtons = (v314 and v313) and not v316, 
                    showCredentialHeader = v314 and not v313, 
                    isDualLayout = v314, 
                    isTenFootUiMode = v313, 
                    emailOtpEnabled = v315
                }) else v12.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    FormContent = v12.createElement(v50, {
                        Size = UDim2.new(0, 0, 1, 0), 
                        crossDeviceLoginEnabled = v319, 
                        quickLoginButtonText = v321, 
                        handleLoginWithFormDataCallback = v309.handleLoginWithFormData, 
                        updateIsLoginInProgress = v309.updateIsLoginInProgress, 
                        cvalueText = v309.cvalueText, 
                        passwordText = v309.passwordText, 
                        onTextBoxesChanged = v309.onTextBoxesChanged, 
                        cvalueRef = v309.cvalueRef, 
                        passwordRef = v309.passwordRef, 
                        loginButtonRef = v309.loginButtonRef, 
                        forgotLinkRef = v309.forgotLinkRef, 
                        crossDeviceButtonRef = v309.crossDeviceButtonRef, 
                        localizedError = v320.localizedError, 
                        localizedErrorMessage = v311, 
                        forceLoginByUsername = v309.state.forceLoginByUsername or v313, 
                        onCrossDeviceLoginActivated = v309.onCrossDeviceLoginActivated, 
                        onEmailOtpActivated = v309.onEmailOtpLoginActivated, 
                        loginButtonDisabled = v309.state.loginButtonDisabled, 
                        isLoginInProgress = v309.state.isLoginInProgress, 
                        authAnalytics = v309.props.authAnalytics, 
                        disableRegularLogin = v312, 
                        showLinkAccountText = v313 and v309.props.uiModeInfo.uiMode ~= l_UiMode_0.VR, 
                        showForgotButton = not v312 and not v313, 
                        onForgetButtonActivated = v309.onForgetButtonActivated, 
                        maxSizeX = math.huge, 
                        showDisclaimerLinks = not v313 and not (v316 or v317), 
                        showDisclaimerButtons = v313 and not v316, 
                        showCredentialHeader = not v313, 
                        isDualLayout = true, 
                        isTenFootUiMode = v313, 
                        emailOtpEnabled = v315, 
                        LayoutOrder = 2
                    })
                }), 
                Divider = not not v314 and v12.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, v318.Tokens.Global.Size_500, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    v12.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v318.Tokens.Global.Size_150)
                    }), 
                    v12.createElement("Frame", {
                        Size = UDim2.new(0, v318.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v318.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 1
                    }), 
                    v12.createElement("TextLabel", {
                        Text = v320.orText, 
                        TextSize = v318.Tokens.Global.Size_200, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTransparency = 0, 
                        TextColor3 = v318.Tokens.Global.Color.Smoke.Color3, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }), 
                    v12.createElement("Frame", {
                        Size = UDim2.new(0, v318.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v318.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 3
                    })
                }) or nil, 
                LoginCode = v314 and v12.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    v12.createElement(v51, {
                        loginCallback = v309.handleLoginWithCode, 
                        isOverlay = false, 
                        hideDeviceCode = not v313, 
                        showLockIcon = not v313, 
                        isDualLayout = true
                    })
                }), 
                Forgot = if v312 or v314 then nil else v12.createElement(l_LinkButton_0, {
                    text = v320.forgotText, 
                    size = UDim2.new(0, 0, 0, 30), 
                    fontStyle = "Footer", 
                    onActivated = v309.onForgetButtonActivated, 
                    colorStyleDefault = "TextDefault", 
                    colorStyleHover = "TextDefault"
                }), 
                DisclaimerLinks = if (v314 or v316) or v317 then nil else v12.createElement(v37, {
                    fillDirection = Enum.FillDirection.Vertical, 
                    LayoutOrder = 60
                }), 
                Padding = not v314 and v12.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v120), 
                    LayoutOrder = 61
                }) or nil
            });
        end);
    end);
end;
v119 = v110.connectBrowserTrackerLayer({
    v65.LoginLayer
}, function(v322, _)
    return {
        isLoginWithOtpEnabled = (v322[v65.LoginLayer] or {}).IsLoginWithOtpEnabled
    };
end)((l_RoactAppPolicy_0.connect(function(v324, _)
    return {
        appPolicy = v324
    };
end)((v13.connect(function(v326, _)
    local v328 = v326.Navigation.history[#v326.Navigation.history];
    return {
        currentPageName = v328[#v328].name, 
        screenSize = v326.ScreenSize, 
        statusBarHeight = v326.TopBar.statusBarHeight, 
        globalGuiInset = v326.GlobalGuiInset
    };
end, function(v329)
    return {
        login = function(...)
            return v329(v24(...));
        end, 
        loginByCode = function(...)
            return v329(v25(...));
        end, 
        loginByPasskey = function(...)
            return v329(v26(...));
        end, 
        loginByOtp = function(...)
            return v329(v27(...));
        end, 
        launchApp = function(v330, v331, v332, v333)
            return v329(v29(v330, v331, v332, v333, v68.Login));
        end, 
        clearApp = function()
            v329(v82());
            return v113.resolve(true);
        end, 
        handleLoginCompletionWithAccountSwitching = function(v334, v335, v336, v337, v338, v339, v340)
            if v104.fromLocalStorage().userId ~= -1 then
                v339():andThen(function(_)
                    v98.setAccountSwitchStatus(v67.Auth.AccountSwitcherSwitchedStatus);
                    v98.setAccountBlob(v338);
                    v98.flush();
                    if not v102 then
                        l_GuiService_0:BroadcastNotification("", v105.DID_LOG_OUT);
                        return ;
                    else
                        l_GuiService_0:BroadcastNotification("", v105.DID_SWITCH_ACCOUNT);
                        return ;
                    end;
                end, function(_)
                    v98.setAccountSwitchStatus("switched");
                    v98.setAccountBlob(v338);
                    v98.flush();
                    v340(v334, v335, v336, v337);
                end);
                return ;
            else
                v98.setAccountBlob(v338);
                v98.flush();
                v340(v334, v335, v336, v337);
                return ;
            end;
        end, 
        setBackNavigationDisabled = function(v343)
            return v329(v34(v343));
        end, 
        navigateToPage = function(v344)
            return v329(v31(v344));
        end, 
        gotoTwoStep = function()
            v329(v31({
                name = v23.TwoStep
            }));
        end, 
        setLoginResult = function(v345)
            v329(v33(v345));
        end, 
        openPasswordResetPrompt = function()
            v329(v32());
        end, 
        openEmailVerificationPrompt = function(v346, v347, v348)
            v329(v35(v57.LoginEmailVerificationPrompt, {
                credentialValue = v346, 
                password = v347, 
                onClose = v348
            }));
        end, 
        openNewAppAvailableModal = function(v349)
            if v117() then
                v329(v35(v57.NewAppAvailableModal, {
                    onButtonActivated = v349
                }));
            end;
        end, 
        openCrossDeviceLoginPrompt = function(v350)
            v329(v36.OpenLoginCodePrompt({
                loginCallback = v350, 
                isOverlay = true
            }));
        end, 
        openAccountSelector = function(v351)
            v329(v38(v351, v89()));
        end, 
        openEmailOtp = function(v352)
            v329(v40(v352));
        end, 
        closeCentralOverlay = function()
            return v329(v41());
        end, 
        resetAppState = function()
            return v329(v82());
        end, 
        renderChallenge = function(v353, v354)
            return v329(v79(v353, v354));
        end, 
        startPasskeyAuthentication = function(v355)
            return v329(v30(v355));
        end, 
        logoutAllLoggedInUsers = function(v356, v357)
            return v329(v81(v356, v357));
        end, 
        logoutWithoutShowConfirmation = function(v358, v359)
            return v329(v39(v358, v359));
        end, 
        openAccountSwitchingErrorOverlay = function(v360, v361, v362, v363, v364, v365, v366)
            return v329(v99(v360, v361, v362, v363, v364, v365, v366));
        end, 
        navigateBack = function()
            return v329(v42());
        end
    };
end)((l_RoactServices_0.connect({
    networking = v14, 
    analytics = v19, 
    authAnalytics = v16, 
    loggingProtocol = l_AppLogging_0, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0, 
    linking = l_AppLinking_0
})(v119)))))));
return function(v367)
    return v12.createElement(v119, v10.Dictionary.join({
        uiModeInfo = l_useUiModeInfo_0()
    }, v367));
end;
