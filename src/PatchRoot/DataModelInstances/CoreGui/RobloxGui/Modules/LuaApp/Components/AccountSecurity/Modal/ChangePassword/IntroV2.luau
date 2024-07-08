local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v7 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.GetAccountPinState);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Helpers.GetDaysRemainingToForceResetString);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v11 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v13 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalErrorText);
local v14 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v15 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout);
local v20 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v22 = {
    [v15.ChangePasswordSuspectedCompromise] = v2.Dictionary.join({
        action = "Feature.AccountSecurityPrompt.Action.ContinueChangePassword", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity", 
        header = "Feature.AccountSecurityPrompt.Header.ChangeYourPassword"
    }, v6.localizationKeys), 
    [v15.ChangePasswordBreachedCredential] = v2.Dictionary.join({
        action = "Feature.AccountSecurityPrompt.Action.ContinueChangePassword", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.NoChangeForceReset", 
        descriptionEndSingular = "Feature.AccountSecurityPrompt.Description.NoChangeForceResetSingular", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword", 
        header = "Feature.AccountSecurityPrompt.Header.ChangeYourPassword"
    }, v6.localizationKeys)
};
local v23 = v3.PureComponent:extend("ChangePassword" .. script.Name);
v23.init = function(v24)
    v24:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v24.continueToChangePassword = function(v25)
        return function()
            v24:setState({
                requestInFlight = true
            });
            v24.props.getAccountPinState(v24.props.networking):andThen(function(v26)
                local v27 = false;
                if v26.unlockedUntil ~= nil then
                    v27 = v26.unlockedUntil > 0;
                end;
                if not v27 and v26.isEnabled then
                    if v24.isMounted then
                        v24.props.navigateToModalState(v14.AccountPinForm);
                        return ;
                    else
                        return ;
                    end;
                else
                    if v26.unlockedUntil ~= nil then
                        v24.props.updateAccountPinUnlockTimeout(DateTime.fromUnixTimestampMillis(DateTime.now().UnixTimestampMillis + math.floor(v26.unlockedUntil * 1000)));
                    else
                        v24.props.updateAccountPinUnlockTimeout(nil);
                    end;
                    if v24.isMounted then
                        v24.props.navigateToModalState(v14.ChangePasswordForm);
                        return ;
                    else
                        return ;
                    end;
                end;
            end):catch(function(v28)
                if v24.isMounted then
                    v24:setState({
                        requestError = v6.toString(v25, v28), 
                        requestInFlight = false
                    });
                    return ;
                else
                    return ;
                end;
            end);
        end;
    end;
end;
v23.didMount = function(v29)
    v29.isMounted = true;
end;
v23.willUnmount = function(v30)
    v30.isMounted = false;
end;
v23.render = function(v31)
    local l_promptType_0 = v31.props.promptType;
    local l_metadata_0 = v31.props.metadata;
    local l_requestError_0 = v31.state.requestError;
    local l_requestInFlight_0 = v31.state.requestInFlight;
    return v20(v22[l_promptType_0] or v22[v15.ChangePasswordSuspectedCompromise])(function(v36)
        local l_descriptionEnd_0 = v36.descriptionEnd;
        if l_promptType_0 == v15.ChangePasswordBreachedCredential then
            l_descriptionEnd_0 = v8(v36.descriptionEndSingular, v36.descriptionEnd, l_metadata_0.forceResetTimestamp);
        end;
        local v38 = v36.descriptionStart .. " " .. l_descriptionEnd_0;
        return v3.createElement(v10, {
            title = v36.header, 
            makeBodyFragment = function(v39)
                return v3.createFragment({
                    Lock = v3.createElement(v9, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v3.createElement(v11, {
                        layoutOrder = 2, 
                        contentWidth = v39, 
                        richText = true, 
                        text = v38
                    }), 
                    ModalErrorText = l_requestError_0 and v3.createElement(v13, {
                        layoutOrder = 3, 
                        contentWidth = v39, 
                        errorText = l_requestError_0
                    })
                });
            end, 
            buttonConfig = v12({
                {
                    isDisabled = l_requestInFlight_0, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v31.continueToChangePassword(v36), 
                    text = v36.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v16, 
    networking = v17
})((v4.connect(function(v40, _)
    return {
        promptType = v40.AccountSecurityPrompt.promptType, 
        metadata = v40.AccountSecurityPrompt.metadata
    };
end, function(v42)
    return {
        getAccountPinState = function(v43)
            return v42(v7(v43));
        end, 
        updateAccountPinUnlockTimeout = function(v44)
            return v42(v19(v44));
        end
    };
end)(v23))));
