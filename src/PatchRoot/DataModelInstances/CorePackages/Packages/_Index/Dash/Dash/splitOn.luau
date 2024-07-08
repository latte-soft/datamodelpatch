local v0 = require(script.Parent.assertEqual);
local l_insert_0 = table.insert;
return function(v2, v3)
    v0(typeof(v2), "string", "Attempted to call Dash.splitOn with argument #1 of type {left:?} not {right:?}");
    v0(typeof(v3), "string", "Attempted to call Dash.splitOn with argument #2 of type {left:?} not {right:?}");
    local v4 = {};
    local v5 = {};
    local v6 = 1;
    if v3 then
        local v7, v8 = v2:find(v3, v6);
        while v7 do
            l_insert_0(v5, v2:sub(v7, v8));
            l_insert_0(v4, v2:sub(v6, v7 - 1));
            v6 = v8 + 1;
            local v9, v10 = v2:find(v3, v6);
            v7 = v9;
            v8 = v10;
        end;
        l_insert_0(v4, v2:sub(v6));
        return v4, v5;
    else
        for v11 = 1, #v2 do
            l_insert_0(v4, v2:sub(v11, v11));
        end;
        return v4;
    end;
end;
