local v0 = require(script.Parent.copy);
local function v3(v1, v2)
    return v1, v2;
end;
local function v5(v4, ...)
    if type(v4) == "function" then
        return v4(...);
    else
        return ;
    end;
end;
return function(v6, v7, v8, v9)
    local v10 = type(v6);
    assert(v10 == "table", "expected a table for first argument, got " .. v10);
    assert(v7 ~= nil, "expected second argument to be anything but nil, got nil");
    local v11 = v0(v6);
    local v12 = nil;
    local v13 = nil;
    v8 = v8 or v3;
    if v11[v7] ~= nil then
        local v14, v15 = v8(v11[v7], v7);
        v12 = v14;
        v13 = v15;
        v5(v9, true, v12, v13 or v7);
    else
        local v16, v17 = v5(v9, false, v7);
        v12 = v16;
        v13 = v17;
    end;
    v11[v13 or v7] = v12;
    return v11;
end;
