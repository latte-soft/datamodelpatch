local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.React);
local l_Change_0 = v4.Change;
local v6 = v4.Component:extend("ScrollContentViewNativeComponent");
v6.init = function(v7, v8)
    v7.props = v8;
end;
v6.render = function(v9)
    return v4.createElement("Frame", l_Object_0.assign({
        Name = "RCTScrollContentView", 
        [l_Change_0.AbsoluteSize] = v9.props.onLayout, 
        Size = UDim2.new(1, 0, 1, 0)
    }, if not v9.props.AutomaticSize then nil else {
        AutomaticSize = v9.props.AutomaticSize
    }, if not l_Array_0.isArray(v9.props.style) then v9.props.style else l_Array_0.reduce(v9.props.style, function(v10, v11)
        return l_Object_0.assign(v10, v11);
    end, {})), v9.props.children);
end;
return v6;
