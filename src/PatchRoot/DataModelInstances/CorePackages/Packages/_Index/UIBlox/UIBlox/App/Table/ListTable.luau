local l_Parent_0 = script.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Core_0.Style.withStyle);
local v6 = v4.PureComponent:extend("ListTable");
v6.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.integer), 
    size = v3.optional(v3.UDim2), 
    showDividers = v3.optional(v3.boolean), 
    anchorPoint = v3.optional(v3.Vector2), 
    position = v3.optional(v3.UDim2), 
    automaticSize = v3.optional(v3.enum(Enum.AutomaticSize)), 
    cells = v3.array(v3.table)
});
v6.defaultProps = {
    showDividers = true
};
v6.render = function(v7)
    return v5(function(v8)
        local l_size_0 = v7.props.size;
        local l_automaticSize_0 = v7.props.automaticSize;
        if not l_size_0 then
            l_size_0 = if not l_automaticSize_0 then UDim2.fromScale(1, 1) else if l_automaticSize_0 == Enum.AutomaticSize.X then UDim2.fromScale(0, 1) else if l_automaticSize_0 == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) else if l_automaticSize_0 == Enum.AutomaticSize.XY then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 1);
        end;
        local v11 = {
            ListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        local l_cells_0 = v7.props.cells;
        for v13, v14 in ipairs(l_cells_0) do
            v11["Cell " .. v13] = v4.createElement("Frame", {
                LayoutOrder = v13, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Content = v14, 
                Divider = not not (v7.props.showDividers and v13 < #l_cells_0) and v4.createElement("Frame", {
                    Size = UDim2.new(1, -24, 0, 1), 
                    Position = UDim2.new(0, 24, 1, -1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v8.Theme.Divider.Color, 
                    BackgroundTransparency = v8.Theme.Divider.Transparency, 
                    ZIndex = 100
                }) or nil
            });
        end;
        return v4.createElement("Frame", {
            LayoutOrder = v7.props.layoutOrder, 
            Size = l_size_0, 
            AutomaticSize = l_automaticSize_0, 
            AnchorPoint = v7.props.anchorPoint, 
            Position = v7.props.position, 
            BackgroundTransparency = 1
        }, v11);
    end);
end;
return v6;
