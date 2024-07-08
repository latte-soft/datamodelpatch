local function v0(v1, v2)
    if type(v1) ~= "table" then
        return v1;
    elseif not v2 or not v2[v1] then
        local v3 = v2 or {};
        local v4 = setmetatable({}, (getmetatable(v1)));
        v3[v1] = v4;
        for v5, v6 in pairs(v1) do
            v4[v0(v5, v3)] = v0(v6, v3);
        end;
        return v4;
    else
        return v2[v1];
    end;
end;
return v0;
