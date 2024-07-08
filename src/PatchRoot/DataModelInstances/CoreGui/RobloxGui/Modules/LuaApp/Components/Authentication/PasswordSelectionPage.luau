local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v12 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpLayout);
local v14 = require(l_Modules_0.LuaApp.Components.Authentication.TextInputValidationWidget);
local v15 = require(l_Modules_0.LuaApp.Thunks.Authentication.PasswordValidator);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUp);
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.StoreSignUpPassword);
local v18 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpSelectedCharacterWithName);
local v19 = require(l_Modules_0.LuaApp.Enum.SignUpErrorCodes);
local v20 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_IsPrefetchOneCopyEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled;
local v22 = v3.PureComponent:extend("PasswordPage");
v22.init = function(v23)
    v23.state = {
        isSignUpInProgress = false
    };
    v23.isMounted = false;
    v23.updateIsSignUpInProgress = function(v24)
        spawn(function()
            local l_isSignUpInProgress_0 = v23.state.isSignUpInProgress;
            if v23.isMounted and l_isSignUpInProgress_0 ~= v24 then
                v23:setState({
                    isSignUpInProgress = v24
                });
            end;
        end);
    end;
    v23.requestSignUp = function(v26)
        local l_networking_0 = v23.props.networking;
        local l_analytics_0 = v23.props.analytics;
        local l_appPolicy_0 = v23.props.appPolicy;
        local l_guiService_0 = v23.props.guiService;
        local l_signUp_0 = v23.props.signUp;
        local l_setBackNavigationDisabled_0 = v23.props.setBackNavigationDisabled;
        l_signUp_0(l_networking_0, v23.props.omniRecommendationsRequest, l_guiService_0, function(v33, v34)
            if not v33 then
                v23.updateIsSignUpInProgress(false);
                return ;
            else
                l_setBackNavigationDisabled_0(true);
                v23.requestSignUp(v34);
                return ;
            end;
        end, v26, l_analytics_0, l_appPolicy_0):andThen(function()
            l_setBackNavigationDisabled_0(false);
        end, function(v35)
            l_setBackNavigationDisabled_0(false);
            if v35 ~= v19.Captcha then
                v23.updateIsSignUpInProgress(false);
            end;
        end);
    end;
    v23.continueButtonActivated = function(v36)
        local l_networking_1 = v23.props.networking;
        local l_authAnalytics_0 = v23.props.authAnalytics;
        local l_storeSignUpPassword_0 = v23.props.storeSignUpPassword;
        local l_setBackNavigationDisabled_1 = v23.props.setBackNavigationDisabled;
        local l_selectedUsername_0 = v23.props.selectedUsername;
        if not v23.state.isSignUpInProgress then
            l_setBackNavigationDisabled_1(true);
            v23.updateIsSignUpInProgress(true);
            l_storeSignUpPassword_0(l_networking_1, l_selectedUsername_0, v36):andThen(function()
                l_authAnalytics_0.reportContinueButtonClicked(v20.Context.PasswordScreen);
                v23.requestSignUp();
            end, function()
                l_setBackNavigationDisabled_1(false);
                v23.updateIsSignUpInProgress(false);
            end);
        end;
    end;
    v23.passwordTextBoxDidGainFocus = false;
    v23.textInputOnFocus = function()
        if not v23.passwordTextBoxDidGainFocus then
            v23.passwordTextBoxDidGainFocus = true;
            v23.props.authAnalytics.reportPasswordFocus(v20.Context.PasswordScreen);
        end;
    end;
    v23.renderWidget = function(v42)
        return v3.createElement(v14, (v2.Dictionary.join(v42, {
            continueButtonActivated = v23.continueButtonActivated, 
            continueButtonActionInProgress = v23.state.isSignUpInProgress, 
            continueButtonKey = "Authentication.SignUp.Label.SignUp", 
            textInputType = Enum.TextInputType.Password, 
            returnKeyType = Enum.ReturnKeyType.Done, 
            captureFocusOnMount = true, 
            textInputOnFocus = v23.textInputOnFocus, 
            validator = v15, 
            validatorAdditionalProps = {
                username = v23.props.selectedUsername
            }
        })));
    end;
    v23.props.authAnalytics.reportScreenLoaded(v20.Context.PasswordScreen);
end;
v22.didMount = function(v43)
    v43.isMounted = true;
end;
v22.willUnmount = function(v44)
    v44.isMounted = false;
end;
v22.render = function(v45)
    return v3.createElement(v13, {
        titleTextKey = "Authentication.SignUp.Heading.PasswordPage", 
        paragraphTextKeys = {
            "Authentication.SignUp.Description.PasswordPage", 
            "Authentication.SignUp.Description.VerificationPage"
        }, 
        showDisclaimerLinks = true, 
        disablePageInteraction = v45.state.isSignUpInProgress, 
        renderWidget = v45.renderWidget, 
        renderCharacter = function()
            return v3.createElement(v18);
        end
    });
end;
return (l_RoactAppPolicy_0.connect(function(v46, _)
    return {
        appPolicy = v46
    };
end)((l_RoactServices_0.connect({
    networking = v8, 
    guiService = l_AppGuiService_0, 
    authAnalytics = v6, 
    analytics = v10, 
    omniRecommendationsRequest = if not l_IsPrefetchOneCopyEnabled_0() then nil else l_AppOmniRecommendationsRequest_0
})((v4.connect(function(v48, _)
    return {
        selectedUsername = v48.SignUpInfo.SignUpUsername, 
        formFactor = v48.FormFactor, 
        birthday = v48.SignUpInfo.SignUpBirthday
    };
end, function(v50)
    return {
        storeSignUpPassword = function(v51, v52, v53)
            return v50(v17(v51, v52, v53));
        end, 
        signUp = function(v54, v55, v56, v57, v58, v59, v60)
            return v50(v16(v54, v55, v56, v57, v58, v59, v60));
        end, 
        setBackNavigationDisabled = function(v61)
            return v50(v12(v61));
        end
    };
end)(v22))))));
