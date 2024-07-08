local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = require(script.Parent.Tracing);
local l_enableSchedulerTracing_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulerTracing;
local l___subscriberRef_0 = v3.__subscriberRef;
local v6 = {};
if l_enableSchedulerTracing_0 then
    v6 = {};
end;
v0.unstable_subscribe = function(v7)
    if l_enableSchedulerTracing_0 then
        v6[v7] = true;
        if #l_Object_0.keys(v6) == 1 then
            l___subscriberRef_0.current = {
                onInteractionScheduledWorkCompleted = onInteractionScheduledWorkCompleted, 
                onInteractionTraced = onInteractionTraced, 
                onWorkCanceled = onWorkCanceled, 
                onWorkScheduled = onWorkScheduled, 
                onWorkStarted = onWorkStarted, 
                onWorkStopped = onWorkStopped
            };
        end;
    end;
end;
v0.unstable_unsubscribe = function(v8)
    if l_enableSchedulerTracing_0 then
        v6[v8] = nil;
        if #l_Object_0.keys(v6) == 0 then
            l___subscriberRef_0.current = nil;
        end;
    end;
end;
onInteractionTraced = function(v9)
    local v10 = false;
    local v11 = nil;
    for v12, _ in v6, nil, nil do
        local l_status_0, l_result_0 = pcall(v12.onInteractionTraced, v9);
        if not (l_status_0 or v10) then
            v10 = true;
            v11 = l_result_0;
        end;
    end;
    if v10 then
        error(v11);
    end;
end;
onInteractionScheduledWorkCompleted = function(v16)
    local v17 = false;
    local v18 = nil;
    for v19, _ in v6, nil, nil do
        local l_status_1, l_result_1 = pcall(v19.onInteractionScheduledWorkCompleted, v16);
        if not (l_status_1 or v17) then
            v17 = true;
            v18 = l_result_1;
        end;
    end;
    if v17 then
        error(v18);
    end;
end;
onWorkScheduled = function(v23, v24)
    local v25 = false;
    local v26 = nil;
    for v27, _ in v6, nil, nil do
        local l_status_2, l_result_2 = pcall(v27.onWorkScheduled, v23, v24);
        if not (l_status_2 or v25) then
            v25 = true;
            v26 = l_result_2;
        end;
    end;
    if v25 then
        error(v26);
    end;
end;
onWorkStarted = function(v31, v32)
    local v33 = false;
    local v34 = nil;
    for v35, _ in v6, nil, nil do
        local l_status_3, l_result_3 = pcall(v35.onWorkStarted, v31, v32);
        if not (l_status_3 or v33) then
            v33 = true;
            v34 = l_result_3;
        end;
    end;
    if v33 then
        error(v34);
    end;
end;
onWorkStopped = function(v39, v40)
    local v41 = false;
    local v42 = nil;
    for v43, _ in v6, nil, nil do
        local l_status_4, l_result_4 = pcall(v43.onWorkStopped, v39, v40);
        if not (l_status_4 or v41) then
            v41 = true;
            v42 = l_result_4;
        end;
    end;
    if v41 then
        error(v42);
    end;
end;
onWorkCanceled = function(v47, v48)
    local v49 = false;
    local v50 = nil;
    for v51, _ in v6, nil, nil do
        local l_status_5, l_result_5 = pcall(v51.onWorkCanceled, v47, v48);
        if not (l_status_5 or v49) then
            v49 = true;
            v50 = l_result_5;
        end;
    end;
    if v49 then
        error(v50);
    end;
end;
return v0;
