local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v2.Style.withStyle;
local l_ActionBar_0 = v2.App.Button.ActionBar;
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local v10 = v1.PureComponent:extend("ProfilePictureEditorBottomBar");
v10.validateProps = v3.strictInterface({
    button1 = v3.strictInterface({
        textKey = v3.string, 
        onActivated = v3.callback, 
        isDisabled = v3.optional(v3.boolean)
    }), 
    button2 = v3.strictInterface({
        textKey = v3.string, 
        onActivated = v3.callback, 
        isDisabled = v3.optional(v3.boolean)
    }), 
    onAbsoluteSizeChanged = v3.optional(v3.callback), 
    NextSelectionUp = v3.table, 
    baseRef = v3.table
});
v10.init = function(v11)
    local v12, v13 = v1.createBinding(UDim2.new(1, 0, 0, 100));
    v11.bottomBarSize = v12;
    v11.updateBottomBarSize = v13;
    v11.onAbsoluteSizeChanged = function(v14)
        v11.updateBottomBarSize(UDim2.new(1, 0, 0, v14.Y));
        if v11.props.onAbsoluteSizeChanged then
            v11.props.onAbsoluteSizeChanged(v14);
        end;
    end;
end;
v10.renderWithProviders = function(v15, v16, v17)
    local l_button1_0 = v15.props.button1;
    local l_button2_0 = v15.props.button2;
    local l_Theme_0 = v17.Theme;
    return v1.createElement(l_Focusable_0.Frame, {
        Size = v15.bottomBarSize, 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 2, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        NextSelectionUp = v15.props.NextSelectionUp, 
        [v1.Ref] = v15.props.baseRef
    }, {
        GradientFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            Position = UDim2.new(0, 0, 0, -20), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = -90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        ActionBar = v1.createElement(l_ActionBar_0, {
            onAbsoluteSizeChanged = v15.onAbsoluteSizeChanged
        }, {
            ButtonStack = v1.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        props = {
                            onActivated = l_button1_0.onActivated, 
                            text = v16.button1Text, 
                            isDisabled = l_button1_0.isDisabled
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        isDefaultChild = true, 
                        props = {
                            onActivated = l_button2_0.onActivated, 
                            text = v16.button2Text, 
                            isDisabled = l_button2_0.isDisabled
                        }
                    }
                }
            })
        })
    });
end;
v10.render = function(v21)
    local l_button1_1 = v21.props.button1;
    local l_button2_1 = v21.props.button2;
    return l_withStyle_0(function(v24)
        return l_withLocalization_0({
            button1Text = l_button1_1.textKey, 
            button2Text = l_button2_1.textKey
        })(function(v25)
            return v21:renderWithProviders(v25, v24);
        end);
    end);
end;
return v10;
