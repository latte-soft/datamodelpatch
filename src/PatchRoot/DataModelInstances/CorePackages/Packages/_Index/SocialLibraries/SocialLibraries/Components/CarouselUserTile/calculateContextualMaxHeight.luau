local v0 = require(script.Parent.Constants);
local v1 = require(script.Parent.getTextHeight);
local _ = require(script.Parent.StyleTypes);
return function(v3)
    local v4 = not not v3 and v3.nameTopPadding or v0.NAME_TOP_PADDING;
    local v5 = not not v3 and v3.contextualTopPadding or v0.CONTEXTUAL_TOP_PADDING;
    local v6 = not not v3 and v3.maxLinesNumber or v0.LINES_MAX;
    local l_font_0 = v3.font;
    return ((v4 + v1("", l_font_0.CaptionHeader.Font, l_font_0.BaseSize * l_font_0.CaptionHeader.RelativeSize)) + v5) + v1("", l_font_0.CaptionBody.Font, l_font_0.BaseSize * l_font_0.CaptionBody.RelativeSize) * v6;
end;
