local l_console_0 = require(script.Parent.Parent.Shared).console;
local v1 = {};
local _ = require(script.Parent.SchedulerPriorities);
local l_enableProfiling_0 = require(script.Parent.SchedulerFeatureFlags).enableProfiling;
local v4 = 0;
local v5 = 0;
local v6 = 0;
local v7 = nil;
local v8 = nil;
local v9 = 1;
local function v12(v10)
    if v8 ~= nil then
        v9 = v9 + #v10;
        if v6 < v9 + 1 then
            v6 = v6 * 2;
            if v6 > 524288 then
                l_console_0.error("Scheduler Profiling: Event log exceeded maximum size. Don't " .. "forget to call `stopLoggingProfilingEvents()`.");
                v1.stopLoggingProfilingEvents();
                return ;
            else
                local v11 = {};
                table.insert(v11, v8);
                v7 = v11;
                v8 = v11;
            end;
        end;
        table.insert(v8, v10);
    end;
end;
v1.startLoggingProfilingEvents = function()
    v6 = 131072;
    v7 = {};
    v8 = v7;
    v9 = 1;
end;
v1.stopLoggingProfilingEvents = function()
    local l_v7_0 = v7;
    v6 = 0;
    v7 = nil;
    v8 = nil;
    v9 = 1;
    return l_v7_0;
end;
v1.markTaskStart = function(v14, v15)
    if l_enableProfiling_0 and v8 ~= nil then
        v12({
            1, 
            v15 * 1000, 
            v14.id, 
            v14.priorityLevel
        });
    end;
end;
v1.markTaskCompleted = function(v16, v17)
    if l_enableProfiling_0 and v8 ~= nil then
        v12({
            2, 
            v17 * 1000, 
            v16.id
        });
    end;
end;
v1.markTaskCanceled = function(v18, v19)
    if l_enableProfiling_0 and v8 ~= nil then
        v12({
            4, 
            v19 * 1000, 
            v18.id
        });
    end;
end;
v1.markTaskErrored = function(v20, v21)
    if l_enableProfiling_0 and v8 ~= nil then
        v12({
            3, 
            v21 * 1000, 
            v20.id
        });
    end;
end;
v1.markTaskRun = function(v22, v23)
    if l_enableProfiling_0 then
        v4 = v4 + 1;
        if v8 ~= nil then
            v12({
                5, 
                v23 * 1000, 
                v22.id, 
                v4
            });
        end;
    end;
end;
v1.markTaskYield = function(v24, v25)
    if l_enableProfiling_0 and v8 ~= nil then
        v12({
            6, 
            v25 * 1000, 
            v24.id, 
            v4
        });
    end;
end;
v1.markSchedulerSuspended = function(v26)
    if l_enableProfiling_0 then
        v5 = v5 + 1;
        if v8 ~= nil then
            v12({
                7, 
                v26 * 1000, 
                v5
            });
        end;
    end;
end;
v1.markSchedulerUnsuspended = function(v27)
    if l_enableProfiling_0 and v8 ~= nil then
        v12({
            8, 
            v27 * 1000, 
            v5
        });
    end;
end;
return v1;
