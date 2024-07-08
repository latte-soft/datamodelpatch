return function(v0, v1, v2, v3, v4)
    local v5 = {};
    if v3 ~= nil then
        table.insert(v5, v0 .. v3 .. v1 .. v2);
    else
        table.insert(v5, v0 .. v1 .. v2);
    end;
    if v4 ~= nil then
        local v6 = tostring(v4);
        if v3 ~= nil then
            table.insert(v5, v0 .. v3 .. v1 .. v6 .. v2);
            return v5;
        else
            table.insert(v5, v0 .. v1 .. v6 .. v2);
        end;
    end;
    return v5;
end;
