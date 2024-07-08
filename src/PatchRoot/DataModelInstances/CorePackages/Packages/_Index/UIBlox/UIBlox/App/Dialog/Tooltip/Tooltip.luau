local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_0.TooltipContainer);
local v7 = require(l_Parent_0.Enum.TooltipOrientation);
local v8 = v3.PureComponent:extend("Tooltip");
v8.validateProps = v4.strictInterface({
    triggerPosition = v4.Vector2, 
    triggerSize = v4.Vector2, 
    bodyText = v4.string, 
    headerText = v4.optional(v4.string), 
    backgroundColor = v4.optional(v4.Color3), 
    backgroundTransparency = v4.optional(v4.number), 
    onDismiss = v4.optional(v4.callback), 
    onClose = v4.optional(v4.callback), 
    screenSize = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    orientation = v4.optional(v7.isEnumValue), 
    triggerOnHover = v4.optional(v4.boolean), 
    forceClickTriggerPoint = v4.optional(v4.boolean), 
    isDirectChild = v4.optional(v4.boolean), 
    minContentWidth = v4.optional(v4.number)
});
v8.defaultProps = {
    screenSize = Vector2.new(10000, 10000), 
    orientation = v7.Bottom, 
    triggerOnHover = false, 
    forceClickTriggerPoint = false, 
    isDirectChild = false
};
v8.init = function(v9)
    v9.onDismissDefault = function()
        if not v9.props.forceClickTriggerPoint and not v9.props.triggerOnHover then
            if v9.props.onDismiss then
                v9.props.onDismiss();
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v8.render = function(v10)
    local v11 = v10.props.forceClickTriggerPoint or v10.props.triggerOnHover;
    local l_isDirectChild_0 = v10.props.isDirectChild;
    return v5(function(v13)
        local v14 = {
            Background = not v10.props.forceClickTriggerPoint and v3.createElement("TextButton", {
                ZIndex = 0, 
                AutoButtonColor = false, 
                BackgroundColor3 = v13.Theme.Overlay.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Position = not not l_isDirectChild_0 and UDim2.fromOffset(-v10.props.triggerPosition.X, -v10.props.triggerPosition.Y) or UDim2.fromOffset(0, 0), 
                Size = UDim2.fromOffset(v10.props.screenSize.X, v10.props.screenSize.Y), 
                Text = "", 
                [v3.Event.Activated] = v10.onDismissDefault, 
                [v3.Event.TouchSwipe] = v10.onDismissDefault, 
                [v3.Event.MouseWheelForward] = v10.onDismissDefault, 
                [v3.Event.MouseWheelBackward] = v10.onDismissDefault
            }), 
            TriggerPointMask = v11 and v3.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Selectable = false, 
                Size = UDim2.fromOffset(v10.props.triggerSize.X, v10.props.triggerSize.Y), 
                Position = not not l_isDirectChild_0 and UDim2.fromOffset(0, 0) or UDim2.fromOffset(v10.props.triggerPosition.X, v10.props.triggerPosition.Y), 
                [v3.Event.Activated] = v10.props.onDismiss
            }), 
            TooltipContainer = v3.createElement(v6, {
                triggerPosition = v10.props.triggerPosition, 
                triggerSize = v10.props.triggerSize, 
                bodyText = v10.props.bodyText, 
                headerText = v10.props.headerText, 
                screenSize = v10.props.screenSize, 
                position = v10.props.position, 
                orientation = v10.props.orientation, 
                isDirectChild = l_isDirectChild_0
            })
        };
        return not not l_isDirectChild_0 and v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v14) or v3.createFragment(v14);
    end);
end;
return v8;
