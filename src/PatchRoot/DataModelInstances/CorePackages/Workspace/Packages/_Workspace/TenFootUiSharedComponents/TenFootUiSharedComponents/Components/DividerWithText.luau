local v0 = require(script:FindFirstAncestor("TenFootUiSharedComponents").Parent.React);
local l_TextService_0 = game:GetService("TextService");
return function(v2)
    local l_X_0 = l_TextService_0:GetTextSize(v2.text, v2.fontSize, v2.font, Vector2.new(math.huge, v2.fontSize)).X;
    return v0.createElement("Frame", {
        LayoutOrder = v2.layoutOrder, 
        Size = if not v2.size then UDim2.new(0, v2.width, 0, v2.height) else v2.size, 
        BackgroundTransparency = 1
    }, v0.createElement("Frame", {
        Position = UDim2.new(0, 0, 0.5, 0), 
        Size = UDim2.new(0.5, -l_X_0 / 2 - v2.padding, 0, 1), 
        BackgroundTransparency = v2.transparency, 
        BackgroundColor3 = v2.color3
    }), v0.createElement("Frame", {
        Position = UDim2.new(0.5, l_X_0 / 2 + v2.padding, 0.5, 0), 
        Size = UDim2.new(0.5, -l_X_0 / 2 - v2.padding, 0, 1), 
        BackgroundTransparency = v2.transparency, 
        BackgroundColor3 = v2.color3
    }), v0.createElement("TextLabel", {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Text = v2.text, 
        TextSize = v2.fontSize, 
        Font = v2.font, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        TextTransparency = v2.transparency, 
        TextColor3 = v2.color3, 
        BackgroundTransparency = 1
    }));
end;
