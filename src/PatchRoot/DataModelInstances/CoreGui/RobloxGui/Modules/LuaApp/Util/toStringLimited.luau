local function v0(v1, v2, v3, v4, v5)
    v2 = v2 or "";
    assert(v2, "");
    v3 = v3 or 5;
    assert(v3, "");
    local v6 = 20;
    if type(v4) == "function" then
        local v7 = v4(v5);
        if type(v7) == "number" then
            v6 = v7;
        end;
    end;
    if type(v1) == "table" then
        if v3 > 0 and v3 < v5 then
            return "*truncated";
        else
            local v8 = "" .. "{\n";
            local v9 = 0;
            for v10, v11 in pairs(v1) do
                v9 = v9 + 1;
                if v6 > 0 and v6 < v9 then
                    v8 = v8 .. "  " .. v2 .. "*truncated" .. "\n";
                    break;
                else
                    if type(v10) == "string" then
                        v8 = v8 .. "  " .. v2 .. v10 .. " = " .. v0(v11, "  " .. v2, v3, v4, v5 + 1) .. ";\n";
                    end;
                    if type(v10) == "number" then
                        v8 = v8 .. "  " .. v2 .. v0(v11, "  " .. v2, v3, v4, v5 + 1) .. ",\n";
                    end;
                end;
            end;
            return v8 .. v2 .. "}";
        end;
    elseif type(v1) == "string" then
        return "\"" .. v1 .. "\"";
    else
        return (tostring(v1));
    end;
end;
return function(v12, v13, v14, v15)
    return (v0(v12, v13, v14, v15, 1));
end;
