local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Config);
return function(v3)
    return v1.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextColor3 = v2.ChatInputBarTextColor3, 
        BackgroundTransparency = 1, 
        Font = v2.ChatInputBarFont, 
        Text = v3.targetTextChannelDisplayName or "", 
        TextSize = v2.ChatInputBarTextSize, 
        TextWrapped = true, 
        TextTransparency = v3.transparency or 1, 
        Size = UDim2.fromScale(0, 1), 
        Visible = v3.targetTextChannelDisplayName ~= "", 
        [v1.Change.AbsoluteSize] = v3.onAbsoluteSizeChanged, 
        [v1.Event.Activated] = v3.onChannelChipActivated
    });
end;
