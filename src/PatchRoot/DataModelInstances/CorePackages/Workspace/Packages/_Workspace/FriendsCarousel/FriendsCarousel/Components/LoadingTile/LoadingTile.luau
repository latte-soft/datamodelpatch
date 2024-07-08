local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_ShimmerPanel_0 = v0.UIBlox.App.Loading.ShimmerPanel;
local v4 = l_Roact_0.PureComponent:extend("LoadingTile");
v4.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.number, 
    tileSize = l_t_0.number, 
    tileInfoHeight = l_t_0.number
});
v4.defaultProps = {
    layoutOrder = 0, 
    tileSize = 100, 
    tileInfoHeight = 70
};
v4.render = function(v5)
    local l_props_0 = v5.props;
    return l_Roact_0.createFragment({
        LoadingTile = l_Roact_0.createElement("Frame", {
            LayoutOrder = l_props_0.layoutOrder, 
            Size = UDim2.fromOffset(l_props_0.tileSize, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            PlayerTile = l_Roact_0.createElement(l_ShimmerPanel_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(l_props_0.tileSize, l_props_0.tileSize), 
                cornerRadius = UDim.new(0, l_props_0.tileSize)
            })
        })
    });
end;
return v4;
