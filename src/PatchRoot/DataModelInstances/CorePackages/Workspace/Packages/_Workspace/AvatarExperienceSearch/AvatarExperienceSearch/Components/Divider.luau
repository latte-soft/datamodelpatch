local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSearch").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v3)
    local v4 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = v4.Semantic.Color.Common.Divider.Color3, 
        BackgroundTransparency = v4.Semantic.Color.Common.Divider.Transparency, 
        LayoutOrder = v3.layoutOrder, 
        [v1.Tag] = "data-testid=AvatarExperienceSearch_Divider"
    });
end;
