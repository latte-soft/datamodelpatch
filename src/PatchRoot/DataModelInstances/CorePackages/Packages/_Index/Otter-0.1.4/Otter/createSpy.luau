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
        assert(v1.valuesLength, v3, "length of expected values differs from stored values");
        for v4 = 1, v3 do
            assert(v1.values[v4], select(v4, ...), "value differs");
        end;
    end;
    setmetatable(v1, {
        __index = function(_, v6)
            error(("%q is not a valid member of spy"):format(v6));
        end
    });
    return v1;
end;
