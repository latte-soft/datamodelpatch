local function v0(v1, v2)
    local v3 = {};
    for v4, v5 in pairs(v1) do
        if type(v5) == "table" then
            v3[v4] = v0(v5, v2);
        else
            v3[v4] = v2[v5];
        end;
    end;
    return v3;
end;
return v0;
