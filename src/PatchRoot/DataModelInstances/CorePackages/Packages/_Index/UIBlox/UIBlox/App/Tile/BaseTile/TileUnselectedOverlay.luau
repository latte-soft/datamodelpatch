local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v6 = v2.PureComponent:extend("TileUnselectedOverlay");
local v7 = v4["squircles/hollow"];
v6.validateProps = v3.strictInterface({
    ZIndex = v3.optional(v3.integer)
});
v6.render = function(v8)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = v8.props.ZIndex
    }, {
        SelectionImage = v2.createElement(v5.Label, {
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            Image = v7, 
            Position = UDim2.new(1, -12, 0, 12), 
            Size = UDim2.fromOffset(24, 24)
        })
    });
end;
return v6;
