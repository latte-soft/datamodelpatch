local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.FitFrameOnAxis);
local v4 = require(script.Parent.isRoact17);
return v2.forwardRef(function(v5, v6)
    v5 = v5 or {};
    return v2.createElement(v3, (v1.Dictionary.join(v5, {
        axis = v3.Axis.Vertical, 
        minimumSize = UDim2.new(v5.width, UDim.new(0, 0)), 
        [if not v4() then v2.Ref else "forwardedRef"] = v6, 
        width = v1.None
    })));
end);
