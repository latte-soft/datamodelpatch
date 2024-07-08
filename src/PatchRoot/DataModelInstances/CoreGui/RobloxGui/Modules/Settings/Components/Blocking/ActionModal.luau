local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local v8 = require(l_RobloxGui_0.Modules.Flags.GetFFlagWrapBlockModalScreenInProvider);
local v9 = v2.PureComponent:extend("ActionModal");
v9.defaultProps = {
    screenSize = Vector2.new(1000, 1000)
};
v9.validateProps = v3.interface({
    action = v3.callback, 
    actionText = v3.string, 
    body = v3.string, 
    cancel = v3.callback, 
    cancelText = v3.string, 
    screenSize = v3.optional(v3.Vector2), 
    title = v3.string
});
v9.render = function(v10)
    return l_withStyle_0(function(v11)
        return v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v11.Theme.Overlay.Transparency, 
            BackgroundColor3 = v11.Theme.Overlay.Color, 
            Active = true, 
            AutoButtonColor = false, 
            Selectable = if not v8() then nil else false, 
            Visible = v10.props.Visible, 
            [v2.Event.Activated] = v10.props.cancel
        }, {
            AlertModal = v2.createElement(l_InteractiveAlert_0, {
                title = v10.props.title, 
                bodyText = v10.props.body, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                text = v10.props.cancelText, 
                                onActivated = v10.props.cancel
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Alert, 
                            props = {
                                text = v10.props.actionText, 
                                onActivated = v10.props.action
                            }
                        }
                    }
                }, 
                screenSize = v10.props.screenSize
            })
        });
    end);
end;
return v9;
