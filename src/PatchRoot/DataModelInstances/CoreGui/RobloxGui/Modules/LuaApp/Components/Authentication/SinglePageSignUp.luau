local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.RoactRodux);
local l_RobloxLocaleIdKey_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RobloxLocaleIdKey;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v12 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v17 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v19 = require(script.Parent.Enum.DisplayNameCounters);
local v20 = require(l_CorePackages_0.Cryo);
local v21 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v22 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v22.App.Button.Button;
local l_ButtonType_0 = v22.App.Button.Enum.ButtonType;
local l_withStyle_0 = v22.Style.withStyle;
local v26 = require(l_Modules_0.LuaApp.withLocalization);
local l_withNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).withNavigationProps;
local v28 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local v29 = require(l_Modules_0.LuaApp.Components.Authentication.UnderAgeInteractiveAlert);
local v30 = require(l_Modules_0.LuaApp.FitChildren);
local v31 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v32 = require(l_Modules_0.LuaApp.Components.Authentication.BackgroundFill);
local v33 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v34 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBirthdayBar);
local v35 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v36 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpGenderSelector);
local v37 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v38 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v39 = require(l_Modules_0.LuaApp.Components.Authentication.ContactInfoField);
local l_PasswordBox_0 = v28.Components.PasswordBox;
local v41 = require(l_Modules_0.LuaApp.Components.Authentication.Birthday.BirthdayField);
local l_TextBoxStateWrapper_0 = v28.Components.TextBoxStateWrapper;
local v43 = require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupText);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v45 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v46 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v47 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v48 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v49 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameValidator);
local v50 = require(l_Modules_0.LuaApp.Thunks.Authentication.PasswordValidator);
local v51 = require(l_Modules_0.LuaApp.Thunks.Authentication.AuthIntent.GetMetaDataFromShareLink);
local v52 = require(l_Modules_0.LuaApp.Thunks.Authentication.AuthIntent.ApiFetchAuthMetaData);
local v53 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUpV2);
local _ = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenEmailOtp);
local v55 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v56 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v58 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v59 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v60 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay);
local v61 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v62 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers);
local v63 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v64 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v65 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v66 = require(l_Modules_0.LuaApp.Flags.FFlagBypassIXPKoreaCompliance);
local v67 = require(l_Modules_0.LuaApp.Flags.FFlagBypassGUACKoreaCompliance);
local v68 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenKISAPopUpAgreements);
local l_KISAComplianceUtils_0 = require(l_CorePackages_0.Workspace.Packages.AuthCompliance).KISAComplianceUtils;
local _ = require(l_Modules_0.LuaApp.Flags.FFlagKoreaKISAUnderAgeNumber);
local _ = require(l_CorePackages_0.LuaSocialLibrariesDeps).llama;
local v72 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenEmailOtp);
local l_ValidateCode_0 = require(l_CorePackages_0.Workspace.Packages.OtpLogin).Thunks.ValidateCode;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.OtpLogin).Constants;
local v75 = require(l_CorePackages_0.Promise);
local l_ImageSetLabel_0 = v22.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_Images_0 = v22.App.ImageSet.Images;
local l_ImageSetButton_0 = v22.Core.ImageSet.ImageSetButton;
local v80 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
local v81 = require(l_Modules_0.LuaApp.Util.DateHelper);
local v82 = require(l_Modules_0.LuaApp.Util.debounce);
local v83 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local v84 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v85 = require(l_Modules_0.LuaApp.Constants);
local v86 = require(l_Modules_0.LuaApp.Experiment.AppBtidLayers);
local v87 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.CredentialType);
local v88 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.UserGender);
local v89 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.SignUpV2ErrorCodes);
local v90 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.InputValidity);
local v91 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.VerifiedSignupErrorCodes);
local v92 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.UsernameIssue);
local v93 = require(l_Modules_0.LuaApp.Components.Authentication.Enum.IssueCondition);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
local v98 = require(l_Modules_0.LuaApp.Flags.GetFFlagSignupRetypePassword);
local v99 = require(l_Modules_0.LuaApp.Flags.GetFFlagMinimalSignupAuthEnabled);
local v100 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasswordlessSignupAuthEnabled);
local v101 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local v102 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtSignupEnabled);
local v103 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtSignupButtonClickEnabled);
local v104 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v105 = require(l_Modules_0.LuaApp.Flags.GetFFlagMultiPageSignupDevOverride);
local v106 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingForShareLinkMetadataAtSignupButtonClickEnabled);
local v107 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaLoginGenderSelector);
local v108 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingForGameJoinEnabled);
local v109 = require(l_Modules_0.LuaApp.Flags.GetFFlagIsAltAttemptLoggingAtSignup);
local v110 = require(l_Modules_0.LuaApp.Flags.FFlagKoreaKISAUnderAgeNumber);
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v112 = require(l_Modules_0.LuaApp.Flags.GetFFlagCredProtocolRegisterPasswordOnSignup);
local v113 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionExperimentEnabled);
local v114 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionRefreshButtonEnabled);
local v115 = require(l_Modules_0.LuaApp.Components.Authentication.SuggestionsFrame);
local v116 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameSuggestor);
local v117 = {
    suggestionsShown = "usernameSuggestionsShown", 
    suggestableInput = "suggestableUsernameInput", 
    refreshButton = "usernameSuggestionRefreshButton"
};
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v119 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenCentralOverlayForAgreeToPhoneNumberVerification);
local v120 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenCentralOverlayForPhoneNumberVerification);
local v121 = require(l_Modules_0.LuaApp.Thunks.Authentication.GetVerifiedSignupChallenge);
local v122 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v123 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v124 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v125 = require(l_Modules_0.LuaApp.Http.Requests.FetchUpdatedUserAgreements);
local v126 = require(l_Modules_0.LuaApp.Http.Requests.FetchSignupUserAgreements);
local v127 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local l_UserAgreementsCounterNames_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).UserAgreementsCounterNames;
local v129 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpPageView);
local v130 = require(l_Modules_0.LuaApp.Components.Authentication.DisplayNameField);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v132 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableSignupBirthdayExperiments);
local v133 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseSignupSpecificUserAgreementsRequest);
local v134 = game:DefineFastFlag("DisplayNamesOnSignupExperiment_v3", false);
local v135 = game:DefineFastFlag("EnableDisplayNamesOnSignupExperimentv1_Dev", false);
local v136 = game:DefineFastInt("DisplayNameEligabilityAgeYears", 17);
local v137 = game:DefineFastFlag("DisplayNamesDiagLogging", false);
local v138 = require(l_Modules_0.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging);
local v139 = UDim2.new(0, 36, 0, 36);
local v140 = l_Images_0["icons/navigation/close"];
local v141 = l_Images_0["icons/actions/cycleLeft"];
local v142 = Vector2.new(540, 1080);
game:DefineFastFlag("LuaVerifiedSignup2", false);
game:DefineFastFlag("LuaVerifiedSignupExperiment2", false);
game:DefineFastFlag("CheckSignupValidityOnRender", false);
local v143 = game:DefineFastFlag("RefactorBirthdayPicker", false);
local v144 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppSignUpPageRefactor);
local v145 = v7.PureComponent:extend("SinglePageSignUp");
v145.init = function(v146)
    v146.state = {
        birthday = nil, 
        shouldHideBirthdayEntry = false, 
        username = "", 
        displayName = "", 
        password = "", 
        retypedPassword = "", 
        retypedPasswordMatches = true, 
        retypedPasswordFocused = false, 
        birthdayValid = v90.Unvalidated, 
        usernameValid = v90.Unvalidated, 
        passwordValid = v90.Unvalidated, 
        displayNameValid = v90.Unvalidated, 
        isSignUpButtonEnabled = false, 
        isSignUpInProgress = false, 
        gender = v88.Unknown, 
        onScreenKeyboardHeight = 0, 
        isUsernameAnimating = false, 
        isPasswordAnimating = false, 
        birthdayFocused = false, 
        contactMethod = "", 
        emailInput = "", 
        emailValid = false, 
        phoneCountryCode = {}, 
        phoneInput = "", 
        phoneValid = false, 
        verifiedSignupVoucher = "", 
        isCountryCodeSearchVisible = false, 
        hidePassword = nil, 
        agreements = {}, 
        passkeysAvailable = nil, 
        isCredentialsProtocolRegisterPasswordAvailable = nil, 
        pillClicked = false, 
        issueCondition = nil, 
        suggestionControlState = nil, 
        loadingSuggestions = false, 
        signUpError = false, 
        shouldShowUnderAgeAlert = false, 
        shouldShowVngTosAlert = false, 
        showU13AccountSwitcherAlert = false, 
        showParentAccountSwitcherAlert = false, 
        hasSetIneligibleAgeAtLeastOnce = false, 
        recommendedUsername = nil, 
        hasEditedUsername = false, 
        bypassDisplayNameField = false, 
        isUsernameFocused = false, 
        otpSessionToken = "", 
        otpCode = ""
    };
    v146.isAlreadyAuthenticated = false;
    if v55 == true then
        v146.isAlreadyAuthenticated = v56.fromLocalStorage().userId ~= -1;
    end;
    v146.resetDefaultTheme = function()
        local v147 = v59.getAuthenticatedTheme();
        if v147 ~= "" then
            l_MemStorageService_0:Fire(v58.ThemeUpdate, v147);
        end;
    end;
    v146.logoutAllLoggedInUsersCallback = function()
        local l_networking_0 = v146.props.networking;
        local v149 = v59.getAccountBlob();
        local v150 = v56.fromLocalStorage().userId ~= -1;
        v146:setState({
            signUpError = false, 
            isSignUpButtonEnabled = false, 
            isSignUpInProgress = false
        });
        v62(l_networking_0, v149):await();
        if v150 == true then
            v146.props.resetAppState();
            l_AppStorageService_0:SetItem(v6.CredentialValue, "");
            l_AppStorageService_0:Flush();
            v146.props.logoutWithoutShowConfirmation(l_networking_0, l_GuiService_0);
        end;
        v146:setState({
            signUpError = false
        });
        v146.props.closeCentralOverlay();
    end;
    v146.closeOverlayAndDisableSwitcherErrors = function()
        v146.props.closeCentralOverlay();
    end;
    v146.onCloseButtonClicked = function()
        if v55 == true and v146.isAlreadyAuthenticated == true then
            v146.resetDefaultTheme();
        end;
        v146.props.navigateBack();
    end;
    v146.getShouldShowVNGAgreements = function()
        return v146.props.appPolicy.getUseVNGUserAgreementPopup();
    end;
    v146.getShouldShowKISAAgreements = function()
        return (v65 and (v146.props.appPolicy.getUseKoreaKISAUserAgreementPopup() or v67)) and (v146.props.shouldShowKoreanKISASignUpFlow or v66);
    end;
    v146.getShouldAddParentalConsentAgreementId = function()
        return v146.props.appPolicy.getParentalConsentAgreementId();
    end;
    v146.launchKISATermsOfService = function(v151, v152)
        v146.props.openKISAUserAgreements({
            agreements = v146.state.agreements, 
            onAgreeFunction = function(v153)
                local v154 = v20.Dictionary.join(v151, {
                    agreementIds = l_KISAComplianceUtils_0.getAgreedUserAgreements(v153)
                });
                local v155 = v146.getShouldAddParentalConsentAgreementId();
                if not (not v152 or not v155) and v155 ~= "" then
                    table.insert(v154.agreementIds, v155);
                end;
                v146.requestSignUp(v154);
            end, 
            onAbandonFunction = v146.onAbandonKISASignUpFlow
        });
    end;
    v146.getIsSignUpButtonEnabled = function()
        local l_birthday_0 = v146.state.birthday;
        local l_username_0 = v146.state.username;
        local l_password_0 = v146.state.password;
        local l_displayName_0 = v146.state.displayName;
        local l_retypedPassword_0 = v146.state.retypedPassword;
        local l_birthdayValid_0 = v146.state.birthdayValid;
        local l_usernameValid_0 = v146.state.usernameValid;
        local l_passwordValid_0 = v146.state.passwordValid;
        local l_displayNameValid_0 = v146.state.displayNameValid;
        local l_validBirthday_0 = v146.state.validBirthday;
        local v166 = l_password_0 == l_retypedPassword_0;
        local v167 = v146.props.shouldUseMinimalSignup and v99();
        local v168 = v146.props.shouldUsePasswordlessSignup and v100();
        if not ((not v101() or not v146.props.shouldUsePasskeySignup) or v146.state.passkeysAvailable) then
            v168 = false;
        end;
        local v169 = (v132() and v146.props.birthdayPickerVariant) and v146.props.birthdayPickerVariant > 0;
        local v170 = true;
        if l_usernameValid_0 == v90.Valid then
            v170 = true;
            if l_passwordValid_0 == v90.Valid then
                if v146.useRetypePassword() then
                    v170 = not v166;
                    if v170 then
                        goto label0;
                    end;
                end;
                if v169 then
                    v170 = true;
                    if not (l_birthdayValid_0 == v90.Valid) then
                        goto label0;
                    end;
                end;
                v170 = if not not v134 and v146.isDisplayNameFieldRequired() then l_displayNameValid_0 ~= v90.Valid else nil;
            end;
        end;
        ::label0::;
        if not v167 or not l_birthday_0 then
            if (not (not v168 or not l_birthday_0) and l_username_0 ~= "") and l_usernameValid_0 == v90.Valid then
                if v169 and l_birthdayValid_0 ~= v90.Valid then
                    return false;
                else
                    return true;
                end;
            elseif ((not (not l_birthday_0 or v170) and l_username_0 ~= "") and l_password_0 ~= "") and not (((not not v134 and v146.isDisplayNameFieldRequired()) and l_displayName_0 == "") and true or nil) then
                if v143 and l_validBirthday_0 == false then
                    return false;
                else
                    return true;
                end;
            else
                return false;
            end;
        elseif v169 and l_birthdayValid_0 ~= v90.Valid then
            return false;
        else
            return true;
        end;
    end;
    v146.updateState = function(v171)
        v171 = v20.Dictionary.join(v171, {
            retypedPasswordMatches = (v171.password or v146.state.password) == (v171.retypedPassword or v146.state.retypedPassword)
        });
        spawn(function()
            if v146.isMounted then
                v146:setState(v171);
            end;
        end);
    end;
    v146.getHidePassword = function()
        if v146.state.hidePassword == nil then
            return not v146.props.arePasswordFieldsPlaintext;
        else
            return v146.state.hidePassword;
        end;
    end;
    v146.passwordVisibilityToggleCallback = function()
        local v172 = v146.getHidePassword();
        if not v172 then
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.HidePassword);
        else
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.ShowPassword);
        end;
        v146:setState({
            hidePassword = not v172
        });
    end;
    v146.retypePasswordVisibilityToggleCallback = function()
        local v173 = v146.getHidePassword();
        if not v173 then
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.HideRetypePassword);
        else
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.ShowRetypePassword);
        end;
        v146:setState({
            hidePassword = not v173
        });
    end;
    v146.onBirthdaySelected = function(v174, v175)
        v21.assert(v80.is(v174), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
        v146.updateState({
            birthday = v174, 
            validBirthday = v175
        });
        if v146.useVerifiedSignup() then
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.ConfirmBirthday);
        end;
    end;
    v146.onAgeChanged = function(v176)
        local v177 = tonumber(v176);
        if not (v177 ~= nil and v177 >= 1) or v177 > 99 then
            v146.updateState({
                birthday = nil, 
                birthdayValid = v90.Invalid
            });
            return ;
        else
            local v178 = DateTime.now():ToLocalTime();
            local v179 = v80.new({
                Year = v178.Year - v177, 
                Month = v178.Month, 
                Day = v178.Day
            });
            if not (not (v179.Month == 2 and v179.Day == 29) or v81:isLeapYear(v179.Year)) then
                v179.Day = 28;
            end;
            if not v81:isValidDate(v179.Month, v179.Day, v179.Year) then
                v146.updateState({
                    birthday = nil, 
                    birthdayValid = v90.Invalid
                });
                return ;
            else
                v146.updateState({
                    birthday = v179, 
                    birthdayValid = v90.Valid
                });
                return ;
            end;
        end;
    end;
    v146.onAgeAndMonthChanged = function(v180, v181)
        if not (v180 ~= nil and v180 >= 1) or v180 > 99 then
            v146.updateState({
                birthday = nil, 
                birthdayValid = v90.Invalid
            });
            return ;
        else
            local v182 = DateTime.now():ToLocalTime().Year - v180;
            local v183 = v80.new({
                Year = v182, 
                Month = v181, 
                Day = v81:getLastDayOfTheMonthInYear(v181, v182)
            });
            if not v81:isValidDate(v183.Month, v183.Day, v183.Year) then
                v146.updateState({
                    birthday = nil, 
                    birthdayValid = v90.Invalid
                });
                return ;
            else
                v146.updateState({
                    birthday = v183, 
                    birthdayValid = v90.Valid
                });
                return ;
            end;
        end;
    end;
    v146.onMonthAndYearChanged = function(v184, v185)
        local v186 = DateTime.now():ToLocalTime();
        if not (v185 ~= nil and v185 >= v186.Year - 100) or v186.Year < v185 then
            v146.updateState({
                birthday = nil, 
                birthdayValid = v90.Invalid
            });
            return ;
        else
            local v187 = v80.new({
                Year = v185, 
                Month = v184, 
                Day = v81:getLastDayOfTheMonthInYear(v184, v185)
            });
            if not v81:isValidDate(v187.Month, v187.Day, v187.Year) then
                v146.updateState({
                    birthday = nil, 
                    birthdayValid = v90.Invalid
                });
                return ;
            else
                v146.updateState({
                    birthday = v187, 
                    birthdayValid = v90.Valid
                });
                return ;
            end;
        end;
    end;
    v146.usernameSuggestionClicked = function(v188, v189)
        v146.props.authEventAnalytics.reportUsernameSuggestionClicked(v84.Context.SinglePageSignUpScreen, v84.Button.UsernameSuggestion, v188, v189);
    end;
    v146.logRefreshButtonClicked = function()
        v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v117.refreshButton);
    end;
    v146.usernameSuggestionsShown = function(v190, v191)
        v146.props.authEventAnalytics.reportInteractWithActionAndSection(v84.Context.SinglePageSignUpScreen, v84.Field.Username, v84.ActionType.Shown, v117.suggestionsShown, v190, v191);
    end;
    v146.logSuggestableUsername = function(v192)
        v146.props.authEventAnalytics.reportInteractWithAction(v84.Context.SinglePageSignUpScreen, v84.Field.Username, v84.ActionType.Shown, v117.suggestableInput, v192);
    end;
    v146.shouldSuggest = function()
        local v193 = false;
        local l_issueCondition_0 = v146.state.issueCondition;
        if l_issueCondition_0 then
            v193 = l_issueCondition_0[v92.AlreadyInUse] == v93.Problematic;
            for v195, v196 in pairs(l_issueCondition_0) do
                if v195 ~= v92.AlreadyInUse and v196 == v93.Problematic then
                    return false;
                end;
            end;
        end;
        return v193;
    end;
    v146.onBirthdayFocused = function(v197)
        if v146.isMounted then
            v146:setState({
                birthdayFocused = v197
            });
        end;
    end;
    v146.onUsernameTextChanged = function(v198, v199)
        local v200 = nil;
        if not ((not v134 or not v146.shouldShowDisplayNameField()) or v146.state.hasEditedUsername) then
            v200 = v146.state.recommendedUsername ~= v198;
        end;
        v146.updateState({
            username = v198, 
            usernameValid = v199, 
            hasEditedUsername = if not v134 then nil else v200
        });
        if not (not v113() or not v146.shouldSuggest()) then
            v146.logSuggestableUsername(v198);
        end;
    end;
    v146.onDisplayNameTextChanged = function(v201, v202)
        v146.updateState({
            displayName = v201, 
            displayNameValid = v202
        });
    end;
    v146.updateBypassDisplayNameField = function(v203)
        v146:setState({
            bypassDisplayNameField = v203
        });
    end;
    v146.onUsernameTextValidated = function(v204, v205)
        v146.onUsernameTextChanged(v204, v205);
        if v205 == v90.Valid then
            v146.props.authEventAnalytics.reportInteractWithAction(v84.Context.SinglePageSignUpScreen, v84.Field.Username, v84.ActionType.Submit, v205, v204);
        end;
    end;
    v146.onPasswordTextChanged = function(v206, v207)
        v146.updateState({
            password = v206, 
            passwordValid = v207
        });
    end;
    v146.onRetypePasswordTextChanged = function(v208)
        v146.updateState({
            retypedPassword = ""
        });
        v146.debouncedUpdateForRetypedPassword(v208.Text);
    end;
    v146.debouncedUpdateForRetypedPassword = v82(function(v209)
        v146.updateState({
            retypedPassword = v209
        });
    end, 0.6);
    v146.cachedScrollCanvasPositionY = 0;
    v146.cachedScrollCanvasInitialSizeY = 0;
    local v210, v211 = v7.createBinding(0);
    v146.scrollCanvasTargetPositionY = v210;
    v146.updateScrollCanvasTargetPositionY = v211;
    v146.scrollingFrameRef = v7.createRef();
    v146.ageTextFieldRef = v7.createRef();
    v146.usernameTextFieldRef = v7.createRef();
    v146.displayNameTextFieldRef = if not v134 then nil else v7.createRef();
    v146.passwordTextFieldRef = v7.createRef();
    v146.passwordFrameRef = v7.createRef();
    v146.retypePasswordTextFieldRef = v7.createRef();
    v146.onDisplayNameTextChangeCompletedFromKeyboard = function()
        task.spawn(function()
            if v146.displayNameTextFieldRef.current then
                v146.displayNameTextFieldRef.current:ReleaseFocus();
            end;
            task.defer(function()
                if v146.usernameTextFieldRef.current then
                    v146.usernameTextFieldRef.current:CaptureFocus();
                end;
            end);
            if v138 then
                v146.props.authEventAnalytics.reportAuthButtonClick(v84.Context.SinglePageSignUpScreen, v84.Button.DisplayNameNext, v84.State.KeyboardInput);
            end;
        end);
    end;
    v146.onUsernameTextChangeCompletedFromKeyboard = function()
        spawn(function()
            if v146.usernameTextFieldRef.current then
                v146.usernameTextFieldRef.current:ReleaseFocus();
            end;
            if v146.passwordTextFieldRef.current then
                v146.passwordTextFieldRef.current:CaptureFocus();
            end;
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.UsernameNext);
        end);
    end;
    v146.onPasswordTextChangeCompletedFromKeyboard = function()
        spawn(function()
            if v146.passwordTextFieldRef.current then
                v146.passwordTextFieldRef.current:ReleaseFocus();
            end;
            if not (not v146.useRetypePassword() or not v146.retypePasswordTextFieldRef.current) then
                v146.retypePasswordTextFieldRef.current:CaptureFocus();
            end;
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.PasswordNext);
        end);
    end;
    v146.onRetypePasswordTextChangeCompletedFromKeyboard = function()
        spawn(function()
            if v146.retypePasswordTextFieldRef.current then
                v146.retypePasswordTextFieldRef.current:ReleaseFocus();
            end;
            v146.props.authEventAnalytics.reportButtonClicked(v84.Context.SinglePageSignUpScreen, v84.Button.RetypePasswordNext);
        end);
    end;
    v146.cacheScrollCanvasInitialSizeIfNecessary = function()
        if v146.cachedScrollCanvasInitialSizeY == 0 then
            local l_Parent_0 = v146.scrollingFrameRef.current.Parent;
            local l_CanvasSize_0 = v146.scrollingFrameRef.current.CanvasSize;
            v146.cachedScrollCanvasInitialSizeY = l_CanvasSize_0.Y.Scale * (not not l_Parent_0 and l_Parent_0.AbsoluteSize or Vector2.new(0, 0)).Y + l_CanvasSize_0.Y.Offset;
        end;
    end;
    v146.agreeToPhoneNumberVerification = function()
        local l_agreeToPhoneNumberVerification_0 = v146.props.agreeToPhoneNumberVerification;
        local l_networking_1 = v146.props.networking;
        local v216 = v146.state.phoneCountryCode.prefix .. "," .. v146.state.phoneInput .. "," .. v146.state.phoneCountryCode.code;
        l_agreeToPhoneNumberVerification_0(l_networking_1, function()
            v121(l_networking_1, v216):andThen(function(v217)
                v146.verifyPhoneNumber(v217.challenge, v146.state.phoneInput, v216);
            end, function(v218)
                if not (v218 ~= "Authentication.TwoStepVerification.Response.TooManyAttempts" and v218 ~= "Authentication.SignUp.Response.PhoneNumberAlreadyLinked") or v218 == "Authentication.SignUp.Response.InvalidPhoneNumber" then
                    v146.props.showErrorMessageToast(v218);
                    return ;
                else
                    v146.props.showErrorToast();
                    return ;
                end;
            end);
        end, v146.state.phoneInput);
    end;
    v146.onSignUpClick = function()
        if v146.useVerifiedSignup() and v146.state.contactMethod == v87.PhoneNumber then
            v146.agreeToPhoneNumberVerification();
            return ;
        else
            v146.onSignUpButtonActivated();
            return ;
        end;
    end;
    v146.verifyPhoneNumber = function(v219, v220, v221)
        v146.props.verifyPhoneNumber(v146.props.networking, v146.verifyPhoneNumberCallback, v219, v220, v221, v146.useEmailOptionClickedCallback);
    end;
    v146.verifyPhoneNumberCallback = function(v222)
        v146.verifiedSignupVoucher = v222;
        v146.onSignUpButtonActivated();
    end;
    v146.useEmailOptionClickedCallback = function()
        v146:setState({
            contactMethod = v87.Email
        });
    end;
    v146.phoneCountryCodeSelectorCallback = function(v223)
        v146:setState({
            isCountryCodeSearchVisible = v223
        });
    end;
    v146.onTextBoxFocused = function(v224)
        v146.cacheScrollCanvasInitialSizeIfNecessary();
        local v225 = math.clamp(v146.scrollingFrameRef.current.CanvasPosition.Y, 0, v146.cachedScrollCanvasInitialSizeY);
        if v146.isMounted then
            v146.updateScrollCanvasTargetPositionY((v224.Y - v146.scrollingFrameRef.current.absolutePosition.Y) + v225);
        end;
    end;
    v146.onTextBoxFocusLost = function()
        if v146.isMounted then
            v146.updateScrollCanvasTargetPositionY(0);
        end;
    end;
    v146.onUsernameTextBoxFocusLost = function()
        v146.onTextBoxFocusLost();
        v146.updateState({
            isUsernameFocused = false
        });
    end;
    v146.onRetypePasswordTextBoxFocusLost = function(v226)
        v146.onTextBoxFocusLost();
        v146.updateState({
            retypedPassword = v226.Text, 
            retypedPasswordFocused = false
        });
    end;
    v146.onAnimationStateChangeCallback = function(v227, v228)
        if v227 == Enum.TextInputType.Password then
            v146:setState({
                isPasswordAnimating = v228
            });
            return ;
        else
            v146:setState({
                isUsernameAnimating = v228
            });
            return ;
        end;
    end;
    v146.onFocusedTextBoxPositionChanged = function(v229)
        if not (not v146.state.isUsernameAnimating and not v146.state.isPasswordAnimating) then
            v146.onTextBoxFocused(v229);
        end;
    end;
    v146.getScrollingFrameCanvasPosition = function(v230)
        if v230 > 0 then
            return Vector2.new(0, v230);
        elseif not v146.scrollingFrameRef or not v146.scrollingFrameRef.current then
            return Vector2.new(0, 0);
        else
            return v146.scrollingFrameRef.current.CanvasPosition;
        end;
    end;
    v146.onUsernameTextBoxFocused = function(v231)
        if v113() then
            v146:setState({
                isUsernameFocused = true
            });
        end;
        v146.props.authEventAnalytics.reportUsernameFocus(v84.Context.SinglePageSignUpScreen);
        v146.onTextBoxFocused(v231);
    end;
    v146.onDisplayNameTextBoxFocused = function(v232)
        if v138 then
            v146.props.authEventAnalytics.reportDisplayNameFocus(v84.Context.SinglePageSignUpScreen);
        end;
        v146.onTextBoxFocused(v232);
    end;
    v146.onPasswordTextBoxFocused = function(v233)
        v146.props.authEventAnalytics.reportPasswordFocus(v84.Context.SinglePageSignUpScreen);
        v146.onTextBoxFocused(v233);
    end;
    v146.onRetypePasswordTextBoxFocused = function()
        spawn(function()
            v146.props.authEventAnalytics.reportFocus(v84.Context.SinglePageSignUpScreen, v84.Field.RetypePassword);
            if v146.passwordFrameRef.current then
                v146.onTextBoxFocused(v146.passwordFrameRef.current.AbsolutePosition);
            end;
            v146.updateState({
                retypedPasswordFocused = true
            });
        end);
    end;
    v146.onRetypePasswordFocusedTextBoxPositionChanged = function()
        spawn(function()
            if not (not v146.state.retypedPasswordFocused or not v146.passwordFrameRef.current) then
                v146.onFocusedTextBoxPositionChanged(v146.passwordFrameRef.current.AbsolutePosition);
            end;
        end);
    end;
    v146.updateIsSignUpInProgress = function(v234)
        spawn(function()
            if v146.isMounted then
                v146:setState({
                    isSignUpInProgress = v234
                });
            end;
        end);
    end;
    v146.requestSignUp = function(v235, v236)
        local l_networking_2 = v146.props.networking;
        local l_guiService_0 = v146.props.guiService;
        local l_analytics_0 = v146.props.analytics;
        local l_appPolicy_0 = v146.props.appPolicy;
        local l_omniRecommendationsRequest_0 = v146.props.omniRecommendationsRequest;
        local l_authEventAnalytics_0 = v146.props.authEventAnalytics;
        local l_signUp_0 = v146.props.signUp;
        local l_setBackNavigationDisabled_0 = v146.props.setBackNavigationDisabled;
        local function v247(v245, v246)
            if not v245 then
                v146.updateIsSignUpInProgress(false);
                return ;
            else
                l_setBackNavigationDisabled_0(true);
                v146.requestSignUp(v235, v246);
                return ;
            end;
        end;
        local v248 = v146.useVerifiedSignup() and v146.state.contactMethod == v87.PhoneNumber;
        l_signUp_0(l_networking_2, l_omniRecommendationsRequest_0, l_guiService_0, v247, v236, l_analytics_0, l_appPolicy_0, v235, v248, ((v146.props.shouldUsePasskeySignup and v101()) and game:GetEngineFeature("SignupActionRequiredKeyAvailable")) and v146.state.passkeysAvailable or (v104() and v146.props.shouldShowMultipageSignupDirectionalTest) and v146.props.shouldUsePasswordlessSignup, v146.props.shouldAutomaticallyPromptForPasskey, v112() and v146.state.isCredentialsProtocolRegisterPasswordAvailable, l_authEventAnalytics_0):andThen(function()
            l_setBackNavigationDisabled_0(false);
        end, function(v249)
            l_setBackNavigationDisabled_0(false);
            if not v248 then
                if v249 ~= v89.Captcha then
                    v146.updateIsSignUpInProgress(false);
                    v146:setState({
                        signUpError = true
                    });
                end;
                if v249 == v89.VNGAgeUnder12 then
                    v146:setState({
                        shouldShowUnderAgeAlert = true
                    });
                end;
                if v55 == true and v249 == v89.EmptyAccountSwitchBlobRequired then
                    v146.props.openAccountSwitchingErrorOverlay("Authentication.AccountSwitch.Header.LogoutAllAccounts", "Authentication.AccountSwitch.Description.LogoutConfirmation", "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v146.logoutAllLoggedInUsersCallback, v146.props.closeCentralOverlay, v85.Auth.AccountSwitcherSignupEmptyBlobRequiredError);
                    v146:setState({
                        signUpError = false
                    });
                end;
                if v55 == true and v249 == v89.ParentEmptyAccountSwitchBlobRequired then
                    v146.props.openAccountSwitchingErrorOverlay("Authentication.AccountSwitch.Header.LogoutAllAccounts", "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v146.logoutAllLoggedInUsersCallback, v146.props.closeCentralOverlay, v85.Auth.AccountSwitcherParentSignupEmptyBlobRequiredError);
                    v146:setState({
                        signUpError = false
                    });
                end;
            elseif v249 ~= v91.Captcha then
                v146.updateIsSignUpInProgress(false);
                v146:setState({
                    signUpError = true
                });
                return ;
            end;
        end);
    end;
    v146.onSignUpButtonActivated = function()
        local l_setBackNavigationDisabled_1 = v146.props.setBackNavigationDisabled;
        local l_birthday_1 = v146.state.birthday;
        local l_username_1 = v146.state.username;
        local l_password_1 = v146.state.password;
        local l_gender_0 = v146.state.gender;
        local v255 = v146.getIsSignUpButtonEnabled();
        local l_locale_0 = v146.locale;
        local l_emailInput_0 = v146.state.emailInput;
        local _ = function(v258)
            local v259 = {};
            for _, v261 in ipairs(v258) do
                table.insert(v259, v261.id);
            end;
            return v259;
        end;
        if v255 then
            v146.props.authEventAnalytics.reportSignUpButtonClicked(v84.Context.SinglePageSignUpScreen);
            if v103() then
                local v263 = l_LinkingProtocol_0:getLastLuaURL();
                local v264 = "";
                do
                    local l_v264_0 = v264;
                    if (not v106() or not v263) or not string.find(v263, "share") then
                        if v108() then
                            local l_l_ExperienceService_0_PendingJoinAttempt_0 = l_ExperienceService_0:GetPendingJoinAttempt();
                            if l_l_ExperienceService_0_PendingJoinAttempt_0 and l_l_ExperienceService_0_PendingJoinAttempt_0 ~= nil then
                                l_v264_0 = l_HttpService_0:JSONEncode(l_l_ExperienceService_0_PendingJoinAttempt_0);
                            end;
                        end;
                    else
                        local v267, v268, v269 = v263:match("code=(.-)&type=(.-)&stamp=(.*)");
                        if not v269 then
                            local v270, v271 = v263:match("code=(.-)&type=(.*)");
                            v267 = v270;
                            v268 = v271;
                        end;
                        if not (not v267 or not v268) then
                            v51(v146.props.networking, v267, v268):andThen(function(v272)
                                if v272 and v272 ~= nil then
                                    l_v264_0 = l_HttpService_0:JSONEncode(v272);
                                end;
                            end, function(_)
                                warn("Error fetching share link metadata: ", error);
                            end):await();
                        end;
                    end;
                    v146.props.authEventAnalytics.reportAuthButtonClick(v84.Context.SinglePageSignUpScreen, v84.Button.SignUp, l_v264_0, v263, v146.isAltAttempt);
                end;
            end;
            if not (not v137 or not v146.props.shouldSeeDisplayNamesOnSignup) then
                if v146.state.recommendedUsername == l_username_1 then
                    v127(v19.SignUpWithRecommendedUsernames, 1);
                elseif v146.state.hasEditedUsername then
                    v127(v19.SignUpWithEditedUsernames, 1);
                end;
                if v146.state.bypassDisplayNameField then
                    v127(v19.SignupBypassingDisplayNames, 1);
                end;
            end;
            v146.updateIsSignUpInProgress(true);
            l_setBackNavigationDisabled_1(true);
            v146:setState({
                signUpError = false
            });
            local v274 = {
                birthday = not not l_birthday_1 and l_birthday_1:FormatForEndpoint() or "", 
                username = l_username_1, 
                password = l_password_1, 
                displayName = if not not v134 and v146.isDisplayNameFieldRequired() then v146.state.displayName else nil, 
                gender = l_gender_0, 
                locale = l_locale_0
            };
            local v275 = v146.useVerifiedSignup();
            if v275 and v146.state.contactMethod == v87.Email then
                v274.email = l_emailInput_0;
            elseif v275 and v146.state.contactMethod == v87.PhoneNumber then
                v274.verifiedSignupVoucher = v146.verifiedSignupVoucher;
            end;
            if v146.props.appPolicy.getAddUserAgreementIdsToSignupRequest() then
                local l_agreements_0 = v146.state.agreements;
                if #l_agreements_0 > 0 then
                    local v277 = {};
                    for _, v279 in ipairs(l_agreements_0) do
                        table.insert(v277, v279.id);
                    end;
                    v274.agreementIds = v277;
                else
                    v127(l_UserAgreementsCounterNames_0.AgreementsIdsEmptyOnSignup, 1);
                end;
            end;
            if not v146.getShouldShowVNGAgreements() then
                if not v146.getShouldShowKISAAgreements() then
                    v146.requestSignUp(v274);
                else
                    local v280 = v146.getUserAge();
                    if v280 and v280 < v110 then
                        v146.launchParentSignUpOtp(v274);
                        return ;
                    else
                        v146.launchKISATermsOfService(v274, false);
                        return ;
                    end;
                end;
            else
                v146.props.showVNGUserAgreementsPopup(v146.state.agreements, function(v281)
                    local l_v274_0 = v274;
                    local v283 = {};
                    for _, v285 in ipairs(v281) do
                        table.insert(v283, v285.id);
                    end;
                    l_v274_0.agreementIds = v283;
                    v146.requestSignUp(v274);
                end, function()
                    v146.updateIsSignUpInProgress(false);
                    l_setBackNavigationDisabled_1(false);
                end);
                return ;
            end;
        end;
    end;
    v146.onGenderChanged = function(v286)
        if v146.isMounted then
            v146.updateState({
                gender = v286
            });
        end;
    end;
    v146.validUsernameEntered = function(_)
        local v288 = false;
        if v146.state.username ~= "" then
            v288 = v146.state.usernameValid ~= v90.Invalid;
        end;
        return v288;
    end;
    v146.validPasswordEntered = function()
        local v289 = false;
        if v146.state.password ~= "" then
            v289 = v146.state.passwordValid ~= v90.Invalid;
        end;
        return v289;
    end;
    v146.useVerifiedSignup = function()
        return game:GetFastFlag("LuaVerifiedSignup2") or (game:GetFastFlag("LuaVerifiedSignupExperiment2") and v146.props.useVerifiedSignupPage) and not l_GuiService_0:IsTenFootInterface();
    end;
    v146.useRetypePassword = function()
        return v98() or v146.props.useRetypePasswordAtSignup;
    end;
    v146.useUsernameSuggestions = function()
        return v113() and v146.props.shouldUseUsernameSuggestions;
    end;
    v146.useRefreshButton = function()
        return v114() and v146.props.enableRefreshButton;
    end;
    v146.getBirthdayVariant = function()
        if not v104() or not v146.state.shouldHideBirthdayEntry then
            if v132() and v146.props.birthdayPickerVariant ~= nil then
                return v146.props.birthdayPickerVariant;
            else
                return 0;
            end;
        else
            return -1;
        end;
    end;
    v146.SetContactMethod = function(v290)
        v146.updateState({
            contactMethod = v290
        });
    end;
    v146.SetPhoneNumber = function(v291, v292, v293)
        v146.updateState({
            phoneCountryCode = v291, 
            phoneInput = v292, 
            phoneValid = v293
        });
    end;
    v146.SetEmail = function(v294, v295)
        v146.updateState({
            emailInput = v294, 
            emailValid = v295
        });
    end;
    v146.updatePillClicked = function()
        v146.updateState({
            pillClicked = true
        });
    end;
    v146.resetPillClicked = function()
        v146.updateState({
            pillClicked = false
        });
    end;
    v146.updateIssueCondition = function(v296)
        v146.updateState({
            issueCondition = v296
        });
    end;
    v146.updateSuggestionControlState = function(_, v298)
        v146.updateState({
            suggestionControlState = v298
        });
    end;
    v146.loadSuggestions = function()
        v146.updateState({
            loadingSuggestions = true
        });
    end;
    v146.finishSuggestions = function()
        v146.updateState({
            loadingSuggestions = false
        });
    end;
    v146.onSignUpContentFrameCanvasSizeChange = function(_)
        v146.scrollingFrameRef.current.CanvasPosition = v146.getScrollingFrameCanvasPosition((v146.scrollCanvasTargetPositionY:getValue()));
    end;
    v146.getUserAge = function()
        if not v146.state.birthday then
            return nil;
        else
            return v146.state.birthday:GetAgeInYears();
        end;
    end;
    v146.getUsernamePlaceholder = function(v300)
        if not v146.props.shouldSeeDisplayNamesOnSignup then
            return v300.usernamePlaceholder;
        elseif v146.state.birthday then
            if not (v136 <= v146.getUserAge()) or v146.state.hasSetIneligibleAgeAtLeastOnce then
                return v300.usernamePlaceholder;
            else
                return v300.agedUpUsernamePlaceholder;
            end;
        else
            return "";
        end;
    end;
    v146.shouldShowUsernameField = function()
        if not v146.props.shouldSeeDisplayNamesOnSignup then
            return true;
        elseif (v146.state.birthday and v146.getUserAge() >= v136) and not v146.state.hasSetIneligibleAgeAtLeastOnce then
            return v146.state.recommendedUsername ~= nil;
        else
            return true;
        end;
    end;
    v146.shouldShowDisplayNameField = function()
        local l_shouldSeeDisplayNamesOnSignup_0 = v146.props.shouldSeeDisplayNamesOnSignup;
        if l_shouldSeeDisplayNamesOnSignup_0 then
            l_shouldSeeDisplayNamesOnSignup_0 = v146.state.birthday;
            if l_shouldSeeDisplayNamesOnSignup_0 then
                l_shouldSeeDisplayNamesOnSignup_0 = false;
                if v136 <= v146.getUserAge() then
                    l_shouldSeeDisplayNamesOnSignup_0 = not v146.state.hasSetIneligibleAgeAtLeastOnce;
                end;
            end;
        end;
        return l_shouldSeeDisplayNamesOnSignup_0;
    end;
    v146.isDisplayNameFieldRequired = function()
        return v146.shouldShowDisplayNameField() and not v146.state.bypassDisplayNameField;
    end;
    v146.isValidDisplayNameEntered = function()
        local v302 = false;
        if v146.state.displayName ~= "" then
            v302 = v146.state.displayNameValid ~= v90.Invalid;
        end;
        return v302;
    end;
    v146.setUsernameRecommendation = function(v303)
        v146:setState(function(v304)
            return {
                recommendedUsername = if v304.recommendedUsername ~= nil and v303 == "" then nil else v303
            };
        end);
    end;
    v146.getUsernameGuidanceText = function(v305)
        if (not ((v146.shouldShowDisplayNameField() and v146.state.recommendedUsername ~= "") and v146.state.recommendedUsername ~= nil) or v146.state.hasEditedUsername) or v146.state.isUsernameFocused then
            return nil;
        else
            return v305.autogeneratedUsernameGuidance;
        end;
    end;
    v146.validateOtpCode = function(v306, v307, v308)
        v146.state.otpSessionToken = v306;
        v146.state.otpCode = v307;
        local l_networking_3 = v146.props.networking;
        local v310 = {
            origin = l_Constants_0.otpServiceOriginSignup, 
            contactType = l_Constants_0.otpServiceContactType, 
            passCode = v146.state.otpCode, 
            otpSessionToken = v146.state.otpSessionToken
        };
        local v311 = {
            otpSessionToken = tostring(v146.state.otpSessionToken), 
            otpContactType = l_Constants_0.otpServiceContactType
        };
        return l_ValidateCode_0(l_networking_3, v310)():andThen(function(_)
            v146.props.closeCentralOverlay();
            v308.otpSession = v311;
            v146.launchKISATermsOfService(v308, true);
        end):catch(function(v313)
            return v75.reject(v313);
        end);
    end;
    v146.onAbandonKISASignUpFlow = function()
        v146.updateIsSignUpInProgress(false);
    end;
    v146.shouldApplyMultiPageSignupTreatment = function()
        return (v104() and v146.props.shouldShowMultipageSignupDirectionalTest) and v146.getBirthdayVariant() == -1;
    end;
    v146.launchParentSignUpOtp = function(v314)
        v146.props.openEmailOtp({
            origin = l_Constants_0.otpServiceOriginSignup, 
            codeLength = 6, 
            enterEmailTitleKey = l_Constants_0.translationKeys.parentEmailTitleKey, 
            enterEmailDescriptionKey = l_Constants_0.translationKeys.sendParentVerificationCodeKey, 
            enterCodeTitleKey = l_Constants_0.translationKeys.oneTimeCodeTitleKey, 
            enterCodeDescriptionKey = l_Constants_0.translationKeys.oneTimeCodeHelpDescriptionKey, 
            complianceCheckboxMessageKey = l_Constants_0.translationKeys.parentalConsentModalDescriptionKey, 
            onSubmitCode = function(v315, v316)
                return v146.validateOtpCode(v315, v316, v314);
            end, 
            onModalAbandoned = v146.onAbandonKISASignUpFlow, 
            screenSize = v146.props.screenSize
        });
    end;
    l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v317)
        local v318 = v317.isAvailable or false;
        local v319 = false;
        if not (not v317.password or not v317.password.isAvailable) then
            v319 = true;
        end;
        if v146.isMounted then
            v146:setState({
                passkeysAvailable = v318, 
                isCredentialsProtocolRegisterPasswordAvailable = v319
            });
        end;
        v146.props.authEventAnalytics.reportAuthPageload(v84.Context.PasskeySignup, (tostring(v318)));
    end):catch(function(v320)
        warn("Error checking for available credential types. Error: ", v320);
    end);
    v146.isMounted = false;
end;
v145.didMount = function(v321)
    v321.isMounted = true;
    v321.isAltAttempt = nil;
    if v55 == true and v321.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v58.ThemeUpdate, "dark");
    end;
    v321.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
        v321:setState({
            onScreenKeyboardHeight = not not l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0
        });
    end);
    local v322 = v321.props.appPolicy.getAddUserAgreementIdsToSignupRequest();
    local v323 = v321.getShouldShowVNGAgreements();
    local v324 = v321.getShouldShowKISAAgreements();
    if not (not (v322 or v323) and not v324) then
        local function v326(v325)
            if v325 then
                if #v325 > 0 then
                    v321.updateState({
                        agreements = v325
                    });
                    return ;
                else
                    v127(l_UserAgreementsCounterNames_0.FetchAgreementsEmptyResponseOnSignup, 1);
                    return ;
                end;
            else
                v127(l_UserAgreementsCounterNames_0.FetchAgreementsHttpRequestFailureOnSignup, 1);
                return ;
            end;
        end;
        if not v133() then
            v125(v321.props.networking, v321.props.analytics):andThen(v326, function()
            end);
        else
            v126(v321.props.networking, v321.props.analytics):andThen(v326, function()
            end);
        end;
    end;
    v321.props.authEventAnalytics.reportScreenLoaded(v84.Context.SinglePageSignUpScreen);
    v321.props.loggingProtocol:logEventOnce("signup_page_did_mount");
    if v102() then
        local v327 = l_LinkingProtocol_0:getLastLuaURL();
        if not v109() then
            v321.props.authEventAnalytics.reportAuthPageload(v84.Context.SinglePageSignUpScreen, v327, v321.isAltAttempt);
        else
            v52(v321.props.networking):andThen(function(v328)
                if v328 and v328.IsAltBrowserTracker ~= nil then
                    v321.isAltAttempt = v328.IsAltBrowserTracker;
                    v321.props.authEventAnalytics.reportAuthPageload(v84.Context.SinglePageSignUpScreen, v327, v321.isAltAttempt);
                end;
            end, function(_)
                warn("Error auth metadata: ", error);
                v321.props.authEventAnalytics.reportAuthPageload(v84.Context.SinglePageSignUpScreen, v327, v321.isAltAttempt);
            end);
        end;
    end;
    if not (not v104() or not v321.props.birthday) then
        v321.onBirthdaySelected(v80.new(v321.props.birthday), v90.Valid);
        v321:setState({
            shouldHideBirthdayEntry = true
        });
    end;
end;
v145.willUnmount = function(v330)
    v330.isMounted = false;
    v330.isAltAttempt = nil;
    if v55 == true and v330.isAlreadyAuthenticated == true then
        v330.resetDefaultTheme();
    end;
    if v330.keyboardVisibleChanged then
        v330.keyboardVisibleChanged:disconnect();
        v330.keyboardVisibleChanged = nil;
    end;
end;
v145.didUpdate = function(v331, _, v333)
    if not (not (v134 and v331.state.birthday ~= nil) or v331.state.hasSetIneligibleAgeAtLeastOnce) and v331.getUserAge() < v136 then
        v331:setState({
            hasSetIneligibleAgeAtLeastOnce = true
        });
    end;
    if not (not v137 or not v331.props.shouldSeeDisplayNamesOnSignup) then
        if not (not (v331.state.recommendedUsername ~= "") or not v331.state.hasEditedUsername) and v331.state.hasEditedUsername ~= v333.hasEditedUsername then
            v127(v19.ReccomendedNameEdited, 1);
        end;
        if not (not ((((v331.state.recommendedUsername ~= nil and v331.state.recommendedUsername ~= "") and v331.state.hasEditedUsername == true) and v331.state.username == "") and v333.username ~= "") or not v331.props.shouldSeeDisplayNamesOnSignup) then
            v127(v19.ReccomendedNameManuallyCleared, 1);
        end;
        if (v331.state.birthday ~= nil and v333.birthday ~= nil) and v331.state.birthday ~= v333.birthday then
            if v136 <= v331.getUserAge() and v333.birthday:GetAgeInYears() < v136 then
                v127(v19.BirthdayChangedToAboveDisplayAge, 1);
            end;
            if v331.getUserAge() < v136 and v136 <= v333.birthday:GetAgeInYears() then
                v127(v19.BirthdayChangedToAboveDisplayAge, 1);
            end;
        end;
    end;
end;
v145.render = function(v334)
    if not v144() then
        return v334:renderDeprecated();
    else
        return v334:renderWithView();
    end;
end;
v145.renderWithView = function(v335)
    local l_birthday_2 = v335.state.birthday;
    local v337 = v335.getIsSignUpButtonEnabled();
    local v338 = not v335.validUsernameEntered();
    local v339 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v340 = "Authentication.SignUp.Label.ErrorsWithPassword";
    local v341 = nil;
    if l_birthday_2 then
        if not v338 then
            if not v335.validPasswordEntered() then
                v341 = "Authentication.SignUp.Response.PasswordMustBeSetFirst";
            end;
        else
            v341 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
        end;
    else
        v339 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v341 = v339;
        v340 = v339;
        v338 = true;
    end;
    local v342 = "Authentication.SignUp.Response.PasswordsDoNotMatch";
    local v343 = not v335.state.retypedPasswordMatches and v335.state.retypedPassword ~= "";
    if v341 then
        v342 = v341;
        v343 = v335.state.retypedPasswordFocused or v335.state.retypedPassword ~= "";
    end;
    return v26({
        retypePasswordErrorText = v342
    })(function(v344)
        v335.locale = v344[l_RobloxLocaleIdKey_0];
        return v7.createElement(v129, {
            navigateBack = v335.props.navigateBack, 
            useVerifiedSignup = v335.useVerifiedSignup, 
            useRetypePassword = v335.useRetypePassword, 
            useUsernameSuggestions = v335.useUsernameSuggestions, 
            useRefreshButton = v335.useRefreshButton, 
            onGenderChanged = v335.onGenderChanged, 
            getHidePassword = v335.getHidePassword, 
            passwordVisibilityToggleCallback = v335.passwordVisibilityToggleCallback, 
            onBirthdaySelected = v335.onBirthdaySelected, 
            onBirthdayFocused = v335.onBirthdayFocused, 
            onSignUpClick = v335.onSignUpClick, 
            usernameSuggestionClicked = v335.usernameSuggestionClicked, 
            usernameSuggestionsShown = v335.usernameSuggestionsShown, 
            shouldSuggest = v335.shouldSuggest, 
            updateIssueCondition = v335.updateIssueCondition, 
            updateSuggestionControlState = v335.updateSuggestionControlState, 
            logRefreshButtonClicked = v335.logRefreshButtonClicked, 
            loadSuggestions = v335.loadSuggestions, 
            finishSuggestions = v335.finishSuggestions, 
            validUsernameEntered = v335.validUsernameEntered, 
            validPasswordEntered = v335.validPasswordEntered, 
            onUsernameTextBoxFocused = v335.onUsernameTextBoxFocused, 
            onPasswordTextBoxFocused = v335.onPasswordTextBoxFocused, 
            onUsernameTextChanged = v335.onUsernameTextChanged, 
            onUsernameTextValidated = v335.onUsernameTextValidated, 
            onPasswordTextChanged = v335.onPasswordTextChanged, 
            onTextBoxFocusLost = v335.onTextBoxFocusLost, 
            onFocusedTextBoxPositionChanged = v335.onFocusedTextBoxPositionChanged, 
            onAnimationStateChangeCallback = v335.onAnimationStateChangeCallback, 
            onUsernameTextChangeCompletedFromKeyboard = v335.onUsernameTextChangeCompletedFromKeyboard, 
            onPasswordTextChangeCompletedFromKeyboard = v335.onPasswordTextChangeCompletedFromKeyboard, 
            onRetypePasswordFocusedTextBoxPositionChanged = v335.onRetypePasswordFocusedTextBoxPositionChanged, 
            onRetypePasswordTextChanged = v335.onRetypePasswordTextChanged, 
            onRetypePasswordTextBoxFocused = v335.onRetypePasswordTextBoxFocused, 
            onRetypePasswordTextBoxFocusLost = v335.onRetypePasswordTextBoxFocusLost, 
            onRetypePasswordTextChangeCompletedFromKeyboard = v335.onRetypePasswordTextChangeCompletedFromKeyboard, 
            retypePasswordVisibilityToggleCallback = v335.retypePasswordVisibilityToggleCallback, 
            phoneCountryCodeSelectorCallback = v335.phoneCountryCodeSelectorCallback, 
            SetContactMethod = v335.SetContactMethod, 
            SetPhoneNumber = v335.SetPhoneNumber, 
            SetEmail = v335.SetEmail, 
            isUsernameAnimating = v335.state.isUsernameAnimating, 
            isPasswordAnimating = v335.state.isPasswordAnimating, 
            birthday = v335.state.birthday, 
            username = v335.state.username, 
            isSignUpInProgress = v335.state.isSignUpInProgress, 
            onScreenKeyboardHeight = v335.state.onScreenKeyboardHeight, 
            usernameValid = v335.state.usernameValid, 
            passwordValid = v335.state.passwordValid, 
            issueCondition = v335.state.issueCondition, 
            loadingSuggestions = v335.state.loadingSuggestions, 
            isRetypePasswordInErrorState = v343, 
            retypePasswordErrorText = v344.retypePasswordErrorText, 
            isSignUpButtonEnabled = v337, 
            birthdayFocused = v335.state.birthdayFocused, 
            isCountryCodeSearchVisible = v335.state.isCountryCodeSearchVisible, 
            contactMethod = v335.state.contactMethod, 
            signUpError = v335.state.signUpError, 
            UsernameValidator = v49, 
            PasswordValidator = v50, 
            signUpContentFrameRef = v335.scrollingFrameRef, 
            ageTextFieldRef = v335.ageTextFieldRef, 
            usernameTextFieldRef = v335.usernameTextFieldRef, 
            passwordTextFieldRef = v335.passwordTextFieldRef, 
            passwordFrameRef = v335.passwordFrameRef, 
            retypePasswordTextFieldRef = v335.retypePasswordTextFieldRef, 
            onSignUpContentFrameCanvasSizeChange = v335.onSignUpContentFrameCanvasSizeChange, 
            scrollCanvasTargetPositionY = v335.scrollCanvasTargetPositionY, 
            updateScrollCanvasTargetPositionY = v335.updateScrollCanvasTargetPositionY, 
            getScrollingFrameCanvasPosition = v335.getScrollingFrameCanvasPosition
        });
    end);
end;
v145.renderDeprecated = function(v345)
    local l_birthday_3 = v345.state.birthday;
    local l_username_2 = v345.state.username;
    local v348 = v345.getIsSignUpButtonEnabled();
    local l_isSignUpInProgress_0 = v345.state.isSignUpInProgress;
    local l_gender_1 = v345.state.gender;
    local v351 = v345.props.formFactor == l_FormFactor_0.WIDE;
    local v352 = 0;
    local v353 = 0;
    local v354 = v345.state.onScreenKeyboardHeight > 0;
    local l_contactMethod_0 = v345.state.contactMethod;
    local v356 = not not l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local v357 = not v345.validUsernameEntered();
    local v358 = v345.useVerifiedSignup();
    local v359 = (not not v351 and v358) and 12 or 0;
    local v360 = "Authentication.SignUp.Label.ErrorsWithUsername";
    local v361 = "Authentication.SignUp.Label.ErrorsWithPassword";
    local v362 = nil;
    local v363 = v345.useRetypePassword();
    local v364 = v345.getHidePassword();
    local v365 = v345.useUsernameSuggestions();
    local v366 = v345.useRefreshButton();
    if l_birthday_3 then
        if (not v134 or not v345.isDisplayNameFieldRequired()) or v345.isValidDisplayNameEntered() then
            if not v357 then
                if not v345.validPasswordEntered() then
                    v362 = "Authentication.SignUp.Response.PasswordMustBeSetFirst";
                end;
            else
                v361 = "Authentication.SignUp.Response.UsernameMustBeSetFirst";
                v362 = v361;
            end;
        else
            v357 = true;
            v361 = "Authentication.SignUp.Response.AgedUpDisplayNameSetFirst";
            v362 = v361;
        end;
    else
        v360 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst";
        v362 = v360;
        v361 = v360;
        v357 = true;
    end;
    local v367 = "Authentication.SignUp.Response.PasswordsDoNotMatch";
    local v368 = not v345.state.retypedPasswordMatches and v345.state.retypedPassword ~= "";
    if v362 then
        v367 = v362;
        v368 = v345.state.retypedPasswordFocused or v345.state.retypedPassword ~= "";
    end;
    if v351 then
        if not v354 then
            v352 = 48;
            v353 = 24;
        else
            v352 = v345.state.onScreenKeyboardHeight + 10;
        end;
    end;
    local v369 = v99();
    local v370 = v345.props.shouldUseMinimalSignup and v369;
    local v371 = v345.props.shouldHideGenderOption and v369;
    local v372 = v345.props.shouldAutofocusOnBirthday and v369;
    local v373 = v345.props.shouldUsePasswordlessSignup and v100();
    local v374 = v345.getShouldShowVNGAgreements();
    local v375 = v345.getShouldShowKISAAgreements();
    local v376 = v345.shouldApplyMultiPageSignupTreatment();
    if not ((not v101() or not v345.props.shouldUsePasskeySignup) or v345.state.passkeysAvailable) then
        v373 = false;
    end;
    local v377 = ((v345.props.shouldUsePasskeySignup and v101()) and game:GetEngineFeature("SignupActionRequiredKeyAvailable")) and v345.state.passkeysAvailable;
    local l_v140_0 = v140;
    if v376 then
        l_v140_0 = v141;
    end;
    return l_withStyle_0(function(v379)
        return v26({
            signUpText = "Authentication.SignUp.Label.SignUp", 
            continueText = "Authentication.SignUp.Action.Continue", 
            retypePasswordLabelText = "Authentication.SignUp.Description.ConfirmPassword", 
            retypePasswordErrorText = v367, 
            usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse", 
            agedUpUsernamePlaceholder = "Authentication.Login.Label.AgedUpUsername", 
            passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder", 
            autogeneratedUsernameGuidance = if not v134 then nil else "Feature.DisplayName.Label.GeneratedUserName", 
            usernameHelperTitleText = "Authentication.SignUp.Heading.PickAUsername", 
            usernameHelperDescriptionText = "Authentication.SignUp.Description.UsernameHelp"
        })(function(v380)
            v345.locale = v380[l_RobloxLocaleIdKey_0];
            local v381 = not v370;
            local v382 = 38;
            local v383 = not v351 and 48 or 25;
            if v376 then
                v382 = 24;
                v383 = 24;
            end;
            if v134 then
                v381 = v345.shouldShowUsernameField() and not v370;
            end;
            local l_createElement_0 = v7.createElement;
            local l_v33_0 = v33;
            local v386 = {
                BackgroundTransparency = 1, 
                includeStatusBar = true, 
                renderFullscreenBackground = function()
                    return v7.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = not v351 and 0 or 1, 
                        BackgroundColor3 = v379.Theme.BackgroundUIDefault.Color
                    }, {
                        Background = v351 and v7.createElement(v32, {
                            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
                        }), 
                        Mask = v351 and v7.createElement("ImageLabel", {
                            ZIndex = 2, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundColor3 = Color3.new(0, 0, 0), 
                            BackgroundTransparency = 0.5
                        })
                    });
                end
            };
            local v387 = {
                UserInputSink = l_isSignUpInProgress_0 and v7.createElement("ImageButton", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = ""
                }), 
                UnderAgeAlert = v345.state.shouldShowUnderAgeAlert and v7.createElement(v29, {
                    ZIndex = 3, 
                    onDismiss = function()
                        v345:setState({
                            shouldShowUnderAgeAlert = false
                        });
                    end
                })
            };
            local l_createElement_1 = v7.createElement;
            local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
            local v390 = {
                Size = UDim2.new(1, 0, 1, -v352), 
                Position = UDim2.new(0.5, 0, 0, v353), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = v379.Theme.BackgroundUIDefault.Color, 
                ClipsDescendants = true
            };
            local v391 = {
                SizeConstraint = v7.createElement("UISizeConstraint", {
                    MaxSize = v142
                }), 
                HeaderFrame = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1
                }, {
                    BackButton = v7.createElement(l_ImageSetButton_0, {
                        Size = v139, 
                        AutoButtonColor = false, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 12, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_v140_0, 
                        ImageColor3 = v379.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0, 
                        [v7.Event.Activated] = v345.onCloseButtonClicked
                    }), 
                    Title = v380.signUpText and v7.createElement(v31, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        fitAxis = v30.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v380.signUpText or "", 
                        TextWrapped = true, 
                        Font = v379.Font.CaptionHeader.Font, 
                        TextSize = v379.Font.BaseSize * v379.Font.Header1.RelativeSize, 
                        TextColor3 = v379.Theme.TextEmphasis.Color, 
                        TextTransparency = v379.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v379.Theme.UIEmphasis.Color
                })
            };
            local l_createElement_2 = v7.createElement;
            local l_FitScrollingFrame_0 = v30.FitScrollingFrame;
            local v396 = {
                Size = UDim2.new(1, 0, 1, -(49 + v359)), 
                Position = UDim2.new(0.5, 0, 0, 49), 
                AnchorPoint = Vector2.new(0.5, 0), 
                fitFields = {
                    CanvasSize = v30.FitAxis.Height
                }, 
                ScrollBarThickness = 0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScrollingEnabled = not (v345.state.isUsernameAnimating or v345.state.isPasswordAnimating), 
                CanvasPosition = v345.scrollCanvasTargetPositionY:map(function(v394)
                    return v345.getScrollingFrameCanvasPosition(v394);
                end), 
                [v7.Ref] = v345.scrollingFrameRef, 
                [v7.Change.CanvasSize] = function(_)
                    v345.scrollingFrameRef.current.CanvasPosition = v345.getScrollingFrameCanvasPosition((v345.scrollCanvasTargetPositionY:getValue()));
                end
            };
            local v397 = {
                ContentPadding = v7.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, v383)
                }), 
                ListLayout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 5)
                }), 
                MultiPageSignupDescription = v376 and v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    Padding = v7.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 11)
                    }), 
                    MultiPageSignupDescription = v7.createElement(v43, {
                        layoutOrder = 1, 
                        titleText = v380.usernameHelperTitleText, 
                        helpText = v380.usernameHelperDescriptionText
                    })
                })
            };
            local v398 = false;
            if v345.getBirthdayVariant() == 0 then
                v398 = v7.createElement(v34, {
                    layoutOrder = 1, 
                    onBirthdaySelected = v345.onBirthdaySelected, 
                    onBirthdayFocused = v345.onBirthdayFocused, 
                    autoFocusOnMount = v358 or v372
                });
            end;
            v397.BirthdayBar = v398;
            v398 = false;
            if v345.getBirthdayVariant() ~= 0 then
                v398 = v7.createElement(v41, {
                    layoutOrder = 1, 
                    variant = v345.getBirthdayVariant(), 
                    textInputHeight = 36, 
                    hasBirthdayError = v345.state.birthdayValid == v90.Invalid, 
                    onAgeChange = v345.onAgeChanged, 
                    onAgeAndMonthChange = v345.onAgeAndMonthChanged, 
                    onMonthAndYearChange = v345.onMonthAndYearChanged, 
                    ageTextFieldRef = v345.ageTextFieldRef, 
                    screenSize = v345.props.screenSize
                });
            end;
            v397.AgeInput = v398;
            v397.ContactInfoField = v358 and v7.createElement(v39, {
                layoutOrder = 2, 
                Under13 = l_birthday_3 and v81:isRecentOrFutureDate(l_birthday_3.Month, l_birthday_3.Day, l_birthday_3.Year + 13), 
                SetContactMethod = v345.SetContactMethod, 
                SetPhoneNumber = v345.SetPhoneNumber, 
                SetEmail = v345.SetEmail, 
                contactMethod = l_contactMethod_0, 
                phoneCountryCodeSelectorCallback = v345.phoneCountryCodeSelectorCallback
            });
            v397.BackgroundPanel = v358 and v7.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 6), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1
            }, {
                LightPanel = v7.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 100000, 0, 100000), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    BackgroundColor3 = v379.Theme.UIDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0)
                })
            });
            v397.DisplayName = if not not v134 and v345.shouldShowDisplayNameField() then v8.createElement(v130, {
                authEventAnalytics = v345.props.authEventAnalytics, 
                birthday = not l_birthday_3 and "" or l_birthday_3:FormatForEndpoint(), 
                bypassDisplayNameField = v345.state.bypassDisplayNameField, 
                focusedTextBoxPositionChangedCallback = v345.onFocusedTextBoxPositionChanged, 
                layoutOrder = 4, 
                onAnimationStateChangeCallback = v345.onAnimationStateChangeCallback, 
                onDisplayNameTextChanged = v345.onDisplayNameTextChanged, 
                onReturnPressedFromOnScreenKeyboard = v345.onDisplayNameTextChangeCompletedFromKeyboard, 
                pillClicked = v345.state.pillClicked, 
                resetPillClicked = v345.resetPillClicked, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                setUsernameRecommendation = v345.setUsernameRecommendation, 
                shouldDisableRecommendation = v345.state.hasEditedUsername, 
                textBoxFocusedCallback = v345.onDisplayNameTextBoxFocused, 
                textBoxFocusLostCallback = v345.onTextBoxFocusLost, 
                textBoxRef = v345.displayNameTextFieldRef, 
                updateBypassDisplayNameField = v345.updateBypassDisplayNameField, 
                updatePillClicked = v345.updatePillClicked
            }) else nil;
            v397.UsernameValidator = v381 and v7.createElement(v35, {
                layoutOrder = not v134 and 4 or 5, 
                titleTextKey = "Authentication.Login.Label.Username", 
                summaryErrorTextKey = v360, 
                prerequisiteMet = not not l_birthday_3 or false, 
                textInputType = v356, 
                onInputTextChanged = v345.onUsernameTextChanged, 
                onInputTextValidated = not not v365 and v345.onUsernameTextValidated or v345.onUsernameTextChanged, 
                validator = v49, 
                prefilledText = if not v134 then nil else v345.state.recommendedUsername, 
                placeholderText = if not v134 then v380.usernamePlaceholder else v345.getUsernamePlaceholder(v380), 
                validatorAdditionalProps = {
                    birthday = not not l_birthday_3 and l_birthday_3:FormatForEndpoint() or "", 
                    context = v83.Signup
                }, 
                textBoxFocusedCallback = v345.onUsernameTextBoxFocused, 
                textBoxFocusLostCallback = if not v134 then v345.onTextBoxFocusLost else v345.onUsernameTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v345.onFocusedTextBoxPositionChanged, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                onReturnPressedFromOnScreenKeyboard = v345.onUsernameTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v345.onAnimationStateChangeCallback, 
                textBoxRef = v345.usernameTextFieldRef, 
                pillClicked = v345.state.pillClicked, 
                updatePillClicked = v345.updatePillClicked, 
                resetPillClicked = v345.resetPillClicked, 
                issueCondition = v345.state.issueCondition, 
                updateIssueCondition = v345.updateIssueCondition, 
                loadingSuggestions = v345.state.loadingSuggestions, 
                paddingBottomOverride = ((not not v134 and v345.props.shouldSeeDisplayNamesOnSignup) and v345.getUsernameGuidanceText(v380)) and -5 or nil
            });
            v397.UsernameGuidanceText = if (not not v134 and v345.props.shouldSeeDisplayNamesOnSignup) and v345.getUsernameGuidanceText(v380) then v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            }, {
                Padding = v7.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 5)
                }), 
                Label = v7.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v379.Font.CaptionBody.Font, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = v345.getUsernameGuidanceText(v380), 
                    TextColor3 = v379.Theme.TextDefault.Color, 
                    TextSize = v379.Font.BaseSize * v379.Font.CaptionBody.RelativeSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            }) else nil;
            v397.SuggestionsFrame = (v381 and v365) and v7.createElement(v115, {
                layoutOrder = not v134 and 4 or 5, 
                textBoxRef = v345.usernameTextFieldRef, 
                usernameValid = v345.state.usernameValid, 
                birthday = not not l_birthday_3 and l_birthday_3:FormatForEndpoint() or "", 
                suggest = v116, 
                context = v83.Signup, 
                pillClicked = v345.state.pillClicked, 
                updatePillClicked = v345.updatePillClicked, 
                resetPillClicked = v345.resetPillClicked, 
                issueCondition = v345.state.issueCondition, 
                usernameSuggestionClicked = v345.usernameSuggestionClicked, 
                usernameSuggestionsShown = v345.usernameSuggestionsShown, 
                shouldSuggest = v345.shouldSuggest, 
                updateSuggestionControlState = v345.updateSuggestionControlState, 
                useRefreshButton = v366, 
                logRefreshButtonClicked = v345.logRefreshButtonClicked, 
                loadSuggestions = v345.loadSuggestions, 
                finishSuggestions = v345.finishSuggestions, 
                loadingSuggestions = v345.state.loadingSuggestions
            });
            v397.PasswordValidator = (not v370 and not v373) and v7.createElement(v35, {
                disabled = v345.state.birthdayFocused, 
                layoutOrder = not v134 and 5 or 6, 
                titleTextKey = "CommonUI.Messages.Label.Password", 
                summaryErrorTextKey = v361, 
                prerequisiteMet = not v357, 
                textInputType = Enum.TextInputType.Password, 
                onInputTextChanged = v345.onPasswordTextChanged, 
                onInputTextValidated = v345.onPasswordTextChanged, 
                validator = v50, 
                placeholderText = v380.passwordPlaceholder, 
                validatorAdditionalProps = {
                    username = l_username_2
                }, 
                returnKeyType = Enum.ReturnKeyType.Next, 
                textBoxFocusedCallback = v345.onPasswordTextBoxFocused, 
                textBoxFocusLostCallback = v345.onTextBoxFocusLost, 
                focusedTextBoxPositionChangedCallback = v345.onFocusedTextBoxPositionChanged, 
                onReturnPressedFromOnScreenKeyboard = v345.onPasswordTextChangeCompletedFromKeyboard, 
                onAnimationStateChangeCallback = v345.onAnimationStateChangeCallback, 
                textBoxRef = v345.passwordTextFieldRef, 
                centralOverlayBlocksInput = v358, 
                captureFocusOnTapStart = not v345.state.isCountryCodeSearchVisible, 
                frameRef = v363 and v345.passwordFrameRef, 
                hidePassword = if v363 then v364 else nil, 
                onToggleCallback = v363 and v345.passwordVisibilityToggleCallback
            });
            v397.RetypePassword = v363 and v7.createElement(l_TextBoxStateWrapper_0, {
                ChildClass = l_PasswordBox_0, 
                Size = UDim2.new(1, 0, 0, 36), 
                LayoutOrder = not v134 and 6 or 7, 
                LabelText = v380.retypePasswordLabelText, 
                ErrorText = v368 and v380.retypePasswordErrorText, 
                ErrorState = v368, 
                TextBoxLabelPadding = 5, 
                InnerSidePadding = 12, 
                onPositionChangedCallback = v345.onRetypePasswordFocusedTextBoxPositionChanged, 
                ChildProps = {
                    Text = "", 
                    TextSize = v379.Font.BaseSize * v379.Font.Body.RelativeSize, 
                    TextColor = v379.Theme.TextDefault.Color, 
                    onChangeText = v345.onRetypePasswordTextChanged, 
                    onFocused = v345.onRetypePasswordTextBoxFocused, 
                    onFocusLost = v345.onRetypePasswordTextBoxFocusLost, 
                    CaptureFocusOnTapStart = true, 
                    Color = v379.Theme.BackgroundUIContrast.Color, 
                    Transparency = v379.Theme.BackgroundUIContrast.Transparency, 
                    TextBoxRef = v345.retypePasswordTextFieldRef, 
                    onReturnPressedFromOnScreenKeyboard = v345.onRetypePasswordTextChangeCompletedFromKeyboard, 
                    hidePassword = v364, 
                    onToggleCallback = v345.retypePasswordVisibilityToggleCallback, 
                    Disabled = v345.state.birthdayFocused
                }
            });
            v398 = not v371;
            if v398 then
                v398 = false;
                if v107() ~= 2 then
                    v398 = v7.createElement(v36, {
                        layoutOrder = not v134 and 7 or 8, 
                        gender = l_gender_1, 
                        onGenderChanged = v345.onGenderChanged
                    });
                end;
            end;
            v397.GenderSelector = v398;
            v397.Spacing = v7.createElement("Frame", {
                LayoutOrder = not v134 and 8 or 9, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v382)
            });
            v397.SignUpButton = v7.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                layoutOrder = not v134 and 9 or 10, 
                size = UDim2.new(1, 0, 0, 36), 
                text = if v377 or v376 then v380.continueText else v380.signUpText, 
                isDisabled = not v348, 
                isLoading = l_isSignUpInProgress_0, 
                onActivated = v345.onSignUpClick
            });
            v397.DisclaimerText = not (v374 or v375) and v7.createElement(v37, {
                layoutOrder = not v134 and 10 or 11, 
                textXAlignment = Enum.TextXAlignment.Center, 
                paragraphTextKeys = {
                    (v377 or v376) and "Authentication.SignUp.Description.VerificationPageMultiStep" or "Authentication.SignUp.Description.VerificationPage"
                }
            });
            v397.DisclaimerLinks = not (v374 or v375) and v7.createElement(v38, {
                LayoutOrder = not v134 and 11 or 12
            });
            v397.ScrollPadding = v354 and v7.createElement("Frame", {
                LayoutOrder = not v134 and 12 or 13, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v345.state.onScreenKeyboardHeight * 2)
            });
            v391.SignUpContentFrame = l_createElement_2(l_FitScrollingFrame_0, v396, v397);
            v391.Footer = (v358 and v351) and v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 12), 
                Position = UDim2.new(0, 0, 1, -12), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Rounding = v7.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 2, 0), 
                    Position = UDim2.new(0, 0, -1, 0), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(9, 9, 9, 9), 
                    Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                    ImageColor3 = v379.Theme.UIDefault.Color
                })
            });
            v387.Container = l_createElement_1(l_l_ImageSetLabel_0_0, v390, v391);
            return l_createElement_0(l_v33_0, v386, v387);
        end);
    end);
end;
return (l_withNavigationProps_0(function(_, v400)
    return v400;
end)((v17.connectBrowserTrackerLayer({
    v86.SignupLayer
}, function(v401, _)
    local v403 = v401[v86.SignupLayer] or {};
    local _ = v401[v86.ConsoleSignUpLayer];
    local v405 = if not v134 then nil else v403.shouldSeeDisplayNamesOnSignup;
    if v135 then
        v405 = true;
    end;
    if v105() then
        v403.shouldAutofocusOnBirthday = false;
        v403.shouldUsePasswordlessSignup = true;
        v403.shouldShowMultipageSignupDirectionalTest = true;
    end;
    return {
        useVerifiedSignupPage = v403.contactMethodRequired, 
        useRetypePasswordAtSignup = v403.ShowRetypePassword, 
        arePasswordFieldsPlaintext = v403.ArePasswordFieldsPlaintext, 
        shouldUseUsernameSuggestions = v403.usernameSuggestionsEnabled, 
        enableRefreshButton = v403.suggestionRefreshButtonEnabled, 
        shouldUseMinimalSignup = v403.shouldUseMinimalSignup, 
        shouldHideGenderOption = v403.shouldHideGenderOption, 
        shouldAutofocusOnBirthday = v403.shouldAutofocusOnBirthday, 
        shouldUsePasswordlessSignup = v403.shouldUsePasswordlessSignup, 
        shouldUsePasskeySignup = v403.shouldUsePasskeySignup, 
        shouldAutomaticallyPromptForPasskey = v403.shouldAutomaticallyPromptForPasskey, 
        birthdayPickerVariant = v403.birthdayPickerVariant, 
        shouldSeeDisplayNamesOnSignup = v405, 
        shouldShowMultipageSignupDirectionalTest = v403.shouldShowMultipageSignupDirectionalTest, 
        shouldShowKoreanKISASignUpFlow = v403.shouldShowKoreanKISASignUpFlow
    };
end)((l_RoactAppPolicy_0.connect(function(v406, _)
    return {
        appPolicy = v406
    };
end)((l_RoactServices_0.connect({
    networking = v15, 
    guiService = l_AppGuiService_0, 
    authEventAnalytics = v12, 
    analytics = v13, 
    loggingProtocol = l_AppLogging_0, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})((v9.connect(function(v408, _)
    return {
        formFactor = v408.FormFactor, 
        screenSize = v408.ScreenSize
    };
end, function(v410)
    return {
        signUp = function(v411, v412, v413, v414, v415, v416, v417, v418, v419, v420, v421, v422, v423)
            return v410(v53(v411, v412, v413, v414, v415, v416, v417, v418, v419, v420, v421, v422, v423));
        end, 
        agreeToPhoneNumberVerification = function(_, v425, v426)
            return v410(v119({
                verificationChallengeCallback = v425, 
                phoneNumber = v426
            }));
        end, 
        openKISAUserAgreements = function(v427)
            return v410(v68(v427));
        end, 
        setBackNavigationDisabled = function(v428)
            return v410(v46(v428));
        end, 
        navigateBack = function()
            return v410(v45());
        end, 
        showErrorToast = function()
            return v410(v122({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        verifyPhoneNumber = function(_, v430, v431, v432, v433, v434)
            return v410(v120({
                verifyPhoneNumberCallback = v430, 
                phoneNumber = v432, 
                deliveryTarget = v433, 
                challenge = v431, 
                useEmailOptionClickedCallback = v434
            }));
        end, 
        showErrorMessageToast = function(v435)
            return v410(v124({
                toastType = v123.NetworkingError, 
                toastMessage = v435
            }));
        end, 
        showVNGUserAgreementsPopup = function(v436, v437, v438)
            return v410(v47(v48.VNGUserAgreementsPopup, {
                agreements = v436, 
                isSignup = true, 
                agreementAccepted = v437, 
                agreementDeclined = v438
            }, {
                DisableBackButtonClose = true
            }));
        end, 
        closeCentralOverlay = function()
            return v410(v61());
        end, 
        openAccountSwitchingErrorOverlay = function(v439, v440, v441, v442, v443, v444, v445)
            return v410(v60(v439, v440, v441, v442, v443, v444, v445));
        end, 
        resetAppState = function()
            return v410(v63());
        end, 
        logoutWithoutShowConfirmation = function(v446, v447)
            return v410(v64(v446, v447));
        end, 
        openEmailOtp = function(v448)
            v410(v72(v448));
        end
    };
end)(v145))))))))));
