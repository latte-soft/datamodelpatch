local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local v10 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v11 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v11.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v16 = require(l_Modules_0.LuaApp.AppPage);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v18 = require(l_Modules_0.LuaApp.Actions.SetScreenGuiBlur);
local v19 = v2.PureComponent:extend("AntiAddictionPrompt");
v19.init = function(v20)
    local l_guiService_0 = v20.props.guiService;
    local l_networking_0 = v20.props.networking;
    v20.state = {
        screenSize = Vector2.new(0, 0)
    };
    v20.changeScreenSize = function(v23)
        if v20.state.screenSize ~= v23.AbsoluteSize then
            v20:setState({
                screenSize = v23.AbsoluteSize
            });
        end;
    end;
    v20.OkCallback = function(...)
        if v20.props.okCallback then
            v20.props.okCallback(...);
        end;
    end;
    v20.LogoutCallback = function()
        v20.props.logout(l_networking_0, l_guiService_0);
        if v20.props.logoutCallback then
            v20.props.logoutCallback();
        end;
    end;
end;
v19.render = function(v24)
    local l_message_0 = v24.props.message;
    local l_lockOut_0 = v24.props.lockOut;
    local v27 = not not l_lockOut_0 and v24.LogoutCallback or v24.OkCallback;
    local l_FocusedTextBox_0 = v24.props.userInputService:GetFocusedTextBox();
    if l_FocusedTextBox_0 then
        l_FocusedTextBox_0:ReleaseFocus();
    end;
    local function v30(v29)
        return v2.createElement(v10, {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = v6.DisplayOrder.AntiAddictionPrompt, 
            OnTopOfCoreBlur = l_lockOut_0
        }, {
            Overlay = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = Color3.new(), 
                BackgroundTransparency = 1, 
                Active = true, 
                Selectable = false
            }, {
                AlertWindow = v2.createElement(l_InteractiveAlert_0, {
                    title = v29.alertTitle, 
                    bodyText = l_message_0, 
                    buttonStackInfo = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    onActivated = v27, 
                                    text = v29.buttonText
                                }
                            }
                        }
                    }, 
                    screenSize = v24.state.screenSize
                })
            })
        });
    end;
    return v7({
        buttonText = not l_lockOut_0 and "CommonUI.Messages.Action.OK" or "Application.Logout.Action.Logout", 
        alertTitle = "CommonUI.Messages.Label.Alert"
    })(function(v31)
        return v30(v31);
    end);
end;
v19.didMount = function(v32)
    if v32.props.lockOut then
        v32.props.setScreenGuiBlur(true);
    end;
end;
v19.willUnmount = function(v33)
    if v33.props.lockOut then
        v33.props.setScreenGuiBlur(false);
    end;
end;
return (l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    userInputService = l_AppUserInputService_0, 
    networking = v5
})((v3.connect(nil, function(v34)
    return {
        openLogoutPage = function()
            v34(v15({
                name = v16.LogoutConfirmation
            }));
        end, 
        setScreenGuiBlur = function(v35)
            v34(v18("AntiAddictionPrompt", v35, v6.DisplayOrder.AntiAddictionPrompt));
        end, 
        logout = function(v36, v37)
            v34(v14(v36, v37, v17.AntiAddiction));
        end
    };
end)(v19))));
