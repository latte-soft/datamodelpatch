local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.App.Loading.LoadingSpinner);
local v3 = v1.PureComponent:extend("LoadingStatePage");
v3.render = function(_)
    return v1.createElement(v2, {
        size = UDim2.fromOffset(42, 42), 
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
end;
return v3;
