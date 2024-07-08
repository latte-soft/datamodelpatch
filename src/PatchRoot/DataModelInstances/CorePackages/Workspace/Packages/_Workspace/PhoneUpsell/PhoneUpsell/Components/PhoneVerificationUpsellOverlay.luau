local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactRodux);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Parent_0.LuauPolyfill);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v10 = require(l_script_FirstAncestor_0.DuplicateAnalytics.EventStreamConstants);
local v11 = require(l_script_FirstAncestor_0.DuplicateAnalytics.RoactAnalyticsAuthEvents);
local v12 = require(l_script_FirstAncestor_0.Utils.debounce);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v14 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v16 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellState);
local v17 = require(l_script_FirstAncestor_0.Components.EntryView);
local v18 = require(l_script_FirstAncestor_0.Components.AddPhoneView);
local v19 = require(l_script_FirstAncestor_0.Components.VerifyPhoneView);
local v20 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v21 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_LoadingSpinner_0 = v21.App.Loading.LoadingSpinner;
local v24 = require(l_script_FirstAncestor_0.Thunks.SetPhoneNumber);
local v25 = require(l_script_FirstAncestor_0.Thunks.VerifyPhoneCode);
local v26 = require(l_script_FirstAncestor_0.Thunks.ResendPhoneCode);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_SetIsPhoneVerified_0 = require(l_Parent_0.ContactImporter).Actions.SetIsPhoneVerified;
local v29 = require(l_script_FirstAncestor_0.Utils.GetPrefixAndNationalNumberFromRawPhoneAndDefaultPrefix);
local v30 = require(l_Parent_0.RoactAppExperiment);
local l_GetFStringAndroidPhoneVerificationLayer_0 = require(l_Parent_0.SharedFlags).GetFStringAndroidPhoneVerificationLayer;
local l_GetFStringIOSPhoneVerificationLayer_0 = require(l_Parent_0.SharedFlags).GetFStringIOSPhoneVerificationLayer;
local v33 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaUsePhoneNumberTextTypeForPhoneUpsell);
local l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0 = require(l_Parent_0.SharedFlags).GetFFlagAbstractPhoneUpsellFromCentralOverlay;
local l_GetFFlagAbstractShowWebpagePhoneUpsell_0 = require(l_Parent_0.SharedFlags).GetFFlagAbstractShowWebpagePhoneUpsell;
local v36 = require(l_script_FirstAncestor_0.Flags.GetFFlagPhoneUseParentSizeForScreenSize);
local l_GetFFlagAddEntryViewToPhoneVerification_0 = require(l_Parent_0.SharedFlags).GetFFlagAddEntryViewToPhoneVerification;
local l_IdentityProtocol_0 = require(l_Parent_0.IdentityProtocol).IdentityProtocol;
local v39 = {
    name = "United States", 
    code = "US", 
    prefix = "1", 
    localizedName = "United States"
};
local function v40()
end;
local v42 = {
    onSuccess = v40, 
    onFailure = v40, 
    onCancelled = v40, 
    origin = "", 
    eventContext = "", 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhone", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
    extraButtonTextKey = "", 
    onExtraButtonClick = v40, 
    shouldAutofillAndroidPhoneNumberAtLaunch = false, 
    isOTPInputTypeEnabled = false, 
    isPhoneNumberTextTypeEnabled = false, 
    alwaysShowAddPhoneLegalText = false, 
    requireAddPhoneLegalTextCheckbox = false, 
    closeUpsell = v40, 
    showWebpage = function(_)
    end
};
return (v30.connectUserLayer({
    l_GetFStringAndroidPhoneVerificationLayer_0(), 
    l_GetFStringIOSPhoneVerificationLayer_0()
}, function(v43, _)
    local v45 = v43[l_GetFStringAndroidPhoneVerificationLayer_0()] or {};
    local v46 = v43[l_GetFStringIOSPhoneVerificationLayer_0()] or {};
    return {
        isAutofillPhoneNumberEnabled = v45.IsAutofillPhoneNumberEnabled, 
        isAutofillSMSOtpEnabled = v45.IsAutofillSMSOtpEnabled, 
        isOTPInputTypeEnabled = v46.IsAutofillSMSOtpEnabled, 
        isPhoneNumberTextTypeEnabled = v46.IsAutofillPhoneNumberEnabled
    };
end)((l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    authEventAnalytics = v11
})((v5.connect(function(v47, _)
    return {
        countryCodeList = v47.CountryCodeList
    };
end, function(v49)
    return {
        closeCentralOverlay = not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() and function()
            return v49(l_CloseCentralOverlay_0());
        end or nil, 
        setPhoneNumber = function(v50, v51, v52, v53)
            return v49(v24(v50, v51, v52, v53, nil));
        end, 
        verifyPhoneCode = function(v54, v55)
            return v49(v25(v54, v55));
        end, 
        resendPhoneCode = function(v56)
            return v49(v26(v56));
        end, 
        navigateToPage = not l_GetFFlagAbstractShowWebpagePhoneUpsell_0() and function(v57)
            return v49(l_NavigateDown_0(v57));
        end or nil, 
        setIsPhoneVerified = function(v58)
            return v49(l_SetIsPhoneVerified_0(v58));
        end
    };
end)(function(v59)
    local v60 = v14(v42, v59);
    local v61, v62 = v3.useState(if not not l_GetFFlagAddEntryViewToPhoneVerification_0() and v60.entryConfig then v16.Entry else v16.AddPhone);
    local v63, v64 = v3.useState("");
    local v65, v66 = v3.useState(v39);
    local v67, v68 = v3.useState(false);
    local v69, v70 = v3.useState("");
    local v71, v72 = v3.useState("");
    local v73, v74 = v3.useState("");
    local v75, v76 = v3.useState("");
    local v77, _ = v3.useState(false);
    local v79, v80 = v3.useState(false);
    local v81, v82 = v3.useState(false);
    local v83, v84 = v3.useState(false);
    local v85, v86 = v3.useState(0);
    local v87, v88 = v3.useState(Vector2.new(400, 400));
    local v89 = v3.useRef(false);
    local v90 = l_useLocalization_0({
        verifyingKey = "Feature.VerificationUpsell.Label.Verifying", 
        invalidPhoneFormatKey = "Feature.VerificationUpsell.Response.ErrorPhoneFormatInvalid", 
        invalidPhoneNumberKey = "Feature.VerificationUpsell.Response.InvalidPhoneNumberError", 
        invalidVerificationCodeKey = "Feature.VerificationUpsell.Message.InvalidSmsCode", 
        tooManyAccountsKey = "Feature.VerificationUpsell.Response.PhoneHasTooManyAssociatedAccounts", 
        tooManyAttemptsKey = "Feature.VerificationUpsell.Response.TooManyAttemptsTryAgainLater", 
        genericErrorKey = "Feature.VerificationUpsell.Response.ErrorTryAgain"
    });
    local v91 = nil;
    v3.useEffect(function()
        if not (v67 or not v60.countryCodeList) and #v60.countryCodeList > 0 then
            for _, v93 in v60.countryCodeList, nil, nil do
                if v93.isDefault then
                    v66(v93);
                end;
            end;
            v68(true);
        end;
    end, {
        v60.countryCodeList, 
        v67
    });
    local function _()
        local l_default_0 = l_IdentityProtocol_0.default;
        l_default_0:supportsGetPhoneNumber():andThen(function(v95)
            print("PhoneVerification: Autofill phone number supported: {}", v95);
            if v95 then
                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillEligible", "autofill", v60.origin, v61);
                local v96 = l_default_0:getPhoneNumber();
                if v96 then
                    v96:andThen(function(v97)
                        if v97 and v97 ~= "" then
                            local v98, v99 = v29(v97, v65.prefix);
                            if v98 == v39.prefix then
                                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillUSFound", "autofill", v60.origin, v61);
                            end;
                            v64(v99);
                            v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillSuccess", "autofill", v60.origin, v61);
                            return ;
                        else
                            v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillNull", "autofill", v60.origin, v61);
                            return ;
                        end;
                    end);
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
    end;
    local function _()
        local l_default_1 = l_IdentityProtocol_0.default;
        l_default_1:supportsGetSMSOTP():andThen(function(v102)
            print("PhoneVerification: Autofill OTP supported: {}", v102);
            if v102 then
                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "codeAutofillEligible", "autofill", v60.origin, v61);
                local v103 = l_default_1:getSMSOTP();
                if v103 then
                    v103:andThen(function(v104)
                        if v104 and v104 ~= "" then
                            v70(v104);
                            v72(v104);
                            v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "codeAutofillSuccess", "autofill", v60.origin, v61);
                        end;
                    end);
                end;
            end;
        end);
    end;
    v3.useEffect(function()
        return function()
            v89.current = v79;
        end;
    end, {
        v79
    });
    v3.useEffect(function()
        v91 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
            v84(l_UserInputService_0.OnScreenKeyboardVisible);
            v86(not not l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        v60.authEventAnalytics.reportModalShownWithSection(v60.eventContext, v60.origin, v16.AddPhone);
        if v60.isAutofillPhoneNumberEnabled then
            local l_default_2 = l_IdentityProtocol_0.default;
            l_default_2:supportsGetPhoneNumber():andThen(function(v107)
                print("PhoneVerification: Autofill phone number supported: {}", v107);
                if v107 then
                    v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillEligible", "autofill", v60.origin, v61);
                    local v108 = l_default_2:getPhoneNumber();
                    if v108 then
                        v108:andThen(function(v109)
                            if v109 and v109 ~= "" then
                                local v110, v111 = v29(v109, v65.prefix);
                                if v110 == v39.prefix then
                                    v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillUSFound", "autofill", v60.origin, v61);
                                end;
                                v64(v111);
                                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillSuccess", "autofill", v60.origin, v61);
                                return ;
                            else
                                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillNull", "autofill", v60.origin, v61);
                                return ;
                            end;
                        end);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end);
        end;
        return function()
            if v91 then
                v91:Disconnect();
            end;
            v91 = nil;
            if not v89.current then
                v60.onCancelled();
            end;
        end;
    end, {});
    local v113 = l_useSelector_0(function(v112)
        return v112.ScreenSize;
    end);
    local function v114()
        v60.authEventAnalytics.reportModalDismissedWithSection(v60.eventContext, v60.origin, v61);
        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
            v60.closeCentralOverlay();
            return ;
        else
            v60.closeUpsell();
            return ;
        end;
    end;
    local function _(v115)
        if v115 == 2 then
            return v90.invalidPhoneFormatKey;
        elseif v115 == 6 then
            return v90.tooManyAttemptsKey;
        elseif v115 == 7 then
            return v90.invalidVerificationCodeKey;
        elseif v115 == 8 then
            return v90.invalidPhoneNumberKey;
        elseif v115 == 9 then
            return v90.tooManyAccountsKey;
        else
            return v90.genericErrorKey;
        end;
    end;
    local function v125()
        v82(true);
        local v117 = v60.setPhoneNumber(v60.networking, v65.code, v65.prefix, v63);
        if v117 then
            v117:andThen(function()
                v62(v16.VerifyPhone);
                v82(false);
                v60.authEventAnalytics.reportModalShownWithSection(v60.eventContext, v60.origin, v16.VerifyPhone);
                if v60.isAutofillSMSOtpEnabled then
                    local l_default_3 = l_IdentityProtocol_0.default;
                    l_default_3:supportsGetSMSOTP():andThen(function(v119)
                        print("PhoneVerification: Autofill OTP supported: {}", v119);
                        if v119 then
                            v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "codeAutofillEligible", "autofill", v60.origin, v61);
                            local v120 = l_default_3:getSMSOTP();
                            if v120 then
                                v120:andThen(function(v121)
                                    if v121 and v121 ~= "" then
                                        v70(v121);
                                        v72(v121);
                                        v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "codeAutofillSuccess", "autofill", v60.origin, v61);
                                    end;
                                end);
                            end;
                        end;
                    end);
                end;
            end):catch(function(v122)
                if v122 then
                    if not v122.PhoneRegexFailed then
                        v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.AddPhone, v122.ErrorCode);
                        local l_v74_0 = v74;
                        local l_ErrorCode_0 = v122.ErrorCode;
                        l_v74_0(if l_ErrorCode_0 == 2 then v90.invalidPhoneFormatKey else if l_ErrorCode_0 == 6 then v90.tooManyAttemptsKey else if l_ErrorCode_0 == 7 then v90.invalidVerificationCodeKey else if l_ErrorCode_0 == 8 then v90.invalidPhoneNumberKey else if l_ErrorCode_0 == 9 then v90.tooManyAccountsKey else v90.genericErrorKey);
                    else
                        v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.AddPhone, "");
                        v74(v90.invalidPhoneFormatKey);
                    end;
                else
                    v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.AddPhone, "");
                    v74(v90.genericErrorKey);
                end;
                v82(false);
            end);
        end;
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, "", "", v60.origin, v10.Button.Continue, v16.AddPhone);
    end;
    local function v130()
        v82(true);
        local v126 = v60.verifyPhoneCode(v60.networking, v71);
        if v126 then
            v126:andThen(function()
                v80(true);
            end):catch(function(v127)
                if v127 then
                    v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.VerifyPhone, v127.ErrorCode);
                    local l_v76_0 = v76;
                    local l_ErrorCode_1 = v127.ErrorCode;
                    l_v76_0(if l_ErrorCode_1 == 2 then v90.invalidPhoneFormatKey else if l_ErrorCode_1 == 6 then v90.tooManyAttemptsKey else if l_ErrorCode_1 == 7 then v90.invalidVerificationCodeKey else if l_ErrorCode_1 == 8 then v90.invalidPhoneNumberKey else if l_ErrorCode_1 == 9 then v90.tooManyAccountsKey else v90.genericErrorKey);
                else
                    v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.VerifyPhone, "");
                    v76(v90.genericErrorKey);
                end;
                v82(false);
            end);
        end;
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, "", "", v60.origin, v10.Button.AutoSubmit, v16.VerifyPhone);
    end;
    local function v135()
        local v131 = v60.resendPhoneCode(v60.networking);
        if v131 then
            v131:andThen(function()
            end):catch(function(v132)
                if v132 then
                    v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.VerifyPhone, v132.ErrorCode);
                    local l_v76_1 = v76;
                    local l_ErrorCode_2 = v132.ErrorCode;
                    l_v76_1(if l_ErrorCode_2 == 2 then v90.invalidPhoneFormatKey else if l_ErrorCode_2 == 6 then v90.tooManyAttemptsKey else if l_ErrorCode_2 == 7 then v90.invalidVerificationCodeKey else if l_ErrorCode_2 == 8 then v90.invalidPhoneNumberKey else if l_ErrorCode_2 == 9 then v90.tooManyAccountsKey else v90.genericErrorKey);
                    return ;
                else
                    v60.authEventAnalytics.reportModalShownWithSectionAndError(v60.eventContext, v10.Field.ErrorMessage, v60.origin, v16.VerifyPhone, "");
                    v76(v90.genericErrorKey);
                    return ;
                end;
            end);
        end;
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, "", "", v60.origin, v10.Button.ResendCode, v16.VerifyPhone);
    end;
    local function v136()
        v62(v16.AddPhone);
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, "", "", v60.origin, v10.Button.ChangePhoneNumber, v16.VerifyPhone);
    end;
    local function v137()
        v62(v16.AddPhone);
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, "", "", v60.origin, v10.Button.Continue, v16.Entry);
    end;
    local function v138()
        if not v81 then
            v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, v10.Field.TermsOfService, "", v60.origin, v61);
            if not l_GetFFlagAbstractShowWebpagePhoneUpsell_0() then
                v60.navigateToPage({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = "https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service", 
                    extraProps = {
                        title = "", 
                        transitionAnimation = "SlideInFromBotton"
                    }
                });
            else
                v60.showWebpage("https://en.help.roblox.com/hc/articles/9483830673556-Roblox-SMS-Terms-of-Service");
                return ;
            end;
        end;
    end;
    local function v139()
        if not v81 then
            v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, v10.Field.PrivacyPolicy, "", v60.origin, v61);
            if not l_GetFFlagAbstractShowWebpagePhoneUpsell_0() then
                v60.navigateToPage({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = "https://en.help.roblox.com/hc/articles/115004630823", 
                    extraProps = {
                        title = "", 
                        transitionAnimation = "SlideInFromBotton"
                    }
                });
            else
                v60.showWebpage("https://en.help.roblox.com/hc/articles/115004630823");
                return ;
            end;
        end;
    end;
    local function v141(v140)
        if not v81 then
            v74("");
            v64(v140.Text);
        end;
    end;
    local function v142()
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, v10.Field.CountryPrefix, v10.ActionType.Focus, v60.origin, "", v16.AddPhone);
    end;
    local function v149()
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, v10.Field.PhoneNumber, v10.ActionType.Focus, v60.origin, "", v16.AddPhone);
        if not v60.shouldAutofillAndroidPhoneNumberAtLaunch then
            local l_default_4 = l_IdentityProtocol_0.default;
            l_default_4:supportsGetPhoneNumber():andThen(function(v144)
                print("PhoneVerification: Autofill phone number supported: {}", v144);
                if v144 then
                    v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillEligible", "autofill", v60.origin, v61);
                    local v145 = l_default_4:getPhoneNumber();
                    if v145 then
                        v145:andThen(function(v146)
                            if v146 and v146 ~= "" then
                                local v147, v148 = v29(v146, v65.prefix);
                                if v147 == v39.prefix then
                                    v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillUSFound", "autofill", v60.origin, v61);
                                end;
                                v64(v148);
                                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillSuccess", "autofill", v60.origin, v61);
                                return ;
                            else
                                v60.authEventAnalytics.reportModalActionWithSection(v60.eventContext, "phoneAutofillNull", "autofill", v60.origin, v61);
                                return ;
                            end;
                        end);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end);
        end;
    end;
    local v151 = v12(function(v150)
        v72(v150);
    end, 0.5);
    local function v154(v152)
        if string.len(v152.Text) <= 6 then
            v76("");
        end;
        local v153 = string.sub(v152.Text, 1, 6);
        v70(v153);
        v151(v153);
    end;
    local function v155()
        v60.authEventAnalytics.reportInteractWithActionAndSection(v60.eventContext, v10.Field.VerificationCode, v10.ActionType.Focus, v60.origin, "", v16.VerifyPhone);
    end;
    v3.useEffect(function()
        if string.len(v71) == 6 then
            v130();
        end;
    end, {
        v71
    });
    v3.useEffect(function()
        if v79 then
            v60.setIsPhoneVerified({
                isPhoneVerified = true
            });
            v60.authEventAnalytics.reportModalShownWithSection(v60.eventContext, v60.origin, v16.Success);
            v60.onSuccess();
        end;
    end, {
        v79
    });
    local v156 = v3.createElement(l_LoadingSpinner_0, {
        size = UDim2.fromOffset(48, 48), 
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
    local l_createElement_0 = v3.createElement;
    local v158 = if not v36() then v3.Fragment else "Frame";
    local v160 = if not v36() then nil else {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v4.Change.AbsoluteSize] = function(v159)
            v88(v159.AbsoluteSize);
        end
    };
    local v161 = {};
    local v162 = false;
    if v61 == v16.Entry then
        v162 = v60.entryConfig and v3.createElement(v17, {
            screenSize = if not v36() then v113 else v87, 
            onClose = v114, 
            titleKey = v60.entryConfig.titleKey, 
            descriptionKey = v60.entryConfig.descriptionKey, 
            buttonKey = v60.entryConfig.buttonKey, 
            onButtonClick = v137, 
            extraButtonKey = v60.entryConfig.extraButtonConfig.extraButtonKey, 
            onExtraButtonClick = v60.entryConfig.extraButtonConfig.onExtraButtonClick
        });
    end;
    v161.Entry = v162;
    v162 = false;
    if v61 == v16.AddPhone then
        v162 = v3.createElement(v18, {
            screenSize = if not v36() then v113 else v87, 
            countryCode = v65, 
            setCountryCode = v66, 
            phoneNumber = v63, 
            errorMessage = v73, 
            isDisabled = v81, 
            onPhoneNumberTextChange = v141, 
            onSetPhoneNumber = v125, 
            onClose = v114, 
            onTermsOfUseClick = v138, 
            onPrivacyPolicyClick = v139, 
            onPhoneInputFocus = v149, 
            onCountryCodeSelectorClick = v142, 
            isKeyboardShowing = v83, 
            keyboardHeight = v85, 
            usePhoneNumberTextType = v33() and v60.isPhoneNumberTextTypeEnabled, 
            titleKey = v60.addPhoneTitleKey, 
            descriptionKey = v60.addPhoneDescriptionKey, 
            buttonKey = v60.addPhoneButtonKey, 
            legalTextKey = v60.addPhoneLegalTextKey, 
            extraButtonKey = v60.extraButtonTextKey, 
            onExtraButtonClick = v60.onExtraButtonClick, 
            alwaysShowLegalText = v60.alwaysShowAddPhoneLegalText, 
            requireLegalTextCheckbox = v60.requireAddPhoneLegalTextCheckbox
        });
    end;
    v161.AddPhone = v162;
    v162 = false;
    if v61 == v16.VerifyPhone then
        v162 = v3.createElement(v19, {
            screenSize = if not v36() then v113 else v87, 
            phoneNumber = v63, 
            prefix = v65.prefix, 
            code = v69, 
            errorMessage = v75, 
            onCodeTextChange = v154, 
            onResendPhoneCode = v135, 
            onClose = v114, 
            returnToAddPhone = v136, 
            onCodeInputFocus = v155, 
            isKeyboardShowing = v83, 
            keyboardHeight = v85, 
            useOTPInputType = v60.isOTPInputTypeEnabled, 
            extraButtonKey = if not l_GetFFlagAddEntryViewToPhoneVerification_0() then nil else v60.verifyPhoneExtraButtonKey, 
            onExtraButtonClick = if not l_GetFFlagAddEntryViewToPhoneVerification_0() then nil else v60.onVerifyPhoneExtraButtonClick
        });
    end;
    v161.VerifyPhone = v162;
    v161.LoadingOverlay = v77 and v3.createElement(v20, {
        image = v156, 
        text = v90.verifyingKey
    });
    return l_createElement_0(v158, v160, v161);
end))))));
