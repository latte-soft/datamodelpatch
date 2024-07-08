local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = v1.PureComponent:extend("LeaveRobloxAlert");
v12.init = function(v13)
    v13.closeAlert = function()
        v13.props.closeAlert();
    end;
end;
v12.render = function(v14)
    local l_continueFunc_0 = v14.props.continueFunc;
    return v7({
        titleText = "Feature.GameDetails.Message.LeavingRobloxTitle", 
        bodyText = "Feature.GameDetails.Message.ExternalLinkWarning", 
        cancelButtonText = "Feature.GamePage.LabelCancelField", 
        confirmButtonText = "Feature.GameDetails.Action.Continue"
    })(function(v16)
        return (v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v11.Color.BLACK, 
            BackgroundTransparency = 1, 
            Active = true, 
            Selectable = false
        }, {
            AlertWindow = v1.createElement(l_InteractiveAlert_0, {
                title = v16.titleText, 
                bodyText = v16.bodyText, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v14.closeAlert, 
                                text = v16.cancelButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = l_continueFunc_0, 
                                text = v16.confirmButtonText
                            }
                        }
                    }
                }, 
                screenSize = v14.props.screenSize
            })
        }));
    end);
end;
return (l_RoactServices_0.connect({
    localization = v5
})((v2.connect(function(v17, _)
    return {
        screenSize = v17.ScreenSize
    };
end, function(v19)
    return {
        closeAlert = function()
            return v19(v6());
        end
    };
end)(v12))));
