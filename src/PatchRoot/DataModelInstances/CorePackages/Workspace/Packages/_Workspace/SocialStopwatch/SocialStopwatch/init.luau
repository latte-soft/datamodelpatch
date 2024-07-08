local v0 = require(script.Events);
local _ = require(script.Types);
local v2 = require(script.initializeStopwatch)();
return {
    ["jest.config"] = script["jest.config"], 
    Events = v0, 
    Stopwatch = v2, 
    TestUtils = {
        resetStopwatchState = v2._unsafeClearEventLog
    }
};
