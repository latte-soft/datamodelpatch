local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.LuaApp.Http.Url);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v10.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local v13 = v2.PureComponent:extend("PasswordResetPrompt");
v13.init = function(v14)
    v14.callback = function()
        v14.props.goToSecurityNotificationPage();
        v14.props.closeCentralOverlay();
    end;
end;
v13.render = function(v15)
    return v4({
        alertTitle = "CommonUI.Messages.Label.Alert", 
        buttonText = "CommonUI.Messages.Action.OK", 
        message = "Authentication.ResetPassword.Response.ResetPasswordStarted"
    })(function(v16)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v16.alertTitle, 
            bodyText = v16.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v15.callback, 
                            text = v16.buttonText
                        }
                    }
                }
            }, 
            screenSize = v15.props.screenSize
        });
    end);
end;
return (v3.connect(function(v17, _)
    return {
        screenSize = v17.ScreenSize
    };
end, function(v19)
    return {
        closeCentralOverlay = function()
            return v19(v7());
        end, 
        goToSecurityNotificationPage = function()
            return v19(v6({
                name = v9.GenericWebPage, 
                detail = string.format("%slogin/securityNotification", v5.BASE_URL), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v8.None
                }
            }));
        end
    };
end)(v13));
