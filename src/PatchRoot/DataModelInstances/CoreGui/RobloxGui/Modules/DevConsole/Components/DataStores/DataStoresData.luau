local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v3 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = {};
    setmetatable(v5, v4);
    v5._dataStoresUpdated = v1.new();
    v5._dataStoresData = {};
    v5._dataStoresDataCount = 0;
    v5._lastUpdateTime = 0;
    v5._isRunning = false;
    return v5;
end;
v4.Signal = function(v6)
    return v6._dataStoresUpdated;
end;
v4.getCurrentData = function(v7)
    return v7._dataStoresData, v7._dataStoresDataCount;
end;
v4.updateValue = function(v8, v9, v10)
    if v8._dataStoresData[v9] then
        local v11 = v8._dataStoresData[v9];
        local l_max_0 = v11.max;
        local l_min_0 = v11.min;
        local v14 = v8._dataStoresData[v9].dataSet:push_back({
            value = v10, 
            time = v8._lastUpdateTime
        });
        if v14 then
            local v15 = v8._dataStoresData[v9].dataSet:iterator();
            local v16 = v15:next();
            if l_max_0 == v14.value then
                l_max_0 = l_min_0;
                while v16 do
                    l_max_0 = v16.value < l_max_0 and l_max_0 or v16.value;
                    v16 = v15:next();
                end;
            end;
            if l_min_0 == v14.value then
                l_min_0 = l_max_0;
                while v16 do
                    l_min_0 = l_min_0 < v16.value and l_min_0 or v16.value;
                    v16 = v15:next();
                end;
            end;
        end;
        v8._dataStoresData[v9].max = l_max_0 < v10 and v10 or l_max_0;
        v8._dataStoresData[v9].min = l_min_0 < v10 and l_min_0 or v10;
        return ;
    else
        local v17 = v0.new(v2);
        v17:push_back({
            value = v10, 
            time = v8._lastUpdateTime
        });
        v8._dataStoresData[v9] = {
            max = v10, 
            min = v10, 
            dataSet = v17
        };
        return ;
    end;
end;
v4.isRunning = function(v18)
    return v18._isRunning;
end;
v4.start = function(v19)
    local v20 = v3();
    if not (not v20 or v19._statsListenerConnection) then
        v19._statsListenerConnection = v20.StatsReceived:connect(function(v21)
            local l_DataStoreBudget_0 = v21.DataStoreBudget;
            v19._lastUpdateTime = os.time();
            if l_DataStoreBudget_0 then
                local v23 = 0;
                for v24, v25 in pairs(l_DataStoreBudget_0) do
                    if type(v25) == "number" then
                        v19:updateValue(v24, v25);
                        v23 = v23 + 1;
                    end;
                end;
                v19._dataStoresDataCount = v23;
                v19._dataStoresUpdated:Fire(v19._dataStoresData, v19._dataStoresDataCount);
            end;
        end);
        v20:RequestServerStats(true);
        v19._isRunning = true;
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
