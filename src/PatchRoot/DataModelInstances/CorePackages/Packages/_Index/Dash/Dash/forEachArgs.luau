local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
return function(v3, ...)
    v2(typeof(v3), "function", "Attempted to call Dash.forEachArgs with argument #1 of type {left:?} not {right:?}");
    for v4 = 1, select("#", ...) do
        v3(select(v4, ...), v4);
    end;
end;
