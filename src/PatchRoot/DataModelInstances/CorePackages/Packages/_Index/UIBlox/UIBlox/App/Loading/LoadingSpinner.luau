local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(l_Parent_0.Core.Animation.SpinningImage);
local v6 = v2.PureComponent:extend("LoadingSpinner");
v6.validateProps = v3.strictInterface({
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.union(v3.UDim2, v3.table)), 
    anchorPoint = v3.optional(v3.Vector2), 
    rotationRate = v3.optional(v3.number)
});
v6.render = function(v7)
    return v2.createElement(v5, {
        image = v4["icons/graphic/loadingspinner"], 
        size = v7.props.size, 
        position = v7.props.position, 
        anchorPoint = v7.props.anchorPoint, 
        rotationRate = v7.props.rotationRate
    });
end;
return v6;
