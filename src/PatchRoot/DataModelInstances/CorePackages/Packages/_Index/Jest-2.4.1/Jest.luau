local l_Parent_0 = script.Parent;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local v2 = require(l_Parent_0.JestFakeTimers).new();
local v3 = l_ModuleMocker_0.new();
return {
    fn = function(...)
        return v3:fn(...);
    end, 
    clearAllMocks = function()
        return v3:clearAllMocks();
    end, 
    resetAllMocks = function()
        return v3:resetAllMocks();
    end, 
    _mock = v3, 
    useFakeTimers = function()
        return v2:useFakeTimers();
    end, 
    useRealTimers = function()
        return v2:useRealTimers();
    end, 
    runAllTicks = function()
        return v2:runAllTicks();
    end, 
    runAllTimers = function()
        return v2:runAllTimers();
    end, 
    advanceTimersByTime = function(v4)
        v2:advanceTimersByTime(v4);
    end, 
    runTimersToTime = function(v5)
        v2:advanceTimersByTime(v5);
    end, 
    runOnlyPendingTimers = function()
        v2:runOnlyPendingTimers();
    end, 
    advanceTimerstoNextTimer = function(v6)
        v2:advanceTimerstoNextTimer(v6);
    end, 
    clearAllTimers = function()
        v2:clearAllTimers();
    end, 
    getTimerCount = function()
        v2:getTimerCount();
    end, 
    setSystemTime = function(v7)
        v2:setSystemTime(v7);
    end, 
    getRealSystemTime = function()
        v2:getRealSystemTime();
    end, 
    testEnv = {
        delay = v2.delayOverride, 
        tick = v2.tickOverride, 
        DateTime = v2.dateTimeOverride, 
        os = v2.osOverride
    }, 
    _fakeTimers = v2
};
