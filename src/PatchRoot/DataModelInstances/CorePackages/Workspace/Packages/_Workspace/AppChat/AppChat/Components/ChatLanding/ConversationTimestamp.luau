local v0 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v1 = v0.PureComponent:extend("ConversationTimestamp");
v1.defaultProps = {
    text = "TEST", 
    textSize = 24, 
    textWidth = 32, 
    paddingX = 0, 
    paddingY = 0, 
    currentStyle = nil
};
v1.render = function(v2)
    local l_textSize_0 = v2.props.textSize;
    local l_textWidth_0 = v2.props.textWidth;
    local l_currentStyle_0 = v2.props.currentStyle;
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        layout = v0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        padding = v0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v2.props.paddingY), 
            PaddingRight = UDim.new(0, v2.props.paddingX)
        }), 
        timestamp = v0.createElement("TextLabel", {
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_textWidth_0, 0, l_textSize_0), 
            Text = v2.props.text, 
            TextSize = l_textSize_0, 
            Font = l_currentStyle_0.Font.Body.Font, 
            TextColor3 = l_currentStyle_0.Theme.TextDefault.Color, 
            TextTransparency = l_currentStyle_0.Theme.TextDefault.Transparency
        })
    });
end;
return v1;
