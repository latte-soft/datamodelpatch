local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Array.isArray);
local v2 = require(l_Parent_0.Array.from.fromString);
local v3 = require(l_Parent_0.Array.forEach);
local _ = require(l_Parent_0.types);
local v5 = require(l_Parent_0.util.inspect);
local v9 = {
    __iter = function(v6)
        return next, v6._array;
    end, 
    __tostring = function(v7)
        local v8 = "Set ";
        if #v7._array > 0 then
            v8 = v8 .. "(" .. tostring(#v7._array) .. ") ";
        end;
        return v8 .. v5(v7._array);
    end
};
v9.__index = v9;
v9.new = function(v10)
    local v11 = nil;
    local v12 = {};
    if v10 ~= nil then
        local v13 = nil;
        if typeof(v10) == "table" then
            if not v1(v10) then
                local v14 = getmetatable(v10);
                if not v14 or not rawget(v14, "__iter") then
                    if _G.__DEV__ then
                        error("cannot create array from an object-like table");
                    end;
                else
                    v13 = v10;
                end;
            else
                v13 = table.clone(v10);
            end;
        elseif typeof(v10) == "string" then
            v13 = v2(v10);
        else
            error(("cannot create array from value of type `%s`"):format((typeof(v10))));
        end;
        if not v13 then
            v11 = {};
        else
            v11 = table.create(#v13);
            for _, v16 in v13, nil, nil do
                if not v12[v16] then
                    v12[v16] = true;
                    table.insert(v11, v16);
                end;
            end;
        end;
    else
        v11 = {};
    end;
    return (setmetatable({
        size = #v11, 
        _map = v12, 
        _array = v11
    }, v9));
end;
v9.add = function(v17, v18)
    if not v17._map[v18] then
        v17.size = v17.size + 1;
        v17._map[v18] = true;
        table.insert(v17._array, v18);
    end;
    return v17;
end;
v9.clear = function(v19)
    v19.size = 0;
    table.clear(v19._map);
    table.clear(v19._array);
end;
v9.delete = function(v20, v21)
    if v20._map[v21] then
        v20.size = v20.size - 1;
        v20._map[v21] = nil;
        local v22 = table.find(v20._array, v21);
        if v22 then
            table.remove(v20._array, v22);
        end;
        return true;
    else
        return false;
    end;
end;
v9.forEach = function(v23, v24, v25)
    if typeof(v24) ~= "function" then
        error("callback is not a function");
    end;
    v3(v23._array, function(v26)
        if v25 ~= nil then
            v24(v25, v26, v26, v23);
            return ;
        else
            v24(v26, v26, v23);
            return ;
        end;
    end);
end;
v9.has = function(v27, v28)
    return v27._map[v28] ~= nil;
end;
v9.ipairs = function(v29)
    if _G.__DEV__ then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2));
    end;
    return ipairs(v29._array);
end;
return v9;
