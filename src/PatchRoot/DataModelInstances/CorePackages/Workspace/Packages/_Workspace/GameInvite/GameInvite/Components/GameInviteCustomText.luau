local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.GameInviteConstants);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_SidePadding_0 = v4.Layout.SidePadding;
return function(v7)
    local v8 = l_useStyle_0();
    local l_Theme_0 = v8.Theme;
    local l_Font_0 = v8.Font;
    return v2.createElement("Frame", {
        Size = v7.size, 
        LayoutOrder = v7.layoutOrder, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_SidePadding_0), 
            PaddingRight = UDim.new(0, l_SidePadding_0)
        }), 
        CustomText = v2.createElement("TextLabel", {
            Text = v7.promptMessage, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            Font = l_Font_0.Body.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        })
    });
end;
