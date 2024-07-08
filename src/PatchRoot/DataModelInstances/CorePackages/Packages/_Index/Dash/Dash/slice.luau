local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local l_insert_0 = table.insert;
return function(v4, v5, v6)
    v2(typeof(v4), "table", "Attempted to call Dash.slice with argument #1 of type {left:?} not {right:?}");
    local v7 = {};
    v5 = v5 or 1;
    v6 = v6 or #v4;
    v2(typeof(v5), "number", "Attempted to call Dash.slice with argument #2 of type {left:?} not {right:?}");
    v2(typeof(v6), "number", "Attempted to call Dash.slice with argument #3 of type {left:?} not {right:?}");
    if v5 < 0 then
        v5 = #v4 + v5;
    end;
    if v6 and v6 < 0 then
        v6 = #v4 + v6;
    end;
    for v8 = v5, v6 do
        l_insert_0(v7, v4[v8]);
    end;
    return v7;
end;
