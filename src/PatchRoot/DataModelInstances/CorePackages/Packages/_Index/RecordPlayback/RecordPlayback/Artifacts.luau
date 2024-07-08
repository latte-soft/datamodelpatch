local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Parent.HttpServiceMock);
local v2 = require(l_Parent_0.deepEqual);
local _ = require(l_Parent_0.RequestWriter);
local v4 = require(l_Parent_0.RequestFormatter);
local v5 = {};
local v6 = {
    __index = v5
};
v5.new = function(v7)
    return (setmetatable({
        _parent = v7, 
        _loadedContent = nil, 
        _formatter = v4.new(), 
        _require = require, 
        _useRequestsOnce = false
    }, v6));
end;
v5.useRequestsOnce = function(v8)
    v8._useRequestsOnce = true;
    return v8;
end;
v5.find = function(v9, v10)
    if not v9._loadedContent then
        v9._loadedContent = v9:_loadRequests();
    end;
    local v11 = v9._formatter:formatRequest(v10);
    local l_ipairs_0 = ipairs;
    local v13 = v9._loadedContent or {};
    for _, v15 in l_ipairs_0(v13) do
        if not (not (not v9._useRequestsOnce or v15.usage == 0) or not v2(v15.object.request, v11)) then
            v15.usage = v15.usage + 1;
            local l_object_0 = v15.object;
            if not l_object_0.response then
                return {
                    error = l_object_0.error
                };
            else
                return {
                    response = v9._formatter:loadResponse(l_object_0.response)
                };
            end;
        end;
    end;
    return nil;
end;
v5.getUnusedRequests = function(v17)
    if not v17._loadedContent then
        v17._loadedContent = v17:_loadRequests();
    end;
    local v18 = {};
    local l_ipairs_1 = ipairs;
    local v20 = v17._loadedContent or {};
    for _, v22 in l_ipairs_1(v20) do
        if v22.usage == 0 then
            table.insert(v18, v22.object.request);
        end;
    end;
    return v18;
end;
v5._loadRequests = function(v23)
    local v24 = {};
    for _, v26 in v23._parent:GetDescendants() do
        if v26:IsA("ModuleScript") then
            table.insert(v24, v23:_deserialize(v26));
        end;
    end;
    return v24;
end;
v5._deserialize = function(v27, v28)
    return {
        object = v27._require(v28), 
        usage = 0
    };
end;
return v5;
