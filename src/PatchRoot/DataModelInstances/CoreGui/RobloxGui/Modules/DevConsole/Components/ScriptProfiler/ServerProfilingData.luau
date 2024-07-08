local v0 = require(script.Parent.Parent.Parent.Signal);
local _ = game:GetService("ScriptContext");
local v2 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v3 = {};
v3.__index = v3;
v3.new = function()
    local v4 = {};
    setmetatable(v4, v3);
    v4._serverStatsUpdated = v0.new();
    v4._serverStatsData = "";
    v4._lastUpdateTime = 0;
    v4._isRunning = false;
    return v4;
end;
v3.Signal = function(v5)
    return v5._serverStatsUpdated;
end;
v3.getCurrentData = function(v6)
    return v6._serverStatsData;
end;
v3.isRunning = function(v7)
    return v7._isRunning;
end;
v3.start = function(v8)
    local v9 = v2();
    if not (not v9 or v8._statsListenerConnection) then
        v8._statsListenerConnection = v9.StatsReceived:connect(function(v10)
            if not (not v10 or not v10.ServerScriptProfilingData) and #v10.ServerScriptProfilingData > 0 then
                v8._serverStatsData = v10.ServerScriptProfilingData;
                v8._serverStatsUpdated:Fire(v8._serverStatsData);
            end;
        end);
        v9:RequestServerStats(true);
        v8._isRunning = true;
    end;
end;
v3.stop = function(v11)
    if v11._statsListenerConnection then
        v11._statsListenerConnection:Disconnect();
        v11._statsListenerConnection = nil;
    end;
    v11._isRunning = false;
end;
return v3;
