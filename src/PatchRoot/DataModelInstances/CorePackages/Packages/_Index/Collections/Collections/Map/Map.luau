local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Array.forEach);
local v4 = require(l_Parent_0.Array.map);
local v5 = require(l_Parent_0.Array.isArray);
local v6 = require(l_Parent_1.InstanceOf);
local _ = require(l_Parent_1.ES7Types);
local v8 = {};
v8.new = function(v9)
    local v10 = nil;
    local v11 = nil;
    if v9 == nil then
        v10 = {};
        v11 = {};
    elseif not v5(v9) then
        if not v6(v9, v8) then
            error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(v9), (tostring(v9))));
        else
            v10 = table.clone(v9._array);
            v11 = table.clone(v9._map);
        end;
    else
        if (l___DEV___0 and #v9 > 0) and typeof(v9[1]) ~= "table" then
            error("Value `" .. typeof(v9[1]) .. "` is not an entry object.\n " .. "Cannot create Map from {K, V} form, it must be { {K, V}... }");
        end;
        v10 = table.create(#v9);
        v11 = {};
        for _, v13 in v9, nil, nil do
            local v14 = v13[1];
            if l___DEV___0 and v14 == nil then
                error("cannot create Map from a table that isn't an array.");
            end;
            local v15 = v13[2];
            if v11[v14] == nil then
                table.insert(v10, v14);
            end;
            v11[v14] = v15;
        end;
    end;
    return (setmetatable({
        size = #v10, 
        _map = v11, 
        _array = v10
    }, v8));
end;
v8.set = function(v16, v17, v18)
    if v16._map[v17] == nil then
        v16.size = v16.size + 1;
        table.insert(v16._array, v17);
    end;
    v16._map[v17] = v18;
    return v16;
end;
v8.get = function(v19, v20)
    return v19._map[v20];
end;
v8.clear = function(v21)
    local l_table_0 = table;
    v21.size = 0;
    l_table_0.clear(v21._map);
    l_table_0.clear(v21._array);
end;
v8.delete = function(v23, v24)
    if v23._map[v24] == nil then
        return false;
    else
        v23.size = v23.size - 1;
        v23._map[v24] = nil;
        local v25 = table.find(v23._array, v24);
        if v25 then
            table.remove(v23._array, v25);
        end;
        return true;
    end;
end;
v8.forEach = function(v26, v27, v28)
    if l___DEV___0 and typeof(v27) ~= "function" then
        error("callback is not a function");
    end;
    v3(v26._array, function(v29)
        local v30 = v26._map[v29];
        if v28 ~= nil then
            v27(v28, v30, v29, v26);
            return ;
        else
            v27(v30, v29, v26);
            return ;
        end;
    end);
end;
v8.has = function(v31, v32)
    return v31._map[v32] ~= nil;
end;
v8.keys = function(v33)
    return v33._array;
end;
v8.values = function(v34)
    return v4(v34._array, function(v35)
        return v34._map[v35];
    end);
end;
v8.entries = function(v36)
    return v4(v36._array, function(v37)
        return {
            v37, 
            v36._map[v37]
        };
    end);
end;
v8.ipairs = function(v38)
    if l___DEV___0 then
        warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2));
    end;
    return ipairs(v38:entries());
end;
v8.__iter = function(v39)
    return next, v39:entries();
end;
v8.__index = function(v40, v41)
    local v42 = rawget(v8, v41);
    if v42 ~= nil then
        return v42;
    else
        if l___DEV___0 then
            assert(rawget(v40, "_map"), "Map has been corrupted, and is missing private stateclear()?");
        end;
        return v8.get(v40, v41);
    end;
end;
v8.__newindex = function(v43, v44, v45)
    v43:set(v44, v45);
end;
return v8;
