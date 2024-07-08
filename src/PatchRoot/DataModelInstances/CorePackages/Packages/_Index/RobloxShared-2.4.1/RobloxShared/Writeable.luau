local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local v2 = setmetatable({}, v0);
    v2._writeFn = if v1 ~= nil and typeof(v1.write) == "function" then v1.write else print;
    v2.isTTY = false;
    return v2;
end;
v0.write = function(v3, v4)
    v3._writeFn(v4);
end;
return {
    Writeable = v0
};
