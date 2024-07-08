local function v6(v0, v1)
    if not (type(v0) == "string") or type(v1) ~= "table" then
        return v0, "";
    else
        for _, v3 in ipairs(v1) do
            local v4, v5 = v0:find(v3, nil, true);
            if v4 ~= nil then
                return v0:sub(1, v4 - 1), (v0:sub(v5 + 1));
            end;
        end;
        return v0, "";
    end;
end;
local function _(v7)
    if type(v7) ~= "string" then
        return "";
    else
        return string.match(v7, "([^.]*)$");
    end;
end;
return function(v9, v10)
    local v11 = {};
    local v12 = {};
    if not v10 then
        v10 = 0;
    end;
    if type(v9) ~= "string" then
        return v11, v12;
    else
        for v13 in v9:gmatch("[^\r\n]+") do
            local _ = nil;
            local v15 = nil;
            local v16 = nil;
            local v17 = nil;
            local v18, v19 = v6(v13, {
                ", line ", 
                ", Line ", 
                ":"
            });
            v15 = v18;
            v18, v19 = v6(v19, {
                " - "
            });
            v17 = v18;
            v16 = v19;
            if v17 ~= "" and v15 ~= "" then
                local v20;
                v18, v19, v20 = string.find(v15, "Script '(.*)'");
                if v20 ~= nil then
                    v15 = v20;
                end;
                local v21 = v12[v15];
                if v21 == nil then
                    v10 = v10 + 1;
                    v21 = v10;
                    v12[v15] = v21;
                end;
                if v16 == "" then
                    local l_v15_0 = v15;
                    v16 = type(l_v15_0) ~= "string" and "" or string.match(l_v15_0, "([^.]*)$");
                end;
                table.insert(v11, {
                    line = v17, 
                    funcName = v16, 
                    sourceCode = tostring(v21)
                });
            end;
        end;
        local v23 = {};
        for v24, v25 in pairs(v12) do
            v23[tostring(v25)] = {
                path = v24
            };
        end;
        return v11, v23, v10;
    end;
end;
