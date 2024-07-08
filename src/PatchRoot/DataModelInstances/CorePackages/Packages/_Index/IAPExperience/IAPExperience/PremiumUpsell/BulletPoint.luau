local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Roact);
local _ = require(l_Parent_0.t);
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v2.Style.withStyle;
local l_IconSize_0 = v2.App.Constant.IconSize;
local v9 = l_IconSize_0.Small + 16;
return function(v10)
    return l_withStyle_0(function(v11)
        local l_Theme_0 = v11.Theme;
        local l_Font_0 = v11.Font;
        local l_text_0 = v10.text;
        local v15 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
        local l_Font_1 = l_Font_0.Body.Font;
        local v17 = nil;
        v17 = if l_text_0 ~= nil then l_TextService_0:GetTextSize(l_text_0, v15, l_Font_1, Vector2.new(v10.width - v9, 10000)) else Vector2.new(0, 0);
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v17.Y), 
            BackgroundTransparency = 1, 
            LayoutOrder = v10.layoutOrder
        }, {
            Bullet = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 2, 0, 2), 
                Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = l_Images_0["icons/status/success_small"], 
                ImageColor3 = l_Theme_0.IconDefault.Color, 
                ImageTransparency = l_Theme_0.IconDefault.Transparency
            }), 
            Text = v3.createElement("TextLabel", {
                Position = UDim2.new(0, v9, 0, 0), 
                Size = UDim2.new(1, -v9, 0, v17.Y), 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                TextSize = v15, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                Font = l_Font_1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                LayoutOrder = v10.layoutOrder
            })
        });
    end);
end;
