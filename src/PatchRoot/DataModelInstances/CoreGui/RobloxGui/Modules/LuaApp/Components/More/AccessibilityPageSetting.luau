local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = v1.PureComponent:extend("AccessibilityPageSetting");
v3.defaultProps = {
    topToBottom = false
};
v3.validateProps = v2.strictInterface({
    topToBottom = v2.optional(v2.boolean), 
    style = v2.table, 
    layoutOrder = v2.number, 
    header = v2.string, 
    description = v2.string, 
    Control = v2.table
});
v3.render = function(v4)
    local l_style_0 = v4.props.style;
    local l_BaseSize_0 = l_style_0.Font.BaseSize;
    local v7 = l_BaseSize_0 * l_style_0.Font.Header2.RelativeSize;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v4.props.layoutOrder
    }, {
        Layout = if not v4.props.topToBottom then nil else v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SettingInfoFrame = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 6)
            }), 
            SettingHeaderText = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v4.props.header, 
                Font = l_style_0.Font.Header2.Font, 
                TextSize = v7, 
                TextColor3 = l_style_0.Theme.TextDefault.Color, 
                TextTransparency = l_style_0.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1
            }), 
            SettingDescriptionText = v1.createElement("TextLabel", {
                Size = if not v4.props.topToBottom then UDim2.new(1, -100, 0, 0) else UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v4.props.description, 
                Font = l_style_0.Font.CaptionBody.Font, 
                TextSize = l_BaseSize_0 * l_style_0.Font.CaptionBody.RelativeSize, 
                TextColor3 = l_style_0.Theme.TextMuted.Color, 
                TextTransparency = l_style_0.Theme.TextMuted.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                LayoutOrder = 2
            })
        }), 
        SettingControlFrame = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = if not v4.props.topToBottom then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = if not v4.props.topToBottom then nil else v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10)
            }), 
            Control = v4.props.Control
        })
    });
end;
return v3;
