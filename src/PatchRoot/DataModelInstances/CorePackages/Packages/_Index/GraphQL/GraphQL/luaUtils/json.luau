local v0 = {};
local function v4(v1)
    if type(v1) ~= "table" then
        return (type(v1));
    else
        local v2 = 1;
        for _ in pairs(v1) do
            if v1[v2] ~= nil then
                v2 = v2 + 1;
            else
                return "table";
            end;
        end;
        if v2 == 1 then
            return "table";
        else
            return "array";
        end;
    end;
end;
local function v10(v5)
    local v6 = {
        "\\", 
        "\"", 
        "/", 
        "\b", 
        "\f", 
        "\n", 
        "\r", 
        "\t"
    };
    local v7 = {
        "\\", 
        "\"", 
        "/", 
        "b", 
        "f", 
        "n", 
        "r", 
        "t"
    };
    for v8, v9 in ipairs(v6) do
        v5 = v5:gsub(v9, "\\" .. v7[v8]);
    end;
    return v5;
end;
v0.stringify = function(v11, v12)
    local v13 = {};
    local v14 = v4(v11);
    if v14 == "array" then
        if v12 then
            error("Can't encode array as key.");
        end;
        v13[#v13 + 1] = "[";
        for v15, v16 in ipairs(v11) do
            if v15 > 1 then
                v13[#v13 + 1] = ", ";
            end;
            v13[#v13 + 1] = v0.stringify(v16);
        end;
        v13[#v13 + 1] = "]";
    elseif v14 == "table" then
        if v12 then
            error("Can't encode table as key.");
        end;
        v13[#v13 + 1] = "{";
        for v17, v18 in pairs(v11) do
            if #v13 > 1 then
                v13[#v13 + 1] = ", ";
            end;
            v13[#v13 + 1] = v0.stringify(v17, true);
            v13[#v13 + 1] = ":";
            v13[#v13 + 1] = v0.stringify(v18);
        end;
        v13[#v13 + 1] = "}";
    elseif v14 == "string" then
        return "\"" .. v10(v11) .. "\"";
    elseif v14 == "number" then
        if not v12 then
            return (tostring(v11));
        else
            return "\"" .. tostring(v11) .. "\"";
        end;
    elseif v14 == "boolean" then
        return (tostring(v11));
    elseif v14 == "nil" then
        return "null";
    else
        error("Unjsonifiable type: " .. v14 .. ".");
    end;
    return table.concat(v13);
end;
return v0;
