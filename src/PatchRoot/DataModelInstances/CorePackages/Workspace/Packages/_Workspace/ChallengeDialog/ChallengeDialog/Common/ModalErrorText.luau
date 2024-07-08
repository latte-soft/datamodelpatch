local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_FitTextLabel_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v2.Style.withStyle;
return function(v5)
    local l_contentWidth_0 = v5.contentWidth;
    local l_layoutOrder_0 = v5.layoutOrder;
    local l_errorText_0 = v5.errorText;
    return l_withStyle_0(function(v9)
        return v1.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            width = l_FitTextLabel_0.Width.FitToText, 
            maximumWidth = l_contentWidth_0, 
            Font = v9.Font.Footer.Font, 
            LayoutOrder = l_layoutOrder_0 or nil, 
            Text = l_errorText_0, 
            TextColor3 = v9.Theme.Alert.Color, 
            TextSize = v9.Font.BaseSize * v9.Font.Footer.RelativeSize, 
            TextTransparency = v9.Theme.TextDefault.Transparency, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            AnchorPoint = Vector2.new(0, 0)
        });
    end);
end;
