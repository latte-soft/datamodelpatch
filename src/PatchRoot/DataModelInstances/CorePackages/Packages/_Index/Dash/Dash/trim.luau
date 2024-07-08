local v0 = require(script.Parent.assertEqual);
return function(v1)
    v0(typeof(v1), "string", "Attempted to call Dash.trim with argument #1 of type {left:?} not {right:?}");
    return v1:match("^%s*(.-)%s*$");
end;
