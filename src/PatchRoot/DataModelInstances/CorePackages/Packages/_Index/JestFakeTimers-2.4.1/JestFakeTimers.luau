local l_Parent_0 = script.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local l_delay_0 = delay;
local l_tick_0 = tick;
local l_DateTime_0 = DateTime;
local l_os_0 = os;
local v7 = {};
v7.__index = v7;
v7.new = function()
    local v8 = l_ModuleMocker_0.new();
    local v9 = v8:fn(l_delay_0);
    local v10 = v8:fn(l_tick_0);
    local v11 = {
        now = v8:fn(l_DateTime_0.now), 
        fromUnixTimestamp = l_DateTime_0.fromUnixTimestamp, 
        fromUnixTimestampMillis = l_DateTime_0.fromUnixTimestampMillis, 
        fromUniversalTime = l_DateTime_0.fromUniversalTime, 
        fromLocalTime = l_DateTime_0.fromLocalTime, 
        fromIsoDate = l_DateTime_0.fromIsoDate
    };
    local v12 = {
        time = v8:fn(l_os_0.time), 
        clock = v8:fn(l_os_0.clock)
    };
    setmetatable(v12, {
        __index = l_os_0
    });
    local v13 = {
        _fakingTime = false, 
        _timeouts = {}, 
        _mock = v8, 
        _mockTime = 0, 
        _mockSystemTime = l_DateTime_0.now().UnixTimestamp, 
        delayOverride = v9, 
        tickOverride = v10, 
        dateTimeOverride = v11, 
        osOverride = v12
    };
    setmetatable(v13, v7);
    return v13;
end;
v7._advanceToTime = function(v14, v15)
    if v14._mockTime < v15 then
        local v16 = v15 - v14._mockTime;
        v14._mockTime = v15;
        v14._mockSystemTime = v14._mockSystemTime + v16;
    end;
end;
v7.clearAllTimers = function(v17)
    if v17._fakingTime then
        v17._timeouts = {};
    end;
end;
v7.dispose = function(v18)
    v18:useRealTimers();
end;
v7.runAllTimers = function(v19)
    if v19:_checkFakeTimers() then
        for _, v21 in ipairs(v19._timeouts) do
            v19:_advanceToTime(v21.time);
            v21.callback();
        end;
    end;
    v19._timeouts = {};
end;
v7.runOnlyPendingTimers = function(v22)
    if v22:_checkFakeTimers() then
        local v23 = {};
        for _, v25 in ipairs(v22._timeouts) do
            table.insert(v23, v25);
        end;
        v22._timeouts = {};
        for _, v27 in ipairs(v23) do
            v22:_advanceToTime(v27.time);
            v27.callback();
        end;
    end;
end;
v7.advanceTimersToNextTimer = function(v28, v29)
    local v30 = v29 or 1;
    if v28:_checkFakeTimers() then
        local v31 = {};
        local v32 = -1;
        for _, v34 in ipairs(v28._timeouts) do
            if v32 < v34.time and v30 > 0 then
                v32 = v34.time;
                v28:_advanceToTime(v32);
                v30 = v30 - 1;
            end;
            if v34.time <= v28._mockTime then
                v34.callback();
            else
                table.insert(v31, v34);
            end;
        end;
        v28._timeouts = v31;
    end;
end;
v7.advanceTimersByTime = function(v35, v36)
    if v35:_checkFakeTimers() then
        local v37 = v35._mockTime + v36;
        local v38 = {};
        for _, v40 in ipairs(v35._timeouts) do
            if v40.time <= v37 then
                v35:_advanceToTime(v40.time);
                v40.callback();
            else
                table.insert(v38, v40);
            end;
        end;
        v35:_advanceToTime(v37);
        v35._timeouts = v38;
    end;
end;
v7.runAllTicks = function(v41)
    if v41:_checkFakeTimers() then
        error("not implemented");
    end;
end;
v7.useRealTimers = function(v42)
    if v42._fakingTime then
        v42.delayOverride.mockImplementation(l_delay_0);
        v42.tickOverride.mockImplementation(l_tick_0);
        v42.dateTimeOverride.now.mockImplementation(l_DateTime_0.now);
        v42.osOverride.time.mockImplementation(l_os_0.time);
        v42.osOverride.clock.mockImplementation(l_os_0.clock);
        v42._fakingTime = false;
    end;
end;
v7.useFakeTimers = function(v43)
    if not v43._fakingTime then
        v43.delayOverride.mockImplementation(function(v44, v45)
            local v46 = v43._mockTime + v44;
            local v47 = {
                time = v46, 
                callback = v45
            };
            local v48 = #v43._timeouts + 1;
            for v49, v50 in ipairs(v43._timeouts) do
                if v46 < v50.time then
                    v48 = v49;
                    break;
                end;
            end;
            table.insert(v43._timeouts, v48, v47);
        end);
        v43.tickOverride.mockImplementation(function()
            return v43._mockSystemTime;
        end);
        v43.dateTimeOverride.now.mockImplementation(function()
            return l_DateTime_0.fromUnixTimestamp(v43._mockSystemTime);
        end);
        v43.osOverride.time.mockImplementation(function(v51)
            if typeof(v51) == "table" then
                return v43._mockSystemTime - l_DateTime_0.fromUniversalTime(v51.year or 1970, v51.month or 1, v51.day or 1, v51.hour or 0, v51.min or 0, v51.sec or 0).UnixTimestamp;
            else
                return v43._mockSystemTime;
            end;
        end);
        v43.osOverride.clock.mockImplementation(function()
            return v43._mockTime;
        end);
        v43._fakingTime = true;
        v43:reset();
    end;
end;
v7.reset = function(v52)
    if v52:_checkFakeTimers() then
        v52._mock:clearAllMocks();
        v52._timeouts = {};
        v52._mockTime = 0;
        v52._mockSystemTime = l_DateTime_0.now().UnixTimestamp;
    end;
end;
v7.setSystemTime = function(v53, v54)
    if v53:_checkFakeTimers() then
        if not v54 then
            v54 = l_DateTime_0.now();
        end;
        if l_getType_0(v54) == "DateTime" then
            v54 = v54.UnixTimestamp;
        end;
        v53._mockSystemTime = v54;
    end;
end;
v7.getRealSystemTime = function(_)
    return l_DateTime_0.now();
end;
v7.getTimerCount = function(v56)
    if not v56:_checkFakeTimers() then
        return 0;
    else
        return #v56._timeouts;
    end;
end;
v7._checkFakeTimers = function(v57)
    if not v57._fakingTime then
        error("A function to advance timers was called but the timers API is not " .. "mocked with fake timers. Call `jest.useFakeTimers()` in this test.");
    end;
    return v57._fakingTime;
end;
return v7;
