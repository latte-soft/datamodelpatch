local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assign);
local v3 = require(l_Parent_0.assertEqual);
return function(v4)
    v3(typeof(v4), "table", "Attempted to call Dash.copy with argument #1 of type {left:?} not {right:?}");
    return v2({}, v4);
end;
