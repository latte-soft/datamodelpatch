local v0 = {};
local v1 = {};
v1.__index = v1;
v1.GetInstance = function(v2, v3)
    if v2.InstancePoolsByClass[v3] == nil then
        v2.InstancePoolsByClass[v3] = {};
    end;
    local v4 = #v2.InstancePoolsByClass[v3];
    if v4 > 0 then
        local v5 = v2.InstancePoolsByClass[v3][v4];
        table.remove(v2.InstancePoolsByClass[v3]);
        return v5;
    else
        return Instance.new(v3);
    end;
end;
v1.ReturnInstance = function(v6, v7)
    if v6.InstancePoolsByClass[v7.ClassName] == nil then
        v6.InstancePoolsByClass[v7.ClassName] = {};
    end;
    if #v6.InstancePoolsByClass[v7.ClassName] < v6.PoolSizePerType then
        table.insert(v6.InstancePoolsByClass[v7.ClassName], v7);
        return ;
    else
        v7:Destroy();
        return ;
    end;
end;
v0.new = function(v8)
    local v9 = setmetatable({}, v1);
    v9.InstancePoolsByClass = {};
    v9.Name = "ObjectPool";
    v9.PoolSizePerType = v8;
    return v9;
end;
return v0;
