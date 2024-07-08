local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactServiceTags_0 = v1.RoactServiceTags;
local l_RobloxAppHooks_0 = v1.RobloxAppHooks;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_NavigateDown_0 = v1.NavigationRodux.Thunks.NavigateDown;
local l_CloseCentralOverlay_0 = v1.CentralOverlay.Thunks.CloseCentralOverlay;
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(l_Parent_0.Common.otpLoginTypes);
local v11 = require(l_Parent_0.Common.otpLoginConstants);
local v12 = require(l_Parent_0.Utils.isStringValidEmail);
local v13 = require(l_Parent_0.Utils.debounce);
local v14 = require(script.Parent.EnterEmailView);
local v15 = require(script.Parent.EnterCodeView);
local v16 = require(l_Parent_0.Thunks.SendCode);
local v17 = require(l_Parent_0.Thunks.ResendCode);
local v18 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v19 = require(l_Parent_0.Analytics.EventConstants);
local v20 = game:DefineFastFlag("ShouldEnableOtpSignup", false);
local l_useState_0 = l_React_0.useState;
local v22 = {
    EnterEmail = "sendOtp", 
    EnterCode = "enterOtp"
};
return (l_RoactRodux_0.connect(function(v23, _)
    return {
        screenSize = v23.screenSize
    };
end, function(v25)
    return {
        sendCode = function(v26, v27)
            return v25(v16(v26, v27));
        end, 
        resendCode = function(v28, v29)
            return v25(v17(v28, v29));
        end, 
        navigateToPage = function(v30)
            return v25(l_NavigateDown_0(v30));
        end, 
        closeCentralOverlay = function()
            return v25(l_CloseCentralOverlay_0());
        end
    };
end)(function(v31)
    local v32 = l_useLocalization_0({
        enterEmailTitle = v31.enterEmailTitleKey, 
        enterEmailDescription = v31.enterEmailDescriptionKey, 
        enterCodeTitle = v31.enterCodeTitleKey, 
        enterCodeDescription = v31.enterCodeDescriptionKey
    });
    local v33 = l_useLocalization_0(v11.errorMessageKeys);
    local v34, v35 = l_useState_0(v22.EnterEmail);
    local v36, v37 = l_useState_0("");
    local v38, v39 = l_useState_0("");
    local v40, v41 = l_useState_0("");
    local v42, v43 = l_useState_0(false);
    local v44, v45 = l_useState_0(false);
    local v46, v47 = l_useState_0(0);
    local v48 = l_React_0.useRef(false);
    local v49 = l_RobloxAppHooks_0.useRoactService(l_RoactServiceTags_0.RoactNetworking);
    local v50 = nil;
    local v51 = l_React_0.useCallback(function()
        v18.sendButtonClickEvent(v19.ctx.enterOtp, v31.origin, v19.btn.changeEmail);
        v35(v22.EnterEmail);
    end, {
        v35, 
        v31.origin
    });
    local v52 = l_React_0.useCallback(function()
        v31.navigateToPage({
            name = "GenericWebPage", 
            detail = "https://en.help.roblox.com/hc/articles/11014749736980", 
            extraProps = {
                title = "", 
                transitionAnimation = "SlideInFromBottom"
            }
        });
    end, {
        v31.navigateToPage
    });
    local v53 = l_React_0.useCallback(function()
        v41("");
    end, {
        v41
    });
    local v55 = l_React_0.useCallback(v13(function(v54)
        v18.sendFormInteractionEvent(v19.ctx.sendOtp, v31.origin, v19.field.email);
        v53();
        if v54.Text then
            v37(v54.Text);
            if not v12(v54.Text) then
                v41(v33.InvalidEmail);
            end;
        end;
    end, 0.5), {
        v37, 
        v31.origin
    });
    local function v58(v56)
        local v57 = nil;
        if v56 then
            v57 = v11.statusCodeMap[v56];
        end;
        if not v57 or not v33[v57] then
            v41(v33.Unknown);
            if v34 == v22.EnterEmail then
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.errorMessage, 1);
                return ;
            else
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.resendErrorMessage, 1);
                return ;
            end;
        else
            v41(v33[v57]);
            if v34 == v22.EnterEmail then
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.errorMessage, v56);
                return ;
            else
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.resendErrorMessage, v56);
                return ;
            end;
        end;
    end;
    local function _(v59)
        return v59 == "signup" and v11.otpServiceOriginSignup or v11.otpServiceOrigin;
    end;
    local function v65(v61)
        v43(true);
        local v62 = v31.sendCode(v49, {
            origin = v31.origin == "signup" and v11.otpServiceOriginSignup or v11.otpServiceOrigin, 
            contactType = v11.otpServiceContactType, 
            contactValue = v61
        });
        if v62 then
            v62:andThen(function(v63)
                v43(false);
                v39(v63.otpSessionToken);
                v35(v22.EnterCode);
            end):catch(function(v64)
                v43(false);
                v58((tonumber(v64)));
            end);
        end;
    end;
    local v66 = l_React_0.useCallback(function()
        v18.sendButtonClickEvent(v19.ctx.sendOtp, v31.origin, v19.btn.sendCode);
        v65(v36);
    end, {
        v36, 
        v31.origin
    });
    local function v71(v67)
        local v68 = v31.resendCode(v49, {
            origin = v31.origin == "signup" and v11.otpServiceOriginSignup or v11.otpServiceOrigin, 
            contactType = v11.otpServiceContactType, 
            otpSessionToken = v67
        });
        if v68 then
            v68:andThen(function(v69)
                v39(v69.otpSessionToken);
            end):catch(function(v70)
                v58((tonumber(v70)));
            end);
        end;
    end;
    local v72 = l_React_0.useCallback(function()
        v18.sendButtonClickEvent(v19.ctx.enterOtp, v31.origin, v19.btn.resendCode);
        v71(v38);
    end, {
        v38, 
        v31.origin
    });
    local v79 = l_React_0.useCallback(function(v73)
        v18.sendButtonClickEvent(v19.ctx.enterOtp, v31.origin, v19.btn.login);
        v43(true);
        v48.current = true;
        local v74 = v31.onSubmitCode(v38, v73);
        if not v20 then
            v74:andThen(function(v75)
                if v75 and type(v75) == "string" then
                    for v76, v77 in v11.errorMessageKeys, nil, nil do
                        if v75 == v77 then
                            v41(v33[v76]);
                        end;
                    end;
                    v48.current = false;
                end;
                v43(false);
            end);
        elseif v74 then
            if v31.origin == v11.otpServiceOriginSignup then
                v74:andThen(function()
                end):catch(function(v78)
                    v58((tonumber(v78)));
                    v48.current = false;
                end);
            end;
            v43(false);
            return ;
        end;
    end, {
        v38, 
        v31.origin
    });
    local function v80()
        v18.sendButtonClickEvent(v34, v31.origin, v19.btn.cancel);
        v31.closeCentralOverlay();
    end;
    l_React_0.useEffect(function()
        v50 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
            v45(l_UserInputService_0.OnScreenKeyboardVisible);
            v47(not not l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        return function()
            if v50 then
                v50:Disconnect();
            end;
            v50 = nil;
            if not v48.current then
                v31.onModalAbandoned();
            end;
        end;
    end, {});
    local l_createElement_0 = l_React_0.createElement;
    local l_Fragment_0 = l_React_0.Fragment;
    local v83 = nil;
    local v84 = {};
    local v85 = false;
    if v34 == v22.EnterEmail then
        v85 = l_React_0.createElement(v14, {
            origin = v31.origin, 
            enterEmailTitle = v32.enterEmailTitle, 
            enterEmailDescription = v32.enterEmailDescription, 
            email = v36, 
            onEmailTextChange = v55, 
            errorMessage = v40, 
            handleContinue = v66, 
            onClose = v80, 
            isDisabled = v42, 
            isKeyboardShowing = v44, 
            keyboardHeight = v46, 
            screenSize = v31.screenSize
        });
    end;
    v84.EnterEmail = v85;
    v85 = false;
    if v34 == v22.EnterCode then
        v85 = l_React_0.createElement(v15, {
            origin = v31.origin, 
            enterCodeTitle = v32.enterCodeTitle, 
            enterCodeDescription = v32.enterCodeDescription, 
            email = v36, 
            errorMessage = v40, 
            clearErrorMessage = v53, 
            onResendCode = v72, 
            onSubmitCode = v79, 
            complianceCheckboxMessageKey = v31.complianceCheckboxMessageKey, 
            returnToEnterEmail = v51, 
            navigateToHelp = v52, 
            onClose = v80, 
            isDisabled = v42, 
            isKeyboardShowing = v44, 
            keyboardHeight = v46, 
            screenSize = v31.screenSize
        });
    end;
    v84.EnterCode = v85;
    return l_createElement_0(l_Fragment_0, v83, v84);
end));
