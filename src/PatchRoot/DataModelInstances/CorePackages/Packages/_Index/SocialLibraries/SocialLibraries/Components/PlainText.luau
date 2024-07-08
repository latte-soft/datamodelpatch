local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local v1 = require(script.Parent.ChatBubbleContainer);
local l_Roact_0 = v0.Roact;
local l_withStyle_0 = v0.UIBlox.Style.withStyle;
local l_FitTextLabel_0 = v0.RoactFitComponents.FitTextLabel;
local v5 = l_Roact_0.PureComponent:extend("PlainText");
v5.defaultProps = {
    text = "", 
    maxWidth = 0, 
    innerPadding = 0, 
    isIncoming = false, 
    hasTail = false, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_Roact_0.Change.AbsoluteSize] = function()
    end
};
v5.render = function(v6)
    return l_withStyle_0(function(v7)
        local l_maxWidth_0 = v6.props.maxWidth;
        local l_innerPadding_0 = v6.props.innerPadding;
        local v10 = math.max(0, l_maxWidth_0 - l_innerPadding_0);
        local l_Body_0 = v7.Font.Body;
        return l_Roact_0.createElement(v1, {
            isIncoming = v6.props.isIncoming, 
            hasTail = v6.props.hasTail, 
            isPending = v6.props.isPending, 
            padding = l_innerPadding_0, 
            LayoutOrder = v6.props.LayoutOrder, 
            [l_Roact_0.Change.AbsoluteSize] = v6.props[l_Roact_0.Change.AbsoluteSize]
        }, {
            textContent = l_Roact_0.createElement(l_FitTextLabel_0, {
                Text = v6.props.text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextColor3 = v7.Theme.TextEmphasis.Color, 
                width = l_FitTextLabel_0.Width.FitToText, 
                maximumWidth = v10, 
                Font = v6.props.font or l_Body_0.Font, 
                TextSize = v6.props.textSize or v7.Font.BaseSize * l_Body_0.RelativeSize, 
                TextTransparency = not not v6.props.isPending and v7.Theme.TextMuted.Transparency or 0, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        });
    end);
end;
return v5;
