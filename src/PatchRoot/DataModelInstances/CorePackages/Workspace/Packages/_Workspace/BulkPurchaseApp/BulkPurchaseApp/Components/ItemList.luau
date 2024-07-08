local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(script.Parent.Item);
return function(v4)
    local v5 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, l_useDesignTokens_0().Global.Space_150)
        })
    };
    for v6, v7 in v4.items, nil, nil do
        v5[v7.id] = v1.createElement(v3, {
            name = v7.name, 
            image = v7.image, 
            endSlot = v7.endSlot, 
            LayoutOrder = v6
        });
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v5);
end;
