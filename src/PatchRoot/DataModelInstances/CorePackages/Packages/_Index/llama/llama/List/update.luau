local v0 = require(script.Parent.copy);
local function v2(v1)
    return v1;
end;
local function v4(v3, ...)
    if type(v3) == "function" then
        return v3(...);
    else
        return ;
    end;
end;
return function(v5, v6, v7, v8)
    local v9 = type(v5);
    assert(v9 == "table", "expected a table for first argument, got " .. v9);
    local v10 = type(v6);
    local v11 = false;
    if v10 == "number" then
        v11 = v6 % 1 == 0;
    end;
    assert(v11, "expected an integer for second argument, got " .. v10);
    local v12 = v0(v5);
    v11 = nil;
    v7 = v7 or v2;
    if v12[v6] ~= nil then
        v11 = v7(v12[v6], v6);
        v4(v8, true, v11, v6);
    else
        v11 = v4(v8, false, v6);
    end;
    v12[v6] = v11;
    return v12;
end;
