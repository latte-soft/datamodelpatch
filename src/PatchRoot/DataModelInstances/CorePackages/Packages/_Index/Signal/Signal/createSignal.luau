local _ = require(script.Parent.types);
return function()
    local v1 = {};
    local v2 = {};
    local v3 = false;
    return {
        subscribe = function(_, v5)
            local v6 = {
                callback = v5, 
                unsubscribed = false
            };
            if not v3 or v1[v5] then
                v1[v5] = v6;
            else
                v2[v5] = v6;
            end;
            return {
                unsubscribe = function(_)
                    v6.unsubscribed = true;
                    v1[v5] = nil;
                    v2[v5] = nil;
                end
            };
        end
    }, function(v8)
        v3 = true;
        for v9, v10 in v1, nil, nil do
            if not (v10.unsubscribed or v2[v9]) then
                v9(v8);
            end;
        end;
        v3 = false;
        for v11, v12 in v2, nil, nil do
            v1[v11] = v12;
        end;
        table.clear(v2);
    end;
end;
