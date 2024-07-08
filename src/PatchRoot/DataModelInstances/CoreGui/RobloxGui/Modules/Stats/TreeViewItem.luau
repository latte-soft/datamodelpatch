local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    local v3 = {};
    setmetatable(v3, v0);
    v3._id = v1;
    v3._parent = v2;
    v3._children = {};
    return v3;
end;
v0.getValue = function(v4)
    return v4._value;
end;
v0.getLabel = function(v5)
    return v5._label;
end;
v0.getChildren = function(v6)
    return v6._children;
end;
v0.getId = function(v7)
    return v7._id;
end;
v0.getStackDepth = function(v8)
    if v8._parent == nil then
        return 0;
    else
        return 1 + v8._parent:getStackDepth();
    end;
end;
v0.setLabelAndValue = function(v9, v10, v11)
    v9._label = v10;
    v9._value = v11;
end;
v0.getOrMakeChildById = function(v12, v13)
    for _, v15 in ipairs(v12._children) do
        if v15:getId() == v13 then
            return v15;
        end;
    end;
    local v16 = v0.new(v13, v12);
    table.insert(v12._children, v16);
    return v16;
end;
v0.removeChildren = function(v17)
    if v17._children then
        for _, v19 in ipairs(v17._children) do
            v19:removeChildren();
            v19 = nil;
        end;
        v17._id = nil;
        v17._parent = nil;
        v17._children = nil;
        return ;
    else
        return ;
    end;
end;
v0.removeChild = function(v20, v21)
    for _, v23 in ipairs(v20._children) do
        if v23:getId() == v21 then
            v23:removeChildren();
            return ;
        end;
    end;
end;
return v0;
