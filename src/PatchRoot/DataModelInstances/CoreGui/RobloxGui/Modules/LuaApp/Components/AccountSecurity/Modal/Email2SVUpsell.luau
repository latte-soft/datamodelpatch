local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v8 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.PromptConstants);
local v10 = require(l_CorePackages_0.Roact);
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v13 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_CorePackages_0.UIBlox);
local v16 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v17 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v15.App.Button.Enum.ButtonType;
local v19 = {
    action = "Feature.AccountSecurityPrompt.Action.SetUpEmail2SV", 
    description = "Feature.AccountSecurityPrompt.Description.Email2SVUpsellMessageBody", 
    header = "Feature.AccountSecurityPrompt.Header.Email2SVUpsell", 
    settingsTitle = "CommonUI.Features.Label.Settings"
};
local v20 = v10.PureComponent:extend(script.Name);
v20.init = function(v21)
    v21:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v21.continueToSecuritySettingsPage = function(v22)
        return function()
            v21:setState({
                requestInFlight = true
            });
            v21.props.openWebView(v9.getWebViewUrlEmailHighlight(), v22.settingsTitle);
            v21.props.closeOverlay();
            v21.props.updatePromptAssignment(v21.props.networking, v21.props.promptType, v8.DismissPrompt);
        end;
    end;
    v21.closeCallback = function()
        v21.props.updatePromptAssignment(v21.props.networking, v21.props.promptType, v8.DismissPrompt);
    end;
end;
v20.render = function(v23)
    local l_requestInFlight_0 = v23.state.requestInFlight;
    return v17(v19)(function(v25)
        return v10.createElement(v4, {
            title = v25.header, 
            closeCallback = v23.closeCallback, 
            makeBodyFragment = function(v26)
                return v10.createFragment({
                    Lock = v10.createElement(v3, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v10.createElement(v5, {
                        layoutOrder = 2, 
                        contentWidth = v26, 
                        text = v25.description
                    })
                });
            end, 
            buttonConfig = v6({
                {
                    isDisabled = l_requestInFlight_0, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v23.continueToSecuritySettingsPage(v25), 
                    text = v25.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v11, 
    networking = v12
})((v13.connect(function(v27, _)
    return {
        metadata = v27.AccountSecurityPrompt.metadata
    };
end, function(v29)
    return {
        closeOverlay = function()
            return v29(v2());
        end, 
        openWebView = function(v30, v31)
            v29(v7(v30, v31));
        end, 
        updatePromptAssignment = function(v32, v33, v34)
            return v29(v16(v32, v33, v34));
        end
    };
end)(v20))));
