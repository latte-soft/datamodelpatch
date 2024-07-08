local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_validateImage_0 = v5.Core.ImageSet.Validator.validateImage;
local v9 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local _ = script.Parent.Parent.Parent.Parent.Parent.InGameMenu;
local v11 = v3.PureComponent:extend("ButtonHint");
v11.validateProps = v4.strictInterface({
    layoutOrder = v4.optional(v4.integer), 
    localizationKey = v4.string, 
    keyImage = l_validateImage_0
});
v11.render = function(v12)
    return l_withStyle_0(function(v13)
        local l_Theme_0 = v13.Theme;
        local l_Font_0 = v13.Font;
        local v16 = v9:FormatByKey(v12.props.localizationKey);
        local v17 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize or l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local l_X_0 = l_TextService_0:GetTextSize(v16, v17, l_Font_0.Header2.Font, Vector2.new(1000, 1000)).X;
        return v3.createElement("Frame", {
            LayoutOrder = v12.props.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 44 + l_X_0, 1, 0)
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            Icon = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(36, 36), 
                Image = v12.props.keyImage, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color
            }), 
            Text = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_X_0, 0, 1), 
                LayoutOrder = 2, 
                Font = l_Font_0.Header2.Font, 
                Text = v16, 
                TextSize = v17, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v11;
