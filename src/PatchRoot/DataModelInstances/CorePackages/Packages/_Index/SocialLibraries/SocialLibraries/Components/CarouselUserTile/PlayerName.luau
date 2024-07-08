local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_llama_0 = v0.llama;
local l_UIBlox_0 = v0.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Style_0 = l_UIBlox_0.Style;
local v6 = require(script.Parent.getTextHeight);
local _ = require(script.Parent.StyleTypes);
local v8 = {
    width = require(script.Parent.Constants).TILE_SIZE
};
return function(v9)
    local v10 = l_llama_0.Dictionary.join(v8, v9);
    return l_Style_0.withStyle(function(v11)
        local l_Theme_0 = v11.Theme;
        local l_Font_0 = v11.Font;
        return l_Roact_0.createElement(l_StyledTextLabel_0, {
            layoutOrder = v10.layoutOrder, 
            text = v10.name, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = l_Theme_0.TextEmphasis, 
            size = UDim2.fromOffset(v10.width, v6(v10.name, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize)), 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Center, 
            lineHeight = 1, 
            fluidSizing = false, 
            richText = false
        });
    end);
end;
