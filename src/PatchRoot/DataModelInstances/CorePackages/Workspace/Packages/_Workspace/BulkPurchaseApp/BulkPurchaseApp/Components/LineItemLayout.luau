local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v3)
    local v4 = l_useDesignTokens_0();
    local v5, v6 = v1.useBinding(Vector2.new(0, 0));
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v3.LayoutOrder
    }, {
        Start = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v5:map(function(v7)
                return UDim2.new(1, -(v7.X + v4.Global.Space_200), 1, 0);
            end)
        }, v3.startSlot), 
        End = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            [v1.Change.AbsoluteSize] = function(v8)
                v6(v8.AbsoluteSize);
            end
        }, v3.endSlot)
    });
end;
