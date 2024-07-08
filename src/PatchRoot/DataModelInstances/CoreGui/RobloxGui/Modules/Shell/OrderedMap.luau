local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, ...)
    local v3 = {
        keys = {}, 
        values = {}, 
        getId = v1, 
        sortPredicate = v2
    };
    setmetatable(v3, v0);
    v0._InsertInPlace(v3, ...);
    return v3;
end;
v0.Get = function(v4, v5)
    return v4.values[v5];
end;
v0.GetByIndex = function(v6, v7)
    local v8 = v6.keys[v7];
    if v8 == nil then
        return nil;
    else
        return v6.values[v8];
    end;
end;
v0.GetIds = function(v9)
    return v9.keys;
end;
v0.Length = function(v10)
    return #v10.keys;
end;
v0.Delete = function(v11, ...)
    local v12 = v0.new(v11.getId, v11.sortPredicate);
    local v13 = select("#", ...);
    for v14, v15 in pairs(v11.values) do
        v12.values[v14] = v15;
    end;
    for v16 = 1, v13 do
        v12.values[select(v16, ...)] = nil;
    end;
    for _, v18 in ipairs(v11.keys) do
        if v12.values[v18] ~= nil then
            v12.keys[#v12.keys + 1] = v18;
        end;
    end;
    return v12;
end;
v0.Insert = function(v19, ...)
    local v20 = v19:_Copy();
    v0._InsertInPlace(v20, ...);
    return v20;
end;
v0.First = function(v21)
    if not v21.keys[1] then
        return ;
    else
        return v21:Get(v21.keys[1]);
    end;
end;
v0.Last = function(v22)
    local v23 = #v22.keys;
    if not v22.keys[v23] then
        return ;
    else
        return v22:Get(v22.keys[v23]);
    end;
end;
v0.CreateIterator = function(v24)
    local v25 = 0;
    local v26 = #v24.keys;
    return function()
        v25 = v25 + 1;
        if v25 <= v26 then
            local v27 = v24.keys[v25];
            return v27, v24.values[v27], v25;
        else
            return ;
        end;
    end;
end;
v0.CreateReverseIterator = function(v28)
    local v29 = #v28.keys + 1;
    return function()
        v29 = v29 - 1;
        if v29 > 0 then
            local v30 = v28.keys[v29];
            return v30, v28.values[v30], v29;
        else
            return ;
        end;
    end;
end;
v0.Map = function(v31, v32)
    local v33 = v0.new(v31.getId, v31.sortPredicate);
    for v34, v35 in v31:CreateIterator() do
        v33:_InsertInPlaceUnsorted(v32(v35, v34));
    end;
    v33:_Sort();
    return v33;
end;
v0.Merge = function(v36, ...)
    local v37 = nil;
    for v38 = 1, select("#", ...) do
        local v39 = select(v38, ...);
        if v39:Length() > 0 then
            if not v37 then
                v37 = v36:_Copy();
            end;
            for _, v41 in v39:CreateIterator() do
                v37:_InsertInPlaceUnsorted(v41);
            end;
        end;
    end;
    if not v37 then
        return v36;
    else
        v37:_Sort();
        return v37;
    end;
end;
v0._Copy = function(v42)
    local v43 = v0.new(v42.getId, v42.sortPredicate);
    for v44, v45 in ipairs(v42.keys) do
        v43.keys[v44] = v45;
    end;
    for v46, v47 in pairs(v42.values) do
        v43.values[v46] = v47;
    end;
    return v43;
end;
v0._InsertInPlaceUnsorted = function(v48, ...)
    for v49 = 1, select("#", ...) do
        local v50 = select(v49, ...);
        local v51 = v48.getId(v50);
        if not v48.values[v51] then
            table.insert(v48.keys, v51);
        end;
        v48.values[v51] = v50;
    end;
end;
v0._Sort = function(v52)
    table.sort(v52.keys, function(v53, v54)
        return v52.sortPredicate(v52.values[v53], v52.values[v54]);
    end);
end;
v0._InsertInPlace = function(v55, ...)
    v55:_InsertInPlaceUnsorted(...);
    v55:_Sort();
end;
return v0;
