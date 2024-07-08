local function v8(v0, v1)
    local v2 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v4)
            error(("%q (%s) is not a valid member of %s"):format(tostring(v4), typeof(v4), v2), 2);
        end, 
        __newindex = function(_, v6, _)
            error(("%q (%s) is not a valid member of %s"):format(tostring(v6), typeof(v6), v2), 2);
        end
    }));
end;
local function v17(v9, v10, v11, v12, v13)
    local v14 = typeof(v12) == "string";
    assert(v14, "Only string names are supported for enums");
    if v14 then
        assert(v12 ~= "fromRawValue", "fromRawValue is reserved");
        assert(v12 ~= "isEnumValue", "isEnumValue is reserved");
        assert(v12 ~= "allValues", "allValues is reserved");
    end;
    assert(v9[v12] == nil, "Enum value names can only be used once");
    assert(v10[v12] == nil, "Enum values can only be used once");
    local v15 = newproxy(true);
    local v16 = getmetatable(v15);
    v16.__tostring = function()
        return ("%s.%s"):format(v11, v12);
    end;
    v16.__index = v8({
        rawValue = function()
            return v13;
        end
    });
    v9[v12] = v15;
    v10[v13] = v15;
end;
return function(v18, v19)
    assert(typeof(v18) == "string", "Bad argument #1 - enums must be created using a string name");
    assert(typeof(v19) == "table", "Bad argument #2 - enums must be created using a table");
    local v20 = {};
    local v21 = {};
    if v19[1] ~= nil then
        for _, v23 in ipairs(v19) do
            v17(v20, v21, v18, v23, v23);
        end;
    else
        for v24, v25 in pairs(v19) do
            v17(v20, v21, v18, v24, v25);
        end;
    end;
    v20.fromRawValue = function(v26)
        return v21[v26];
    end;
    v20.isEnumValue = function(v27)
        if typeof(v27) ~= "userdata" then
            return false;
        else
            for _, v29 in pairs(v20) do
                if v29 == v27 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    v20.allValues = function()
        local v30 = {};
        for _, v32 in pairs(v21) do
            table.insert(v30, v32);
        end;
        return v30;
    end;
    local v33 = newproxy(true);
    local v34 = getmetatable(v33);
    v34.__index = v8(v20, v18);
    v34.__tostring = function()
        return v18;
    end;
    return v33;
end;
