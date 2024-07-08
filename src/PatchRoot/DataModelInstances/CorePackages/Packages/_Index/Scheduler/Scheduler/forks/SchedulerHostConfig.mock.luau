local v0 = {};
local v1 = 0;
local v2 = nil;
local v3 = nil;
local v4 = -1;
local v5 = nil;
local v6 = -1;
local v7 = false;
local v8 = false;
local v9 = false;
local v10 = false;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_disabledLog_0 = require(l_Parent_0.Shared).ConsolePatchingDev.disabledLog;
v0.requestHostCallback = function(v14)
    v2 = v14;
end;
v0.cancelHostCallback = function()
    v2 = nil;
end;
v0.requestHostTimeout = function(v15, v16)
    v3 = v15;
    v4 = v1 + v16;
end;
v0.cancelHostTimeout = function()
    v3 = nil;
    v4 = -1;
end;
v0.shouldYieldToHost = function()
    local l_v5_0 = v5;
    if (not (v6 ~= -1 and l_v5_0 ~= nil) or v6 > #l_v5_0) and (not v10 or not v9) then
        return false;
    else
        v7 = true;
        return true;
    end;
end;
v0.getCurrentTime = function()
    return v1;
end;
v0.forceFrameRate = function()
end;
v0.reset = function()
    if v8 then
        error("Cannot reset while already flushing work.");
    end;
    v1 = 0;
    v2 = nil;
    v3 = nil;
    v4 = -1;
    v5 = nil;
    v6 = -1;
    v7 = false;
    v8 = false;
    v9 = false;
end;
v0.unstable_flushNumberOfYields = function(v18)
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        local l_v2_0 = v2;
        v6 = v18;
        v8 = true;
        local l_status_0, l_result_0 = pcall(function()
            local v20 = true;
            while true do
                v20 = l_v2_0(true, v1);
                if not v20 or v7 then
                    break;
                end;
            end;
            if not v20 then
                v2 = nil;
            end;
        end);
        v6 = -1;
        v7 = false;
        v8 = false;
        if not l_status_0 then
            error(l_result_0);
        end;
    end;
end;
v0.unstable_flushUntilNextPaint = function()
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        local l_v2_1 = v2;
        v10 = true;
        v9 = false;
        v8 = true;
        local l_status_1, l_result_1 = pcall(function()
            local v24 = true;
            while true do
                v24 = l_v2_1(true, v1);
                if not v24 or v7 then
                    break;
                end;
            end;
            if not v24 then
                v2 = nil;
            end;
        end);
        v10 = false;
        v7 = false;
        v8 = false;
        if not l_status_1 then
            error(l_result_1);
        end;
    end;
end;
v0.unstable_flushExpired = function()
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        v8 = true;
        local l_status_2, l_result_2 = pcall(function()
            if not v2(false, v1) then
                v2 = nil;
            end;
        end);
        v8 = false;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v0.unstable_flushAllWithoutAsserting = function()
    if v8 then
        error("Already flushing work.");
    end;
    if v2 ~= nil then
        local l_v2_2 = v2;
        v8 = true;
        local l_status_3, l_result_3 = pcall(function()
            local v30 = true;
            while true do
                v30 = l_v2_2(true, v1);
                if not v30 then
                    break;
                end;
            end;
            if not v30 then
                v2 = nil;
            end;
        end);
        v8 = false;
        if not l_status_3 then
            error(l_result_3);
        end;
        return true;
    else
        return false;
    end;
end;
v0.unstable_clearYields = function()
    if v5 == nil then
        return {};
    else
        local l_v5_1 = v5;
        v5 = nil;
        return l_v5_1;
    end;
end;
v0.unstable_flushAll = function()
    if v5 ~= nil then
        error("Log is not empty. Assert on the log of yielded values before " .. "flushing additional work.");
    end;
    v0.unstable_flushAllWithoutAsserting();
    if v5 ~= nil then
        error("While flushing work, something yielded a value. Use an " .. "assertion helper to assert on the log of yielded values, e.g. " .. "expect(Scheduler).toFlushAndYield([...])");
    end;
end;
v0.unstable_yieldValue = function(v34)
    if l_console_0.log == l_disabledLog_0 then
        return ;
    elseif v5 == nil then
        v5 = {
            v34
        };
        return ;
    else
        table.insert(v5, v34);
        return ;
    end;
end;
v0.unstable_advanceTime = function(v35)
    if l_console_0.log == l_disabledLog_0 then
        return ;
    else
        v1 = v1 + v35;
        if v3 ~= nil and v4 <= v1 then
            v3(v1);
            v4 = -1;
            v3 = nil;
        end;
        return ;
    end;
end;
v0.requestPaint = function()
    v9 = true;
end;
return v0;
