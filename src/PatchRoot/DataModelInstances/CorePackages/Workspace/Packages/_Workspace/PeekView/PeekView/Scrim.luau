local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_GetFFlagPeekViewScrimColorOff_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewScrimColorOff;
return (v1.forwardRef(function(v4, v5)
    local v6 = l_useDesignTokens_0();
    return v1.createElement("TextButton", {
        ref = v5, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v6.Semantic.Color.Common.Overlay.Transparency, 
        BackgroundColor3 = v6.Semantic.Color.Common.Overlay.Color3, 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = not l_GetFFlagPeekViewScrimColorOff_0() and true or false, 
        [v1.Event.Activated] = v4.onActivated, 
        [v1.Change.AbsoluteSize] = v4.onSizeChanged
    }, v4.children);
end));
