local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.inspect);
local v4 = require(l_Parent_0.Array.isArray);
local v5 = require(l_Parent_0.Array.forEach);
local v6 = require(l_Parent_0.Array.from.fromString);
local _ = require(l_Parent_1.ES7Types);
local v11 = {
    __iter = function(v8)
        return next, v8._array;
    end, 
    __tostring = function(v9)
        local v10 = "Set ";
        if #v9._array > 0 then
            v10 = v10 .. "(" .. tostring(#v9._array) .. ") ";
        end;
        return v10 .. v3(v9._array);
    end
};
v11.__index = v11;
v11.new = function(v12)
    local v13 = nil;
    local v14 = {};
    if v12 ~= nil then
        local v15 = nil;
        if typeof(v12) == "table" then
            if not v4(v12) then
                local v16 = getmetatable(v12);
                if not v16 or not rawget(v16, "__iter") then
                    if l___DEV___0 then
                        error("cannot create array from an object-like table");
                    end;
                else
                    v15 = v12;
                end;
            else
                v15 = table.clone(v12);
            end;
        elseif typeof(v12) == "string" then
            v15 = v6(v12);
        else
            error(("cannot create array from value of type `%s`"):format((typeof(v12))));
        end;
        if not v15 then
            v13 = {};
        else
            v13 = table.create(#v15);
            for _, v18 in v15, nil, nil do
                if not v14[v18] then
                    v14[v18] = true;
                    table.insert(v13, v18);
                end;
            end;
        end;
    else
        v13 = {};
    end;
    return (setmetatable({
        size = #v13, 
        _map = v14, 
        _array = v13
    }, v11));
end;
v11.add = function(v19, v20)
    if not v19._map[v20] then
        v19.size = v19.size + 1;
        v19._map[v20] = true;
        table.insert(v19._array, v20);
    end;
    return v19;
end;
v11.clear = function(v21)
    v21.size = 0;
    table.clear(v21._map);
    table.clear(v21._array);
end;
v11.delete = function(v22, v23)
    if v22._map[v23] then
        v22.size = v22.size - 1;
        v22._map[v23] = nil;
        local v24 = table.find(v22._array, v23);
        if v24 then
            table.remove(v22._array, v24);
        end;
        return true;
    else
        return false;
    end;
end;
v11.forEach = function(v25, v26, v27)
    if typeof(v26) ~= "function" then
        error("callback is not a function");
    end;
    v5(v25._array, function(v28)
        if v27 ~= nil then
            v26(v27, v28, v28, v25);
            return ;
        else
            v26(v28, v28, v25);
            return ;
        end;
    end);
end;
v11.has = function(v29, v30)
    return v29._map[v30] ~= nil;
end;
v11.ipairs = function(v31)
    if l___DEV___0 then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2));
    end;
    return ipairs(v31._array);
end;
return v11;
