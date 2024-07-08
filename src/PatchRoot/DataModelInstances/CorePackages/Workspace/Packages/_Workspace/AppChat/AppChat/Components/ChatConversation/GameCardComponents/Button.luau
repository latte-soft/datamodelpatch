local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = v0.PureComponent:extend("Button");
v1.defaultProps = {
    color = Color3.new(0.9, 0.9, 0.9), 
    transparency = 0, 
    textSize = 12, 
    textColor = Color3.new(0.1, 0.1, 0.1), 
    font = Enum.Font.Gotham, 
    text = "", 
    LayoutOrder = 0, 
    onActivated = function()
        print("Game card button activated");
    end
};
v1.render = function(v2)
    return v0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 32), 
        LayoutOrder = v2.props.LayoutOrder or 0
    }, {
        layout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        actionButton = v0.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png", 
            ImageColor3 = v2.props.color, 
            ImageTransparency = v2.props.transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(3, 3, 4, 4), 
            [v0.Event.Activated] = v2.props.onActivated
        }, {
            layout = v0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            actionLabel = v0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.8, 0, 0.8, 0), 
                TextSize = v2.props.textSize, 
                TextColor3 = v2.props.textColor, 
                Font = v2.props.font, 
                Text = v2.props.text or ""
            })
        })
    });
end;
return v1;
