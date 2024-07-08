local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v3 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = {};
    setmetatable(v5, v4);
    v5._serverStatsUpdated = v1.new();
    v5._serverStatsPing = v1.new();
    v5._serverStatsData = {};
    v5._serverStatsDataCount = 0;
    v5._lastUpdateTime = 0;
    v5._isRunning = false;
    return v5;
end;
v4.avgPing = function(v6)
    return v6._serverStatsPing;
end;
v4.Signal = function(v7)
    return v7._serverStatsUpdated;
end;
v4.getCurrentData = function(v8)
    return v8._serverStatsData;
end;
v4.updateValue = function(v9, v10, v11)
    if v9._serverStatsData[v10] then
        local v12 = v9._serverStatsData[v10];
        local l_max_0 = v12.max;
        local l_min_0 = v12.min;
        local v15 = v9._serverStatsData[v10].dataSet:push_back({
            value = v11, 
            time = v9._lastUpdateTime
        });
        if v15 then
            local v16 = v9._serverStatsData[v10].dataSet:iterator();
            local v17 = v16:next();
            if l_max_0 == v15.value then
                l_max_0 = l_min_0;
                while v17 do
                    l_max_0 = v17.value < l_max_0 and l_max_0 or v17.value;
                    v17 = v16:next();
                end;
            end;
            if l_min_0 == v15.value then
                l_min_0 = l_max_0;
                while v17 do
                    l_min_0 = l_min_0 < v17.value and l_min_0 or v17.value;
                    v17 = v16:next();
                end;
            end;
        end;
        v9._serverStatsData[v10].max = l_max_0 < v11 and v11 or l_max_0;
        v9._serverStatsData[v10].min = l_min_0 < v11 and l_min_0 or v11;
        return ;
    else
        local v18 = v0.new(v2);
        v18:push_back({
            value = v11, 
            time = v9._lastUpdateTime
        });
        v9._serverStatsData[v10] = {
            max = v11, 
            min = v11, 
            dataSet = v18
        };
        return ;
    end;
end;
v4.isRunning = function(v19)
    return v19._isRunning;
end;
v4.start = function(v20)
    local v21 = v3();
    if not (not v21 or v20._statsListenerConnection) then
        v20._statsListenerConnection = v21.StatsReceived:connect(function(v22)
            if v22 then
                v20._lastUpdateTime = os.time();
                local v23 = 0;
                for v24, v25 in pairs(v22) do
                    if type(v25) == "number" then
                        v20:updateValue(v24, v25);
                        v23 = v23 + 1;
                    end;
                end;
                v20._serverStatsDataCount = v23;
                v20._serverStatsUpdated:Fire(v20._serverStatsData);
                if v20._serverStatsData["Avg Ping ms"] then
                    v20._serverStatsPing:Fire(v20._serverStatsData["Avg Ping ms"].dataSet:back().value);
                end;
            end;
        end);
        v21:RequestServerStats(true);
        v20._isRunning = true;
    end;
end;
v4.stop = function(v26)
    if v26._statsListenerConnection then
        v26._statsListenerConnection:Disconnect();
        v26._statsListenerConnection = nil;
    end;
    v26._isRunning = false;
end;
return v4;
