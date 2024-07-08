local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Array);
local v2 = require(l_Parent_0.Object);
local v3 = require(l_Parent_0.instanceof);
local v4 = {};
v4.new = function(v5)
    local v6 = {};
    local v7 = {};
    if v5 ~= nil then
        local v8 = nil;
        local v9 = typeof(v5);
        if v9 == "table" then
            if #v5 > 0 and typeof(v5[1]) ~= "table" then
                error("cannot create Map from {K, V} form, it must be { {K, V}... }");
            end;
            v8 = v1.from(v5);
        else
            error(("cannot create array from value of type `%s`"):format(v9));
        end;
        for _, v11 in ipairs(v8) do
            local v12 = v11[1];
            if _G.__DEV__ and v12 == nil then
                error("cannot create Map from a table that isn't an array.");
            end;
            local v13 = v11[2];
            if v7[v12] == nil then
                table.insert(v6, v12);
            end;
            v7[v12] = v13;
        end;
    end;
    return (setmetatable({
        size = #v6, 
        _map = v7, 
        _array = v6
    }, v4));
end;
v4.set = function(v14, v15, v16)
    if v14._map[v15] == nil then
        v14.size = v14.size + 1;
        table.insert(v14._array, v15);
    end;
    v14._map[v15] = v16;
    return v14;
end;
v4.get = function(v17, v18)
    return v17._map[v18];
end;
v4.clear = function(v19)
    local l_table_0 = table;
    v19.size = 0;
    l_table_0.clear(v19._map);
    l_table_0.clear(v19._array);
end;
v4.delete = function(v21, v22)
    if v21._map[v22] == nil then
        return false;
    else
        v21.size = v21.size - 1;
        v21._map[v22] = nil;
        local v23 = table.find(v21._array, v22);
        if v23 then
            table.remove(v21._array, v23);
        end;
        return true;
    end;
end;
v4.forEach = function(v24, v25, v26)
    if typeof(v25) ~= "function" then
        error("callback is not a function");
    end;
    return v1.forEach(v24._array, function(v27)
        local v28 = v24._map[v27];
        if v26 ~= nil then
            v25(v26, v28, v27, v24);
            return ;
        else
            v25(v28, v27, v24);
            return ;
        end;
    end);
end;
v4.has = function(v29, v30)
    return v29._map[v30] ~= nil;
end;
v4.keys = function(v31)
    return v31._array;
end;
v4.values = function(v32)
    return v1.map(v32._array, function(v33)
        return v32._map[v33];
    end);
end;
v4.entries = function(v34)
    return v1.map(v34._array, function(v35)
        return {
            v35, 
            v34._map[v35]
        };
    end);
end;
v4.ipairs = function(v36)
    return ipairs(v36:entries());
end;
v4.__index = function(v37, v38)
    local v39 = rawget(v4, v38);
    if v39 ~= nil then
        return v39;
    else
        return v4.get(v37, v38);
    end;
end;
v4.__newindex = function(v40, v41, v42)
    v40:set(v41, v42);
end;
return {
    Map = v4, 
    coerceToMap = function(v43)
        return not not v3(v43, v4) and v43 or v4.new(v2.entries(v43));
    end, 
    coerceToTable = function(v44)
        if v3(v44, v4) then
            return v1.reduce(v44:entries(), function(v45, v46)
                v45[v46[1]] = v46[2];
                return v45;
            end, {});
        else
            return v44;
        end;
    end
};
