local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).ServerJobsFormatting.ChartHeaderNames;
local v3 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v12 = {
    [l_ChartHeaderNames_0[1]] = function(v4, v5)
        return v4.name < v5.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v6, v7)
        return v6.dataStats.dataSet:back().data[1] < v7.dataStats.dataSet:back().data[1];
    end, 
    [l_ChartHeaderNames_0[3]] = function(v8, v9)
        return v8.dataStats.dataSet:back().data[2] < v9.dataStats.dataSet:back().data[2];
    end, 
    [l_ChartHeaderNames_0[4]] = function(v10, v11)
        return v10.dataStats.dataSet:back().data[3] < v11.dataStats.dataSet:back().data[3];
    end
};
local v13 = require(script.Parent.Parent.Parent.Util.minOfTable);
local v14 = require(script.Parent.Parent.Parent.Util.maxOfTable);
local v15 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v16 = {};
v16.__index = v16;
v16.new = function()
    local v17 = {};
    setmetatable(v17, v16);
    v17._serverJobsUpdated = v1.new();
    v17._serverJobsData = {};
    v17._sortedJobsData = {};
    v17._sortType = l_ChartHeaderNames_0[1];
    v17._lastUpdate = 0;
    v17._isRunning = false;
    return v17;
end;
v16.setSortType = function(v18, v19)
    if not v12[v19] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v19))), 2);
        return ;
    else
        v18._sortType = v19;
        table.sort(v18._sortedJobsData, v12[v18._sortType]);
        return ;
    end;
end;
v16.getSortType = function(v20)
    return v20._sortType;
end;
v16.Signal = function(v21)
    return v21._serverJobsUpdated;
end;
v16.getCurrentData = function(v22)
    return v22._sortedJobsData;
end;
v16.updateServerJobsData = function(v23, v24)
    v23._lastUpdate = os.time();
    for v25, v26 in pairs(v24) do
        if v23._serverJobsData[v25] then
            local v27 = {};
            for v28, v29 in pairs(v23._serverJobsData[v25].max) do
                v27[v28] = v29;
            end;
            local v30 = {};
            for v31, v32 in pairs(v23._serverJobsData[v25].min) do
                v30[v31] = v32;
            end;
            local v33 = v23._serverJobsData[v25].dataSet:push_back({
                data = v26, 
                time = v23._lastUpdate
            });
            if v33 then
                for v34, v35 in pairs(v33.data) do
                    if v27[v34] == v35 then
                        local v36 = v23._serverJobsData[v25].dataSet:iterator();
                        local v37 = v36:next();
                        v27[v34] = v30[v34];
                        while v37 do
                            v27[v34] = v37.data[v34] < v27[v34] and v27[v34] or v37.data[v34];
                            v37 = v36:next();
                        end;
                    end;
                end;
                for v38, v39 in pairs(v33.data) do
                    if v30[v38] == v39 then
                        local v40 = v23._serverJobsData[v25].dataSet:iterator();
                        local v41 = v40:next();
                        v30[v38] = v27[v38];
                        while v41 do
                            v30[v38] = v30[v38] < v41.data[v38] and v30[v38] or v41.data[v38];
                            v41 = v40:next();
                        end;
                    end;
                end;
            end;
            v23._serverJobsData[v25].max = v14(v27, v26);
            v23._serverJobsData[v25].min = v13(v30, v26);
        else
            local v42 = v0.new(v3);
            v42:push_back({
                data = v26, 
                time = v23._lastUpdate
            });
            v23._serverJobsData[v25] = {
                max = v26, 
                min = v26, 
                dataSet = v42
            };
            table.insert(v23._sortedJobsData, {
                name = v25, 
                dataStats = v23._serverJobsData[v25]
            });
        end;
    end;
end;
v16.isRunning = function(v43)
    return v43._isRunning;
end;
v16.start = function(v44)
    local v45 = v15();
    if not (not v45 or v44._statsListenerConnection) then
        v44._statsListenerConnection = v45.StatsReceived:connect(function(v46)
            local l_Jobs_0 = v46.Jobs;
            if l_Jobs_0 then
                v44:updateServerJobsData(l_Jobs_0);
                v44._serverJobsUpdated:Fire(v44._sortedJobsData);
            end;
        end);
        v45:RequestServerStats(true);
        v44._isRunning = true;
    end;
end;
v16.stop = function(v48)
    if v48._statsListenerConnection then
        v48._statsListenerConnection:Disconnect();
        v48._statsListenerConnection = nil;
        v48._isRunning = false;
    end;
end;
return v16;
