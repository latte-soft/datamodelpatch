local _ = require(script.Parent.Parent.ES7Types);
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({
        _weakMap = setmetatable({}, {
            __mode = "k"
        })
    }, v1));
end;
v1.get = function(v2, v3)
    return v2._weakMap[v3];
end;
v1.set = function(v4, v5, v6)
    v4._weakMap[v5] = v6;
    return v4;
end;
v1.has = function(v7, v8)
    return v7._weakMap[v8] ~= nil;
end;
return v1;
