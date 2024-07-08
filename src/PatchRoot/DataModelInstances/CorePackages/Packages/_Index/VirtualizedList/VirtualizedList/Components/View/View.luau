local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = require(l_Parent_0.React);
local l_Change_0 = v4.Change;
local v6 = v4.Component:extend("View");
v6.init = function(v7, v8)
    v7.props = v8;
    v7._nativeRef = v7.props.nativeRef or v4.createRef();
end;
v6.render = function(v9)
    local v12 = l_Object_0.assign(table.clone(v9.props), if not l_Array_0.isArray(v9.props.style) then v9.props.style else l_Array_0.reduce(v9.props.style, function(v10, v11)
        return l_Object_0.assign(v10, v11);
    end, {}));
    v9.nativeProps = {
        ref = v9._nativeRef, 
        BackgroundColor3 = v12.BackgroundColor3, 
        Name = v12.Name or "View", 
        Size = v12.Size or UDim2.new(1, 0, 0, 0), 
        AutomaticSize = v12.AutomaticSize or Enum.AutomaticSize.Y, 
        ZIndex = v12.ZIndex or nil, 
        LayoutOrder = v12.LayoutOrder or nil, 
        BorderSizePixel = v12.BorderSizePixel or 0, 
        BackgroundTransparency = v12.BackgroundTransparency or 1, 
        [l_Change_0.AbsoluteSize] = v12.onLayout
    };
    return v4.createElement("Frame", v9.nativeProps, v9.props.children);
end;
return v6;
