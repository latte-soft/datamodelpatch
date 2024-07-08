local v0 = {};
v0.new = function(v1)
    local v2 = {
        defaultConfig = v1, 
        defaultConfigKeys = {}
    };
    for v3 in pairs(v1) do
        table.insert(v2.defaultConfigKeys, v3);
    end;
    v2._currentConfig = setmetatable({}, {
        __index = function(_, v5)
            error(("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(v5), table.concat(v2.defaultConfigKeys, ", ")), 3);
        end
    });
    v2.set = function(...)
        return v0.set(v2, ...);
    end;
    v2.get = function(...)
        return v0.get(v2, ...);
    end;
    v2.scoped = function(...)
        return v0.scoped(v2, ...);
    end;
    v2.set(v1);
    return v2;
end;
v0.set = function(v6, v7)
    local v8 = {};
    local v9 = {};
    for v10, v11 in pairs(v7) do
        if v6.defaultConfig[v10] == nil then
            table.insert(v8, v10);
        elseif typeof(v11) ~= "boolean" then
            table.insert(v9, tostring(v10) .. " (type " .. typeof(v11) .. ")");
        else
            v6._currentConfig[v10] = v11;
        end;
    end;
    if next(v8) ~= nil then
        error(("Invalid global configuration keys %s. Valid configuration keys are: %s"):format(table.concat(v8, ", "), table.concat(v6.defaultConfigKeys, ", ")), 3);
    end;
    if next(v9) ~= nil then
        error(("Invalid global configuration types for keys %s. All configuration values must be boolean."):format(table.concat(v9, ", ")), 3);
    end;
end;
v0.get = function(v12)
    return v12._currentConfig;
end;
return v0;
