local l_Parent_0 = script.Parent;
local l_getDefaultValue_0 = require(l_Parent_0.Parent.SharedUtils).getDefaultValue;
local v2 = require(l_Parent_0.Artifacts);
local v3 = require(l_Parent_0.RequestWriter);
local _ = require(l_Parent_0.Resolver);
local v5 = require(l_Parent_0.tryGetService);
local v6 = {
    useRequestsOnce = false
};
local v7 = {};
local v8 = {
    __index = v7
};
v7.new = function(v9)
    return (setmetatable({
        _resolver = v9, 
        _fileSystemService = v5("FileSystemService")
    }, v8));
end;
v7.load = function(v10, v11, v12)
    local v13 = v10._resolver:getInstance(v11);
    if v13 == nil then
        return nil;
    else
        local v14 = l_getDefaultValue_0(v12, v6);
        local v15 = v2.new(v13);
        if l_getDefaultValue_0(v14.useRequestsOnce, v6.useRequestsOnce) then
            v15:useRequestsOnce();
        end;
        return v15;
    end;
end;
v7.getWriter = function(v16, v17)
    return v3.new(v16._resolver:getLocation(v17));
end;
v7.delete = function(v18, v19)
    local v20 = v18._resolver:getLocation(v19);
    if not v18._fileSystemService then
        local v21 = v18._resolver:getInstance(v19);
        if v21 ~= nil then
            v21:ClearAllChildren();
        end;
    else
        local v22 = v20:resolvePath();
        if v18._fileSystemService:Exists(v22) then
            v18._fileSystemService:RemoveAll(v22);
            return ;
        end;
    end;
end;
return v7;
