local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v7 = {
    width = require(script.Parent.Constants).TILE_SIZE
};
return function(v8)
    local v9 = v2.Dictionary.join(v7, v8);
    local v10 = l_useStyle_0();
    local l_Theme_0 = v10.Theme;
    local l_Font_0 = v10.Font;
    return v1.createElement(l_StyledTextLabel_0, {
        layoutOrder = v9.layoutOrder, 
        text = v9.name, 
        fontStyle = l_Font_0.CaptionHeader, 
        colorStyle = l_Theme_0.TextEmphasis, 
        size = UDim2.fromOffset(v9.width, (v1.useMemo(function()
            return l_Text_0.GetTextHeight(v9.name, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 10000);
        end, {
            v9.name, 
            l_Font_0.CaptionHeader.Font, 
            l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize
        }))), 
        textTruncate = Enum.TextTruncate.AtEnd, 
        textXAlignment = Enum.TextXAlignment.Left, 
        textYAlignment = Enum.TextYAlignment.Center, 
        lineHeight = 1, 
        fluidSizing = false, 
        richText = false
    });
end;
