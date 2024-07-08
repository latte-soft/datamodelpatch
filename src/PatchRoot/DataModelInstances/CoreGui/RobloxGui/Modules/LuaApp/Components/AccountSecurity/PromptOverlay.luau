local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Analytics.Events.accountSecurityPromptEvent);
local v3 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.AccountPinForm);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.AccountRestoresPolicyUpsell);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.ChangePassword.Confirmation);
local v7 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.ChangePassword.Form);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.ChangePassword.IntroV2);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.AuthenticatorUpsell.Intro);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.AuthenticatorUpsell.InstallApps);
local v11 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.Email2SVUpsell);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Modal.DismissConfirmation);
local v13 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v14 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v15 = require(l_Modules_0.Common.Roact);
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v17 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = {
    [v13.ChangePasswordIntro] = v8, 
    [v13.ChangePasswordForm] = v7, 
    [v13.ChangePasswordConfirmation] = v6, 
    [v13.ChangePasswordDismissConfirmation] = v12, 
    [v13.AccountPinForm] = v4, 
    [v13.AccountPinFormExpired] = v4, 
    [v13.AuthenticatorUpsellIntro] = v9, 
    [v13.AuthenticatorUpsellInstallApps] = v10, 
    [v13.AccountRestoresPolicyUpsell] = v5, 
    [v13.Email2SVUpsell] = v11
};
local v20 = v15.PureComponent:extend(script.Name);
v20.init = function(v21)
    v21:setState({
        initialPromptType = v21.props.promptType, 
        modalState = v21.props.modalState
    });
    v21.setModalState = function(v22)
        if v21.isMounted then
            v21:setState({
                modalState = v22
            });
            return ;
        else
            return ;
        end;
    end;
end;
v20.didMount = function(v23)
    v23.isMounted = true;
    if v23.state.initialPromptType ~= nil then
        v2(v23.props.analytics.EventStream, v3.Context.ModalStateViewed, v14.toRawValue(v23.state.initialPromptType), v13.toRawValue(v23.state.modalState));
    end;
end;
v20.didUpdate = function(v24, _, v26)
    if v24.state.initialPromptType ~= nil and v24.state.modalState ~= v26.modalState then
        v2(v24.props.analytics.EventStream, v3.Context.ModalStateViewed, v14.toRawValue(v24.state.initialPromptType), v13.toRawValue(v24.state.modalState));
    end;
end;
v20.willUnmount = function(v27)
    if v27.props.promptType ~= nil then
        v2(v27.props.analytics.EventStream, v3.Context.ModalStateViewed, v14.toRawValue(v27.props.promptType), "NONE");
    end;
    v27.isMounted = false;
end;
v20.render = function(v28)
    local l_modalState_0 = v28.state.modalState;
    local v30 = v19[l_modalState_0];
    return v30 and v15.createElement(v30, {
        modalState = l_modalState_0, 
        navigateToModalState = v28.setModalState, 
        openWebView = v28.props.openWebView, 
        closeOverlay = v28.props.closeOverlay, 
        updatePromptAssignment = v28.props.updatePromptAssignment, 
        promptType = v28.props.promptType
    });
end;
return (l_RoactServices_0.connect({
    analytics = v16
})((v17.connect(function(v31, _)
    return {
        promptType = v31.AccountSecurityPrompt.promptType
    };
end)(v20))));
