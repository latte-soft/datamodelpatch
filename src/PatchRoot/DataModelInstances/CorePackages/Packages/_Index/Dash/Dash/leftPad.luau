local v0 = require(script.Parent.assertEqual);
return function(v1, v2, v3)
    v0(typeof(v1), "string", "Attempted to call Dash.leftPad with argument #1 of type {left:?} not {right:?}");
    v0(typeof(v2), "number", "Attempted to call Dash.leftPad with argument #2 of type {left:?} not {right:?}");
    local v4 = v3 or " ";
    v0(typeof(v4), "string", "Attempted to call Dash.leftPad with argument #3 of type {left:?} not {right:?}");
    local v5 = v2 - v1:len();
    local v6 = v5 % v4:len();
    return string.rep(v4 or " ", (v5 - v6) / v4:len()) .. v4:sub(1, v6) .. v1;
end;
