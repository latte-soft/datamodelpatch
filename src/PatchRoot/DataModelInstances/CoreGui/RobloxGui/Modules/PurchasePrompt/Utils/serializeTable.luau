local function v0(v1, v2, v3, v4)
    v3 = v3 or false;
    v4 = v4 or 0;
    local v5 = string.rep(" ", v4);
    if v2 then
        v5 = v5 .. v2 .. " = ";
    end;
    if type(v1) == "table" then
        v5 = v5 .. "{" .. (v3 and "" or "\n");
        for v6, v7 in pairs(v1) do
            v5 = v5 .. v0(v7, v6, v3, v4 + 1) .. "," .. (v3 and "" or "\n");
        end;
        return v5 .. string.rep(" ", v4) .. "}";
    elseif type(v1) == "number" then
        return v5 .. tostring(v1);
    elseif type(v1) == "string" then
        return v5 .. string.format("%q", v1);
    elseif type(v1) == "boolean" then
        return v5 .. (not v1 and "false" or "true");
    else
        return v5 .. "\"[inserializeable datatype:" .. type(v1) .. "]\"";
    end;
end;
return v0;
