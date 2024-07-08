local v0 = require(script.Parent.join);
local function v1(v2, v3)
    local v4 = type(v2);
    assert(v4 == "table", "expected a table for first argument, got " .. v4);
    local v5 = type(v3);
    assert(v5 == "function", "expected a function for second argument, got " .. v5);
    local v6 = {};
    for v7, v8 in pairs(v2) do
        if type(v8) == "table" then
            v6 = v0(v1(v8, v3), v6);
        else
            local v9, v10 = v3(v8, v7);
            v6[v10 or v7] = v9;
        end;
    end;
    return v6;
end;
return v1;
