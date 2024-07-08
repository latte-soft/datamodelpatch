local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4)
    local v5 = {};
    setmetatable(v5, v1);
    v5._statType = v2;
    v5._numSamples = v3;
    v5._pauseBetweenSamples = v4;
    v5._statName = v0.StatNames[v5._statType];
    v5._statMaxName = v0.StatMaxNames[v5._statType];
    v5._samples = {};
    for v6 = 0, v3 - 1 do
        v5._samples[v6] = 0;
    end;
    v5._oldestIndex = 0;
    v5._listeners = {};
    v5._nextListenerId = 1001;
    return v5;
end;
v1.AddListener = function(v7, v8)
    local l__nextListenerId_0 = v7._nextListenerId;
    v7._nextListenerId = v7._nextListenerId + 1;
    v7._listeners[l__nextListenerId_0] = v8;
    return l__nextListenerId_0;
end;
v1.RemoveListener = function(v10, v11)
    v10._listeners[v11] = nil;
end;
v1._notifyAllListeners = function(v12)
    for _, v14 in pairs(v12._listeners) do
        v14();
    end;
end;
v1.StartListening = function(v15)
    if v15._listening == true then
        return ;
    else
        spawn(function()
            v15._listening = true;
            while v15._listening do
                v15:_storeStatValue((v15:_getStatValue()));
                v15:_notifyAllListeners();
                wait(v15._pauseBetweenSamples);
            end;
        end);
        return ;
    end;
end;
v1.StopListening = function(v16)
    v16._listening = false;
end;
v1.GetValues = function(v17)
    local v18 = {};
    local _ = nil;
    for v20 = 0, v17._numSamples - 1 do
        v18[v20 + 1] = v17._samples[(v17._oldestIndex + v20) % v17._numSamples];
    end;
    return v18;
end;
v1.GetAverage = function(v21)
    local v22 = 0;
    for v23 = 0, v21._numSamples - 1 do
        v22 = v22 + v21._samples[v23];
    end;
    return v22 / v21._numSamples;
end;
v1.GetLatestValue = function(v24)
    return v24._samples[((v24._oldestIndex + v24._numSamples) - 1) % v24._numSamples];
end;
v1._storeStatValue = function(v25, v26)
    v25._samples[v25._oldestIndex] = v26;
    v25._oldestIndex = (v25._oldestIndex + 1) % v25._numSamples;
end;
v1._getStatValue = function(v27)
    local l_Stats_0 = game:GetService("Stats");
    if l_Stats_0 == nil then
        return 0;
    else
        local l_PerformanceStats_0 = l_Stats_0:FindFirstChild("PerformanceStats");
        if l_PerformanceStats_0 == nil then
            return 0;
        else
            local l_l_PerformanceStats_0_FirstChild_0 = l_PerformanceStats_0:FindFirstChild(v27._statName);
            if l_l_PerformanceStats_0_FirstChild_0 == nil then
                return 0;
            else
                return l_l_PerformanceStats_0_FirstChild_0:GetValue();
            end;
        end;
    end;
end;
v1.GetTarget = function(v31)
    local l_Stats_1 = game:GetService("Stats");
    if l_Stats_1 == nil then
        return 0;
    else
        local l_PerformanceStats_1 = l_Stats_1:FindFirstChild("PerformanceStats");
        if l_PerformanceStats_1 == nil then
            return 0;
        else
            local l_l_PerformanceStats_1_FirstChild_0 = l_PerformanceStats_1:FindFirstChild(v31._statMaxName);
            if l_l_PerformanceStats_1_FirstChild_0 == nil then
                return 0;
            else
                return l_l_PerformanceStats_1_FirstChild_0:GetValue();
            end;
        end;
    end;
end;
return v1;
