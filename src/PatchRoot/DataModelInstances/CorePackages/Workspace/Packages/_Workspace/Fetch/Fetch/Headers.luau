local l_Array_0 = require(script.Parent.Parent.LuauPolyfill).Array;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {};
    local v4 = nil;
    if not l_Array_0.isArray(v2) then
        v4 = v2 or {};
    else
        v4 = {};
        for _, v6 in v2, nil, nil do
            v4[v6[1]] = v6[2];
        end;
    end;
    v3.headerList = v4;
    v3.guard = "none";
    setmetatable(v3, v1);
    return v3;
end;
v1.append = function(v7, v8, v9)
    if v7.guard == "immutable" then
        error("TypeError: tried to append header to immutable Headers object");
    end;
    v7.headerList[v8] = v9;
end;
v1.delete = function(v10, v11)
    if v10.guard == "immutable" then
        error("TypeError: tried to delete key on immutable Headers object");
    end;
    if v10:has(v11) then
        v10.headerList[v11] = nil;
        return ;
    else
        return ;
    end;
end;
v1.get = function(v12, v13)
    return v12.headerList[v13];
end;
v1.has = function(v14, v15)
    return v14.headerList[v15] ~= nil;
end;
v1.set = function(v16, v17, v18)
    if v16.guard == "immutable" then
        error("TypeError: tried to set key on immutable Headers object");
    end;
    v16.headerList[v17] = v18;
end;
v1.__iter = function(v19)
    return next, v19.headerList;
end;
return {
    Headers = v1
};
