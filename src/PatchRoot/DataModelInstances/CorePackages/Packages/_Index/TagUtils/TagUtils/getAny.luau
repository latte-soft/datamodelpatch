local l_CollectionService_0 = game:GetService("CollectionService");
return function(...)
    local v1 = select("#", ...);
    assert(v1 ~= 0, "getAny should receive at least one tag");
    if v1 == 1 then
        return l_CollectionService_0:GetTagged((...));
    else
        local v2 = {};
        local v3 = {};
        for v4 = 1, v1 do
            for _, v6 in ipairs(l_CollectionService_0:GetTagged((select(v4, ...)))) do
                if not v2[v6] then
                    v2[v6] = true;
                    table.insert(v3, v6);
                end;
            end;
        end;
        return v3;
    end;
end;
