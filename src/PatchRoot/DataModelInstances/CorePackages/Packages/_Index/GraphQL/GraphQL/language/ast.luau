local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
local _ = require(script.Parent.source);
local _ = require(script.Parent.tokenKind);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6)
    return (setmetatable({
        start = v4.start, 
        _end = v5._end, 
        startToken = v4, 
        endToken = v5, 
        source = v6
    }, v3));
end;
v3.toJSON = function(v7)
    return {
        start = v7.start, 
        _end = v7._end
    };
end;
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10, v11, v12, v13, v14, v15)
    return (setmetatable({
        kind = v9, 
        start = v10, 
        _end = v11, 
        line = v12, 
        column = v13, 
        value = v15, 
        prev = v14, 
        next = nil
    }, v8));
end;
v8.toJSON = function(v16)
    return {
        kind = v16.kind, 
        value = v16.value, 
        line = v16.line, 
        column = v16.column
    };
end;
return {
    Location = v3, 
    Token = v8, 
    isNode = function(v17)
        local v18 = false;
        if typeof(v17) == "table" then
            v18 = typeof(v17.kind) == "string";
        end;
        return v18;
    end
};
