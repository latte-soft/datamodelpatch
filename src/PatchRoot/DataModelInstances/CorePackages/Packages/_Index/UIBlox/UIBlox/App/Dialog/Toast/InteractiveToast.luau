local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_2.App.ImageSet.Images);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_2.Utility.SpringAnimatedItem);
local v10 = require(l_Parent_1.Button.Enum.ButtonType);
local v11 = require(l_Parent_0.ToastFrame);
local v12 = require(l_Parent_0.ToastIcon);
local v13 = require(l_Parent_0.ToastText);
local v14 = {
    dampingRatio = 1, 
    frequency = 4
};
local v15 = v7["component_assets/circle_21"];
local v16 = Rect.new(10, 10, 11, 11);
local v17 = v4.PureComponent:extend("InteractiveToast");
v17.validateProps = v5.strictInterface({
    anchorPoint = v5.optional(v5.Vector2), 
    buttonProps = v5.optional(v5.strictInterface({
        buttonDimensions = v5.Vector2, 
        buttonText = v5.string, 
        onActivated = v5.callback, 
        buttonType = v5.optional(v10.isEnumValue)
    })), 
    iconProps = v5.optional(v12.validateProps), 
    iconChildren = v5.optional(v5.table), 
    isCompact = v5.optional(v5.boolean), 
    layoutOrder = v5.optional(v5.integer), 
    padding = v5.optional(v5.numberMin(0)), 
    position = v5.optional(v5.UDim2), 
    pressed = v5.optional(v5.boolean), 
    pressedScale = v5.number, 
    size = v5.UDim2, 
    subtitleTextProps = v5.optional(v13.validateProps), 
    textFrameSize = v5.optional(v5.UDim2), 
    titleTextProps = v13.validateProps
});
v17.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    layoutOrder = 1, 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    pressedScale = 0.95, 
    size = UDim2.new(1, 0, 1, 0)
};
v17.render = function(v18)
    return v8(function(v19)
        local l_Theme_0 = v19.Theme;
        return v4.createElement(v6.Label, {
            AnchorPoint = v18.props.anchorPoint, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v15, 
            ImageColor3 = l_Theme_0.SystemPrimaryContent.Color, 
            ImageTransparency = l_Theme_0.SystemPrimaryContent.Transparency, 
            LayoutOrder = v18.props.layoutOrder, 
            Position = v18.props.position, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = v18.props.size, 
            SliceCenter = v16
        }, {
            Scaler = v4.createElement(v9.AnimatedUIScale, {
                springOptions = v14, 
                animatedValues = {
                    scale = not not v18.props.pressed and v18.props.pressedScale or 1
                }, 
                mapValuesToProps = function(v21)
                    return {
                        Scale = v21.scale
                    };
                end
            }), 
            ToastFrame = v4.createElement(v11, {
                buttonProps = v18.props.buttonProps, 
                iconProps = v18.props.iconProps, 
                iconChildren = v18.props.iconChildren, 
                isCompact = v18.props.isCompact, 
                padding = v18.props.padding, 
                subtitleTextProps = v18.props.subtitleTextProps, 
                textFrameSize = v18.props.textFrameSize, 
                titleTextProps = v18.props.titleTextProps
            })
        });
    end);
end;
return v17;
