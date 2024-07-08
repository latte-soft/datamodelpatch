return function(v0)
    local v1 = {
        callCount = 0, 
        values = {}, 
        valuesLength = 0
    };
    v1.value = function(...)
        v1.callCount = v1.callCount + 1;
        v1.values = {
            ...
        };
        v1.valuesLength = select("#", ...);
        if v0 ~= nil then
            return v0(...);
        else
            return ;
        end;
    end;
    v1.assertCalledWith = function(_, ...)
        local v3 = select("#", ...);
        if v1.valuesLength ~= v3 then
            error(("Expected %d arguments, but was called with %d arguments"):format(v1.valuesLength, v3), 2);
        end;
        for v4 = 1, v3 do
            local v5 = select(v4, ...);
            assert(v1.values[v4] == v5, "value differs; got " .. tostring(v1.values[v4]) .. ", expected " .. tostring(v5));
        end;
    end;
    v1.captureValues = function(_, ...)
        local v7 = select("#", ...);
        local v8 = {};
        assert(v1.valuesLength == v7, "length of expected values differs from stored values");
        for v9 = 1, v7 do
            v8[select(v9, ...)] = v1.values[v9];
        end;
        return v8;
    end;
    setmetatable(v1, {
        __index = function(_, v11)
            error(("%q is not a valid member of spy"):format(v11));
        end
    });
    return v1;
end;
