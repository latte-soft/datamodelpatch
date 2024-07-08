local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.assertEqual);
local l_insert_0 = table.insert;
return function(v4, v5)
    v2(typeof(v4), "table", "Attempted to call Dash.groupBy with argument #1 of type {left:?} not {right:?}");
    v2(v5 == nil, false, "Attempted to call Dash.groupBy with a nil getKey argument");
    local v6 = {};
    for v7, v8 in pairs(v4) do
        local v9 = nil;
        v9 = if typeof(v5) == "function" then v5(v8, v7) else v8[v5];
        if v9 ~= nil then
            if v6[v9] ~= nil then
                l_insert_0(v6[v9], v8);
            else
                v6[v9] = {
                    v8
                };
            end;
        end;
    end;
    return v6;
end;
