local v0 = {};
v0.__index = v0;
v0.__tostring = function(v1)
    return getmetatable(v0).__tostring(v1);
end;
v0.new = function(v2)
    return (setmetatable({
        name = "Error", 
        message = v2 or "", 
        stack = debug.traceback(nil, 2)
    }, v0));
end;
return (setmetatable(v0, {
    __call = function(_, ...)
        local v4 = v0.new(...);
        v4.stack = debug.traceback(nil, 2);
        return v4;
    end, 
    __tostring = function(v5)
        if v5.name ~= nil then
            if v5.message and v5.message ~= "" then
                return string.format("%s: %s", tostring(v5.name), (tostring(v5.message)));
            else
                return (tostring(v5.name));
            end;
        else
            return (tostring("Error"));
        end;
    end
}));
