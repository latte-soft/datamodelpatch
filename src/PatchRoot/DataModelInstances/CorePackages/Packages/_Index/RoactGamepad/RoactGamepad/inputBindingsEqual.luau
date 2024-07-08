return function(v0, v1)
    if v0 == v1 then
        return true;
    else
        for v2, v3 in pairs(v0) do
            local v4 = v1[v2];
            if v4 == nil then
                return false;
            elseif not (v3.kind == v4.kind and v3.keyCode == v4.keyCode) or v3.action ~= v4.action then
                return false;
            else
                local l_meta_0 = v3.meta;
                local l_meta_1 = v4.meta;
                if l_meta_0 ~= l_meta_1 then
                    if typeof(l_meta_0) == "table" and typeof(l_meta_1) == "table" then
                        for v7, v8 in pairs(l_meta_0) do
                            if v8 ~= l_meta_1[v7] then
                                return false;
                            end;
                        end;
                        for v9 in pairs(l_meta_1) do
                            if l_meta_0[v9] == nil then
                                return false;
                            end;
                        end;
                    else
                        return false;
                    end;
                end;
            end;
        end;
        for v10 in pairs(v1) do
            if v0[v10] == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
