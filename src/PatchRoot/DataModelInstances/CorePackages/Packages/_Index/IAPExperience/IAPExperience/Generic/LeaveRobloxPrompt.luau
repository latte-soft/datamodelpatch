local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v6 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v7 = v2.Component:extend(script.Name);
v7.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v7.render = function(v8)
    return v2.createElement(v6, {
        keys = {
            TitleText = {
                key = ("IAPExperience.LeaveRoblox.%s"):format("Title.LeavingRoblox")
            }, 
            BodyText = {
                key = ("IAPExperience.LeaveRoblox.%s"):format("Text.ExternalWebsiteWarning")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.LeaveRoblox.%s"):format("Action.Cancel")
            }, 
            ButtonContinue = {
                key = ("IAPExperience.LeaveRoblox.%s"):format("Action.Continue")
            }
        }, 
        render = function(v9)
            return v8:renderAlert(v9);
        end
    });
end;
v7.renderAlert = function(v10, v11)
    return (v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        Selectable = false
    }, {
        AlertWindow = v2.createElement(l_InteractiveAlert_0, {
            title = v11.TitleText, 
            bodyText = v11.BodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v10.props.cancelActivated, 
                            text = v11.ButtonCancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v10.props.continueActivated, 
                            text = v11.ButtonContinue
                        }
                    }
                }
            }, 
            screenSize = v10.props.screenSize
        })
    }));
end;
return v7;
