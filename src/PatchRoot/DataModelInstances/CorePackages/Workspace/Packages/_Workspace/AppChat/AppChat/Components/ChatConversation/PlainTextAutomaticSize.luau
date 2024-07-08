local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(script.Parent.ChatBubbleContainerAutomaticSize);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v8 = {
    text = "", 
    maxWidth = 0, 
    innerPadding = 0, 
    isIncoming = false, 
    hasTail = false, 
    LayoutOrder = 0, 
    isPending = false, 
    isUnfiltered = false, 
    [v4.Change.AbsoluteSize] = function()
    end
};
PlainText = function(v9)
    local v10 = v6.Dictionary.join(v8, v9);
    local v11 = l_useStyle_0();
    local l_maxWidth_0 = v10.maxWidth;
    local l_innerPadding_0 = v10.innerPadding;
    local v14 = math.max(0, l_maxWidth_0 - l_innerPadding_0);
    local l_Body_0 = v11.Font.Body;
    local v16 = v10.textSize or v11.Font.BaseSize * l_Body_0.RelativeSize;
    local l_text_0 = v10.text;
    local v18 = v10.font or l_Body_0.Font;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_text_0, v16, v18, (Vector2.new(v14, math.huge)));
    return v4.createElement(v3, {
        isIncoming = v10.isIncoming, 
        hasTail = v10.hasTail, 
        isPending = v10.isPending, 
        isUnfiltered = v10.isUnfiltered, 
        padding = l_innerPadding_0, 
        LayoutOrder = v10.LayoutOrder, 
        [v4.Change.AbsoluteSize] = v10[v4.Change.AbsoluteSize]
    }, {
        textContent = v4.createElement("TextLabel", {
            Text = l_text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            TextColor3 = if not (((v7() and v10.isUnfiltered) and not v10.isIncoming) and not v10.isPending) then v11.Theme.TextEmphasis.Color else Color3.new(1, 1, 1), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = v18, 
            TextSize = v16, 
            Size = UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), 
            TextTransparency = not not v10.isPending and v11.Theme.TextMuted.Transparency or 0, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true
        }, {
            SizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v14 or l_maxWidth_0, math.huge)
            })
        })
    });
end;
return PlainText;
