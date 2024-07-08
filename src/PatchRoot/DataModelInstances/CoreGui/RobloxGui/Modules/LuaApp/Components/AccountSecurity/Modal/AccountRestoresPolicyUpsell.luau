local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v8 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_CorePackages_0.UIBlox);
local v15 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v16 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v14.App.Button.Enum.ButtonType;
local v18 = {
    action = "Feature.AccountSecurityPrompt.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell", 
    description = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyUpsellMessageBody", 
    header = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpsell", 
    settingsTitle = "CommonUI.Features.Label.Settings"
};
local v19 = v9.PureComponent:extend(script.Name);
v19.init = function(v20)
    v20:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v20.continueToAuthenticatorAppScreen = function(_)
        return function()
            v20:setState({
                requestInFlight = true
            });
            v20.props.navigateToSecuritySettings();
            v20.props.closeOverlay();
            v20.props.updatePromptAssignment(v20.props.networking, v20.props.promptType, v8.DismissPrompt);
        end;
    end;
    v20.closeCallback = function()
        v20.props.updatePromptAssignment(v20.props.networking, v20.props.promptType, v8.DismissPrompt);
    end;
end;
v19.render = function(v22)
    local _ = v22.state.requestError;
    local l_requestInFlight_0 = v22.state.requestInFlight;
    return v16(v18)(function(v25)
        return v9.createElement(v4, {
            title = v25.header, 
            closeCallback = v22.closeCallback, 
            makeBodyFragment = function(v26)
                return v9.createFragment({
                    Lock = v9.createElement(v3, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v9.createElement(v5, {
                        layoutOrder = 2, 
                        contentWidth = v26, 
                        text = v25.description:gsub("{linkStartSettings}", ""):gsub("{linkEndSettings}", "")
                    })
                });
            end, 
            buttonConfig = v6({
                {
                    isDisabled = l_requestInFlight_0, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v22.continueToAuthenticatorAppScreen(v25), 
                    text = v25.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v10, 
    networking = v11
})((v12.connect(function(_, _)
    return {};
end, function(v29)
    return {
        closeOverlay = function()
            return v29(v2());
        end, 
        navigateToSecuritySettings = function()
            v29(v7());
        end, 
        updatePromptAssignment = function(v30, v31, v32)
            return v29(v15(v30, v31, v32));
        end
    };
end)(v19))));
