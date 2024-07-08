local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = v2.PureComponent:extend("LoginConfirmationPrompt");
v11.init = function(v12)
    v12.retryCodeCallback = function()
        v12.props.closeCentralOverlay();
        if v12.props.retryCallback then
            v12.props.retryCallback();
        end;
    end;
    v12.closePageCallback = function()
        v12.props.closeCentralOverlay();
        if v12.props.closeCallback then
            v12.props.closeCallback();
        end;
    end;
end;
v11.didMount = function(v13)
    v13.props.authAnalytics.reportScreenLoaded(not v13.props.loginSuccess and "quickLoginFailed" or "quickLoginSucceeded");
end;
v11.render = function(v14)
    local l_loginSuccess_0 = v14.props.loginSuccess;
    return v5({
        alertTitle = not l_loginSuccess_0 and "Authentication.CrossDevice.Response.LoginFail" or "Authentication.CrossDevice.Response.LoginSuccess", 
        errorMessage = "Authentication.CrossDevice.Label.CodeNotVerified", 
        successButtonText = "Authentication.CrossDevice.Action.Done", 
        retryButtonText = "Authentication.CrossDevice.Action.TryAgain", 
        cancelButtonText = "Authentication.CrossDevice.Action.CancelLogin"
    })(function(v16)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v16.alertTitle, 
            bodyText = not not l_loginSuccess_0 and v14.props.deviceString or v16.errorMessage, 
            buttonStackInfo = {
                buttons = not not l_loginSuccess_0 and {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v14.closePageCallback, 
                            text = v16.successButtonText
                        }
                    }
                } or {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v14.closePageCallback, 
                            text = v16.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v14.retryCodeCallback, 
                            text = v16.retryButtonText
                        }
                    }
                }
            }, 
            screenSize = v14.props.screenSize
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
        end
    };
end)((l_RoactServices_0.connect({
    authAnalytics = v6
})(v11))));
