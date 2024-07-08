local v0 = require(script.Scheduler);
local function _(v1)
    return function()
        error(v1 .. " is only available in tests, not in production");
    end;
end;
local v3 = v0(nil);
local v4 = require(script.Tracing);
local v5 = require(script.TracingSubscriptions);
if not _G.__ROACT_17_MOCK_SCHEDULER__ then
    local v6 = {
        unstable_ImmediatePriority = v3.unstable_ImmediatePriority, 
        unstable_UserBlockingPriority = v3.unstable_UserBlockingPriority, 
        unstable_NormalPriority = v3.unstable_NormalPriority, 
        unstable_IdlePriority = v3.unstable_IdlePriority, 
        unstable_LowPriority = v3.unstable_LowPriority, 
        unstable_runWithPriority = v3.unstable_runWithPriority, 
        unstable_next = v3.unstable_next, 
        unstable_scheduleCallback = v3.unstable_scheduleCallback, 
        unstable_cancelCallback = v3.unstable_cancelCallback, 
        unstable_wrapCallback = v3.unstable_wrapCallback, 
        unstable_getCurrentPriorityLevel = v3.unstable_getCurrentPriorityLevel, 
        unstable_shouldYield = v3.unstable_shouldYield, 
        unstable_requestPaint = v3.unstable_requestPaint, 
        unstable_continueExecution = v3.unstable_continueExecution, 
        unstable_pauseExecution = v3.unstable_pauseExecution, 
        unstable_getFirstCallbackNode = v3.unstable_getFirstCallbackNode, 
        unstable_now = v3.unstable_now, 
        unstable_forceFrameRate = v3.unstable_forceFrameRate
    };
    local v7 = "unstable_flushAllWithoutAsserting";
    local l_v7_0 = v7 --[[ copy: 7 -> 11 ]];
    v6.unstable_flushAllWithoutAsserting = function()
        error(l_v7_0 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_flushAll";
    local l_v7_1 = v7 --[[ copy: 7 -> 12 ]];
    v6.unstable_flushAll = function()
        error(l_v7_1 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_flushNumberOfYields";
    local l_v7_2 = v7 --[[ copy: 7 -> 13 ]];
    v6.unstable_flushNumberOfYields = function()
        error(l_v7_2 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_clearYields";
    local l_v7_3 = v7 --[[ copy: 7 -> 14 ]];
    v6.unstable_clearYields = function()
        error(l_v7_3 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_clearYields";
    local l_v7_4 = v7 --[[ copy: 7 -> 15 ]];
    v6.unstable_flushUntilNextPaint = function()
        error(l_v7_4 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_advanceTime";
    local l_v7_5 = v7 --[[ copy: 7 -> 16 ]];
    v6.unstable_advanceTime = function()
        error(l_v7_5 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_flushExpired";
    local l_v7_6 = v7 --[[ copy: 7 -> 17 ]];
    v6.unstable_flushExpired = function()
        error(l_v7_6 .. " is only available in tests, not in production");
    end;
    v7 = "unstable_yieldValue";
    v6.unstable_yieldValue = function()
        error(v7 .. " is only available in tests, not in production");
    end;
    local v15 = {};
    local v16 = "unstable_wrap";
    v15.unstable_wrap = function()
        error(v16 .. " is only available in tests, not in production");
    end;
    v15.__interactionsRef = {};
    v15.__subscriberRef = {};
    v6.tracing = v15;
    for v17, v18 in v4, nil, nil do
        v6.tracing[v17] = v18;
    end;
    for v19, v20 in v5, nil, nil do
        v6.tracing[v19] = v20;
    end;
    return v6;
else
    return require(script.unstable_mock);
end;
