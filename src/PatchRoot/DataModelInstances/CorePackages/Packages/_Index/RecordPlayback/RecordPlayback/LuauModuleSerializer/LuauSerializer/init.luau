local v0 = require(script.isValidLuauIdentifier);
local function v3(v1, v2)
    return v1[1] < v2[1];
end;
local v4 = {};
local v5 = {
    __index = v4
};
v4.new = function()
    return (setmetatable({
        _indentation = "\t", 
        _indentationLevel = 0
    }, v5));
end;
v4.serialize = function(v6, v7)
    local v8 = typeof(v7);
    if v8 == "string" then
        return ("%q"):format(v7);
    elseif v8 == "number" then
        return (tostring(v7));
    elseif v8 == "boolean" then
        if not v7 then
            return "false";
        else
            return "true";
        end;
    elseif v8 == "table" then
        if next(v7) == nil then
            return "{}";
        else
            local v9 = {
                "{"
            };
            v6._indentationLevel = v6._indentationLevel + 1;
            local v10 = v6:_ident();
            local v11 = {};
            local v12 = nil;
            for v13, v14 in ipairs(v7) do
                v11[v13] = true;
                if v12 ~= nil and v13 ~= v12 + 1 then
                    for _ = v12 + 1, v13 do
                        table.insert(v9, v10 .. v6:serialize(nil) .. ",");
                    end;
                end;
                table.insert(v9, v10 .. v6:serialize(v14) .. ",");
                v12 = v13;
            end;
            local v16 = {};
            for v17, v18 in pairs(v7) do
                if not v11[v17] then
                    table.insert(v16, {
                        v6:_serializeTableKey(v17), 
                        (v6:serialize(v18))
                    });
                end;
            end;
            table.sort(v16, v3);
            for _, v20 in ipairs(v16) do
                table.insert(v9, ("%s%s = %s,"):format(v10, v20[1], v20[2]));
            end;
            v6._indentationLevel = v6._indentationLevel - 1;
            table.insert(v9, v6:_ident() .. "}");
            return table.concat(v9, "\n");
        end;
    elseif v8 == "EnumItem" then
        return ("Enum.%s.%s"):format(tostring(v7.EnumType), v7.Name);
    elseif v8 == "Enum" then
        return "Enum." .. tostring(v7);
    elseif v8 == "nil" then
        return "nil";
    else
        error(("unable to serialize value of type `%s`"):format(v8));
        return ;
    end;
end;
v4._serializeTableKey = function(v21, v22)
    if not (typeof(v22) == "string") or not v0(v22) then
        return "[" .. v21:serialize(v22) .. "]";
    else
        return v22;
    end;
end;
v4._ident = function(v23)
    return v23._indentation:rep(v23._indentationLevel);
end;
return v4;
