local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2)
    local v3 = {
        sid = v1, 
        tag = v2, 
        metadata = {}, 
        children = {}, 
        timestamp = tick()
    };
    setmetatable(v3, {
        __index = v0
    });
    return v3;
end;
v0.addChild = function(v4, v5, v6)
    local v7 = v0.new(v5, v6);
    v7.parent = v4;
    v4.children[v5] = v7;
end;
v0.dump = function(v8, v9, v10)
    v10 = v10 .. ("%* sid: %*, tag: %*\n"):format(v9, v8.sid, v8.tag);
    v9 = v9 .. "----";
    for _, v12 in v8.children, nil, nil do
        v10 = v12:dump(v9, v10);
    end;
    return v10;
end;
findSid = function(v13, v14)
    if v13.sid == v14 then
        return v13;
    else
        for _, v16 in v13.children, nil, nil do
            local v17 = findSid(v16, v14);
            if v17 ~= nil then
                return v17;
            end;
        end;
        return nil;
    end;
end;
local v18 = {
    MOCK_ROOT_SID = "MOCK_ROOT_SID"
};
v18.__index = v18;
v18.new = function()
    local v19 = {
        mockRootNode = v0.new(v18.MOCK_ROOT_SID, v18.MOCK_ROOT_SID)
    };
    setmetatable(v19, {
        __index = v18
    });
    return v19;
end;
v18._resetMockData = function(v20)
    v20.mockRootNode = v0.new(v18.MOCK_ROOT_SID, v18.MOCK_ROOT_SID);
end;
v18._findSid = function(v21, v22)
    return findSid(v21.mockRootNode, v22);
end;
v18._dumpSessionTree = function(v23)
    if v23.mockRootNode ~= nil then
        return v23.mockRootNode:dump("", "");
    else
        return "Root node is nil";
    end;
end;
v18.GetRootSID = function(v24)
    return v24.MOCK_ROOT_SID;
end;
v18.SetSession = function(v25, v26, v27, v28)
    (findSid(v25.mockRootNode, v26) or v25.mockRootNode):addChild(v27, v28);
end;
v18.ReplaceSession = function(v29, v30, v31)
    local v32 = findSid(v29.mockRootNode, v30);
    if v32 ~= nil and v32.parent ~= nil then
        v32.parent.children[v30] = nil;
        v32.parent:addChild(v30, v31);
    end;
end;
v18.RemoveSession = function(v33, v34)
    local v35 = findSid(v33.mockRootNode, v34);
    if v35 ~= nil then
        local l_parent_0 = v35.parent;
        if l_parent_0 ~= nil then
            l_parent_0.children[v34] = nil;
        end;
    end;
end;
v18.GetMetadata = function(v37, v38, v39)
    local v40 = findSid(v37.mockRootNode, v38);
    if v40 ~= nil then
        return v40.metadata[v39];
    else
        return nil;
    end;
end;
v18.SetMetadata = function(v41, v42, v43, v44)
    local v45 = findSid(v41.mockRootNode, v42);
    if v45 ~= nil then
        v45.metadata[v43] = v44;
    end;
end;
v18.SessionExists = function(v46, v47)
    return findSid(v46.mockRootNode, v47) ~= nil;
end;
v18.RemoveSessionsWithMetadataKey = function(v48, v49)
    if v49 == nil then
        return ;
    else
        local function v50(v51, v52)
            if v52 ~= nil then
                if v52.metadata[v51] ~= nil then
                    return v52;
                else
                    for _, v54 in v52.children, nil, nil do
                        local v55 = v50(v51, v54);
                        if v55 ~= nil then
                            return v55;
                        end;
                    end;
                end;
            end;
            return nil;
        end;
        local v56 = v50(v49, v48.mockRootNode);
        while v56 ~= nil do
            v48:RemoveSession(v56.sid);
            v56 = v50(v49, v48.mockRootNode);
        end;
        return ;
    end;
end;
v18.generateSessionInfoString = function(_, _, _, _, _)
    return "";
end;
v18.GetSessionTag = function(v62, v63)
    local v64 = findSid(v62.mockRootNode, v63);
    if v64 ~= nil then
        return v64.tag;
    else
        return "";
    end;
end;
return v18;
