local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local _ = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local _ = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v7 = require(l_Parent_0.Core.Style.useStyle);
local v8 = require(l_Parent_0.Core.Text.GetTextSize);
local l_Emoji_0 = l_Parent_0.Core.Emoji;
local v10 = require(l_Emoji_0.Emoji);
local v11 = require(l_Emoji_0.Enum.Emoji);
local v12 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v13 = {
    maxSize = Vector2.new(10000, 10000), 
    fluidSizing = false
};
return function(v14)
    v14 = v3.Dictionary.join(v13, v14);
    local v15 = v7();
    local v16 = v11.isEnumValue(v14.emoji);
    local l_BaseSize_0 = v15.Font.BaseSize;
    local l_fontStyle_0 = v14.fontStyle;
    local l_Font_0 = l_fontStyle_0.Font;
    local v20 = if not l_fontStyle_0.RelativeSize then l_fontStyle_0.FontSize else l_BaseSize_0 * l_fontStyle_0.RelativeSize;
    local l_maxSize_0 = v14.maxSize;
    local v22 = v8(v14.Text, v20, l_Font_0, l_maxSize_0);
    return v2.createElement(v12, v3.Dictionary.join(v14, {
        emoji = v3.None, 
        emojiOnActivated = v3.None, 
        Size = UDim2.fromOffset(math.min(v22.X, l_maxSize_0.X - v20), v22.Y)
    }), {
        Emoji = v16 and v2.createElement(v10, {
            emoji = v14.emoji, 
            onActivated = v14.emojiOnActivated, 
            textFont = l_Font_0, 
            textSize = v20, 
            Position = UDim2.fromScale(1, 0)
        })
    });
end;
