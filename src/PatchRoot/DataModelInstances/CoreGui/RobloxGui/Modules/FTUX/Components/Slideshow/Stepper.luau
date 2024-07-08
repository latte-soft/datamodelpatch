local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
return function(v3)
    local l_numberOfSteps_0 = v3.numberOfSteps;
    local l_layoutOrder_0 = v3.layoutOrder;
    local l_numberActivated_0 = v3.numberActivated;
    local v7 = {};
    for v8 = 1, l_numberOfSteps_0 do
        v7[v8] = v8;
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.9, 0, 0.12, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = l_layoutOrder_0
    }, v1.createElement("UIListLayout", {
        Padding = UDim.new(0, 10), 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    }), (v2.Array.map(v7, function(_, v10)
        return v1.createElement("Frame", {
            LayoutOrder = v10, 
            BackgroundTransparency = v10 <= l_numberActivated_0 and 0 or 0.7, 
            Size = UDim2.new(1 / l_numberOfSteps_0, 0, 0.5, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        });
    end)));
end;
