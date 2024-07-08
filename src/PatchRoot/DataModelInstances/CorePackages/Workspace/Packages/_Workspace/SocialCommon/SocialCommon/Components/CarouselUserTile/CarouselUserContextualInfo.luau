local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_IconSize_0 = v3.App.Constant.IconSize;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v10 = require(script.Parent.Constants);
local v11 = {
    maxNumberOfLines = v10.LINES_MAX, 
    lineWidth = v10.TILE_SIZE
};
CarouselUserContextualInfo = function(v12)
    local v13 = v2.Dictionary.join(v11, v12);
    local l_icon_0 = v13.icon;
    local l_label_0 = v13.label;
    local v16 = l_useStyle_0();
    local l_Theme_0 = v16.Theme;
    local l_Font_0 = v16.Font;
    local v19 = l_label_0.font or l_Font_0.CaptionBody;
    local l_text_0 = l_label_0.text;
    return v1.createElement("Frame", {
        LayoutOrder = v13.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 2)
        }), 
        IconFrame = if not not l_icon_0 and l_icon_0.path then v1.createElement("Frame", {
            Size = UDim2.fromOffset(l_IconSize_0.Small, l_IconSize_0.Small), 
            BackgroundTransparency = 1
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            ImageLabel = v1.createElement(l_ImageSetLabel_0, {
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
        ContextualText = if not l_text_0 then nil else v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            size = UDim2.fromOffset(not not l_icon_0 and v13.lineWidth - (l_IconSize_0.Small + 2) or v13.lineWidth, (v1.useMemo(function()
                return l_Text_0.GetTextHeight(l_text_0 or "", v19.Font, l_Font_0.BaseSize * v19.RelativeSize, 10000) * v13.maxNumberOfLines;
            end, {
                v19.Font, 
                l_Font_0.BaseSize, 
                v19.RelativeSize, 
                v13.maxNumberOfLines, 
                l_text_0
            }))), 
            lineHeight = 1, 
            text = l_text_0, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Top, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            fontStyle = v19, 
            colorStyle = l_label_0.colorStyle or l_Theme_0.SecondaryContent, 
            fluidSizing = false, 
            richText = false
        })
    });
end;
return CarouselUserContextualInfo;
