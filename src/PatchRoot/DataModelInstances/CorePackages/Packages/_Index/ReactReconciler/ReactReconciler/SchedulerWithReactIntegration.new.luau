local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(l_Parent_0.Scheduler);
local l_decoupleUpdatePriorityFromScheduler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v7 = require(script.Parent.ReactFiberLane);
local l_SyncLanePriority_0 = v7.SyncLanePriority;
local l_getCurrentUpdateLanePriority_0 = v7.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v7.setCurrentUpdateLanePriority;
local l_unstable_runWithPriority_0 = v3.unstable_runWithPriority;
local l_unstable_scheduleCallback_0 = v3.unstable_scheduleCallback;
local l_unstable_cancelCallback_0 = v3.unstable_cancelCallback;
local l_unstable_shouldYield_0 = v3.unstable_shouldYield;
local l_unstable_requestPaint_0 = v3.unstable_requestPaint;
local l_unstable_now_0 = v3.unstable_now;
local l_unstable_getCurrentPriorityLevel_0 = v3.unstable_getCurrentPriorityLevel;
local l_unstable_ImmediatePriority_0 = v3.unstable_ImmediatePriority;
local l_unstable_UserBlockingPriority_0 = v3.unstable_UserBlockingPriority;
local l_unstable_NormalPriority_0 = v3.unstable_NormalPriority;
local l_unstable_LowPriority_0 = v3.unstable_LowPriority;
local l_unstable_IdlePriority_0 = v3.unstable_IdlePriority;
local v23 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local l_ImmediatePriority_0 = v23.ImmediatePriority;
local l_UserBlockingPriority_0 = v23.UserBlockingPriority;
local l_NormalPriority_0 = v23.NormalPriority;
local l_LowPriority_0 = v23.LowPriority;
local l_IdlePriority_0 = v23.IdlePriority;
local l_NoPriority_0 = v23.NoPriority;
local v30 = nil;
local v31 = {};
local v32 = nil;
v32 = if l_unstable_requestPaint_0 ~= nil then l_unstable_requestPaint_0 else function()
end;
local v33 = nil;
local v34 = nil;
local v35 = false;
local v36 = l_unstable_now_0();
local function v37()
    return l_unstable_now_0() - v36;
end;
local function v39()
    local v38 = l_unstable_getCurrentPriorityLevel_0();
    if v38 == l_unstable_ImmediatePriority_0 then
        return l_ImmediatePriority_0;
    elseif v38 == l_unstable_UserBlockingPriority_0 then
        return l_UserBlockingPriority_0;
    elseif v38 == l_unstable_NormalPriority_0 then
        return l_NormalPriority_0;
    elseif v38 == l_unstable_LowPriority_0 then
        return l_LowPriority_0;
    elseif v38 == l_unstable_IdlePriority_0 then
        return l_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return l_NoPriority_0;
    end;
end;
reactPriorityToSchedulerPriority = function(v40)
    if v40 == l_ImmediatePriority_0 then
        return l_unstable_ImmediatePriority_0;
    elseif v40 == l_UserBlockingPriority_0 then
        return l_unstable_UserBlockingPriority_0;
    elseif v40 == l_NormalPriority_0 then
        return l_unstable_NormalPriority_0;
    elseif v40 == l_LowPriority_0 then
        return l_unstable_LowPriority_0;
    elseif v40 == l_IdlePriority_0 then
        return l_unstable_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return nil;
    end;
end;
local function v43(v41, v42)
    return l_unstable_runWithPriority_0(reactPriorityToSchedulerPriority(v41), v42);
end;
local function v47(v44, v45, v46)
    return l_unstable_scheduleCallback_0(reactPriorityToSchedulerPriority(v44), v45, v46);
end;
local function v49(v48)
    if v33 == nil then
        v33 = {
            v48
        };
        v34 = l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v30);
    else
        table.insert(v33, v48);
    end;
    return v31;
end;
local function v51(v50)
    if v50 ~= v31 then
        l_unstable_cancelCallback_0(v50);
    end;
end;
local function v53()
    if v34 ~= nil then
        local l_v34_0 = v34;
        v34 = nil;
        l_unstable_cancelCallback_0(l_v34_0);
    end;
    return v30();
end;
v30 = function()
    if not v35 and v33 ~= nil then
        v35 = true;
        local v54 = 1;
        if not l_decoupleUpdatePriorityFromScheduler_0 then
            local v55 = nil;
            local v56 = nil;
            if _G.__YOLO__ then
                v55 = true;
                local l_v33_0 = v33;
                local _ = l_unstable_runWithPriority_0(reactPriorityToSchedulerPriority(l_ImmediatePriority_0), function()
                    for v58, v59 in l_v33_0, nil, nil do
                        v54 = v58;
                        while true do
                            v59 = v59(true);
                            if not (v59 ~= nil) then
                                break;
                            end;
                        end;
                    end;
                end);
                v33 = nil;
            else
                local l_v33_1 = v33;
                local v64, v65 = xpcall(v43, l_describeError_0, l_ImmediatePriority_0, function()
                    for v62, v63 in l_v33_1, nil, nil do
                        v54 = v62;
                        while true do
                            v63 = v63(true);
                            if not (v63 ~= nil) then
                                break;
                            end;
                        end;
                    end;
                end);
                v55 = v64;
                v56 = v65;
                v33 = nil;
            end;
            v35 = false;
            if not v55 then
                if v33 ~= nil then
                    v33 = l_Array_0.slice(v33, v54 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v53);
                error(v56);
            end;
        else
            local v66 = l_getCurrentUpdateLanePriority_0();
            local v67 = true;
            local v68 = nil;
            if _G.__YOLO__ then
                v67 = true;
                local l_v33_2 = v33;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local _ = l_unstable_runWithPriority_0(reactPriorityToSchedulerPriority(l_ImmediatePriority_0), function()
                    for v70, v71 in l_v33_2, nil, nil do
                        v54 = v70;
                        while true do
                            v71 = v71(true);
                            if not (v71 ~= nil) then
                                break;
                            end;
                        end;
                        v54 = v54 + 1;
                    end;
                end);
                v33 = nil;
            else
                local l_v33_3 = v33;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local v76, v77 = xpcall(v43, l_describeError_0, l_ImmediatePriority_0, function()
                    for v74, v75 in l_v33_3, nil, nil do
                        v54 = v74;
                        while true do
                            v75 = v75(true);
                            if not (v75 ~= nil) then
                                break;
                            end;
                        end;
                    end;
                end);
                v67 = v76;
                v68 = v77;
                v33 = nil;
            end;
            l_setCurrentUpdateLanePriority_0(v66);
            v35 = false;
            if not v67 then
                if v33 ~= nil then
                    v33 = l_Array_0.slice(v33, v54 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v53);
                error(v68);
            end;
        end;
        return true;
    else
        return false;
    end;
end;
return {
    ImmediatePriority = l_ImmediatePriority_0, 
    UserBlockingPriority = l_UserBlockingPriority_0, 
    NormalPriority = l_NormalPriority_0, 
    LowPriority = l_LowPriority_0, 
    IdlePriority = l_IdlePriority_0, 
    NoPriority = l_NoPriority_0, 
    getCurrentPriorityLevel = v39, 
    flushSyncCallbackQueue = v53, 
    runWithPriority = v43, 
    scheduleCallback = v47, 
    scheduleSyncCallback = v49, 
    cancelCallback = v51, 
    now = v37, 
    requestPaint = v32, 
    shouldYield = l_unstable_shouldYield_0
};
