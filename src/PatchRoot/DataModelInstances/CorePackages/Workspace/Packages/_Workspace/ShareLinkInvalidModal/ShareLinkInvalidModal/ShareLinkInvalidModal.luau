local v0 = require(script.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withLocalization_0 = v0.withLocalization;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local v7 = l_Roact_0.Component:extend("ShareLinkInvalidModal");
v7.validateProps = l_t_0.interface({
    closeModal = l_t_0.callback, 
    screenSize = l_t_0.Vector2
});
v7.render = function(v8)
    local l_props_0 = v8.props;
    return l_withLocalization_0({
        titleText = "Feature.SocialShare.Label.InvalidLinkError", 
        bodyText = "Feature.SocialShare.Description.InvalidLinkError", 
        buttonText = "Feature.Friends.Label.Cancel"
    })(function(v10)
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            title = v10.titleText, 
            bodyText = v10.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v10.buttonText, 
                            onActivated = l_props_0.closeModal
                        }
                    }
                }
            }
        });
    end);
end;
return v7;
