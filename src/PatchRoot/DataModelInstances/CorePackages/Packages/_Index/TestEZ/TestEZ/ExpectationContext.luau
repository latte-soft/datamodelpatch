local v0 = require(script.Parent.Expectation);
local l_checkMatcherNameCollisions_0 = v0.checkMatcherNameCollisions;
local function _(v2)
    local v3 = {};
    for v4, v5 in pairs(v2) do
        v3[v4] = v5;
    end;
    return v3;
end;
local v7 = {};
v7.__index = v7;
v7.new = function(v8)
    local v9 = {};
    local v10;
    if v8 then
        local l__extensions_0 = v8._extensions;
        local v12 = {};
        for v13, v14 in pairs(l__extensions_0) do
            v12[v13] = v14;
        end;
        v10 = v12;
        if v10 then
            goto label0;
        end;
    end;
    v10 = {};
    ::label0::;
    v9._extensions = v10;
    return (setmetatable(v9, v7));
end;
v7.startExpectationChain = function(v15, ...)
    return v0.new(...):extend(v15._extensions);
end;
v7.extend = function(v16, v17)
    for v18, v19 in pairs(v17) do
        assert(v16._extensions[v18] == nil, string.format("Cannot reassign %q in expect.extend", v18));
        assert(l_checkMatcherNameCollisions_0(v18), string.format("Cannot overwrite matcher %q; it already exists", v18));
        v16._extensions[v18] = v19;
    end;
end;
return v7;
