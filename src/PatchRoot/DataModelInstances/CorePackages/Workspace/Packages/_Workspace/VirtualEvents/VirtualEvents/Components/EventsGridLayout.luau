local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = {
    itemPadding = UDim.new(0, 12), 
    numItemsShown = math.huge
};
return function(v4)
    local v5 = v1.Dictionary.join(v3, v4);
    local v8 = v2.useMemo(function()
        local v6 = {};
        for v7 = 1, v5.numItemsShown do
            v6[v7] = v2.createElement("Frame", {
                LayoutOrder = v7, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Content = v5.items[v7]
            });
        end;
        return v6;
    end, {
        v5.items, 
        v5.numItemsShown
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = v5.itemPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        Rows = v2.createElement(v2.Fragment, nil, (v2.useMemo(function()
            local v9 = {};
            for v10 = 1, #v8, 2 do
                local v11 = v8[v10];
                local v12 = v8[v10 + 1];
                v9["Row" .. math.ceil(v10 / 2)] = v2.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v10
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        Padding = v5.itemPadding, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    CellFrame1 = v2.createElement("Frame", {
                        Size = UDim2.new(0.5, -v5.itemPadding.Offset / 2, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        Item = v2.createElement(v2.Fragment, nil, v11)
                    }), 
                    CellFrame2 = v12 and v2.createElement("Frame", {
                        Size = UDim2.new(0.5, -v5.itemPadding.Offset / 2, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        Item = v2.createElement(v2.Fragment, nil, v12)
                    })
                });
            end;
            return v9;
        end, {
            v5.items, 
            v8
        })))
    });
end;
