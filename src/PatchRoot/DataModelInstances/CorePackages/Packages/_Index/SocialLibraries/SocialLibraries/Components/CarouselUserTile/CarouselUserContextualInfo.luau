local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_llama_0 = v0.llama;
local l_UIBlox_0 = v0.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Style_0 = l_UIBlox_0.Style;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v9 = require(script.Parent.getTextHeight);
local _ = require(script.Parent.StyleTypes);
local v11 = require(script.Parent.Constants);
local v12 = {
    maxNumberOfLines = v11.LINES_MAX, 
    lineWidth = v11.TILE_SIZE
};
return function(v13)
    local v14 = l_llama_0.Dictionary.join(v12, v13);
    local l_icon_0 = v14.icon;
    local l_label_0 = v14.label;
    return l_Style_0.withStyle(function(v17)
        local l_Theme_0 = v17.Theme;
        local l_Font_0 = v17.Font;
        local v20 = l_label_0.font or l_Font_0.CaptionBody;
        local l_text_0 = l_label_0.text;
        return l_Roact_0.createElement("Frame", {
            LayoutOrder = v14.layoutOrder, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 2)
            }), 
            IconFrame = if not not l_icon_0 and l_icon_0.path then l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
                BackgroundTransparency = 1
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                ImageLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Image = l_Images_0[l_icon_0.path], 
                    ImageColor3 = l_icon_0.color or l_Theme_0.IconDefault.Color, 
                    ImageTransparency = l_icon_0.transparency or l_Theme_0.IconDefault.Transparency, 
                    Size = l_icon_0.size or UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }) else nil, 
            ContextualText = if not l_text_0 then nil else l_Roact_0.createElement(l_StyledTextLabel_0, {
                layoutOrder = 2, 
                size = UDim2.fromOffset(not not l_icon_0 and v14.lineWidth - (l_IconSize_0.Small + 2) or v14.lineWidth, v9(l_text_0, v20.Font, l_Font_0.BaseSize * v20.RelativeSize) * v14.maxNumberOfLines), 
                lineHeight = 1, 
                text = l_text_0, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Top, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                fontStyle = v20, 
                colorStyle = l_label_0.colorStyle or l_Theme_0.SecondaryContent, 
                fluidSizing = false, 
                richText = false
            })
        });
    end);
end;
