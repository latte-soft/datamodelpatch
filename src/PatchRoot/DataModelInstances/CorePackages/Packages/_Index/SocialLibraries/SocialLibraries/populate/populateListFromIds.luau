local function v0(v1, v2)
    local v3 = {};
    for _, v5 in ipairs(v1) do
        if type(v5) == "table" then
            table.insert(v3, v0(v5, v2));
        else
            table.insert(v3, v2[v5]);
        end;
    end;
    return v3;
end;
return v0;
