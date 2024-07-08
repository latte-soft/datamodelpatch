local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = require(script.Parent.Parent.Parent.Constants);
local v3 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local l_ChartHeaderNames_0 = v2.ServerScriptsFormatting.ChartHeaderNames;
local v11 = {
    [l_ChartHeaderNames_0[1]] = function(v5, v6)
        return v5.dataStats.dataSet:back().name < v6.dataStats.dataSet:back().name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v7, v8)
        return v7.dataStats.dataSet:back().data[1] < v8.dataStats.dataSet:back().data[1];
    end, 
    [l_ChartHeaderNames_0[3]] = function(v9, v10)
        return v9.dataStats.dataSet:back().data[2] < v10.dataStats.dataSet:back().data[2];
    end
};
local v12 = require(script.Parent.Parent.Parent.Util.minOfTable);
local v13 = require(script.Parent.Parent.Parent.Util.maxOfTable);
local v14 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v15 = {};
v15.__index = v15;
v15.new = function()
    local v16 = {};
    setmetatable(v16, v15);
    v16._serverScriptsUpdated = v1.new();
    v16._serverScriptsData = {};
    v16._lastUpdate = 0;
    v16._sortedScriptsData = {};
    v16._sortType = l_ChartHeaderNames_0[1];
    v16._isRunning = false;
    return v16;
end;
v15.setSortType = function(v17, v18)
    if not v11[v18] then
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v18))), 2);
        return ;
    else
        v17._sortType = v18;
        table.sort(v17._sortedScriptsData, v11[v17._sortType]);
        return ;
    end;
end;
v15.getSortType = function(v19)
    return v19._sortType;
end;
v15.Signal = function(v20)
    return v20._serverScriptsUpdated;
end;
v15.getCurrentData = function(v21)
    return v21._sortedScriptsData;
end;
v15.updateScriptsData = function(v22, v23)
    v22._lastUpdate = os.time();
    for v24, v25 in pairs(v23) do
        if v22._serverScriptsData[v24] then
            local v26 = {};
            for v27, v28 in pairs(v22._serverScriptsData[v24].max) do
                v26[v27] = v28;
            end;
            local v29 = {};
            for v30, v31 in pairs(v22._serverScriptsData[v24].min) do
                v29[v30] = v31;
            end;
            local v32 = v22._serverScriptsData[v24].dataSet:push_back({
                data = v25, 
                time = v22._lastUpdate
            });
            if v32 then
                for v33, v34 in pairs(v32.data) do
                    if v26[v33] == v34 then
                        local v35 = v22._serverScriptsData[v24].dataSet:iterator();
                        local v36 = v35:next();
                        v26[v33] = v29[v33];
                        while v36 do
                            v26[v33] = v36.data[v33] < v26[v33] and v26[v33] or v36.data[v33];
                            v36 = v35:next();
                        end;
                    end;
                end;
                for v37, v38 in pairs(v32.data) do
                    if v29[v37] == v38 then
                        local v39 = v22._serverScriptsData[v24].dataSet:iterator();
                        local v40 = v39:next();
                        v29[v37] = v26[v37];
                        while v40 do
                            v29[v37] = v29[v37] < v40.data[v37] and v29[v37] or v40.data[v37];
                            v40 = v39:next();
                        end;
                    end;
                end;
            end;
            v22._serverScriptsData[v24].max = v13(v26, v25);
            v22._serverScriptsData[v24].min = v12(v29, v25);
        else
            local v41 = v0.new(v3);
            v41:push_back({
                data = v25, 
                time = v22._lastUpdate
            });
            v22._serverScriptsData[v24] = {
                max = v25, 
                min = v25, 
                dataSet = v41
            };
            table.insert(v22._sortedScriptsData, {
                name = v24, 
                dataStats = v22._serverScriptsData[v24]
            });
        end;
    end;
end;
v15.isRunning = function(v42)
    return v42._isRunning;
end;
v15.start = function(v43)
    local v44 = v14();
    if not (not v44 or v43._statsListenerConnection) then
        v43._statsListenerConnection = v44.StatsReceived:connect(function(v45)
            if v45 then
                v43._lastUpdate = os.time();
                local l_Scripts_0 = v45.Scripts;
                if l_Scripts_0 then
                    v43:updateScriptsData(l_Scripts_0);
                end;
                v43._serverScriptsUpdated:Fire(v43._sortedScriptsData);
            end;
        end);
        v44:RequestServerStats(true);
        v43._isRunning = true;
    end;
end;
v15.stop = function(v47)
    if v47._statsListenerConnection then
        v47._statsListenerConnection:Disconnect();
        v47._statsListenerConnection = nil;
    end;
    v47._isRunning = false;
end;
return v15;
