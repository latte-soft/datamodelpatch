return function(v0)
    local v1 = {};
    local function _(v2, v3)
        local v4 = v1[v2];
        local v5 = if not v4 then nil else v4[v0];
        if v5 then
            table.remove(v5, (table.find(v5, v3)));
            return ;
        else
            return ;
        end;
    end;
    return {
        addListener = function(v7, v8)
            v1[v7] = v1[v7] or {};
            v1[v7][v0] = v1[v7][v0] or {};
            table.insert(v1[v7][v0], v8);
            return {
                remove = function()
                    local l_v7_0 = v7;
                    local l_v8_0 = v8;
                    local v11 = v1[l_v7_0];
                    local v12 = if not v11 then nil else v11[v0];
                    if v12 then
                        table.remove(v12, (table.find(v12, l_v8_0)));
                        return ;
                    else
                        return ;
                    end;
                end
            };
        end, 
        emit = function(v13, v14)
            local v15 = v1[v13] or {};
            local v16 = if not v15[v0] then nil else table.clone(v15[v0]);
            if v16 then
                for _, v18 in v16, nil, nil do
                    v18(v14);
                end;
            end;
        end
    };
end;
