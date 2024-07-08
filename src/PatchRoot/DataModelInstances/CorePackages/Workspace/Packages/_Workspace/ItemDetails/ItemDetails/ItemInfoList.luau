local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.ItemInfoRow);
local v3 = require(l_CorePackages_0.Cryo);
return function(v4)
    local v5 = {
        layout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    for v6, v7 in v4.rowData, nil, nil do
        table.insert(v5, v1.createElement(v2, (v3.Dictionary.join(v7, {
            LayoutOrder = v6, 
            hideDivider = next(v4.rowData, v6) == nil
        }))));
    end;
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v4.LayoutOrder
    }, v5);
end;
