local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local v7 = require(script.Parent.LeavePrompt);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Localization.withLocalization);
local v10 = require(l_Parent_0.Thunks.CloseMenu);
local v11 = require(l_Parent_0.Utility.SendAnalytics);
local v12 = require(l_Parent_0.Resources.Constants);
local v13 = l_Roact_0.PureComponent:extend("LeaveToAppPrompt");
v13.validateProps = l_t_0.strictInterface({
    closeMenu = l_t_0.callback, 
    canGamepadCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    canKeyboardCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    onConfirm = l_t_0.optional(l_t_0.callback), 
    linkingProtocol = l_t_0.table
});
v13.defaultProps = {
    linkingProtocol = l_LinkingProtocol_0.default
};
v13.init = function(v14)
    v14.goToHomePage = function()
        v11(v12.AnalyticsLeaveToHomeName, v12.AnalyticsLeaveToHomeName, {
            confirmed = v12.AnalyticsLeaveToHomeName
        });
        l_RunService_0.Heartbeat:Wait();
        v14.props.linkingProtocol:detectURL("roblox://navigation/home");
        game:Shutdown();
    end;
end;
v13.render = function(v15)
    return v9({
        titleText = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle", 
        bodyText = "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText", 
        confirmText = "CoreScripts.InGameMenu.Prompt.BackToHome", 
        cancelText = "CoreScripts.InGameMenu.Prompt.ResumeGame"
    })(function(v16)
        return l_Roact_0.createElement(v7, {
            titleText = v16.titleText, 
            bodyText = v16.bodyText, 
            confirmText = v16.confirmText, 
            cancelText = v16.cancelText, 
            onConfirm = v15.props.onConfirm or v15.goToHomePage, 
            onCancel = v15.props.closeMenu, 
            canGamepadCaptureFocus = v15.props.canGamepadCaptureFocus, 
            canKeyboardCaptureFocus = v15.props.canKeyboardCaptureFocus
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v17, _)
    local v19 = false;
    if v17.menuPage == v12.LeaveToAppPromptPageKey then
        v19 = false;
        if v17.displayOptions.inputType == v12.InputType.Gamepad then
            v19 = not v17.respawn.dialogOpen and v17.currentZone == 1;
        end;
    end;
    local v20 = false;
    if v17.menuPage == v12.LeaveToAppPromptPageKey then
        v20 = false;
        if v17.displayOptions.inputType == v12.InputType.MouseAndKeyboard then
            v20 = not v17.respawn.dialogOpen;
        end;
    end;
    return {
        canGamepadCaptureFocus = v19, 
        canKeyboardCaptureFocus = v20
    };
end, function(v21)
    return {
        closeMenu = function()
            v21(v10);
        end
    };
end)(v13);
