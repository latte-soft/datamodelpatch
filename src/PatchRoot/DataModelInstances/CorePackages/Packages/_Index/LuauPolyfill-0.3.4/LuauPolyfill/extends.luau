return function(v0, v1, v2)
    local v3 = {};
    v3.__index = v3;
    v3.__tostring = function(v4)
        return getmetatable(v0).__tostring(v4);
    end;
    local v5 = {};
    v3.new = function(...)
        local v6 = {};
        v2(v6, ...);
        return (setmetatable(v6, v3));
    end;
    if not (not (typeof((getmetatable(v0))) == "table") or not getmetatable(v0).__call) then
        v5.__call = function(_, ...)
            return v3.new(...);
        end;
    end;
    v5.__index = v0;
    v5.__tostring = function(v8)
        if v8 == v3 then
            return (tostring(v1));
        else
            return getmetatable(v0).__tostring(v8);
        end;
    end;
    setmetatable(v3, v5);
    return v3;
end;
