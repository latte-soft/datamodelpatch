return function(v0)
    local function _(v1)
        if type(v1) == "string" then
            return string.format("%s", v1);
        else
            return string.format("[%s]", (tostring(v1)));
        end;
    end;
    local function v5(v3)
        local v4 = type(v3);
        if v4 == "string" then
            return string.format("%q", v3);
        elseif not (v4 ~= "function") or v4 == "table" then
            return string.format("<%s>", (tostring(v3)));
        else
            return string.format("%s", (tostring(v3)));
        end;
    end;
    local function v10(v6, v7, v8, v9)
        v0(string.format("%s%s = %s,%s", v8, if type(v6) == "string" then string.format("%s", v6) else string.format("[%s]", (tostring(v6))), v5(v7), not not v9 and string.format(" -- %s", v9) or ""));
    end;
    return function(v11, v12)
        v12 = v12 or "  ";
        if type(v11) ~= "table" then
            error("tutils.Print must be passed a table", 2);
        end;
        local v13 = {};
        local function v14(v15, v16, v17)
            v13[v15] = true;
            local v18 = string.rep(v12, v17);
            local v19 = string.rep(v12, v17 + 1);
            if not v16 then
                v0(string.format("%s%s {", v18, v5(v15)));
            else
                v0(string.format("%s%s = %s {", v18, if type(v16) == "string" then string.format("%s", v16) else string.format("[%s]", (tostring(v16))), v5(v15)));
            end;
            for v20, v21 in pairs(v15) do
                if type(v21) == "table" then
                    if not v13[v21] then
                        v14(v21, v20, v17 + 1);
                    else
                        v10(v20, v21, v19, "Possible cycle");
                    end;
                else
                    v10(v20, v21, v19);
                end;
            end;
            v0(string.format("%s}%s", v18, v17 > 0 and "," or ""));
        end;
        v14(v11, nil, 0);
    end;
end;
