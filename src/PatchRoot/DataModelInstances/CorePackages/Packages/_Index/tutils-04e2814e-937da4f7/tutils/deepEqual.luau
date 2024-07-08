local function v0(v1, v2, v3)
    if v1 == v2 then
        return true;
    else
        local v4 = type(v1);
        if v4 ~= type(v2) then
            return false;
        elseif v4 ~= "table" then
            return false;
        else
            if not v3 then
                local v5 = getmetatable(v1);
                if not (not v5 or not v5.__eq) then
                    return v1 == v2;
                end;
            end;
            local v6 = {};
            for v7, v8 in pairs(v1) do
                local v9 = v2[v7];
                if v9 ~= nil and v0(v8, v9, v3) then
                    v6[v7] = true;
                else
                    return false;
                end;
            end;
            for v10, _ in pairs(v2) do
                if not v6[v10] then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
return v0;
