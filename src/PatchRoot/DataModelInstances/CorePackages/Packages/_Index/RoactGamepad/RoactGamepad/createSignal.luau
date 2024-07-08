local function _(v0, v1, v2)
    local v3 = {};
    for v4, v5 in pairs(v0) do
        v3[v4] = v5;
    end;
    v3[v1] = v2;
    return v3;
end;
local function _(v7, v8)
    local v9 = {};
    for v10, v11 in pairs(v7) do
        if v10 ~= v8 then
            v9[v10] = v11;
        end;
    end;
    return v9;
end;
return function()
    local v13 = {};
    return {
        subscribe = function(_, v15)
            assert(typeof(v15) == "function", "Can only subscribe to signals with a function.");
            local v16 = {
                callback = v15, 
                disconnected = false
            };
            local l_v13_0 = v13;
            local v18 = {};
            for v19, v20 in pairs(l_v13_0) do
                v18[v19] = v20;
            end;
            v18[v15] = v16;
            v13 = v18;
            return function()
                assert(not v16.disconnected, "Listeners can only be disconnected once.");
                v16.disconnected = true;
                local l_v13_1 = v13;
                local l_v15_0 = v15;
                local v23 = {};
                for v24, v25 in pairs(l_v13_1) do
                    if v24 ~= l_v15_0 then
                        v23[v24] = v25;
                    end;
                end;
                v13 = v23;
            end;
        end, 
        fire = function(_, ...)
            for v27, v28 in pairs(v13) do
                if not v28.disconnected then
                    v27(...);
                end;
            end;
        end
    };
end;
