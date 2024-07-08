local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local v2 = v1.PureComponent:extend("MoreGrid");
v2.defaultProps = {
    layoutOrder = 1, 
    size = UDim2.fromScale(1, 1)
};
v2.validateProps = v0.strictInterface({
    gridCellPadding = v0.integer, 
    gridCellSize = v0.integer, 
    items = v0.table, 
    layoutOrder = v0.optional(v0.integer), 
    renderItem = v0.callback, 
    size = v0.optional(v0.UDim2)
});
v2.render = function(v3)
    local l_gridCellPadding_0 = v3.props.gridCellPadding;
    local l_gridCellSize_0 = v3.props.gridCellSize;
    local l_items_0 = v3.props.items;
    local l_layoutOrder_0 = v3.props.layoutOrder;
    local l_renderItem_0 = v3.props.renderItem;
    local l_size_0 = v3.props.size;
    local v10 = UDim2.fromOffset(l_gridCellPadding_0, l_gridCellPadding_0);
    local v11 = UDim2.fromOffset(l_gridCellSize_0, l_gridCellSize_0);
    local v12 = {};
    for v13, v14 in ipairs(l_items_0) do
        v12[v13] = l_renderItem_0(v14, v13);
    end;
    v12.GridLayout = v1.createElement("UIGridLayout", {
        CellPadding = v10, 
        CellSize = v11, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_0
    }, v12);
end;
return v2;
