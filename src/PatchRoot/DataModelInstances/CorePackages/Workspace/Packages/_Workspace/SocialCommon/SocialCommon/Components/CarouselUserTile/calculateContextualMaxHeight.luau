local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v2 = require(script.Parent.Constants);
local _ = require(l_Parent_0.UIBlox);
return function(v4)
    local v5 = not not v4 and v4.nameTopPadding or v2.NAME_TOP_PADDING;
    local v6 = not not v4 and v4.contextualTopPadding or v2.CONTEXTUAL_TOP_PADDING;
    local v7 = not not v4 and v4.maxLinesNumber or v2.LINES_MAX;
    local l_font_0 = v4.font;
    return ((v5 + l_Text_0.GetTextHeight("", l_font_0.CaptionHeader.Font, l_font_0.BaseSize * l_font_0.CaptionHeader.RelativeSize, 10000)) + v6) + l_Text_0.GetTextHeight("", l_font_0.CaptionBody.Font, l_font_0.BaseSize * l_font_0.CaptionBody.RelativeSize, 10000) * v7;
end;
