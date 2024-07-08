local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_Text_0 = v0.Text;
local l_memoize_0 = v0.memoize;
local l_UIBlox_0 = v0.UIBlox;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v7 = l_Roact_0.PureComponent:extend("PlayerName");
v7.init = function(v8)
    v8.getTextHeight = l_memoize_0(function(v9, v10, v11)
        return l_Text_0.GetTextHeight(v9, v10, v11);
    end);
end;
v7.render = function(v12)
    local l_props_0 = v12.props;
    return l_withStyle_0(function(v14)
        local l_Theme_0 = v14.Theme;
        local l_Font_0 = v14.Font;
        return l_Roact_0.createElement(l_StyledTextLabel_0, {
            layoutOrder = l_props_0.layoutOrder, 
            text = l_props_0.name, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = l_Theme_0.TextEmphasis, 
            size = UDim2.fromOffset(l_props_0.tileSize, v12.getTextHeight(l_props_0.name, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize)), 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Center, 
            lineHeight = 1, 
            fluidSizing = false, 
            richText = false
        });
    end);
end;
return v7;
