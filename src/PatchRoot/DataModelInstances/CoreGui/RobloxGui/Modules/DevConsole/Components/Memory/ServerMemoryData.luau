local v0 = require(script.Parent.Parent.Parent.Signal);
local v1 = require(script.Parent.Parent.Parent.CircularBuffer);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames;
local v3 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v8 = {
    [l_ChartHeaderNames_0[1]] = function(v4, v5)
        return v4.name < v5.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v6, v7)
        return v6.dataStats.dataSet:back().data < v7.dataStats.dataSet:back().data;
    end
};
local v9 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v10 = {};
v10.__index = v10;
v10.new = function()
    local v11 = {};
    setmetatable(v11, v10);
    v11._init = false;
    v11._isRunning = false;
    v11._totalMemory = 0;
    v11._memoryData = {};
    v11._memoryDataSorted = {};
    v11._coreTreeData = {};
    v11._coreTreeDataSorted = {};
    v11._placeTreeData = {};
    v11._placeTreeDataSorted = {};
    v11._placeScriptTreeData = {};
    v11._placeScriptTreeDataSorted = {};
    v11._coreScriptTreeData = {};
    v11._coreScriptTreeDataSorted = {};
    v11._treeViewUpdated = v0.new();
    v11._sortType = l_ChartHeaderNames_0[1];
    return v11;
end;
v10.updateEntry = function(v12, v13, v14, v15, v16)
    if v13[v15] then
        local l_max_0 = v13[v15].max;
        local l_min_0 = v13[v15].min;
        local v19 = v13[v15].dataSet:push_back({
            data = v16, 
            time = v12._lastUpdate
        });
        if v19 then
            local v20 = v13[v15].dataSet:iterator();
            local v21 = v20:next();
            if l_max_0 == v19.data then
                l_max_0 = l_min_0;
                while v21 do
                    l_max_0 = v21.data < l_max_0 and l_max_0 or v21.data;
                    v21 = v20:next();
                end;
            end;
            if l_min_0 == v19.data then
                l_min_0 = l_max_0;
                while v21 do
                    l_min_0 = l_min_0 < v21.data and l_min_0 or v21.data;
                    v21 = v20:next();
                end;
            end;
        end;
        v13[v15].max = l_max_0 < v16 and v16 or l_max_0;
        v13[v15].min = l_min_0 < v16 and l_min_0 or v16;
        return ;
    else
        local v22 = v1.new(v3);
        v22:push_back({
            data = v16, 
            time = v12._lastUpdate
        });
        v13[v15] = {
            min = v16, 
            max = v16, 
            dataSet = v22
        };
        table.insert(v14, {
            name = v15, 
            dataStats = v13[v15]
        });
        return ;
    end;
end;
v10.updateEntryList = function(v23, v24, v25, v26)
    local v27 = 0;
    for v28, v29 in pairs(v26) do
        local v30 = v29 / 1048576;
        v27 = v27 + v30;
        v23:updateEntry(v24, v25, v28, v30);
    end;
    for v31, _ in pairs(v24) do
        if v26[v31] == nil then
            v24[v31] = nil;
            for v33, v34 in ipairs(v25) do
                if v31 == v34.name then
                    table.remove(v25, v33);
                    break;
                end;
            end;
        end;
    end;
    return v27;
end;
v10.updateWithTreeStats = function(v35, v36)
    local v37 = {
        PlaceMemory = 0, 
        CoreMemory = 0, 
        UntrackedMemory = 0, 
        PlaceScriptMemory = 0, 
        CoreScriptMemory = 0
    };
    for v38, v39 in pairs(v36) do
        if v38 == "totalServerMemory" then
            v35._totalMemory = v39 / 1048576;
        elseif v38 == "developerTags" then
            v37.PlaceMemory = v35:updateEntryList(v35._placeTreeData, v35._placeTreeDataSorted, v39);
        elseif v38 == "internalCategories" then
            v37.CoreMemory = v35:updateEntryList(v35._coreTreeData, v35._coreTreeDataSorted, v39);
        elseif v38 == "placeScriptMemoryCategories" then
            v37.PlaceScriptMemory = v35:updateEntryList(v35._placeScriptTreeData, v35._placeScriptTreeDataSorted, v39);
        elseif v38 == "coreScriptMemoryCategories" then
            v37.CoreScriptMemory = v35:updateEntryList(v35._coreScriptTreeData, v35._coreScriptTreeDataSorted, v39);
        end;
    end;
    v37.UntrackedMemory = (v35._totalMemory - v37.PlaceMemory) - v37.CoreMemory;
    if not v35._init then
        local v40 = {};
        local v41 = {};
        for v42, v43 in pairs(v37) do
            v35:updateEntry(v40, v41, v42, v43);
        end;
        v35:updateEntry(v35._memoryData, v35._memoryDataSorted, "Memory", v35._totalMemory);
        v40.PlaceMemory.children = v35._placeTreeData;
        v40.PlaceMemory.sortedChildren = v35._placeTreeDataSorted;
        v40.CoreMemory.children = v35._coreTreeData;
        v40.CoreMemory.sortedChildren = v35._coreTreeDataSorted;
        v40.PlaceScriptMemory.children = v35._placeScriptTreeData;
        v40.PlaceScriptMemory.sortedChildren = v35._placeScriptTreeDataSorted;
        v40.CoreScriptMemory.children = v35._coreScriptTreeData;
        v40.CoreScriptMemory.sortedChildren = v35._coreScriptTreeDataSorted;
        v35._memoryData.Memory.children = v40;
        v35._memoryData.Memory.sortedChildren = v41;
        v35._init = true;
        return ;
    else
        for v44, v45 in pairs(v37) do
            v35:updateEntry(v35._memoryData.Memory.children, v35._memoryData.Memory.sortedChildren, v44, v45);
        end;
        v35:updateEntry(v35._memoryData, v35._memoryDataSorted, "Memory", v35._totalMemory);
        return ;
    end;
end;
v10.totalMemSignal = function(v46)
    return v46._totalMemoryUpdated;
end;
v10.treeUpdatedSignal = function(v47)
    return v47._treeViewUpdated;
end;
v10.getSortType = function(v48)
    return v48._sortType;
end;
local function v49(v50, v51)
    table.sort(v50, v51);
    for _, v53 in pairs(v50) do
        if v53.dataStats.sortedChildren then
            v49(v53.dataStats.sortedChildren, v51);
        end;
    end;
end;
v10.setSortType = function(v54, v55)
    if not v8[v55] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v55))), 2);
        return ;
    else
        v54._sortType = v55;
        v49(v54._memoryDataSorted, v8[v54._sortType]);
        return ;
    end;
end;
v10.getMemoryData = function(v56)
    return v56._memoryDataSorted;
end;
v10.isRunning = function(v57)
    return v57._isRunning;
end;
v10.start = function(v58)
    local v59 = v9();
    if not (not v59 or v58._statsListenerConnection) then
        v58._statsListenerConnection = v59.StatsReceived:connect(function(v60)
            if v60.ServerMemoryTree then
                v58._lastUpdate = os.time();
                local l_ServerMemoryTree_0 = v60.ServerMemoryTree;
                if l_ServerMemoryTree_0 then
                    v58:updateWithTreeStats(l_ServerMemoryTree_0);
                    v58._treeViewUpdated:Fire(v58._memoryDataSorted);
                end;
                return ;
            else
                return ;
            end;
        end);
        v59:RequestServerStats(true);
        v58._isRunning = true;
    end;
end;
v10.stop = function(v62)
    local v63 = v9();
    if v63 then
        v63:RequestServerStats(false);
        v62._statsListenerConnection:Disconnect();
        v62._isRunning = false;
    end;
end;
return v10;
