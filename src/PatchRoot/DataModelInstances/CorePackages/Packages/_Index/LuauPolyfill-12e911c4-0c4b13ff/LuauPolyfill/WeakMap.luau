local v0 = {};
v0.__index = v0;
v0.new = function()
    return (setmetatable({
        _weakMap = setmetatable({}, {
            __mode = "k"
        })
    }, v0));
end;
v0.get = function(v1, v2)
    return v1._weakMap[v2];
end;
v0.set = function(v3, v4, v5)
    v3._weakMap[v4] = v5;
    return v3;
end;
v0.has = function(v6, v7)
    return v6._weakMap[v7] ~= nil;
end;
return v0;
