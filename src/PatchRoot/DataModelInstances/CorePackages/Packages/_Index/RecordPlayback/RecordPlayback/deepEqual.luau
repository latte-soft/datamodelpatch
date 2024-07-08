local function v0(v1, v2)
    for v3, v4 in pairs(v1) do
        local v5 = typeof(v4);
        local v6 = v2[v3];
        if v5 ~= typeof(v6) then
            return false;
        elseif v4 ~= v6 then
            if v5 == "table" then
                return v0(v4, v6);
            else
                return false;
            end;
        end;
    end;
    for v7 in pairs(v2) do
        if v1[v7] == nil then
            return false;
        end;
    end;
    return true;
end;
return v0;
