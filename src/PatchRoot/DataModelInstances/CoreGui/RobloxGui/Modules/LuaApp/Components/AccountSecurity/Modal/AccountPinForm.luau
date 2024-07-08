local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v7 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v11 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalTextInput);
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v16 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout);
local v17 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UnlockAccountPin);
local v18 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.Validators.True);
local v19 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v21 = v2.Dictionary.join({
    action = "Feature.AccountSecurityPrompt.Action.UnlockAccountPin", 
    description = "Feature.AccountSecurityPrompt.Description.EnterYourAccountPin", 
    header = "Feature.AccountSecurityPrompt.Header.AccountPinRequired", 
    headerExpired = "Feature.AccountSecurityPrompt.Header.AccountPinExpired", 
    label = "Feature.AccountSecurityPrompt.Label.AccountPin"
}, v6.localizationKeys);
local v22 = v3.PureComponent:extend(script.Name);
v22.init = function(v23)
    v23:setState({
        accountPin = "", 
        accountPinError = nil, 
        requestError = nil, 
        requestInFlight = false
    });
    v23.setAccountPin = function(v24)
        v23:setState({
            accountPin = v24
        });
    end;
    v23.setAccountPinError = function(v25)
        v23:setState({
            accountPinError = v25 or v3.None
        });
    end;
    v23.clearRequestError = function()
        v23:setState({
            requestError = v3.None
        });
    end;
    v23.unlockAccountPin = function(v26)
        return function()
            v23:setState({
                requestInFlight = true
            });
            v23.props.unlockAccountPin(v23.props.networking, v23.state.accountPin):andThen(function(v27)
                v23.props.updateAccountPinUnlockTimeout(DateTime.fromUnixTimestampMillis(DateTime.now().UnixTimestampMillis + math.floor(v27.unlockedUntil * 1000)));
                if v23.isMounted then
                    v23.props.navigateToModalState(v11.ChangePasswordForm);
                    return ;
                else
                    return ;
                end;
            end):catch(function(v28)
                if v23.isMounted then
                    v23:setState({
                        requestError = v6.toString(v26, v28), 
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
v22.didMount = function(v29)
    v29.isMounted = true;
end;
v22.willUnmount = function(v30)
    v30.isMounted = false;
end;
v22.render = function(v31)
    local l_accountPin_0 = v31.state.accountPin;
    local l_requestError_0 = v31.state.requestError;
    local l_requestInFlight_0 = v31.state.requestInFlight;
    local v35 = l_accountPin_0 ~= "";
    return v19(v21)(function(v36)
        local _ = nil;
        return v3.createElement(v8, {
            title = if v31.props.modalState == v11.AccountPinForm then v36.header else v36.headerExpired, 
            makeBodyFragment = function(v38)
                return v3.createFragment({
                    Lock = v3.createElement(v7, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v3.createElement(v9, {
                        layoutOrder = 2, 
                        contentWidth = v38, 
                        text = v36.description
                    }), 
                    ModalTextInput = v3.createElement(v12, {
                        layoutOrder = 3, 
                        errorText = l_requestError_0, 
                        labelText = v36.label, 
                        onChanged = v31.clearRequestError, 
                        placeholderText = "", 
                        setError = v31.setAccountPinError, 
                        setValue = v31.setAccountPin, 
                        textInputType = Enum.TextInputType.Password, 
                        validate = v18, 
                        value = l_accountPin_0
                    })
                });
            end, 
            buttonConfig = v10({
                {
                    isDisabled = l_requestInFlight_0 or not v35, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v31.unlockAccountPin(v36), 
                    text = v36.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v13, 
    networking = v14
})((v4.connect(nil, function(v39)
    return {
        updateAccountPinUnlockTimeout = function(v40)
            return v39(v16(v40));
        end, 
        unlockAccountPin = function(v41, v42)
            return v39(v17(v41, v42));
        end
    };
end)(v22))));
