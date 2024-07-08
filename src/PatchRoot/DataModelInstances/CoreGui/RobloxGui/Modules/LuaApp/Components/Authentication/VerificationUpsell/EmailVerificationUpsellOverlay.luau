local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v11 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v12 = require(script.Parent.EmailVerificationUpsellState);
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail);
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.SendVerificationEmailToUser);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v16 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local v17 = require(script.Parent.EmailVerificationUpsellStep);
local v18 = require(l_Modules_0.LuaApp.EventStreamConstants);
local _ = require(l_Modules_0.LuaApp.Http.Requests.GetVerifiedEmail);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFStringPrivacyPolicyUrl);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePrivacyPolicyForLogoutUpsell);
local v22 = v2.PureComponent:extend(script.Name);
v22.defaultProps = {
    addEmailOver13TextKey = "Feature.VerificationUpsell.Description.AddEmailTextOver13", 
    addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.AddEmailTextUnder13", 
    addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail", 
    checkExistingEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyEmail", 
    eventContext = v18.Context.VerificationUpsell
};
v22.init = function(v23)
    local l_PromptUpdateEmail_0 = v12.PromptUpdateEmail;
    if v23.props.emailAddress then
        l_PromptUpdateEmail_0 = v12.PromptCheckEmail;
    end;
    v23.potentialEmailAddress = nil;
    v23.password = nil;
    v23.emailWasUpdated = false;
    v23.state = {
        upsellState = l_PromptUpdateEmail_0, 
        emailAddress = v23.props.emailAddress or ""
    };
    v23.closeOverlay = function()
        if v23.isMounted then
            v23.props.closeCentralOverlay();
            v23.props.authEventAnalytics.reportModalDismissedWithSection(v23.props.eventContext, v23.props.origin, v23.props.section);
        end;
    end;
    v23.onUpdateEmailSecondaryButtonPressed = function()
        if not (not v23.isMounted or not v23.props.onUpdateEmailSecondaryButtonPressed) then
            v23.props.onUpdateEmailSecondaryButtonPressed();
            v23.props.authEventAnalytics.reportInteractWithAction(v23.props.eventContext, "", v18.ActionType.Click, v23.props.origin, v23.props.onUpdateEmailSecondaryButtonPressedEvent);
        end;
    end;
    v23.onPasswordChangedCallback = function(v25)
        v23.password = v25.Text;
    end;
    v23.onEmailChangedCallback = function(v26)
        v23.potentialEmailAddress = v26.Text;
    end;
    v23.onResendEmailPressed = function()
        if v23.isMounted then
            v23:setState({
                isInResendEmailCooldown = true
            });
            v23.props.sendVerificationEmailToUser(v23.props.networking):andThen(function()
                spawn(function()
                    wait(20);
                    v23.resetResendEmailState(true);
                end);
            end):catch(function()
                v23.resetResendEmailState(false);
            end);
            v23.props.authEventAnalytics.reportInteractWithActionAndSection(v23.props.eventContext, "", v18.ActionType.Click, v23.props.origin, v18.Button.ResendEmailConfirmation, "verifyEmail");
        end;
    end;
    v23.resetResendEmailState = function(v27)
        local v28 = not v27 and "Feature.VerificationUpsell.Message.ConfirmationEmailNotSent" or "";
        if v23.isMounted then
            if v28 ~= "" then
                v23.props.authEventAnalytics.reportErrorMessageShown(v23.props.eventContext, "", v23.props.origin);
            end;
            v23:setState({
                isInResendEmailCooldown = false, 
                errorMessageKey = v28
            });
        end;
    end;
    v23.onUpdateEmailSelected = function()
        if v23.isMounted then
            v23:setState({
                upsellState = v12.PromptUpdateEmail, 
                errorMessageKey = ""
            });
            v23.props.authEventAnalytics.reportInteractWithActionAndSection(v23.props.eventContext, "", v18.ActionType.Click, v23.props.origin, v18.Button.ChangeEmail, "verifyEmail");
        end;
    end;
    v23.onEmailFocused = function()
        v23.props.authEventAnalytics.reportInteractWithActionAndSection(v23.props.eventContext, v18.Field.Email, v18.ActionType.Focus, v23.props.origin, "", v23.props.section);
    end;
    v23.onEmailUpdated = function()
        if v23.isMounted then
            local v29 = v16(v23.potentialEmailAddress);
            v23.props.authEventAnalytics.reportInteractWithActionAndSection(v23.props.eventContext, "", "", v23.props.origin, v18.Button.Continue, v23.props.section);
            if not v29 then
                v23:setState({
                    errorMessageKey = "Feature.VerificationUpsell.Message.InvalidEmailAddress"
                });
                v23.props.authEventAnalytics.reportErrorMessageShown(v23.props.eventContext, "", v23.props.origin);
            else
                v23:setState({
                    errorMessageKey = ""
                });
                local l_potentialEmailAddress_0 = v23.potentialEmailAddress;
                v23.props.updateUserEmail(v23.props.networking, l_potentialEmailAddress_0, nil):andThen(function()
                    if v23.isMounted then
                        v23.emailWasUpdated = true;
                        if v23.props.successCallback then
                            v23.props.successCallback(l_potentialEmailAddress_0);
                        end;
                        if not v23.props.closeOnEmailUpdate then
                            v23:setState({
                                upsellState = v12.PromptCheckEmail, 
                                errorMessage = "", 
                                errorMessageKey = "", 
                                emailAddress = l_potentialEmailAddress_0, 
                                isInResendEmailCooldown = false
                            });
                        else
                            v23.closeOverlay();
                            return ;
                        end;
                    end;
                end):catch(function(v31)
                    if v23.isMounted then
                        v23:setState({
                            errorMessageKey = "", 
                            errorMessage = v31 and v31.Message, 
                            isInResendEmailCooldown = false
                        });
                        v23.props.authEventAnalytics.reportModalShownWithSectionAndError(v23.props.eventContext, "errorMessage", v23.props.origin, v23.props.section, v31.ErrorCode);
                    end;
                end);
                return ;
            end;
        end;
    end;
    v23.onPasswordEntered = function()
        if v23.isMounted then
            v23:setState({
                isInResendEmailCooldown = true
            });
            local l_potentialEmailAddress_1 = v23.potentialEmailAddress;
            v23.props.updateUserEmail(v23.props.networking, l_potentialEmailAddress_1, v23.password):andThen(function()
                v23:setState({
                    upsellState = v12.PromptCheckEmail, 
                    errorMessage = "", 
                    errorMessageKey = "", 
                    emailAddress = l_potentialEmailAddress_1, 
                    isInResendEmailCooldown = false
                });
            end):catch(function(v33)
                local l_PasswordIncorrect_0 = v33.PasswordIncorrect;
                local v35 = "";
                if l_PasswordIncorrect_0 then
                    v35 = "Feature.VerificationUpsell.Message.WrongPassword";
                end;
                v23:setState({
                    errorMessageKey = v35, 
                    errorMessage = v33.Message, 
                    isInResendEmailCooldown = false
                });
            end);
        end;
    end;
    v23.shouldShowPrivacyPolicyLink = function()
        if v21() then
            if v23.state.upsellState ~= v12.PromptUpdateEmail then
                return false;
            elseif not v23.props.IsLocalUserUnder13 then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    end;
    v23.onPrivacyPolicyLinkActivated = function()
        if v23.isMounted then
            v23.props.authEventAnalytics.reportModalActionWithSection(v23.props.eventContext, v18.Field.PrivacyPolicy, "", v23.props.origin, v23.props.section);
            v23.props.navigateToPage({
                name = v9.GenericWebPage, 
                detail = v20(), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v10.SlideInFromBottom
                }
            });
        end;
    end;
    v23.getLinks = function()
        if v23.state.upsellState ~= v12.PromptCheckEmail then
            return nil;
        else
            local l_onResendEmailPressed_0 = v23.onResendEmailPressed;
            if v23.state.isInResendEmailCooldown then
                l_onResendEmailPressed_0 = nil;
            end;
            return {
                {
                    textKey = "Feature.VerificationUpsell.Action.ResendConfirmationEmail", 
                    onClicked = l_onResendEmailPressed_0, 
                    isPrimaryLink = true
                }, 
                {
                    textKey = "Feature.VerificationUpsell.Action.ChangeEmail", 
                    onClicked = v23.onUpdateEmailSelected, 
                    isPrimaryLink = false
                }
            };
        end;
    end;
    v23.getTitleTextKey = function()
        if v23.state.upsellState == v12.PromptCheckEmail then
            if v23.password and v23.password ~= "" then
                return "Feature.VerificationUpsell.Heading.VerifyEmail";
            else
                return v23.props.checkExistingEmailTitleKey;
            end;
        elseif v23.state.upsellState == v12.PromptUpdateEmail then
            return v23.props.addEmailTitleKey;
        elseif v23.state.upsellState == v12.PromptEnterPassword then
            return v23.props.addEmailTitleKey;
        else
            return ;
        end;
    end;
    v23.getBodyTextKey = function()
        if v23.state.upsellState == v12.PromptCheckEmail then
            return {
                "Feature.VerificationUpsell.Description.VerifyEmailBody"; 
                emailAddress = v23.state.emailAddress
            };
        elseif v23.state.upsellState == v12.PromptUpdateEmail then
            if not v23.props.IsLocalUserUnder13 then
                return v23.props.addEmailOver13TextKey;
            else
                return v23.props.addEmailUnder13TextKey;
            end;
        elseif v23.state.upsellState == v12.PromptEnterPassword then
            return "Feature.VerificationUpsell.Description.EnterPassword";
        else
            return ;
        end;
    end;
    local v37 = not v23.props.IsLocalUserUnder13;
    v23.stateDisplayInfo = {
        [v12.PromptCheckEmail] = {}, 
        [v12.PromptUpdateEmail] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.Continue", 
            secondaryButtonTextKey = v23.props.updateEmailSecondaryButtonText, 
            privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
            textFieldPlaceholderTextKey = not v37 and "Feature.VerificationUpsell.Label.EmailInputPlaceholderUnder13" or "Feature.VerificationUpsell.Label.EmailInputPlaceholderOver13", 
            textFieldLabelTextKey = not v37 and "Feature.VerificationUpsell.Label.EmailInputPlaceholderUnder13" or "Authentication.SignUp.Label.EmailAddress", 
            onPrimaryButtonActivated = v23.onEmailUpdated, 
            onSecondaryButtonActivated = v23.onUpdateEmailSecondaryButtonPressed, 
            onChangeTextCallback = v23.onEmailChangedCallback, 
            textInputType = Enum.TextInputType.NoSuggestions
        }, 
        [v12.PromptEnterPassword] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.SendConfirmationEmail", 
            textFieldPlaceholderTextKey = "Feature.VerificationUpsell.Label.PasswordInputPlaceholder", 
            onPrimaryButtonActivated = v23.onPasswordEntered, 
            onChangeTextCallback = v23.onPasswordChangedCallback, 
            textInputType = Enum.TextInputType.Password
        }
    };
end;
v22.willUnmount = function(v38)
    v38.isMounted = false;
    if not (v38.emailWasUpdated or not v38.props.failureCallback) then
        v38.props.failureCallback();
    end;
end;
v22.didMount = function(v39)
    v39.isMounted = true;
    v39.props.authEventAnalytics.reportModalShownWithSection(v39.props.eventContext, v39.props.origin, v39.props.section);
end;
v22.render = function(v40)
    local v41 = v40.stateDisplayInfo[v40.state.upsellState];
    local l_primaryButtonTextKey_0 = v41.primaryButtonTextKey;
    local l_onPrimaryButtonActivated_0 = v41.onPrimaryButtonActivated;
    local l_secondaryButtonTextKey_0 = v41.secondaryButtonTextKey;
    local l_onSecondaryButtonActivated_0 = v41.onSecondaryButtonActivated;
    local l_privacyPolicyKey_0 = v41.privacyPolicyKey;
    local l_textInputType_0 = v41.textInputType;
    local l_textFieldPlaceholderTextKey_0 = v41.textFieldPlaceholderTextKey;
    local l_textFieldLabelTextKey_0 = v41.textFieldLabelTextKey;
    local l_onChangeTextCallback_0 = v41.onChangeTextCallback;
    local l_errorMessageKey_0 = v40.state.errorMessageKey;
    local v52 = v40.getLinks();
    local v53 = {
        primaryButtonText = l_primaryButtonTextKey_0, 
        secondaryButtonText = l_secondaryButtonTextKey_0, 
        privacyPolicyLinkText = l_privacyPolicyKey_0, 
        placeholderText = l_textFieldPlaceholderTextKey_0, 
        title = v40.getTitleTextKey(), 
        bodyText = v40.getBodyTextKey(), 
        textFieldLabelText = l_textFieldLabelTextKey_0
    };
    if l_errorMessageKey_0 and l_errorMessageKey_0 ~= "" then
        v53.errorText = l_errorMessageKey_0;
    end;
    return l_withStyle_0(function(_)
        return v8(v53)(function(v55)
            return v2.createElement(v17, {
                title = v55.title, 
                primaryButtonText = v55.primaryButtonText, 
                secondaryButtonText = v55.secondaryButtonText, 
                bodyText = v55.bodyText, 
                textInputType = l_textInputType_0, 
                textFieldPlaceholderText = v55.placeholderText, 
                textFieldLabelText = v55.textFieldLabelText, 
                privacyPolicyLinkText = v55.privacyPolicyLinkText, 
                errorMessage = v55.errorText or v40.state.errorMessage, 
                links = v52, 
                onPrimaryButtonActivated = l_onPrimaryButtonActivated_0, 
                onSecondaryButtonActivated = l_onSecondaryButtonActivated_0, 
                onPrivacyPolicyLinkActivated = v40.onPrivacyPolicyLinkActivated, 
                onChangeTextCallback = l_onChangeTextCallback_0, 
                onCloseClickedCallback = v40.closeOverlay, 
                onEmailFocused = v40.onEmailFocused, 
                isEmailModalCalledFromHomePage = v40.props.isEmailModalCalledFromHomePage, 
                shouldShowPrivacyPolicyLink = v40.shouldShowPrivacyPolicyLink
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v4, 
    authEventAnalytics = v6
})((v3.connect(function(v56, _)
    return {
        screenSize = v56.ScreenSize, 
        IsLocalUserUnder13 = v56.IsLocalUserUnder13
    };
end, function(v58)
    return {
        closeCentralOverlay = function()
            return v58(v11());
        end, 
        updateUserEmail = function(v59, v60, v61)
            return v58(v13(v59, v60, v61));
        end, 
        sendVerificationEmailToUser = function(v62)
            return v58(v14(v62));
        end, 
        navigateToPage = function(v63)
            return v58(v15(v63));
        end
    };
end)(v22))));
