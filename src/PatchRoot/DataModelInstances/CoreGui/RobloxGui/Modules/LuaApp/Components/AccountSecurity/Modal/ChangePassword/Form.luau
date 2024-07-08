local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v7 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.ChangePassword);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.ChangePassword.InputHelpTextWithIcon);
local v9 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.LockAccountPin);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v11 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v13 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v14 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalTextInput);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v16 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PasswordError);
local v17 = require(l_Modules_0.LuaApp.Promise);
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v21 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout);
local v22 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent);
local v23 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.Validators.Chained);
local v24 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.Validators.Equals);
local v25 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.Validators.Password);
local v26 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.Validators.True);
local v27 = require(l_Modules_0.LuaApp.withLocalization);
local l_Enum_0 = v6.Enum;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local l_Enum_1 = v16.Enum;
local l_validator_0 = v25.validator;
local l_withStyle_0 = v5.Style.withStyle;
local v34 = l_Images_0["icons/graphic/lock_xxlarge"];
local v35 = v2.Dictionary.join({
    action = "Feature.AccountSecurityPrompt.Action.SubmitChangePassword", 
    errorPasswordsDoNotMatch = "Feature.AccountSecurityPrompt.Message.Error.Input.PasswordsDoNotMatch", 
    header = "Feature.AccountSecurityPrompt.Header.CreateAStrongPassword", 
    labelConfirmNewPassword = "Feature.AccountSecurityPrompt.Label.ConfirmNewPassword", 
    labelCurrentPassword = "Feature.AccountSecurityPrompt.Label.CurrentPassword", 
    labelIForgotMyPassword = "Feature.AccountSecurityPrompt.Label.IForgotMyPassword", 
    labelNewPassword = "Feature.AccountSecurityPrompt.Label.NewPassword", 
    labelTimeRemaining = "Feature.AccountSecurityPrompt.Label.TimeRemaining", 
    labelUseAUniquePassword = "Feature.AccountSecurityPrompt.Label.UseAUniquePassword", 
    webViewTitleForgotPassword = "CommonUI.Features.Label.Help"
}, v16.localizationKeys, v25.localizationKeys);
local function v40(...)
    local v36 = {
        ...
    };
    return function(v37)
        for _, v39 in ipairs(v36) do
            v39(v37);
        end;
    end;
end;
local v41 = v3.PureComponent:extend("ChangePassword" .. script.Name);
v41.init = function(v42)
    v42:setState({
        currentPassword = "", 
        currentPasswordError = nil, 
        newPassword = "", 
        newPasswordError = nil, 
        confirmNewPassword = "", 
        confirmNewPasswordError = nil, 
        requestError = nil, 
        requestErrorForCurrentPassword = false, 
        requestInFlight = false, 
        accountPinUnlockedForMinutes = 0, 
        accountPinUnlockedForSeconds = 0
    });
    v42.setCurrentPassword = function(v43)
        v42:setState({
            currentPassword = v43
        });
    end;
    v42.setNewPassword = function(v44)
        v42:setState({
            newPassword = v44
        });
    end;
    v42.setConfirmNewPassword = function(v45)
        v42:setState({
            confirmNewPassword = v45
        });
    end;
    v42.setRequestError = function(v46)
        v42:setState({
            requestError = v46 or v3.None
        });
    end;
    v42.clearRequestError = function()
        v42.setRequestError(nil);
    end;
    v42.setCurrentPasswordError = function(v47)
        v42:setState({
            currentPasswordError = v47 or v3.None
        });
    end;
    v42.setNewPasswordError = function(v48)
        v42:setState({
            newPasswordError = v48 or v3.None
        });
    end;
    v42.clearNewPasswordError = function()
        v42.setNewPasswordError(nil);
    end;
    v42.setConfirmNewPasswordError = function(v49)
        v42:setState({
            confirmNewPasswordError = v49 or v3.None
        });
    end;
    v42.clearConfirmNewPasswordError = function()
        v42.setConfirmNewPasswordError(nil);
    end;
    v42.changePassword = function(v50)
        return function()
            v42:setState({
                requestInFlight = true
            });
            v42.props.changePassword(v42.props.networking, v42.state.currentPassword, v42.state.newPassword):andThen(function(_)
                local v52 = v17.resolve();
                if v42.props.accountPinUnlockedUntil ~= nil then
                    v52 = v42.props.lockAccountPin(v42.props.networking):andThen(function(_)
                        v42.props.updateAccountPinUnlockTimeout(nil);
                    end):catch(function(v54)
                        if v54 == l_Enum_0.AccountLocked then
                            v42.props.updateAccountPinUnlockTimeout(nil);
                        end;
                    end);
                end;
                v52:andThen(function()
                    v42.props.updatePromptType(v42.props.analytics, nil, nil, nil);
                    if v42.isMounted then
                        v42.props.navigateToModalState(v13.ChangePasswordConfirmation);
                        return ;
                    else
                        return ;
                    end;
                end);
            end):catch(function(v55)
                if v42.isMounted then
                    v42:setState({
                        requestInFlight = false
                    });
                    if v55 == l_Enum_1.PinLocked then
                        v42.props.navigateToModalState(v13.AccountPinFormExpired);
                        return ;
                    else
                        v42:setState({
                            requestError = v16.toString(v50, v55), 
                            requestErrorForCurrentPassword = v55 == l_Enum_1.InvalidCurrentPassword
                        });
                        return ;
                    end;
                else
                    return ;
                end;
            end);
        end;
    end;
    v42.openForgotPasswordSupportPage = function(v56)
        return function()
            v42.props.openWebView("https://en.help.roblox.com/hc/articles/203313070-I-Forgot-My-Password", v56.webViewTitleForgotPassword);
        end;
    end;
end;
v41.didMount = function(v57)
    v57.isMounted = true;
    spawn(function()
        while true do
            if v57.isMounted and v57.props.accountPinUnlockedUntil ~= nil then
                local l_accountPinUnlockedUntil_0 = v57.props.accountPinUnlockedUntil;
                local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
                local l_UnixTimestampMillis_1 = l_accountPinUnlockedUntil_0.UnixTimestampMillis;
                if l_UnixTimestampMillis_0 < l_UnixTimestampMillis_1 then
                    local v61 = (l_UnixTimestampMillis_1 - l_UnixTimestampMillis_0) / 1000;
                    v57:setState({
                        accountPinUnlockedForMinutes = math.floor(v61 / 60), 
                        accountPinUnlockedForSeconds = math.floor(v61 % 60)
                    });
                    wait(1);
                else
                    v57.props.navigateToModalState(v13.AccountPinFormExpired);
                    return ;
                end;
            else
                return ;
            end;
        end;
    end);
end;
v41.willUnmount = function(v62)
    v62.isMounted = false;
end;
v41.render = function(v63)
    local l_currentPassword_0 = v63.state.currentPassword;
    local l_currentPasswordError_0 = v63.state.currentPasswordError;
    local l_newPassword_0 = v63.state.newPassword;
    local l_newPasswordError_0 = v63.state.newPasswordError;
    local l_confirmNewPassword_0 = v63.state.confirmNewPassword;
    local l_confirmNewPasswordError_0 = v63.state.confirmNewPasswordError;
    local l_requestError_0 = v63.state.requestError;
    local l_requestErrorForCurrentPassword_0 = v63.state.requestErrorForCurrentPassword;
    local l_requestInFlight_0 = v63.state.requestInFlight;
    local l_accountPinUnlockedForMinutes_0 = v63.state.accountPinUnlockedForMinutes;
    local l_accountPinUnlockedForSeconds_0 = v63.state.accountPinUnlockedForSeconds;
    local l_accountPinUnlockedUntil_1 = v63.props.accountPinUnlockedUntil;
    local l_username_0 = v63.props.username;
    local l_networking_0 = v63.props.networking;
    local v78 = false;
    if l_currentPassword_0 ~= "" then
        v78 = false;
        if l_currentPasswordError_0 == nil then
            v78 = false;
            if l_newPassword_0 ~= "" then
                v78 = false;
                if l_newPasswordError_0 == nil then
                    v78 = false;
                    if l_confirmNewPassword_0 ~= "" then
                        v78 = l_confirmNewPasswordError_0 == nil;
                    end;
                end;
            end;
        end;
    end;
    return l_withStyle_0(function(v79)
        return v27(v35)(function(v80)
            return v3.createElement(v10, {
                title = v80.header, 
                makeBodyFragment = function(v81)
                    local l_createFragment_0 = v3.createFragment;
                    local v83 = {};
                    local v84 = false;
                    if l_accountPinUnlockedUntil_1 ~= nil then
                        v84 = v3.createElement(v11, {
                            layoutOrder = 1, 
                            contentWidth = v81, 
                            text = v80.labelTimeRemaining .. "\n" .. string.format("%02d:%02d", l_accountPinUnlockedForMinutes_0, l_accountPinUnlockedForSeconds_0)
                        });
                    end;
                    v83.ModalBodyText = v84;
                    v83.ModalTextInputCurrentPassword = v3.createElement(v14, {
                        layoutOrder = 2, 
                        errorText = (l_currentPasswordError_0 or l_requestErrorForCurrentPassword_0 and l_requestError_0) or nil, 
                        helpComponent = v3.createElement("TextButton", {
                            [v3.Event.Activated] = v63.openForgotPasswordSupportPage(v80), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Font = v79.Font.CaptionBody.Font, 
                            Size = UDim2.fromScale(1, 0), 
                            Text = v80.labelIForgotMyPassword, 
                            TextColor3 = v79.Theme.TextLink.Color, 
                            TextSize = v79.Font.CaptionBody.RelativeSize * v79.Font.BaseSize, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        labelText = v80.labelCurrentPassword, 
                        onChanged = v63.clearRequestError, 
                        placeholderText = "", 
                        setError = v63.setCurrentPasswordError, 
                        setValue = v63.setCurrentPassword, 
                        textInputType = Enum.TextInputType.Password, 
                        validate = v26, 
                        value = l_currentPassword_0
                    });
                    v83.ModalTextInputNewPassword = v3.createElement(v14, {
                        layoutOrder = 3, 
                        errorText = l_newPasswordError_0, 
                        helpComponent = v3.createElement(v8, {
                            helpText = v80.labelUseAUniquePassword, 
                            iconImage = v34
                        }), 
                        labelText = v80.labelNewPassword, 
                        onChanged = v63.clearRequestError, 
                        placeholderText = "", 
                        setError = v40(v63.clearConfirmNewPasswordError, v63.setNewPasswordError), 
                        setValue = v63.setNewPassword, 
                        textInputType = Enum.TextInputType.Password, 
                        validate = v23(l_validator_0(l_networking_0, v80, l_username_0), l_confirmNewPassword_0 ~= "" and v24(v80.errorPasswordsDoNotMatch, l_confirmNewPassword_0) or v26), 
                        value = l_newPassword_0
                    });
                    v83.ModalTextInputConfirmNewPassword = v3.createElement(v14, {
                        layoutOrder = 4, 
                        errorText = (l_confirmNewPasswordError_0 or not l_requestErrorForCurrentPassword_0 and l_requestError_0) or nil, 
                        labelText = v80.labelConfirmNewPassword, 
                        onChanged = v63.clearRequestError, 
                        placeholderText = "", 
                        setError = v40(v63.clearNewPasswordError, v63.setConfirmNewPasswordError), 
                        setValue = v63.setConfirmNewPassword, 
                        textInputType = Enum.TextInputType.Password, 
                        validate = v23(v24(v80.errorPasswordsDoNotMatch, l_newPassword_0), l_validator_0(l_networking_0, v80, l_username_0)), 
                        value = l_confirmNewPassword_0
                    });
                    return l_createFragment_0(v83);
                end, 
                buttonConfig = v12({
                    {
                        isDisabled = l_requestInFlight_0 or not v78, 
                        isLoading = l_requestInFlight_0, 
                        onActivated = v63.changePassword(v80), 
                        text = v80.action, 
                        type = l_ButtonType_0.PrimarySystem
                    }
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v18, 
    networking = v19
})((v4.connect(function(v85, _)
    return {
        accountPinUnlockedUntil = v85.AccountSecurityPrompt.accountPinUnlockedUntil, 
        username = not not v85.Users[v85.LocalUserId] and v85.Users[v85.LocalUserId].name or ""
    };
end, function(v87)
    return {
        changePassword = function(v88, v89, v90)
            return v87(v7(v88, v89, v90));
        end, 
        openWebView = function(v91, v92)
            return v87(v15(v91, v92));
        end, 
        lockAccountPin = function(v93)
            return v87(v9(v93));
        end, 
        updateAccountPinUnlockTimeout = function(v94)
            return v87(v21(v94));
        end, 
        updatePromptType = function(v95, v96, v97, v98)
            return v87(v22(v95, v96, v97, v98));
        end
    };
end)(v41))));
