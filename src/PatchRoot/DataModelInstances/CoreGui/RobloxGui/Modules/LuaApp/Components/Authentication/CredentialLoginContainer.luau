local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("AppStorageService");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v5 = require(l_Modules_0.LuaApp.Components.Authentication.CredentialLoginForm);
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
return function(v7)
    local v8 = not not l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local function v9()
        if not v7.loginButtonDisabled then
            if not v7.isLoginInProgress then
                v7.updateIsLoginInProgress(true);
                v7.authAnalytics.reportLogInButtonClicked(v4.Context.LoginScreen);
                v7.handleLoginWithFormDataCallback();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v10()
        spawn(function()
            v7.cvalueRef.current:ReleaseFocus();
            v7.passwordRef.current:CaptureFocus();
        end);
    end;
    local function v11()
        v7.passwordRef.current:ReleaseFocus();
        if not v7.loginButtonDisabled then
            if not v7.isLoginInProgress then
                v7.updateIsLoginInProgress(true);
                v7.authAnalytics.reportLogInButtonClicked(v4.Context.LoginScreen);
                v7.handleLoginWithFormDataCallback();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local v12 = false;
    local function v13()
        if not v12 then
            v12 = true;
            v7.authAnalytics.reportUsernameFocus(v4.Context.LoginScreen);
        end;
    end;
    local v14 = false;
    return v3.createElement(v5, {
        disableRegularLogin = v7.disableRegularLogin, 
        usernameTextInputType = v8, 
        crossDeviceLoginEnabled = v7.crossDeviceLoginEnabled, 
        quickLoginButtonText = v7.quickLoginButtonText, 
        cvalueText = v7.cvalueText, 
        passwordText = v7.passwordText, 
        onTextBoxesChanged = v7.onTextBoxesChanged, 
        onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue = v10, 
        onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword = v11, 
        cvalueTextBoxOnFocus = v13, 
        passwordTextBoxOnFocus = function()
            if not v14 then
                v14 = true;
                v7.authAnalytics.reportPasswordFocus(v4.Context.LoginScreen);
            end;
        end, 
        passwordVisibilityToggleCallback = function(v15)
            if not v15 then
                v7.authAnalytics.reportHidePasswordButtonClicked(v4.Context.LoginScreen);
                return ;
            else
                v7.authAnalytics.reportShowPasswordButtonClicked(v4.Context.LoginScreen);
                return ;
            end;
        end, 
        cvalueRef = v7.cvalueRef, 
        passwordRef = v7.passwordRef, 
        loginButtonRef = v7.loginButtonRef, 
        forgotLinkRef = v7.forgotLinkRef, 
        crossDeviceButtonRef = v7.crossDeviceButtonRef, 
        localizedError = v7.localizedError, 
        localizedErrorMessage = v7.localizedErrorMessage, 
        forceLoginByUsername = v7.forceLoginByUsername, 
        showLinkAccountText = v7.showLinkAccountText, 
        showForgotButton = v7.showForgotButton, 
        onForgetButtonActivated = v7.onForgetButtonActivated, 
        onCrossDeviceLoginActivated = v7.onCrossDeviceLoginActivated, 
        loginButtonDisabled = v7.loginButtonDisabled, 
        isLoginInProgress = v7.isLoginInProgress, 
        onLoginButtonActivated = v9, 
        maxSizeX = v7.maxSizeX, 
        showDisclaimerLinks = v7.showDisclaimerLinks, 
        showDisclaimerButtons = v7.showDisclaimerButtons, 
        showCredentialHeader = v7.showCredentialHeader, 
        isDualLayout = v7.isDualLayout, 
        isTenFootUiMode = v7.isTenFootUiMode, 
        onEmailOtpActivated = v7.onEmailOtpActivated, 
        emailOtpEnabled = v7.emailOtpEnabled
    });
end;
