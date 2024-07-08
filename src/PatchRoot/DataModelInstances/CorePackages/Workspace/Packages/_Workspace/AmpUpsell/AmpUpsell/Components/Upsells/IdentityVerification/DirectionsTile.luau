local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.React);
local l_ImageSetLabel_0 = v1.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v1.App.Constant.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
return function(v8)
    local v9 = l_useStyle_0();
    local l_frameHeight_0 = v8.frameHeight;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.layoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        ImageIcon = v2.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, l_IconSize_0.Large, 0, l_IconSize_0.Large), 
            ScaleType = Enum.ScaleType.Fit, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Image = l_Images_0[v8.imagePath], 
            ImageTransparency = v9.Theme.SystemPrimaryDefault.Transparency
        }), 
        TextFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, l_frameHeight_0), 
            LayoutOrder = 2
        }, {
            TextLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Header = v2.createElement(l_StyledTextLabel_0, {
                text = v8.headerText, 
                fontStyle = v9.Font.Header2, 
                colorStyle = v9.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0.5, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            }), 
            Body = v2.createElement(l_StyledTextLabel_0, {
                text = v8.descriptionText, 
                fontStyle = v9.Font.CaptionBody, 
                colorStyle = v9.Theme.TextDefault, 
                size = UDim2.new(1, 0, 0.5, 0), 
                lineHeight = 1, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 2
            })
        })
    });
end;
