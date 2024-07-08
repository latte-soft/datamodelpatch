local function v0(v1, v2)
    v2 = v2 or 0;
    local v3 = {};
    if typeof(v1) == "table" then
        table.insert(v3, "{\n");
        for v4, v5 in pairs(v1) do
            table.insert(v3, ("    "):rep(v2 + 1));
            table.insert(v3, (tostring(v4)));
            table.insert(v3, " = ");
            table.insert(v3, v0(v5, v2 + 1));
            table.insert(v3, "\n");
        end;
        table.insert(v3, ("    "):rep(v2));
        table.insert(v3, "}");
    elseif typeof(v1) == "string" then
        table.insert(v3, string.format("%q", v1));
        table.insert(v3, " (string)");
    else
        table.insert(v3, (tostring(v1)));
        table.insert(v3, " (");
        table.insert(v3, (typeof(v1)));
        table.insert(v3, ")");
    end;
    return table.concat(v3, "");
end;
return v0;
