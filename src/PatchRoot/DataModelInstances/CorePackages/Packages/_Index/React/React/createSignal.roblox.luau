return function()
    local v0 = {};
    local v1 = {};
    local v2 = false;
    return function(v3)
        assert(typeof(v3) == "function", "Can only subscribe to signals with a function.");
        local v4 = {
            callback = v3, 
            disconnected = false
        };
        if not (not v2 or v0[v3]) then
            v1[v3] = v4;
        end;
        v0[v3] = v4;
        return function()
            assert(not v4.disconnected, "Listeners can only be disconnected once.");
            v4.disconnected = true;
            v0[v3] = nil;
            v1[v3] = nil;
        end;
    end, function(...)
        v2 = true;
        for v5, v6 in v0, nil, nil do
            if not (v6.disconnected or v1[v5]) then
                v5(...);
            end;
        end;
        v2 = false;
        table.clear(v1);
    end;
end;
