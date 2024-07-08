local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RoactFitComponents_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = {
    Text = "Default Title", 
    LayoutOrder = 0, 
    marginTop = 8, 
    marginBottom = 14, 
    style = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle
};
SectionHeader = function(v7)
    local v8 = v3.Dictionary.join(v6, v7);
    local l_style_0 = v8.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    return v4.createElement(l_RoactFitComponents_0.FitFrameVertical, {
        BackgroundTransparency = 1, 
        LayoutOrder = v8.LayoutOrder, 
        width = UDim.new(1, 0), 
        margin = {
            top = v8.marginTop, 
            left = 12, 
            right = 0, 
            bottom = v8.marginBottom
        }
    }, {
        SectionHeader = v4.createElement(l_RoactFitComponents_0.FitTextLabel, {
            width = l_RoactFitComponents_0.FitTextLabel.Width.FitToText, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = v8.Text, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
            Font = l_Font_0.CaptionHeader.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AnchorPoint = Vector2.new(0, 1)
        })
    });
end;
return l_memo_0(SectionHeader);
