local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local v1 = require(script.Parent.ChatBubbleContainerAutomaticSize);
local l_Roact_0 = v0.Roact;
local l_withStyle_0 = v0.UIBlox.Style.withStyle;
local l_TextService_0 = game:GetService("TextService");
game:DefineFastFlag("FixPlainTextAutomaticSizeClippingText", false);
local l_FixPlainTextAutomaticSizeClippingText_0 = game:GetFastFlag("FixPlainTextAutomaticSizeClippingText");
local v6 = {
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
return function(v7)
    return l_withStyle_0(function(v8)
        local v9 = v7.maxWidth or v6.maxWidth;
        local v10 = v7.innerPadding or v6.innerPadding;
        local v11 = math.max(0, v9 - v10);
        local l_Body_0 = v8.Font.Body;
        local v13 = v7.textSize or v8.Font.BaseSize * l_Body_0.RelativeSize;
        local v14 = v7.text or v6.text;
        local v15 = v7.font or l_Body_0.Font;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v14, v13, v15, (Vector2.new(v11, math.huge)));
        return l_Roact_0.createElement(v1, {
            isIncoming = v7.isIncoming or v6.isIncoming, 
            hasTail = v7.hasTail or v6.hasTail, 
            isPending = v7.isPending or v6.isPending, 
            padding = v10, 
            LayoutOrder = v7.LayoutOrder or v6.LayoutOrder, 
            [l_Roact_0.Change.AbsoluteSize] = v7[l_Roact_0.Change.AbsoluteSize] or v6[l_Roact_0.Change.AbsoluteSize]
        }, {
            textContent = l_Roact_0.createElement("TextLabel", {
                Text = v14, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextColor3 = v8.Theme.TextEmphasis.Color, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = v15, 
                TextSize = v13, 
                Size = not not l_FixPlainTextAutomaticSizeClippingText_0 and UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))) or UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y), 
                TextTransparency = not not v7.isPending and v8.Theme.TextMuted.Transparency or 0, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            }, {
                SizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v11 or v9, math.huge)
                })
            })
        });
    end);
end;
