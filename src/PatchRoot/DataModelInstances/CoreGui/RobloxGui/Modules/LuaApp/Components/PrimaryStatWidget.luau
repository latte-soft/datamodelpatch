local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.Text);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v6 = v2.PureComponent:extend("PrimaryStatWidget");
v6.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.new(0, 0, 0, 0)
};
v6.GetMinimumWidth = function(v7, v8, v9)
    return math.max(v3.GetTextWidth(v7, v9, 42), (v3.GetTextWidth(v8, v9, 12))) + 74;
end;
v6.GetMinimumWidthRethemed = function(v10, v11, v12)
    return math.max(v3.GetTextWidth(v10, v12.Font.Title.Font, v12.Font.BaseSize * v12.Font.Title.RelativeSize), (v3.GetTextWidth(v11, v12.Font.CaptionHeader.Font, v12.Font.BaseSize * v12.Font.CaptionHeader.RelativeSize))) + 74;
end;
v6.render = function(v13)
    local l_icon_0 = v13.props.icon;
    local l_number_0 = v13.props.number;
    local l_label_0 = v13.props.label;
    local l_font_0 = v13.props.font;
    local l_color_0 = v13.props.color;
    local l_width_0 = v13.props.width;
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_AnchorPoint_0 = v13.props.AnchorPoint;
    local l_Position_0 = v13.props.Position;
    local l_withNewThemeProvider_0 = v13.props.withNewThemeProvider;
    local v24 = l_width_0 - 74;
    return l_withStyle_0(function(v25)
        return v2.createElement("Frame", {
            AnchorPoint = l_AnchorPoint_0, 
            Position = l_Position_0, 
            Size = UDim2.new(0, l_width_0, 0, 44), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10)
            }), 
            Icon = not not l_withNewThemeProvider_0 and v2.createElement(v4, {
                Size = UDim2.new(0, 44, 0, 44), 
                Image = l_icon_0, 
                ImageColor3 = v25.Theme.IconEmphasis.Color, 
                ImageTransparency = v25.Theme.IconEmphasis.Transparency, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }) or v2.createElement(v4, {
                Size = UDim2.new(0, 44, 0, 44), 
                Image = l_icon_0, 
                ImageColor3 = l_color_0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            TextSection = v2.createElement("Frame", {
                Size = UDim2.new(0, v24, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Number = not not l_withNewThemeProvider_0 and v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 42), 
                    Position = UDim2.new(0, 0, 0, -7), 
                    Text = l_number_0, 
                    Font = v25.Font.Title.Font, 
                    TextSize = v25.Font.BaseSize * v25.Font.Title.RelativeSize, 
                    TextColor3 = v25.Theme.TextEmphasis.Color, 
                    TextTransparency = v25.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                }) or v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 42), 
                    Position = UDim2.new(0, 0, 0, -7), 
                    Text = l_number_0, 
                    Font = l_font_0, 
                    TextSize = 42, 
                    TextColor3 = l_color_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                }), 
                Label = not not l_withNewThemeProvider_0 and v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 12), 
                    Position = UDim2.new(0, 0, 0, 28), 
                    Text = l_label_0, 
                    Font = v25.Font.CaptionHeader.Font, 
                    TextSize = v25.Font.BaseSize * v25.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v25.Theme.TextEmphasis.Color, 
                    TextTransparency = v25.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                }) or v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 12), 
                    Position = UDim2.new(0, 0, 0, 28), 
                    Text = l_label_0, 
                    Font = l_font_0, 
                    TextSize = 12, 
                    TextColor3 = l_color_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextScaled = true, 
                    BackgroundTransparency = 1
                })
            })
        });
    end);
end;
return v6;
