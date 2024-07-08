local v0 = require(script.Parent.Parent.Parent.Parent.dependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v8 = l_Roact_0.PureComponent:extend("ContactsInformationModal");
v8.validateProps = l_t_0.strictInterface({
    text = l_t_0.string, 
    image = l_t_0.table, 
    layoutOrder = l_t_0.optional(l_t_0.number)
});
v8.render = function(v9)
    return l_withStyle_0(function(v10)
        local l_Theme_0 = v10.Theme;
        local l_Font_0 = v10.Font;
        local l_props_0 = v9.props;
        return l_Roact_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.layoutOrder
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 36)
            }), 
            IconContainer = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(120, 132), 
                LayoutOrder = 1
            }, {
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v10.Theme.IconEmphasis.Color, 
                    ImageTransparency = v10.Theme.IconEmphasis.Transparency, 
                    Image = l_props_0.image, 
                    Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    LayoutOrder = 1
                })
            }), 
            Description = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = l_props_0.text, 
                fontStyle = l_Font_0.CaptionBody, 
                colorStyle = l_Theme_0.TextEmphasis, 
                lineHeight = 1.2, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Top, 
                layoutOrder = 2
            })
        });
    end);
end;
return v8;
