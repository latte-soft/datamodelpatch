local _ = game:GetService("ScriptContext");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.Parent.Parent.Signal);
local v3 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = {};
    setmetatable(v5, v4);
    v5._serverStatsUpdated = v2.new();
    v5._serverStatsData = {};
    v5._isRunning = false;
    return v5;
end;
v4.Signal = function(v6)
    return v6._serverStatsUpdated;
end;
v4.getCurrentData = function(v7)
    return v7._serverStatsData;
end;
v4.isRunning = function(v8)
    return v8._isRunning;
end;
v4.start = function(v9)
    local v10 = v3();
    if not (not v10 or v9._statsListenerConnection) then
        v9._statsListenerConnection = v10.StatsReceived:connect(function(v11)
            if not (not v11 or not v11.ServerLuauHeapData) and #v11.ServerLuauHeapData > 0 then
                v9._serverStatsData = l_HttpService_0:JSONDecode(v11.ServerLuauHeapData);
                v9._serverStatsUpdated:Fire(v9._serverStatsData);
            end;
        end);
        v10:RequestServerStats(true);
        v9._isRunning = true;
    end;
end;
v4.stop = function(v12)
    if v12._statsListenerConnection then
        v12._statsListenerConnection:Disconnect();
        v12._statsListenerConnection = nil;
    end;
    v12._isRunning = false;
end;
return v4;
