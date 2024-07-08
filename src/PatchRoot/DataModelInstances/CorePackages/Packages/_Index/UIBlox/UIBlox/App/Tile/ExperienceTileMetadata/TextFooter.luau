local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Parent.React);
local v4 = require(l_Parent_2.Core.Style.useStyle);
local _ = require(l_Parent_1.Style.StyleTypes);
local _ = require(l_Parent_1.Style.Fonts);
local v7 = require(l_Parent_0.FooterFrame);
local function v11(v8, v9)
    local v10 = v8 or {};
    return {
        cornerRadius = v10.cornerRadius, 
        textColor = v10.textColor or v9.Theme.TextMuted, 
        backgroundColor = v10.backgroundColor, 
        textXAlignment = v10.textXAlignment or Enum.TextXAlignment.Left, 
        textFont = v10.textFont or v9.Font.CaptionBody
    };
end;
return function(v12)
    local v13 = v4();
    local l_Font_0 = v13.Font;
    local v15 = v11(v12.styleProps, v13);
    local l_cornerRadius_0 = v15.cornerRadius;
    local l_textColor_0 = v15.textColor;
    local l_backgroundColor_0 = v15.backgroundColor;
    local l_textXAlignment_0 = v15.textXAlignment;
    local l_textFont_0 = v15.textFont;
    return v3.createElement(v7, v12, {
        Text = v3.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if not l_backgroundColor_0 then nil else l_backgroundColor_0.Color, 
            BackgroundTransparency = not l_backgroundColor_0 and 1 or l_backgroundColor_0.Transparency, 
            BorderSizePixel = 0, 
            Text = v12.text, 
            TextXAlignment = l_textXAlignment_0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_textFont_0.Font, 
            TextSize = l_Font_0.BaseSize * l_textFont_0.RelativeSize, 
            TextColor3 = l_textColor_0.Color, 
            TextTransparency = l_textColor_0.Transparency
        }, {
            UICorner = if not l_cornerRadius_0 then nil else v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_cornerRadius_0)
            })
        })
    });
end;
