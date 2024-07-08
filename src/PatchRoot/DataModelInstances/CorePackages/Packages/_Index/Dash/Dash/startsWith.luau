local v0 = require(script.Parent.assertEqual);
return function(v1, v2)
    v0(typeof(v1), "string", "Attempted to call Dash.startsWith with argument #1 of type {left:?} not {right:?}");
    v0(typeof(v2), "string", "Attempted to call Dash.startsWith with argument #2 of type {left:?} not {right:?}");
    return v1:sub(1, v2:len()) == v2;
end;
