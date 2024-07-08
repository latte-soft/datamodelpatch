local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.VerifyCredentials);
local v9 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = v2.PureComponent:extend("LoginEmailVerificationPrompt");
v12.init = function(v13)
    v13.resendCallback = function()
        v13.props.verifyCredentials(v13.props.networking, v13.props.credentialValue, v13.props.password);
        v13.props.onClose(v13.props.credentialValue);
        v13.props.closeCentralOverlay();
    end;
    v13.closeCallback = function()
        v13.props.onClose(v13.props.credentialValue);
        v13.props.closeCentralOverlay();
    end;
end;
v12.render = function(v14)
    return v6({
        alertTitle = "Authentication.Login.Label.EmailNeedsVerification", 
        buttonText = "Authentication.Login.Action.SendVerificationEmail", 
        cancelText = "Feature.Chat.Action.Cancel", 
        message = "Authentication.Login.Label.UnverifiedEmailInstructions"
    })(function(v15)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v15.alertTitle, 
            bodyText = v15.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v14.closeCallback, 
                            text = v15.cancelText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v14.resendCallback, 
                            text = v15.buttonText
                        }
                    }
                }
            }, 
            screenSize = v14.props.screenSize
        });
    end);
end;
return (v3.connect(function(v16, _)
    return {
        screenSize = v16.ScreenSize
    };
end, function(v18)
    return {
        verifyCredentials = function(v19, v20, v21)
            return v18(v8(v19, "Email", v20, v21));
        end, 
        closeCentralOverlay = function()
            return v18(v7());
        end
    };
end)((l_RoactServices_0.connect({
    networking = v5
})(v12))));
