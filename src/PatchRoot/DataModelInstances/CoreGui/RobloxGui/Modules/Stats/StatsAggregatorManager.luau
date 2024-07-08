local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v3 = {};
v3.__index = v3;
v3.SecondsBetweenUpdate = 1;
v3.NumSamplesToKeep = 20;
local v4 = nil;
v3.getSingleton = function()
    if v4 == nil then
        v4 = v3.__new();
        v4:StartListening();
    end;
    return v4;
end;
v3.__new = function()
    local v5 = {};
    setmetatable(v5, v3);
    v5._statsAggregators = {};
    for _, v7 in ipairs(v1.AllStatTypes) do
        v5._statsAggregators[v7] = v2.new(v7, v3.NumSamplesToKeep, v3.SecondsBetweenUpdate);
    end;
    return v5;
end;
v3.StartListening = function(v8)
    for _, v10 in pairs(v8._statsAggregators) do
        v10:StartListening();
    end;
end;
v3.StopListening = function(v11)
    for _, v13 in pairs(v11._statsAggregators) do
        v13:StopListening();
    end;
end;
v3.GetAggregator = function(v14, v15)
    return v14._statsAggregators[v15];
end;
return v3;
