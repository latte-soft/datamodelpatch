local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_RunService_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).RunService;
local v3 = require(script.Parent.IntervalPerformanceTrackerTelemetryConfig);
game:DefineFastFlag("DebugPrintIntervalPerformanceTrackerResults", false);
local l_GetFFlagFixInvertedIntervalFPSMetric_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixInvertedIntervalFPSMetric;
local v5 = math.random(0, 1000) < require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream();
local v15 = {
    averageFPS = {
        reducer = function(v6)
            return {
                framesCount = v6.framesCount == nil and 0 or v6.framesCount + 1, 
                startTime = v6.startTime or tick()
            };
        end, 
        getResult = function(v7)
            if not l_GetFFlagFixInvertedIntervalFPSMetric_0() then
                if (v7.framesCount ~= nil and v7.framesCount > 0) and v7.startTime ~= nil then
                    return (tick() - v7.startTime) / v7.framesCount;
                else
                    return nil;
                end;
            else
                local v8 = tick();
                if not ((v7.framesCount ~= nil and v7.framesCount ~= 0) and v7.startTime ~= nil) or v8 == v7.startTime then
                    return nil;
                else
                    return v7.framesCount / (v8 - v7.startTime);
                end;
            end;
        end
    }, 
    framesCount = {
        reducer = function(v9)
            return {
                framesCount = v9.framesCount == nil and 0 or v9.framesCount + 1
            };
        end, 
        getResult = function(v10)
            return v10.framesCount;
        end
    }, 
    longestFrameTime = {
        reducer = function(v11)
            return {
                framesCount = v11.framesCount == nil and 0 or v11.framesCount + 1, 
                longestFrameTime = (not (v11.longestFrameTime ~= nil) or v11.previousTime == nil) and 0 or math.max(v11.longestFrameTime, tick() - v11.previousTime), 
                previousTime = tick()
            };
        end, 
        getResult = function(v12)
            if v12.framesCount < 1 then
                return nil;
            else
                return v12.longestFrameTime;
            end;
        end
    }, 
    duration = {
        reducer = function(v13)
            return {
                startTime = v13.startTime or tick()
            };
        end, 
        getResult = function(v14)
            return tick() - v14.startTime;
        end
    }
};
local v16 = {};
local v17 = {};
for v18, _ in v15, nil, nil do
    v16[v18] = v18;
    table.insert(v17, v18);
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22)
    local v23 = {
        _metricsData = {}, 
        _timeout = v21, 
        _startTime = nil, 
        _metricsToTrack = v22
    };
    setmetatable(v23, v20);
    return v23;
end;
v20.getMetricsToTrack = function(v24)
    if v24._metricsToTrack and #v24._metricsToTrack > 0 then
        return v24._metricsToTrack;
    else
        return v17;
    end;
end;
v20.hasReachedTimeout = function(v25)
    if v25._timeout ~= nil and v25._startTime ~= nil then
        return v25._timeout < tick() - v25._startTime;
    else
        return false;
    end;
end;
v20.updateMetrics = function(v26)
    if v26._startTime == nil then
        v26._startTime = tick();
    end;
    for _, v28 in (v26:getMetricsToTrack()), nil, nil do
        local v29 = v15[v28];
        if v29 then
            if not v26._metricsData[v28] then
                v26._metricsData[v28] = {};
            end;
            v26._metricsData[v28] = v29.reducer(v26._metricsData[v28]);
        end;
    end;
end;
v20.getResult = function(v30)
    local v31 = {};
    for _, v33 in (v30:getMetricsToTrack()), nil, nil do
        local v34 = v15[v33];
        if v34 then
            v31[v33] = v34.getResult(v30._metricsData[v33]);
        end;
    end;
    return v31;
end;
local v35 = {};
v35.__index = v35;
v35.new = function()
    local v36 = {
        _metricsTrackers = v15, 
        _intervals = {}, 
        _renderSteppedConnection = nil, 
        availableMetricsEnum = v16
    };
    setmetatable(v36, v35);
    return v36;
end;
v35._updateIntervals = function(v37)
    for v38, v39 in v37._intervals, nil, nil do
        v39:updateMetrics();
        if v39:hasReachedTimeout() then
            v37:stopAndLogTracking(v38);
        end;
    end;
end;
v35.startTracking = function(v40, v41, v42, v43)
    if v5 then
        if not v40._intervals[v41] then
            local v44 = v20.new(v42, v43);
            v40._intervals[v41] = v44;
            v44:updateMetrics();
        end;
        if not v40._renderSteppedConnection then
            v40._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function()
                v40:_updateIntervals();
            end);
        end;
        return ;
    else
        return ;
    end;
end;
v35.stopAndLogTracking = function(v45, v46)
    if v5 then
        local v47 = v45._intervals[v46];
        if v47 then
            local v48 = v47:getResult();
            local v49 = {
                intervalName = v46
            };
            local v50 = 0;
            for v51, v52 in v48, nil, nil do
                if v52 ~= nil then
                    v50 = v50 + 1;
                end;
                v49[v51] = v52;
            end;
            if v50 > 0 then
                l_default_0:logRobloxTelemetryEvent(v3, nil, v49);
                if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
                    print("IntervalPerformanceTracker:" .. tostring(v46) .. " logged with results:");
                    for v53, v54 in v49, nil, nil do
                        print("\t" .. tostring(v53) .. " = " .. tostring(v54));
                    end;
                end;
            end;
            v45._intervals[v46] = nil;
        end;
        v45:disconnectUnusedRenderStepped();
        return ;
    else
        return ;
    end;
end;
v35.cancelTracking = function(v55, v56)
    if v5 then
        v55._intervals[v56] = nil;
        v55:disconnectUnusedRenderStepped();
        return ;
    else
        return ;
    end;
end;
v35.disconnectUnusedRenderStepped = function(v57)
    if not (next(v57._intervals) or not v57._renderSteppedConnection) then
        v57._renderSteppedConnection:Disconnect();
        v57._renderSteppedConnection = nil;
    end;
end;
v35.class = v35;
return v35.new();
