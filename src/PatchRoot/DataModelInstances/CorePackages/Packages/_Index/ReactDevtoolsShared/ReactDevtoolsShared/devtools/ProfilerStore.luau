local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Map_0 = v0.Map;
local l_Set_0 = v0.Set;
local l_console_0 = v0.console;
local v5 = require(script.Parent.Parent.events);
local l_prepareProfilingDataFrontendFromBackendAndStore_0 = require(script.Parent.views.Profiler.utils).prepareProfilingDataFrontendFromBackendAndStore;
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.bridge);
local _ = require(script.Parent.Parent.backend.types);
local _ = require(script.Parent.views.Profiler.types);
local v11 = require(script.Parent.ProfilingCache);
local v12 = setmetatable({}, {
    __index = v5
});
v12.__index = v12;
v12.new = function(v13, v14, v15)
    local v16 = setmetatable(v5.new(), v12);
    v16._dataBackends = {};
    v16._dataFrontend = nil;
    v16._initialRendererIDs = l_Set_0.new();
    v16._initialSnapshotsByRootID = l_Map_0.new();
    v16._inProgressOperationsByRootID = l_Map_0.new();
    v16._isProfiling = v15;
    v16._rendererIDsThatReportedProfilingData = l_Set_0.new();
    v16._rendererQueue = l_Set_0.new();
    v16._bridge = v13;
    v16._store = v14;
    v16._takeProfilingSnapshotRecursive = function(v17, v18, v19)
        local v20 = v17._store:getElementByID(v18);
        if v20 ~= nil then
            v19:set(v18, {
                id = v18, 
                children = l_Array_0.slice(v20.children, 0), 
                displayName = v20.displayName, 
                hocDisplayNames = v20.hocDisplayNames, 
                key = v20.key, 
                type = v20.type
            });
            l_Array_0.forEach(v20.children, function(v21)
                return v17:_takeProfilingSnapshotRecursive(v21, v19);
            end);
        end;
    end;
    v16.onBridgeOperations = function(v22, v23)
        local v24 = v23[1];
        local v25 = v23[2];
        if v22._isProfiling then
            local v26 = v22._inProgressOperationsByRootID:get(v25);
            if v26 == nil then
                v22._inProgressOperationsByRootID:set(v25, {
                    v23
                });
            else
                table.insert(v26, v23);
            end;
            if not v22._initialRendererIDs:has(v24) then
                v22._initialRendererIDs:add(v24);
            end;
            if not v22._initialSnapshotsByRootID:has(v25) then
                v22._initialSnapshotsByRootID:set(v25, l_Map_0.new());
            end;
            v22._rendererIDsThatReportedProfilingData:add(v24);
        end;
    end;
    v16.onBridgeProfilingData = function(v27, v28)
        if not v27._isProfiling then
            local l_rendererID_0 = v28.rendererID;
            if not v27._rendererQueue:has(l_rendererID_0) then
                error(string.format("Unexpected profiling data update from renderer \"%s\"", (tostring(l_rendererID_0))));
            end;
            table.insert(v27._dataBackends, v28);
            v27._rendererQueue:delete(l_rendererID_0);
            if v27._rendererQueue.size == 0 then
                v27._dataFrontend = l_prepareProfilingDataFrontendFromBackendAndStore_0(v27._dataBackends, v27._inProgressOperationsByRootID, v27._initialSnapshotsByRootID);
                l_Array_0.splice(v27._dataBackends, 0);
                v27:emit("isProcessingData");
            end;
            return ;
        else
            return ;
        end;
    end;
    v16.onBridgeShutdown = function(v30)
        v30._bridge:removeListener("operations", v30.onBridgeOperations);
        v30._bridge:removeListener("profilingData", v30.onBridgeProfilingData);
        v30._bridge:removeListener("profilingStatus", v30.onProfilingStatus);
        v30._bridge:removeListener("shutdown", v30.onBridgeShutdown);
    end;
    v16.onProfilingStatus = function(v31, v32)
        if v32 then
            l_Array_0.splice(v31._dataBackends, 0);
            v31._dataFrontend = nil;
            v31._initialRendererIDs:clear();
            v31._initialSnapshotsByRootID:clear();
            v31._inProgressOperationsByRootID:clear();
            v31._rendererIDsThatReportedProfilingData:clear();
            v31._rendererQueue:clear();
            for _, v34 in v31._store:getRootIDToRendererID() do
                if not v31._initialRendererIDs:has(v34) then
                    v31._initialRendererIDs:add(v34);
                end;
            end;
            for _, v36 in v31._store:getRoots() do
                local v37 = l_Map_0.new();
                v31._initialSnapshotsByRootID:set(v36, v37);
                v31:_takeProfilingSnapshotRecursive(v36, v37);
            end;
        end;
        if v31._isProfiling ~= v32 then
            v31._isProfiling = v32;
            v31._cache:invalidate();
            v31:emit("isProfiling");
            if not v32 then
                l_Array_0.splice(v31._dataBackends, 0);
                v31._rendererQueue:clear();
                for _, v39 in v31._rendererIDsThatReportedProfilingData, nil, nil do
                    if not v31._rendererQueue:has(v39) then
                        v31._rendererQueue:add(v39);
                        v31._bridge:send("getProfilingData", {
                            rendererID = v39
                        });
                    end;
                end;
                v31:emit("isProcessingData");
            end;
        end;
    end;
    v13:addListener("operations", function(...)
        return v16:onBridgeOperations(...);
    end);
    v13:addListener("profilingData", function(...)
        return v16:onBridgeProfilingData(...);
    end);
    v13:addListener("profilingStatus", function(...)
        return v16:onProfilingStatus(...);
    end);
    v13:addListener("shutdown", function(...)
        return v16:onBridgeShutdown(...);
    end);
    v13:send("getProfilingStatus");
    v16._cache = v11.new(v16);
    return v16;
end;
v12.getCommitData = function(v40, v41, v42)
    if v40._dataFrontend ~= nil then
        local v43 = v40._dataFrontend.dataForRoots:get(v41);
        if v43 ~= nil then
            local v44 = v43.commitData[v42];
            if v44 ~= nil then
                return v44;
            end;
        end;
    end;
    error(string.format("Could not find commit data for root \"%s\" and commit %s", tostring(v41), (tostring(v42))));
end;
v12.getDataForRoot = function(v45, v46)
    if v45._dataFrontend ~= nil then
        local v47 = v45._dataFrontend.dataForRoots:get(v46);
        if v47 ~= nil then
            return v47;
        end;
    end;
    error(string.format("Could not find commit data for root \"%s\"", (tostring(v46))));
end;
v12.didRecordCommits = function(v48)
    local v49 = false;
    if v48._dataFrontend ~= nil then
        v49 = v48._dataFrontend.dataForRoots.size > 0;
    end;
    return v49;
end;
v12.isProcessingData = function(v50)
    local v51 = true;
    if v50._rendererQueue.size <= 0 then
        v51 = #v50._dataBackends > 0;
    end;
    return v51;
end;
v12.isProfiling = function(v52)
    return v52._isProfiling;
end;
v12.profilingCache = function(v53)
    return v53._cache;
end;
v12.profilingData = function(v54, v55)
    if v55 == nil then
        return v54._dataFrontend;
    elseif not v54._isProfiling then
        l_Array_0.splice(v54._dataBackends, 0);
        v54._dataFrontend = v55;
        v54._initialRendererIDs:clear();
        v54._initialSnapshotsByRootID:clear();
        v54._inProgressOperationsByRootID:clear();
        v54._cache:invalidate();
        v54:emit("profilingData");
        return ;
    else
        l_console_0.warn("Profiling data cannot be updated while profiling is in progress.");
        return ;
    end;
end;
v12.clear = function(v56)
    l_Array_0.splice(v56._dataBackends, 0);
    v56._dataFrontend = nil;
    v56._initialRendererIDs:clear();
    v56._initialSnapshotsByRootID:clear();
    v56._inProgressOperationsByRootID:clear();
    v56._rendererQueue:clear();
    v56._cache:invalidate();
    v56:emit("profilingData");
end;
v12.startProfiling = function(v57)
    v57._bridge:send("startProfiling", v57._store:getRecordChangeDescriptions());
end;
v12.stopProfiling = function(v58)
    v58._bridge:send("stopProfiling");
end;
return v12;
