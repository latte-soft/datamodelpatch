return function(v0)
    local l_describeError_0 = require(script.Parent.Parent.Shared).describeError;
    local v2 = require(script.Parent.SchedulerFeatureFlags);
    local l_enableSchedulerDebugging_0 = v2.enableSchedulerDebugging;
    local l_enableProfiling_0 = v2.enableProfiling;
    local v5 = v0 or require(script.Parent.SchedulerHostConfig);
    local l_requestHostCallback_0 = v5.requestHostCallback;
    local l_requestHostTimeout_0 = v5.requestHostTimeout;
    local l_cancelHostTimeout_0 = v5.cancelHostTimeout;
    local l_shouldYieldToHost_0 = v5.shouldYieldToHost;
    local l_getCurrentTime_0 = v5.getCurrentTime;
    local l_forceFrameRate_0 = v5.forceFrameRate;
    local l_requestPaint_0 = v5.requestPaint;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local function _(v16, v17)
        local v18 = #v16 + 1;
        v16[v18] = v17;
        v14(v16, v17, v18);
    end;
    local function _(v20)
        return v20[1];
    end;
    local function _(v22)
        local v23 = v22[1];
        if v23 ~= nil then
            local v24 = v22[#v22];
            v22[#v22] = nil;
            if v24 ~= v23 then
                v22[1] = v24;
                v15(v22, v24, 1);
            end;
            return v23;
        else
            return nil;
        end;
    end;
    v14 = function(v26, v27, v28)
        while true do
            local v29 = math.floor(v28 / 2);
            local v30 = v26[v29];
            if v30 ~= nil and v13(v30, v27) > 0 then
                v26[v29] = v27;
                v26[v28] = v30;
                v28 = v29;
            else
                break;
            end;
        end;
    end;
    v15 = function(v31, v32, v33)
        local v34 = #v31;
        while true do
            if v33 < v34 then
                local v35 = v33 * 2;
                local v36 = v31[v35];
                local v37 = v35 + 1;
                local v38 = v31[v37];
                if v36 ~= nil and v13(v36, v32) < 0 then
                    if v38 ~= nil and v13(v38, v36) < 0 then
                        v31[v33] = v38;
                        v31[v37] = v32;
                        v33 = v37;
                    else
                        v31[v33] = v36;
                        v31[v35] = v32;
                        v33 = v35;
                    end;
                elseif v38 ~= nil and v13(v38, v32) < 0 then
                    v31[v33] = v38;
                    v31[v37] = v32;
                    v33 = v37;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
    end;
    v13 = function(v39, v40)
        local v41 = v39.sortIndex - v40.sortIndex;
        if v41 == 0 then
            return v39.id - v40.id;
        else
            return v41;
        end;
    end;
    local v42 = require(script.Parent.SchedulerPriorities);
    local l_ImmediatePriority_0 = v42.ImmediatePriority;
    local l_UserBlockingPriority_0 = v42.UserBlockingPriority;
    local l_NormalPriority_0 = v42.NormalPriority;
    local l_LowPriority_0 = v42.LowPriority;
    local l_IdlePriority_0 = v42.IdlePriority;
    local v48 = require(script.Parent.SchedulerProfiling);
    local l_markTaskRun_0 = v48.markTaskRun;
    local l_markTaskYield_0 = v48.markTaskYield;
    local l_markTaskCompleted_0 = v48.markTaskCompleted;
    local l_markTaskCanceled_0 = v48.markTaskCanceled;
    local l_markTaskErrored_0 = v48.markTaskErrored;
    local l_markSchedulerSuspended_0 = v48.markSchedulerSuspended;
    local l_markSchedulerUnsuspended_0 = v48.markSchedulerUnsuspended;
    local l_markTaskStart_0 = v48.markTaskStart;
    local l_stopLoggingProfilingEvents_0 = v48.stopLoggingProfilingEvents;
    local l_startLoggingProfilingEvents_0 = v48.startLoggingProfilingEvents;
    local v59 = {};
    local v60 = {};
    local v61 = 1;
    local v62 = false;
    local v63 = nil;
    local l_l_NormalPriority_0_0 = l_NormalPriority_0;
    local v65 = false;
    local v66 = false;
    local v67 = false;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local function v80(v71)
        local v72 = v60[1];
        while true do
            if v72 ~= nil then
                if v72.callback == nil then
                    local l_v60_0 = v60;
                    local v74 = l_v60_0[1];
                    if v74 ~= nil then
                        local v75 = l_v60_0[#l_v60_0];
                        l_v60_0[#l_v60_0] = nil;
                        if v75 ~= v74 then
                            l_v60_0[1] = v75;
                            v15(l_v60_0, v75, 1);
                        end;
                    end;
                elseif v72.startTime <= v71 then
                    local l_v60_1 = v60;
                    local v77 = l_v60_1[1];
                    if v77 ~= nil then
                        local v78 = l_v60_1[#l_v60_1];
                        l_v60_1[#l_v60_1] = nil;
                        if v78 ~= v77 then
                            l_v60_1[1] = v78;
                            v15(l_v60_1, v78, 1);
                        end;
                    end;
                    v72.sortIndex = v72.expirationTime;
                    l_v60_1 = v59;
                    v77 = v72;
                    local v79 = #l_v60_1 + 1;
                    l_v60_1[v79] = v77;
                    v14(l_v60_1, v77, v79);
                    if l_enableProfiling_0 then
                        l_markTaskStart_0(v72, v71);
                        v72.isQueued = true;
                    end;
                else
                    return ;
                end;
                v72 = v60[1];
            else
                return ;
            end;
        end;
    end;
    v68 = function(v81)
        v67 = false;
        v80(v81);
        if not v66 then
            if v59[1] ~= nil then
                v66 = true;
                l_requestHostCallback_0(v69);
                return ;
            else
                local v82 = v60[1];
                if v82 ~= nil then
                    l_requestHostTimeout_0(v68, v82.startTime - v81);
                end;
            end;
        end;
    end;
    v69 = function(v83, v84)
        if l_enableProfiling_0 then
            l_markSchedulerUnsuspended_0(v84);
        end;
        v66 = false;
        if v67 then
            v67 = false;
            l_cancelHostTimeout_0();
        end;
        v65 = true;
        local l_l_l_NormalPriority_0_0_0 = l_l_NormalPriority_0_0;
        local v86 = nil;
        local v87 = nil;
        if _G.__YOLO__ then
            v86 = true;
            v87 = v70(v83, v84);
        elseif not l_enableProfiling_0 then
            v86 = true;
            v87 = v70(v83, v84);
        else
            local v88, v89 = xpcall(v70, l_describeError_0, v83, v84);
            v86 = v88;
            v87 = v89;
            if not v86 and v63 ~= nil then
                l_markTaskErrored_0(v63, (l_getCurrentTime_0()));
                v63.isQueued = false;
            end;
        end;
        v63 = nil;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_0;
        v65 = false;
        if l_enableProfiling_0 then
            l_markSchedulerSuspended_0((l_getCurrentTime_0()));
        end;
        if not v86 then
            error(v87);
        end;
        return v87;
    end;
    v70 = function(v90, v91)
        local l_v91_0 = v91;
        v80(l_v91_0);
        v63 = v59[1];
        while not ((not (v63 ~= nil) or l_enableSchedulerDebugging_0 and v62) or l_v91_0 < v63.expirationTime and (not v90 or l_shouldYieldToHost_0())) do
            local l_callback_0 = v63.callback;
            if typeof(l_callback_0) == "function" then
                v63.callback = nil;
                l_l_NormalPriority_0_0 = v63.priorityLevel;
                local v94 = v63.expirationTime <= l_v91_0;
                l_markTaskRun_0(v63, l_v91_0);
                local v95 = l_callback_0(v94);
                l_v91_0 = l_getCurrentTime_0();
                if typeof(v95) == "function" then
                    v63.callback = v95;
                    l_markTaskYield_0(v63, l_v91_0);
                else
                    if l_enableProfiling_0 then
                        l_markTaskCompleted_0(v63, l_v91_0);
                        v63.isQueued = false;
                    end;
                    if v63 == v59[1] then
                        local l_v59_0 = v59;
                        local v97 = l_v59_0[1];
                        if v97 ~= nil then
                            local v98 = l_v59_0[#l_v59_0];
                            l_v59_0[#l_v59_0] = nil;
                            if v98 ~= v97 then
                                l_v59_0[1] = v98;
                                v15(l_v59_0, v98, 1);
                            end;
                        end;
                    end;
                end;
                v80(l_v91_0);
            else
                local l_v59_1 = v59;
                local v100 = l_v59_1[1];
                if v100 ~= nil then
                    local v101 = l_v59_1[#l_v59_1];
                    l_v59_1[#l_v59_1] = nil;
                    if v101 ~= v100 then
                        l_v59_1[1] = v101;
                        v15(l_v59_1, v101, 1);
                    end;
                end;
            end;
            v63 = v59[1];
        end;
        if v63 ~= nil then
            return true;
        else
            local v102 = v60[1];
            if v102 ~= nil then
                l_requestHostTimeout_0(v68, v102.startTime - l_v91_0);
            end;
            return false;
        end;
    end;
    return {
        unstable_ImmediatePriority = l_ImmediatePriority_0, 
        unstable_UserBlockingPriority = l_UserBlockingPriority_0, 
        unstable_NormalPriority = l_NormalPriority_0, 
        unstable_IdlePriority = l_IdlePriority_0, 
        unstable_LowPriority = l_LowPriority_0, 
        unstable_runWithPriority = function(v103, v104)
            if not (not (((v103 ~= l_ImmediatePriority_0 and v103 ~= l_UserBlockingPriority_0) and v103 ~= l_NormalPriority_0) and v103 ~= l_LowPriority_0) or v103 == l_IdlePriority_0) then
                v103 = l_NormalPriority_0;
            end;
            local l_l_l_NormalPriority_0_0_1 = l_l_NormalPriority_0_0;
            l_l_NormalPriority_0_0 = v103;
            local v106 = nil;
            local v107 = nil;
            if _G.__YOLO__ then
                v106 = true;
                v107 = v104();
            else
                local v108, v109 = xpcall(v104, l_describeError_0);
                v106 = v108;
                v107 = v109;
            end;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_1;
            if not v106 then
                error(v107);
            end;
            return v107;
        end, 
        unstable_next = function(v110)
            local v111 = nil;
            v111 = if not (l_l_NormalPriority_0_0 ~= l_ImmediatePriority_0 and l_l_NormalPriority_0_0 ~= l_UserBlockingPriority_0) or l_l_NormalPriority_0_0 == l_NormalPriority_0 then l_NormalPriority_0 else l_l_NormalPriority_0_0;
            local l_l_l_NormalPriority_0_0_2 = l_l_NormalPriority_0_0;
            l_l_NormalPriority_0_0 = v111;
            local v113 = nil;
            local v114 = nil;
            if _G.__YOLO__ then
                v113 = true;
                v114 = v110();
            else
                local v115, v116 = xpcall(v110, l_describeError_0);
                v113 = v115;
                v114 = v116;
            end;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_2;
            if not v113 then
                error(v114);
            end;
            return v114;
        end, 
        unstable_scheduleCallback = function(v117, v118, v119)
            local v120 = l_getCurrentTime_0();
            local v121 = nil;
            if typeof(v119) == "table" then
                local l_delay_0 = v119.delay;
                v121 = if typeof(l_delay_0) == "number" and l_delay_0 > 0 then v120 + l_delay_0 else v120;
            else
                v121 = v120;
            end;
            local _ = nil;
            local v124 = v121 + (v117 == l_ImmediatePriority_0 and -1 or (v117 == l_UserBlockingPriority_0 and 250 or (v117 == l_IdlePriority_0 and 1073741823 or (v117 == l_LowPriority_0 and 10000 or 5000))));
            local v125 = {
                id = v61, 
                callback = v118, 
                priorityLevel = v117, 
                startTime = v121, 
                expirationTime = v124, 
                sortIndex = -1
            };
            v61 = v61 + 1;
            if l_enableProfiling_0 then
                v125.isQueued = false;
            end;
            if v120 < v121 then
                v125.sortIndex = v121;
                local l_v60_2 = v60;
                local v127 = #l_v60_2 + 1;
                l_v60_2[v127] = v125;
                v14(l_v60_2, v125, v127);
                if #v59 == 0 and v125 == v60[1] then
                    if not v67 then
                        v67 = true;
                    else
                        l_cancelHostTimeout_0();
                    end;
                    l_requestHostTimeout_0(v68, v121 - v120);
                    return v125;
                end;
            else
                v125.sortIndex = v124;
                local l_v59_2 = v59;
                local v129 = #l_v59_2 + 1;
                l_v59_2[v129] = v125;
                v14(l_v59_2, v125, v129);
                if l_enableProfiling_0 then
                    l_markTaskStart_0(v125, v120);
                    v125.isQueued = true;
                end;
                if not (v66 or v65) then
                    v66 = true;
                    l_requestHostCallback_0(v69);
                end;
            end;
            return v125;
        end, 
        unstable_cancelCallback = function(v130)
            if not (not l_enableProfiling_0 or not v130.isQueued) then
                l_markTaskCanceled_0(v130, (l_getCurrentTime_0()));
                v130.isQueued = false;
            end;
            v130.callback = nil;
        end, 
        unstable_wrapCallback = function(v131)
            local l_l_l_NormalPriority_0_0_3 = l_l_NormalPriority_0_0;
            return function(...)
                local l_l_l_NormalPriority_0_0_4 = l_l_NormalPriority_0_0;
                l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_3;
                local v134 = nil;
                local v135 = nil;
                if _G.__YOLO__ then
                    v134 = true;
                    v135 = v131(...);
                else
                    local v136, v137 = xpcall(v131, l_describeError_0, ...);
                    v134 = v136;
                    v135 = v137;
                end;
                l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_4;
                if not v134 then
                    error(v135);
                end;
                return v135;
            end;
        end, 
        unstable_getCurrentPriorityLevel = function()
            return l_l_NormalPriority_0_0;
        end, 
        unstable_shouldYield = l_shouldYieldToHost_0, 
        unstable_requestPaint = l_requestPaint_0, 
        unstable_continueExecution = function()
            v62 = false;
            if not (v66 or v65) then
                v66 = true;
                l_requestHostCallback_0(v69);
            end;
        end, 
        unstable_pauseExecution = function()
            v62 = true;
        end, 
        unstable_getFirstCallbackNode = function()
            return v59[1];
        end, 
        unstable_now = l_getCurrentTime_0, 
        unstable_forceFrameRate = l_forceFrameRate_0, 
        unstable_Profiling = if not l_enableProfiling_0 then nil else {
            startLoggingProfilingEvents = l_startLoggingProfilingEvents_0, 
            stopLoggingProfilingEvents = l_stopLoggingProfilingEvents_0
        }
    };
end;
