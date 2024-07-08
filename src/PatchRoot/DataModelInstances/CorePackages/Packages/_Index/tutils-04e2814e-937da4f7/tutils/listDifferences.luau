local v0 = require(script.Parent.tableDifference);
local function _(v1)
    local v2 = {};
    for v3 = 1, #v1 do
        v2[v1[v3]] = true;
    end;
    return v2;
end;
local _ = function(v5)
    local v6 = {};
    for v7, _ in pairs(v5) do
        table.insert(v6, v7);
    end;
    return v6;
end;
return function(v10, v11)
    local l_v0_0 = v0;
    local v13 = {};
    for v14 = 1, #v10 do
        v13[v10[v14]] = true;
    end;
    local l_v13_0 = v13;
    local v16 = {};
    for v17 = 1, #v11 do
        v16[v11[v17]] = true;
    end;
    l_v0_0 = l_v0_0(l_v13_0, v16);
    l_v13_0 = {};
    for v18, _ in pairs(l_v0_0) do
        table.insert(l_v13_0, v18);
    end;
    return l_v13_0;
end;
