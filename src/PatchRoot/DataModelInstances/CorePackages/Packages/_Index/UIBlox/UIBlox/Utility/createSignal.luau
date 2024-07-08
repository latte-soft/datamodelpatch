return function()
    local v0 = {};
    local v1 = {};
    local v2 = false;
    return {
        subscribe = function(_, v4)
            assert(typeof(v4) == "function", "Can only subscribe to signals with a function.");
            local v5 = {
                callback = v4, 
                disconnected = false
            };
            if not (not v2 or v0[v4]) then
                v1[v4] = v5;
            end;
            v0[v4] = v5;
            return function()
                assert(not v5.disconnected, "Listeners can only be disconnected once.");
                v5.disconnected = true;
                v0[v4] = nil;
                v1[v4] = nil;
            end;
        end, 
        fire = function(_, ...)
            v2 = true;
            for v7, v8 in pairs(v0) do
                if not (v8.disconnected or v1[v7]) then
                    v7(...);
                end;
            end;
            v2 = false;
            for v9, _ in pairs(v1) do
                v1[v9] = nil;
            end;
        end
    };
end;
