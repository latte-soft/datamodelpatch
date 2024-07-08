local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_withStyle_0 = v0.UIBlox.Style.withStyle;
local l_t_0 = v0.t;
local l_abbreviateCount_0 = v0.abbreviateCount;
local v5 = l_Roact_0.PureComponent:extend("ProfileSocialCircleItem");
v5.validateProps = l_t_0.strictInterface({
    count = l_t_0.number, 
    text = l_t_0.string, 
    layoutOrder = l_t_0.number, 
    onActivated = l_t_0.optional(l_t_0.callback)
});
v5.render = function(v6)
    return l_withStyle_0(function(v7)
        local l_Theme_0 = v7.Theme;
        local l_Font_0 = v7.Font;
        local l_text_0 = v6.props.text;
        local v11 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v12 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
        local l_count_0 = v6.props.count;
        local v14 = l_count_0 ~= 0;
        local v15 = not not v14 and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
        local v16 = not not v14 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
        return l_Roact_0.createElement("ImageButton", {
            Size = UDim2.new(0.3333333333333333, 0, 0, 44), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Image = "", 
            [l_Roact_0.Event.Activated] = v6.props.onActivated, 
            LayoutOrder = v6.props.layoutOrder, 
            Active = v14
        }, {
            VerticalLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            Count = l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Header1.Font, 
                Text = l_abbreviateCount_0(l_count_0), 
                TextSize = v11, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v15, 
                TextTransparency = v16, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            Label = l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = l_Font_0.CaptionHeader.Font, 
                Text = l_text_0, 
                TextSize = v12, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v15, 
                TextTransparency = v16, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v5;
