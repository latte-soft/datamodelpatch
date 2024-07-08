local function v3(v0)
    local v1 = string.split(v0, "/");
    for v2 = #v1, 1, -1 do
        if v1[v2] == "" then
            table.remove(v1, v2);
        end;
    end;
    return v1;
end;
local _ = function(v4, v5)
    local v6 = 0;
    for _ in pairs(v4) do
        v6 = v6 + 1;
    end;
    assert(v6 <= v5, v6);
    return v6 == v5;
end;
local function v9(v10, v11)
    if v10.instance == nil then
        return ;
    else
        v10.instance = nil;
        local l_connections_0 = v10.connections;
        if l_connections_0 then
            for _, v14 in ipairs(l_connections_0) do
                v14:Disconnect();
            end;
            table.clear(l_connections_0);
        end;
        if not (not v11 or not v10.alias) then
            v11[v10.alias] = nil;
        end;
        local l_children_0 = v10.children;
        if l_children_0 then
            for _, v17 in pairs(l_children_0) do
                v9(v17, v11);
            end;
        end;
        return ;
    end;
end;
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20)
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = 1;
    for v27, v28 in pairs(v19) do
        v25[v27] = v3(v28);
        v26 = v26 + 1;
    end;
    return (setmetatable({
        _boundFn = v20, 
        _parsedManifest = v25, 
        _manifestSizeTarget = v26, 
        _dtorMap = v21, 
        _connections = v22, 
        _rootInstToRootNode = v23, 
        _rootInstToManifest = v24
    }, v18));
end;
v18._startBoundFn = function(v29, v30, v31)
    local l__boundFn_0 = v29._boundFn;
    local l__dtorMap_0 = v29._dtorMap;
    local v34 = l__dtorMap_0[v30];
    if v34 then
        v34();
        l__dtorMap_0[v30] = nil;
    end;
    local v35 = l__boundFn_0(v31);
    if v35 then
        l__dtorMap_0[v30] = v35;
    end;
end;
v18._stopBoundFn = function(v36, v37)
    local l__dtorMap_1 = v36._dtorMap;
    local v39 = l__dtorMap_1[v37];
    if v39 then
        v39();
        l__dtorMap_1[v37] = nil;
    end;
end;
v18.bindRoot = function(v40, v41)
    debug.profilebegin("AtomicBinding:BindRoot");
    local l__parsedManifest_0 = v40._parsedManifest;
    local l__rootInstToRootNode_0 = v40._rootInstToRootNode;
    local l__rootInstToManifest_0 = v40._rootInstToManifest;
    local l__manifestSizeTarget_0 = v40._manifestSizeTarget;
    assert(l__rootInstToManifest_0[v41] == nil, "rootInstToManifest is nil");
    local v46 = {};
    l__rootInstToManifest_0[v41] = v46;
    debug.profilebegin("BuildTree");
    local v47 = {
        alias = "root", 
        instance = v41
    };
    if next(l__parsedManifest_0) then
        v47.children = {};
        v47.connections = {};
    end;
    l__rootInstToRootNode_0[v41] = v47;
    for v48, v49 in pairs(l__parsedManifest_0) do
        local l_v47_0 = v47;
        for v51, v52 in ipairs(v49) do
            local v53 = v51 == #v49;
            local v54 = l_v47_0.children[v52] or {};
            if not v53 then
                v54.children = v54.children or {};
                v54.connections = v54.connections or {};
            else
                if v54.alias ~= nil then
                    error("Multiple aliases assigned to one instance");
                end;
                v54.alias = v48;
            end;
            l_v47_0.children[v52] = v54;
            l_v47_0 = v54;
        end;
    end;
    debug.profileend();
    local function v55(v56)
        local v57 = assert(v56.instance, "instance does not exist");
        local l_children_1 = v56.children;
        local l_alias_0 = v56.alias;
        local v60 = not l_children_1;
        if l_alias_0 then
            v46[l_alias_0] = v57;
        end;
        if not v60 then
            local function v63(v61)
                local v62 = l_children_1[v61.Name];
                if not v62 or v62.instance ~= nil then
                    return ;
                else
                    v62.instance = v61;
                    v55(v62);
                    return ;
                end;
            end;
            local function v69(v64)
                local l_Name_0 = v64.Name;
                local v66 = l_children_1[l_Name_0];
                if v66 then
                    if v66.instance ~= v64 then
                        return ;
                    else
                        v40:_stopBoundFn(v41);
                        v9(v66, v46);
                        assert(v66.instance == nil, "unbindNodeDescend failed");
                        local l_v57_FirstChild_0 = v57:FindFirstChild(l_Name_0);
                        if l_v57_FirstChild_0 then
                            local v68 = l_children_1[l_v57_FirstChild_0.Name];
                            if v68 then
                                if v68.instance ~= nil then
                                    return ;
                                else
                                    v68.instance = l_v57_FirstChild_0;
                                    v55(v68);
                                end;
                            end;
                        end;
                        return ;
                    end;
                else
                    return ;
                end;
            end;
            for _, v71 in ipairs(v57:GetChildren()) do
                local v72 = l_children_1[v71.Name];
                if not (not v72 or v72.instance ~= nil) then
                    v72.instance = v71;
                    v55(v72);
                end;
            end;
            table.insert(v56.connections, v57.ChildAdded:Connect(v63));
            table.insert(v56.connections, v57.ChildRemoved:Connect(v69));
        end;
        if v60 then
            local l_v46_0 = v46;
            local l_l__manifestSizeTarget_0_0 = l__manifestSizeTarget_0;
            local v75 = 0;
            for _ in pairs(l_v46_0) do
                v75 = v75 + 1;
            end;
            assert(v75 <= l_l__manifestSizeTarget_0_0, v75);
            if v75 == l_l__manifestSizeTarget_0_0 then
                v40:_startBoundFn(v41, v46);
            end;
        end;
    end;
    debug.profilebegin("ResolveTree");
    v55(v47);
    debug.profileend();
    debug.profileend();
end;
v18.unbindRoot = function(v77, v78)
    local l__rootInstToRootNode_1 = v77._rootInstToRootNode;
    local l__rootInstToManifest_1 = v77._rootInstToManifest;
    v77:_stopBoundFn(v78);
    local v81 = l__rootInstToRootNode_1[v78];
    if v81 then
        v9(v81, (assert(l__rootInstToManifest_1[v78], "rootInstToManifest is nil")));
        l__rootInstToRootNode_1[v78] = nil;
    end;
    l__rootInstToManifest_1[v78] = nil;
end;
v18.destroy = function(v82)
    debug.profilebegin("AtomicBinding:destroy");
    for _, v84 in pairs(v82._dtorMap) do
        v84:destroy();
    end;
    table.clear(v82._dtorMap);
    for _, v86 in ipairs(v82._connections) do
        v86:Disconnect();
    end;
    table.clear(v82._connections);
    local l__rootInstToManifest_2 = v82._rootInstToManifest;
    for v88, v89 in pairs(v82._rootInstToRootNode) do
        v9(v89, (assert(l__rootInstToManifest_2[v88], "rootInstToManifest is nil")));
    end;
    table.clear(v82._rootInstToManifest);
    table.clear(v82._rootInstToRootNode);
    debug.profileend();
end;
return v18;
