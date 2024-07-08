local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_InteractiveAlert_0 = require(l_CorePackages_0.UIBlox).App.Dialog.Alert.InteractiveAlert;
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v7 = v2.PureComponent:extend("CameraPermissionPrompt");
v7.renderAlertLocalized = function(v8, v9)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v9.titleText, 
        bodyText = v9.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v8.props.closePrompt, 
                        text = v9.gotItButtonText
                    }
                }
            }
        }, 
        screenSize = v8.props.screenSize
    });
end;
v7.render = function(v10)
    return l_withLocalization_0({
        titleText = "Feature.AddFriends.Title.CameraPermission", 
        messageText = "Feature.AddFriends.Description.CameraPermissionWarning", 
        gotItButtonText = "Feature.Avatar.Action.GotIt"
    })(function(v11)
        return v10:renderAlertLocalized(v11);
    end);
end;
return (v3.connect(function(v12, _)
    return {
        screenSize = v12.ScreenSize
    };
end, function(v14)
    return {
        closePrompt = function()
            v14(v6());
        end
    };
end)(v7));
