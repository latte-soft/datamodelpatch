local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v7 = require(l_Modules_0.LuaApp.Components.LocalizedFitTextLabel);
local v8 = require(l_Modules_0.Common.Text);
local v9 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppConsoleSupportRFY);
local l_SECTION_HEADER_HEIGHT_0 = v4.SECTION_HEADER_HEIGHT;
local v11 = v2.PureComponent:extend("SectionHeader");
v11.defaultProps = {
    Size = UDim2.new(1, 0, 0, l_SECTION_HEADER_HEIGHT_0), 
    useLocalizedText = false
};
v11.render = function(v12)
    local l_text_0 = v12.props.text;
    local l_LayoutOrder_0 = v12.props.LayoutOrder;
    local l_Size_0 = v12.props.Size;
    local l_Position_0 = v12.props.Position;
    local l_TextTransparency_0 = v12.props.TextTransparency;
    local l_useLocalizedText_0 = v12.props.useLocalizedText;
    return l_withStyle_0(function(v19)
        local l_Font_0 = v19.Font;
        local l_Theme_0 = v19.Theme;
        local v22 = v12.props.Font or l_Font_0.Header1.Font;
        local v23 = if not v9 then l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize else v12.props.TextSize or l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local v24 = v12.props.TextColor3 or l_Theme_0.TextEmphasis.Color;
        l_TextTransparency_0 = l_Theme_0.TextEmphasis.Transparency;
        l_Size_0 = UDim2.new(1, 0, 0, (v8.GetTextHeight(l_text_0, v22, v23, 10000)));
        return v2.createElement(not not l_useLocalizedText_0 and v7 or v6, {
            LayoutOrder = l_LayoutOrder_0, 
            Size = l_Size_0, 
            Position = l_Position_0, 
            BackgroundTransparency = 1, 
            TextSize = v23, 
            TextColor3 = v24, 
            TextTransparency = l_TextTransparency_0, 
            Font = v22, 
            Text = l_text_0, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            fitAxis = v5.FitAxis.Height
        });
    end);
end;
return v11;
