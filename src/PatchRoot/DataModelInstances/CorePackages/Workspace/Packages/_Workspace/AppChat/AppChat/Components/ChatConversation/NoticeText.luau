local l_TextService_0 = game:GetService("TextService");
local v1 = require(script:FindFirstAncestor("AppChat").Parent.Roact);
local v2 = v1.PureComponent:extend("NoticeText");
v2.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Font = Enum.Font.Gotham, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    LayoutOrder = 1, 
    Position = UDim2.new(0, 0, 0, 0), 
    Text = "PLACEHOLDER Not everyone in this chat can see your message.", 
    TextColor3 = nil, 
    TextSize = 17, 
    TextTransparency = nil, 
    TextWrapped = true, 
    TextXAlignment = Enum.TextXAlignment.Left, 
    TextYAlignment = Enum.TextYAlignment.Top, 
    [v1.Change.AbsoluteSize] = function()
    end, 
    margin = {
        top = 0, 
        left = 0, 
        right = 0, 
        bottom = 0
    }, 
    maxWidth = 0, 
    width = UDim.new(1, 0)
};
v2.render = function(v3)
    local v4 = math.max(0, v3.props.maxWidth - (v3.props.margin.left + v3.props.margin.right));
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v3.props.Text, v3.props.TextSize, v3.props.Font, (Vector2.new(v4, math.huge)));
    return v1.createElement("Frame", {
        AnchorPoint = v3.props.AnchorPoint, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v3.props.LayoutOrder, 
        Position = v3.props.Position, 
        [v1.Change.AbsoluteSize] = v3.props[v1.Change.AbsoluteSize], 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(v3.props.width, UDim.new(0, 0))
    }, {
        Layout = v1.createElement("UIListLayout", {
            HorizontalAlignment = v3.props.HorizontalAlignment
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v3.props.margin.bottom), 
            PaddingRight = UDim.new(0, v3.props.margin.right), 
            PaddingLeft = UDim.new(0, v3.props.margin.left), 
            PaddingTop = UDim.new(0, v3.props.margin.top)
        }), 
        NoticeText = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v3.props.Font, 
            Text = v3.props.Text, 
            TextColor3 = v3.props.TextColor3, 
            TextSize = v3.props.TextSize, 
            TextTransparency = v3.props.TextTransparency, 
            TextWrapped = v3.props.TextWrapped, 
            TextXAlignment = v3.props.TextXAlignment, 
            TextYAlignment = v3.props.TextYAlignment, 
            Size = UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y)))
        }, {
            SizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v4, math.huge)
            })
        })
    });
end;
return v2;
