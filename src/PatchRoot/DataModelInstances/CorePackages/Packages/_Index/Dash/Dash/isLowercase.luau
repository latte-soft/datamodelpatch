local v0 = require(script.Parent.assertEqual);
return function(v1)
    v0(typeof(v1), "string", "Attempted to call Dash.isLowercase with argument #1 of type {left:?} not {right:?}");
    v0(#v1 > 0, true, "Attempted to call Dash.isLowercase with an empty string");
    local v2 = v1:sub(1, 1);
    return v2 == v2:lower();
end;
