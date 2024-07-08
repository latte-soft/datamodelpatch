local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Array.forEach);
local v2 = require(l_Parent_0.Array.map);
local _ = require(l_Parent_0.types);
local v4 = {};
v4.new = function(v5)
    local v6 = nil;
    local v7 = {};
    if v5 ~= nil then
        if _G.__DEV__ then
            local v8 = typeof(v5);
            if v8 == "table" then
                if #v5 > 0 and typeof(v5[1]) ~= "table" then
                    error("cannot create Map from {K, V} form, it must be { {K, V}... }");
                end;
            else
                error(("cannot create array from value of type `%s`"):format(v8));
            end;
        end;
        local v9 = table.clone(v5);
        v6 = table.create(#v9);
        for _, v11 in v9, nil, nil do
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
    else
        v6 = {};
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
    if _G.__DEV__ and typeof(v25) ~= "function" then
        error("callback is not a function");
    end;
    v1(v24._array, function(v27)
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
    return v2(v32._array, function(v33)
        return v32._map[v33];
    end);
end;
v4.entries = function(v34)
    return v2(v34._array, function(v35)
        return {
            v35, 
            v34._map[v35]
        };
    end);
end;
v4.ipairs = function(v36)
    if _G.__DEV__ then
        warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2));
    end;
    return ipairs(v36:entries());
end;
v4.__iter = function(v37)
    return next, v37:entries();
end;
v4.__index = function(v38, v39)
    local v40 = rawget(v4, v39);
    if v40 ~= nil then
        return v40;
    else
        return v4.get(v38, v39);
    end;
end;
v4.__newindex = function(v41, v42, v43)
    v41:set(v42, v43);
end;
return v4;
