local v0 = {};
local v2 = {
    __index = v0, 
    __tostring = function(v1)
        return v1:toString();
    end
};
v0.new = function(v3, v4)
    return (setmetatable({
        message = v3, 
        stack = debug.traceback(nil, 2 + (v4 == nil and 0 or v4))
    }, v2));
end;
v0.toString = function(v5)
    return v5.message;
end;
return v0;
