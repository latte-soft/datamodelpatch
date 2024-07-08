local l_Parent_0 = script.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local l_delay_0 = delay;
local l_tick_0 = tick;
local l_time_0 = time;
local l_DateTime_0 = DateTime;
local l_os_0 = os;
local l_task_0 = task;
local v9 = {};
v9.__index = v9;
v9.new = function()
    local v10 = l_ModuleMocker_0.new();
    local v11 = v10:fn(l_delay_0);
    local v12 = v10:fn(l_tick_0);
    local v13 = v10:fn(l_time_0);
    local v14 = {
        now = v10:fn(l_DateTime_0.now), 
        fromUnixTimestamp = l_DateTime_0.fromUnixTimestamp, 
        fromUnixTimestampMillis = l_DateTime_0.fromUnixTimestampMillis, 
        fromUniversalTime = l_DateTime_0.fromUniversalTime, 
        fromLocalTime = l_DateTime_0.fromLocalTime, 
        fromIsoDate = l_DateTime_0.fromIsoDate
    };
    local v15 = {
        time = v10:fn(l_os_0.time), 
        clock = v10:fn(l_os_0.clock)
    };
    setmetatable(v15, {
        __index = l_os_0
    });
    local v16 = {
        delay = v10:fn(l_task_0.delay)
    };
    setmetatable(v16, {
        __index = l_task_0
    });
    local v17 = {
        _fakingTime = false, 
        _timeouts = {}, 
        _mock = v10, 
        _mockTimeMs = 0, 
        _mockSystemTime = l_DateTime_0.now().UnixTimestamp, 
        _engineFrameTime = 0, 
        delayOverride = v11, 
        tickOverride = v12, 
        timeOverride = v13, 
        dateTimeOverride = v14, 
        osOverride = v15, 
        taskOverride = v16
    };
    setmetatable(v17, v9);
    return v17;
end;
v9._advanceToTime = function(v18, v19)
    local l_v19_0 = v19;
    if v18._mockTimeMs < v19 then
        if v18._engineFrameTime > 0 then
            l_v19_0 = math.floor(v19 / v18._engineFrameTime) * v18._engineFrameTime;
        end;
        local v21 = l_v19_0 - v18._mockTimeMs;
        v18._mockTimeMs = l_v19_0;
        v18._mockSystemTime = v18._mockSystemTime + v21 / 1000;
    end;
end;
v9.clearAllTimers = function(v22)
    if v22._fakingTime then
        v22._timeouts = {};
    end;
end;
v9.dispose = function(v23)
    v23:useRealTimers();
end;
v9.runAllTimers = function(v24)
    if v24:_checkFakeTimers() then
        for _, v26 in v24._timeouts, nil, nil do
            v24:_advanceToTime(v26.time + v24._engineFrameTime);
            v26.callback(unpack(v26.args));
        end;
    end;
    v24._timeouts = {};
end;
v9.runOnlyPendingTimers = function(v27)
    if v27:_checkFakeTimers() then
        local v28 = {};
        for _, v30 in v27._timeouts, nil, nil do
            table.insert(v28, v30);
        end;
        v27._timeouts = {};
        for _, v32 in v28, nil, nil do
            v27:_advanceToTime(v32.time + v27._engineFrameTime);
            v32.callback(unpack(v32.args));
        end;
    end;
end;
v9.advanceTimersToNextTimer = function(v33, v34)
    local v35 = v34 or 1;
    if v33:_checkFakeTimers() then
        local v36 = {};
        local v37 = -1;
        for _, v39 in v33._timeouts, nil, nil do
            if v37 < v39.time and v35 > 0 then
                v37 = if v33._engineFrameTime > 0 then math.floor(v39.time / v33._engineFrameTime + 1) * v33._engineFrameTime else v39.time;
                v33:_advanceToTime(v37);
                v35 = v35 - 1;
            end;
            if v39.time <= v33._mockTimeMs then
                v39.callback(unpack(v39.args));
            else
                table.insert(v36, v39);
            end;
        end;
        v33._timeouts = v36;
    end;
end;
v9.advanceTimersByTime = function(v40, v41)
    if v40:_checkFakeTimers() then
        local v42 = v40._mockTimeMs + v41;
        if v40._engineFrameTime > 0 then
            v42 = (math.floor(v42 / v40._engineFrameTime) + 1) * v40._engineFrameTime;
        end;
        local v43 = {};
        for _, v45 in v40._timeouts, nil, nil do
            if v45.time <= v42 then
                v40:_advanceToTime(v45.time + v40._engineFrameTime);
                v45.callback(unpack(v45.args));
            else
                table.insert(v43, v45);
            end;
        end;
        v40:_advanceToTime(v42);
        v40._timeouts = v43;
    end;
end;
v9.runAllTicks = function(v46)
    if v46:_checkFakeTimers() then
        error("not implemented");
    end;
end;
v9.useRealTimers = function(v47)
    if v47._fakingTime then
        v47.delayOverride.mockImplementation(l_delay_0);
        v47.tickOverride.mockImplementation(l_tick_0);
        v47.timeOverride.mockImplementation(l_time_0);
        v47.dateTimeOverride.now.mockImplementation(l_DateTime_0.now);
        v47.osOverride.time.mockImplementation(l_os_0.time);
        v47.osOverride.clock.mockImplementation(l_os_0.clock);
        v47.taskOverride.delay.mockImplementation(l_task_0.delay);
        v47._fakingTime = false;
    end;
end;
local function v56(v48, v49, v50, ...)
    local v51 = v48._mockTimeMs + (v48._engineFrameTime / 1000 + v49 * 1000);
    local v52 = {
        time = v51, 
        callback = v50, 
        args = {
            ...
        }
    };
    local v53 = #v48._timeouts + 1;
    for v54, v55 in v48._timeouts, nil, nil do
        if v51 < v55.time then
            v53 = v54;
            break;
        end;
    end;
    table.insert(v48._timeouts, v53, v52);
end;
v9.useFakeTimers = function(v57)
    if not v57._fakingTime then
        v57.delayOverride.mockImplementation(function(v58, v59)
            v56(v57, v58, v59);
        end);
        v57.tickOverride.mockImplementation(function()
            return v57._mockSystemTime;
        end);
        v57.timeOverride.mockImplementation(function()
            return v57._mockTimeMs / 1000;
        end);
        v57.dateTimeOverride.now.mockImplementation(function()
            return l_DateTime_0.fromUnixTimestamp(v57._mockSystemTime);
        end);
        v57.osOverride.time.mockImplementation(function(v60)
            if typeof(v60) == "table" then
                return v57._mockSystemTime - l_DateTime_0.fromUniversalTime(v60.year or 1970, v60.month or 1, v60.day or 1, v60.hour or 0, v60.min or 0, v60.sec or 0).UnixTimestamp;
            else
                return v57._mockSystemTime;
            end;
        end);
        v57.osOverride.clock.mockImplementation(function()
            return v57._mockTimeMs / 1000;
        end);
        v57.taskOverride.delay.mockImplementation(function(v61, v62, ...)
            v56(v57, v61, v62, ...);
        end);
        v57._fakingTime = true;
        v57:reset();
    end;
end;
v9.reset = function(v63)
    if v63:_checkFakeTimers() then
        v63._mock:clearAllMocks();
        v63._timeouts = {};
        v63._mockTimeMs = 0;
        v63._mockSystemTime = l_DateTime_0.now().UnixTimestamp;
        v63._engineFrameTime = 0;
    end;
end;
v9.setSystemTime = function(v64, v65)
    if v64:_checkFakeTimers() then
        if not v65 then
            v65 = l_DateTime_0.now();
        end;
        if l_getType_0(v65) == "DateTime" then
            v65 = v65.UnixTimestamp;
        end;
        v64._mockSystemTime = v65;
    end;
end;
v9.setEngineFrameTime = function(v66, v67)
    if v66:_checkFakeTimers() then
        if v67 < 0 then
            error("Frame Time should be greater than 0");
        end;
        v66._engineFrameTime = v67;
    end;
end;
v9.getEngineFrameTime = function(v68)
    if not v68:_checkFakeTimers() then
        return 0;
    else
        return v68._engineFrameTime;
    end;
end;
v9.getRealSystemTime = function(_)
    return l_DateTime_0.now();
end;
v9.getTimerCount = function(v70)
    if not v70:_checkFakeTimers() then
        return 0;
    else
        return #v70._timeouts;
    end;
end;
v9._checkFakeTimers = function(v71)
    if not v71._fakingTime then
        error("A function to advance timers was called but the timers API is not " .. "mocked with fake timers. Call `jest.useFakeTimers()` in this test.");
    end;
    return v71._fakingTime;
end;
return v9;
