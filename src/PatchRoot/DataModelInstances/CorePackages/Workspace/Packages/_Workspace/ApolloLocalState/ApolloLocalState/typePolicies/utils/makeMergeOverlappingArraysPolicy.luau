return function(v0)
    return function(_, v2, v3, v4)
        v2 = v2 or {};
        v3 = v3 or {};
        if #v3 == 0 then
            return v2;
        elseif #v2 == 0 then
            return v3;
        else
            local v5 = {};
            local v6 = table.clone(v2);
            for v7, v8 in v6, nil, nil do
                local v9 = v4:readField(v0, v8);
                if v9 then
                    v5[v9] = v7;
                end;
            end;
            for _, v11 in v3, nil, nil do
                local v12 = v4:readField(v0, v11);
                if not v12 or not v5[v12] then
                    table.insert(v6, v11);
                else
                    local v13 = v5[v12];
                    v6[v13] = v4:mergeObjects(v6[v13], v11);
                end;
            end;
            return v6;
        end;
    end;
end;
