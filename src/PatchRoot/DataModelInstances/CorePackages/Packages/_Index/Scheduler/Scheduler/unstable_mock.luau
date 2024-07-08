local v0 = require(script.Parent.Tracing);
local v1 = require(script.Parent.TracingSubscriptions);
local v2 = require(script.Parent.Scheduler);
local v3 = require(script.Parent.forks["SchedulerHostConfig.mock"]);
local v4 = v2(v3);
local v5 = {
    tracing = {}
};
for v6, v7 in v4, nil, nil do
    v5[v6] = v7;
end;
for v8, v9 in v0, nil, nil do
    v5.tracing[v8] = v9;
end;
for v10, v11 in v1, nil, nil do
    v5.tracing[v10] = v11;
end;
v5.unstable_flushAllWithoutAsserting = v3.unstable_flushAllWithoutAsserting;
v5.unstable_flushNumberOfYields = v3.unstable_flushNumberOfYields;
v5.unstable_flushExpired = v3.unstable_flushExpired;
v5.unstable_clearYields = v3.unstable_clearYields;
v5.unstable_flushUntilNextPaint = v3.unstable_flushUntilNextPaint;
v5.unstable_flushAll = v3.unstable_flushAll;
v5.unstable_yieldValue = v3.unstable_yieldValue;
v5.unstable_advanceTime = v3.unstable_advanceTime;
v5.unstable_Profiling = v4.unstable_Profiling;
return v5;
