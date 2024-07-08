local v0 = require(script.Parent.symbols);
local v1 = {};
v1.__index = v1;
local v2 = {};
setmetatable(v2, {
    __mode = "kv"
});
v1.new = function(v3)
    local v4 = {
        [v0.Calls] = {}
    };
    setmetatable(v4, v1);
    local function v6(...)
        local v5 = {
            args = table.pack(...), 
            result = table.pack(v3(...))
        };
        table.insert(v4[v0.Calls], v5);
        return table.unpack(v5.result);
    end;
    v4.inner = v6;
    v2[v6] = v4;
    return v4, v6;
end;
v1.lookup = function(v7)
    return v2[v7];
end;
return v1;
