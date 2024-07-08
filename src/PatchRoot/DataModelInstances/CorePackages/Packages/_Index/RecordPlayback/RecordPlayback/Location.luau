local v0 = require(script.Parent.PathUtils);
local v1 = {};
local v2 = {
    __index = v1
};
v1.new = function(v3, v4, v5)
    return (setmetatable({
        _relativePath = v0.trimEndSeparator(v3), 
        _rootPath = v4, 
        _rootInstance = v5
    }, v2));
end;
v1.join = function(v6, ...)
    return v1.new(v0.join(v6._relativePath, ...), v6._rootPath, v6._rootInstance);
end;
v1.resolvePath = function(v7)
    return v0.join(v7._rootPath, v7._relativePath);
end;
v1.getInstance = function(v8)
    local l__rootInstance_0 = v8._rootInstance;
    for _, v11 in ipairs(v0.getComponents(v8._relativePath)) do
        if v11 == "" then
            error(("invalid path location provided `%s`"):format(v8._relativePath), 2);
        end;
        l__rootInstance_0 = l__rootInstance_0:FindFirstChild(v11);
        if l__rootInstance_0 == nil then
            return nil;
        end;
    end;
    return l__rootInstance_0;
end;
v1.getOrCreateInstance = function(v12, v13)
    local v14 = v12:_ensureParentInstance();
    local v15 = v0.fileStem(v12._relativePath);
    local l_v14_FirstChild_0 = v14:FindFirstChild(v15);
    if not l_v14_FirstChild_0 or not l_v14_FirstChild_0:IsA(v13) then
        local v17 = Instance.new(v13);
        v17.Name = v15;
        v17.Parent = v14;
        return v17;
    else
        return l_v14_FirstChild_0;
    end;
end;
v1._ensureParentInstance = function(v18)
    local v19 = v0.parent(v18._relativePath);
    if v19 == nil then
        error(("invalid path location provided `%s` (unable to obtain parent path)"):format(v18._relativePath), 2);
    end;
    if v19 == "" then
        return v18._rootInstance;
    else
        local l__rootInstance_1 = v18._rootInstance;
        for _, v22 in ipairs(v0.getComponents(v19)) do
            if v22 == "" then
                error(("invalid path location provided `%s`"):format(v18._relativePath), 2);
            end;
            local l_l__rootInstance_1_FirstChild_0 = l__rootInstance_1:FindFirstChild(v22);
            if l_l__rootInstance_1_FirstChild_0 == nil then
                l_l__rootInstance_1_FirstChild_0 = Instance.new("Folder");
                l_l__rootInstance_1_FirstChild_0.Name = v22;
                l_l__rootInstance_1_FirstChild_0.Parent = l__rootInstance_1;
            end;
            l__rootInstance_1 = l_l__rootInstance_1_FirstChild_0;
        end;
        return l__rootInstance_1;
    end;
end;
return v1;
