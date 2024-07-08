local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.Core.Style.useStyle);
return function(v3)
    local l_HelperText_0 = v2().Tokens.Component.HelperText;
    local l_Typography_0 = l_HelperText_0.Base.Typography;
    local v6 = if not v3.error then l_HelperText_0.Base.ContentColor else l_HelperText_0.Error.ContentColor;
    return v1.createElement("TextLabel", {
        Text = v3.text, 
        TextTransparency = v6.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        BackgroundTransparency = 1, 
        TextColor3 = v6.Color3, 
        Font = l_Typography_0.Font, 
        TextSize = l_Typography_0.FontSize, 
        LineHeight = l_Typography_0.LineHeight, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v3.LayoutOrder
    });
end;
