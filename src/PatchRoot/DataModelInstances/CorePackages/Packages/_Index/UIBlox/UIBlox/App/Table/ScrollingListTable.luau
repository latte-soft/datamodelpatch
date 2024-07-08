local l_Parent_0 = script.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_VirtualizedList_0 = require(l_Parent_1.VirtualizedList).VirtualizedList;
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Core_0.Style.withStyle);
local v7 = {
    selectable = true, 
    size = UDim2.fromScale(1, 1)
};
return function(v8)
    return v6(function(v9)
        local v10 = v5.Dictionary.join(v7, v8);
        local v11 = {};
        local l_cells_0 = v10.cells;
        for v13, v14 in ipairs(l_cells_0) do
            local v15 = "Cell " .. v13;
            v11[v15] = v3.createElement("Frame", {
                LayoutOrder = v13, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Name = v15
            }, {
                Content = v14, 
                Divider = v13 < #l_cells_0 and v3.createElement("Frame", {
                    Size = UDim2.new(1, -24, 0, 1), 
                    Position = UDim2.new(0, 24, 1, -1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v9.Theme.Divider.Color, 
                    BackgroundTransparency = v9.Theme.Divider.Transparency, 
                    ZIndex = 100
                }) or nil
            });
        end;
        return v3.createElement(l_VirtualizedList_0, {
            Size = v10.size, 
            data = v11, 
            renderItem = function(v16)
                return v16.item;
            end, 
            getItemCount = function(_)
                return #l_cells_0;
            end, 
            getItem = function(v18, v19)
                return v18["Cell " .. tostring(v19)];
            end, 
            keyExtractor = function(_, v21)
                return "Cell " .. tostring(v21);
            end, 
            style = {
                AnchorPoint = v10.anchorPoint, 
                Position = v10.position, 
                BackgroundTransparency = 1, 
                LayoutOrder = v10.layoutOrder, 
                Name = v10.Name or "ListTable", 
                ScrollBarThickness = 0, 
                Selectable = v10.selectable
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }
        });
    end);
end;
