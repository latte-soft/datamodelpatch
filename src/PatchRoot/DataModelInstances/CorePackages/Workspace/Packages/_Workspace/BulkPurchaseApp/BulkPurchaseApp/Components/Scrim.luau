local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return (v1.forwardRef(function(v3, v4)
    local v5 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        ref = v4, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v5.Semantic.Color.Common.Overlay.Transparency, 
        BackgroundColor3 = v5.Semantic.Color.Common.Overlay.Color3, 
        ClipsDescendants = false, 
        Active = true
    }, v3.children);
end));
