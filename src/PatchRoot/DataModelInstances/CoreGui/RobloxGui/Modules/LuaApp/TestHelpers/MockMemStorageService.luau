local v0 = {
    storage = {}, 
    bindings = {}
};
v0.__index = v0;
v0.new = function()
    return (setmetatable({}, v0));
end;
v0.SetItem = function(v1, v2, v3)
    v1.storage[v2] = v3;
end;
v0.bind = function(v4, v5, v6)
    v4.bindings[v5] = v6;
end;
return v0;
