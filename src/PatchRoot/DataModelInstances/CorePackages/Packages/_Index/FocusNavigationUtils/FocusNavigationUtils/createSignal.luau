return function(v0)
    local v1 = {};
    local v2 = {};
    local l_v0_0 = v0;
    local v4 = false;
    return {
        subscribe = function(_, v6)
            local v7 = {
                callback = v6, 
                unsubscribed = false
            };
            if not v4 or v1[v6] then
                v1[v6] = v7;
            else
                v2[v6] = v7;
            end;
            return {
                unsubscribe = function(_)
                    v7.unsubscribed = true;
                    v1[v6] = nil;
                    v2[v6] = nil;
                end
            };
        end, 
        getValue = function(_)
            return l_v0_0;
        end
    }, function(v10)
        l_v0_0 = v10;
        v4 = true;
        for v11, v12 in v1, nil, nil do
            if not (v12.unsubscribed or v2[v11]) then
                v11(v10);
            end;
        end;
        v4 = false;
        for v13, v14 in v2, nil, nil do
            v1[v13] = v14;
        end;
        table.clear(v2);
    end;
end;
