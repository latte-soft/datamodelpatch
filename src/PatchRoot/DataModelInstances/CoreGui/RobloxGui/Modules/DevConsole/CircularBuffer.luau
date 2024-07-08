local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    assert(v1, "Cannot initialize CircularBuffer with nil");
    assert(v1 > 0, "Cannot initialize CircularBuffer to size < 1");
    local v2 = {};
    setmetatable(v2, v0);
    v2._data = {};
    v2._backIndex = 0;
    v2._maxSize = v1;
    return v2;
end;
v0.reset = function(v3)
    v3._data = {};
    v3._backIndex = 0;
end;
v0.getSize = function(v4)
    return #v4._data;
end;
v0.getMaxSize = function(v5)
    return v5._maxSize;
end;
v0.setSize = function(v6, v7)
    assert(v7, "Cannot set CircularBuffer with nil");
    assert(v7 > 0, "Cannot set CircularBuffer to size < 1");
    if v7 == v6._maxSize then
        return ;
    else
        local v8 = v6:iterator();
        local v9 = v8:next();
        local v10 = {};
        local v11 = 0;
        while v9 and v11 < v7 do
            local v12 = v11 + 1;
            v10[v12] = {
                entry = v9
            };
            if v10[v11] then
                v10[v11]._next = v10[v12];
            end;
            v11 = v12;
            v9 = v8:next();
        end;
        v6._data = v10;
        v6._backIndex = v11;
        v6._maxSize = v7;
        return ;
    end;
end;
v0.getFrontIndex = function(v13)
    local v14 = v13._backIndex + 1;
    if v13._data[v14] then
        return v14;
    else
        return 1;
    end;
end;
v0.front = function(v15)
    local v16 = v15:getFrontIndex();
    if not v15._data[v16] then
        return nil;
    else
        return v15._data[v16].entry;
    end;
end;
v0.back = function(v17)
    if not v17._data[v17._backIndex] then
        return nil;
    else
        return v17._data[v17._backIndex].entry;
    end;
end;
v0.iterator = function(v18)
    return {
        data = v18._data[v18:getFrontIndex()], 
        next = function(v19)
            local l_data_0 = v19.data;
            if l_data_0 then
                v19.data = v19.data._next;
            end;
            return l_data_0 and l_data_0.entry;
        end
    };
end;
v0.getData = function(v21)
    return v21._data;
end;
v0.at = function(v22, v23)
    assert(v23, "Cannot index CircularBuffer with nil");
    local v24 = ((v22:getFrontIndex() + v23) - 2) % v22._maxSize + 1;
    if not v22._data[v24] then
        return nil;
    else
        return v22._data[v24].entry;
    end;
end;
v0.reverseAt = function(v25, v26)
    local v27 = (v25._backIndex - v26) % v25._maxSize + 1;
    if not v25._data[v27] then
        return nil;
    else
        return v25._data[v27].entry;
    end;
end;
v0.push_back = function(v28, v29)
    local l__backIndex_0 = v28._backIndex;
    local v31 = v28._backIndex + 1;
    if v28._maxSize < v31 then
        v31 = 1;
    end;
    local v32 = v28._data[v31];
    v28._data[v31] = {
        entry = v29
    };
    if l__backIndex_0 > 0 then
        v28._data[l__backIndex_0]._next = v28._data[v31];
        if v32 then
            v32._next = nil;
        end;
    end;
    v28._backIndex = v31;
    return v32 and v32.entry;
end;
return v0;
