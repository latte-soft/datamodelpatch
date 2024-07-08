local v0 = require(script:FindFirstAncestor("ProfilePlatform").Parent.React);
return function(_, v2)
    local v3 = v2 or {};
    local v4 = {
        Layout = v0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 4)
        })
    };
    for v5, v6 in ipairs(v3) do
        local v7 = 33 * (v5 + 1);
        v4[v6] = v0.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 100), 
            BackgroundColor3 = Color3.fromRGB(v7, v7, 2 * v7), 
            Text = v6, 
            LayoutOrder = v5
        });
    end;
    return v4;
end;
