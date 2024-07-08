local function _(v0)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. v0);
    error("FIXME (roblox): " .. v0 .. " is unimplemented");
end;
local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Error_0 = v4.Error;
local l_Object_0 = v4.Object;
local l_createRef_0 = require(l_Parent_0.React).createRef;
local l_createBinding_0 = require(l_Parent_0.React).createBinding;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v13 = require(script.Parent.ReactFiberLane);
local v14 = require(script.Parent.ReactHookEffectTags);
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_enableNewReconciler_0 = l_ReactFeatureFlags_0.enableNewReconciler;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local l_DebugTracingMode_0 = require(script.Parent.ReactTypeOfMode).DebugTracingMode;
local l_NoLane_0 = v13.NoLane;
local l_NoLanes_0 = v13.NoLanes;
local l_isSubsetOfLanes_0 = v13.isSubsetOfLanes;
local l_mergeLanes_0 = v13.mergeLanes;
local l_removeLanes_0 = v13.removeLanes;
local l_markRootEntangled_0 = v13.markRootEntangled;
local l_markRootMutableRead_0 = v13.markRootMutableRead;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v30 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v30.Update;
local l_Passive_0 = v30.Passive;
local l_PassiveStatic_0 = v30.PassiveStatic;
local l_MountLayoutDev_0 = v30.MountLayoutDev;
local l_MountPassiveDev_0 = v30.MountPassiveDev;
local l_HasEffect_0 = v14.HasEffect;
local l_Layout_0 = v14.Layout;
local l_Passive_1 = v14.Passive;
local v39 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_warnIfNotCurrentlyActingUpdatesInDEV_0 = v39.warnIfNotCurrentlyActingUpdatesInDEV;
local l_scheduleUpdateOnFiber_0 = v39.scheduleUpdateOnFiber;
local l_warnIfNotScopedWithMatchingAct_0 = v39.warnIfNotScopedWithMatchingAct;
local l_requestEventTime_0 = v39.requestEventTime;
local l_requestUpdateLane_0 = v39.requestUpdateLane;
local l_markSkippedUpdateLanes_0 = v39.markSkippedUpdateLanes;
local l_getWorkInProgressRoot_0 = v39.getWorkInProgressRoot;
local l_warnIfNotCurrentlyActingEffectsInDEV_0 = v39.warnIfNotCurrentlyActingEffectsInDEV;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local function _(v50, v51)
    local v52;
    if v50 == v51 then
        v52 = true;
        if v50 == 0 then
            v52 = true;
            if not (1 / v50 ~= 1 / v51) then
                goto label0;
            end;
        else
            goto label0;
        end;
    end;
    v52 = false;
    if v50 ~= v50 then
        v52 = v51 ~= v51;
    end;
    ::label0::;
    return v52;
end;
local l_markWorkInProgressReceivedUpdate_0 = require(script.Parent["ReactFiberBeginWork.new"]).markWorkInProgressReceivedUpdate;
local l_getIsHydrating_0 = require(script.Parent["ReactFiberHydrationContext.new"]).getIsHydrating;
local l_makeClientId_0 = require(script.Parent.ReactFiberHostConfig).makeClientId;
local v57 = require(script.Parent["ReactMutableSource.new"]);
local l_warnAboutMultipleRenderersDEV_0 = v57.warnAboutMultipleRenderersDEV;
local l_getWorkInProgressVersion_0 = v57.getWorkInProgressVersion;
local l_setWorkInProgressVersion_0 = v57.setWorkInProgressVersion;
local l_markSourceAsDirty_0 = v57.markSourceAsDirty;
local l_logStateUpdateScheduled_0 = require(script.Parent.DebugTracing).logStateUpdateScheduled;
local l_markStateUpdateScheduled_0 = require(script.Parent.SchedulingProfiler).markStateUpdateScheduled;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local v65 = nil;
local v66 = nil;
if l___DEV___0 then
    v66 = {};
    v65 = {};
end;
local v67 = {};
local l_l_NoLanes_0_0 = l_NoLanes_0;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = false;
local v73 = false;
local v74 = nil;
local v75 = nil;
local v76 = 0;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local v83 = nil;
local _ = function(v84)
    local v85 = 0;
    for v86, _ in v84, nil, nil do
        if v85 < v86 then
            v85 = v86;
        end;
    end;
    return v85;
end;
local _ = function(v89)
    if type(v89) ~= "table" then
        return false;
    else
        for v90, _ in v89, nil, nil do
            if type(v90) ~= "number" then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _()
    if l___DEV___0 then
        local l_v74_0 = v74;
        if v75 == nil then
            v75 = {
                l_v74_0
            };
            return ;
        else
            table.insert(v75, l_v74_0);
        end;
    end;
end;
updateHookTypesDev = function()
    if l___DEV___0 then
        local l_v74_1 = v74;
        if v75 ~= nil then
            v76 = v76 + 1;
            if v75[v76] ~= l_v74_1 then
                warnOnHookMismatchInDev(l_v74_1);
            end;
        end;
    end;
end;
local _ = function(v96)
    if l___DEV___0 and v96 ~= nil then
        local v97;
        if type(v96) ~= "table" then
            v97 = false;
        else
            for v98, _ in v96, nil, nil do
                if type(v98) ~= "number" then
                    v97 = false;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v97 = true;
        end;
        ::label1::;
        if not v97 then
            l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v96)));
        end;
    end;
end;
warnOnHookMismatchInDev = function(v101)
    if l___DEV___0 then
        local v102 = l_getComponentName_0(v69.type) or "Component";
        if not v65[v102] then
            v65[v102] = true;
            if v75 ~= nil then
                local v103 = "";
                for v104 = 1, v76 do
                    local v105 = v75[v104];
                    local v106 = nil;
                    v106 = if v104 == v76 then v101 else v105;
                    local v107 = tostring(v104) .. ". " .. (v105 or "undefined");
                    while string.len(v107) < 30 do
                        v107 = v107 .. " ";
                    end;
                    v103 = v103 .. v107 .. v106 .. "\n";
                end;
                l_console_0.error("React has detected a change in the order of Hooks called by %s. " .. "This will lead to bugs and errors if not fixed. " .. "For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n" .. "   Previous render            Next render\n" .. "   ------------------------------------------------------\n" .. "%s" .. "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v102, v103);
            end;
        end;
    end;
end;
local function v108()
    error(l_Error_0.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."));
end;
local function v122(v109, v110)
    if l___DEV___0 then
    end;
    if v110 == nil then
        if l___DEV___0 then
            l_console_0.error("%s received a final argument during this render, but not during " .. "the previous render. Even though the final argument is optional, " .. "its type cannot change between renders.", v74);
        end;
        return false;
    else
        local v111 = 0;
        for v112, _ in v109, nil, nil do
            if v111 < v112 then
                v111 = v112;
            end;
        end;
        local l_v111_0 = v111;
        local v115 = 0;
        for v116, _ in v110, nil, nil do
            if v115 < v116 then
                v115 = v116;
            end;
        end;
        v111 = v115;
        if l_v111_0 ~= v111 then
            return false;
        else
            for v118 = 1, math.min(v111, l_v111_0) do
                local v119 = v109[v118];
                local v120 = v110[v118];
                local v121;
                if v119 == v120 then
                    v121 = true;
                    if v119 == 0 then
                        v121 = true;
                        if not (1 / v119 ~= 1 / v120) then
                            goto label2;
                        end;
                    else
                        goto label2;
                    end;
                end;
                v121 = false;
                if v119 ~= v119 then
                    v121 = v120 ~= v120;
                end;
                ::label2::;
                if not v121 then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v67.bailoutHooks = function(v123, v124, v125)
    v124.updateQueue = v123.updateQueue;
    if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
        v124.flags = bit32.band(v124.flags, (bit32.bnot((bit32.bor(l_Passive_0, l_Update_0)))));
    else
        v124.flags = bit32.band(v124.flags, (bit32.bnot((bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_MountLayoutDev_0, l_Update_0)))));
    end;
    v123.lanes = l_removeLanes_0(v123.lanes, v125);
end;
local v126 = false;
v67.resetHooksAfterThrow = function()
    l_ReactCurrentDispatcher_0.current = v67.ContextOnlyDispatcher;
    if v72 then
        local l_memoizedState_0 = v69.memoizedState;
        while l_memoizedState_0 ~= nil do
            local l_queue_0 = l_memoizedState_0.queue;
            if l_queue_0 ~= nil then
                l_queue_0.pending = nil;
            end;
            l_memoizedState_0 = l_memoizedState_0.next;
        end;
        v72 = false;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v69 = nil;
    v70 = nil;
    v71 = nil;
    if l___DEV___0 then
        v75 = nil;
        v76 = 0;
        v74 = nil;
        v126 = false;
    end;
    v73 = false;
end;
local function _()
    local v129 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v129;
        v71 = v129;
    else
        v71.next = v129;
        v71 = v129;
    end;
    return v71;
end;
local function v135()
    local v131 = nil;
    if v70 == nil then
        local l_alternate_0 = v69.alternate;
        v131 = if l_alternate_0 ~= nil then l_alternate_0.memoizedState else nil;
    else
        v131 = v70.next;
    end;
    local v133 = nil;
    v133 = if v71 == nil then v69.memoizedState else v71.next;
    if v133 ~= nil then
        v71 = v133;
        v133 = v71.next;
        v70 = v131;
    else
        if v131 == nil then
            error(l_Error_0.new("Rendered more hooks than during the previous render."));
        end;
        v70 = v131;
        local v134 = {
            memoizedState = v70.memoizedState, 
            baseState = v70.baseState, 
            baseQueue = v70.baseQueue, 
            queue = v70.queue, 
            next = nil
        };
        if v71 == nil then
            v71 = v134;
            v69.memoizedState = v134;
        else
            v71.next = v134;
            v71 = v134;
        end;
    end;
    return v71;
end;
basicStateReducer = function(v136, v137)
    if type(v137) == "function" then
        return v137(v136);
    else
        return v137;
    end;
end;
mountReducer = function(v138, v139, v140)
    local v141 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v141;
        v71 = v141;
    else
        v71.next = v141;
        v71 = v141;
    end;
    local l_v71_0 = v71;
    v141 = nil;
    v141 = if v140 ~= nil then v140(v139) else v139;
    l_v71_0.baseState = v141;
    l_v71_0.memoizedState = l_v71_0.baseState;
    local v143 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = v138, 
        lastRenderedState = v141
    };
    l_v71_0.queue = v143;
    local l_v69_0 = v69;
    local function v146(v145, ...)
        dispatchAction(l_v69_0, v143, v145, ...);
    end;
    v143.dispatch = v146;
    return l_v71_0.memoizedState, v146;
end;
updateReducer = function(v147, _, _)
    local v150 = v135();
    local l_queue_1 = v150.queue;
    assert(l_queue_1 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_1.lastRenderedReducer = v147;
    local l_v70_0 = v70;
    local l_baseQueue_0 = l_v70_0.baseQueue;
    local l_pending_0 = l_queue_1.pending;
    if l_pending_0 ~= nil then
        if l_baseQueue_0 ~= nil then
            local l_next_0 = l_baseQueue_0.next;
            l_baseQueue_0.next = l_pending_0.next;
            l_pending_0.next = l_next_0;
        end;
        l_baseQueue_0 = l_pending_0;
        l_v70_0.baseQueue = l_baseQueue_0;
        l_queue_1.pending = nil;
    end;
    if l_baseQueue_0 ~= nil then
        local l_next_1 = l_baseQueue_0.next;
        local l_baseState_0 = l_v70_0.baseState;
        local v158 = nil;
        local v159 = nil;
        local v160 = nil;
        local l_l_next_1_0 = l_next_1;
        while true do
            local l_lane_0 = l_l_next_1_0.lane;
            if bit32.band(l_l_NoLanes_0_0, l_lane_0) ~= l_lane_0 then
                local v163 = {
                    lane = l_lane_0, 
                    action = l_l_next_1_0.action, 
                    eagerReducer = l_l_next_1_0.eagerReducer, 
                    eagerState = l_l_next_1_0.eagerState, 
                    next = nil
                };
                if v160 == nil then
                    v160 = v163;
                    v159 = v160;
                    v158 = l_baseState_0;
                else
                    v160.next = v163;
                    v160 = v160.next;
                end;
                v69.lanes = l_mergeLanes_0(v69.lanes, l_lane_0);
                l_markSkippedUpdateLanes_0(l_lane_0);
            else
                if v160 ~= nil then
                    v160.next = {
                        lane = l_NoLane_0, 
                        action = l_l_next_1_0.action, 
                        eagerReducer = l_l_next_1_0.eagerReducer, 
                        eagerState = l_l_next_1_0.eagerState, 
                        next = nil
                    };
                    v160 = v160.next;
                end;
                l_baseState_0 = if l_l_next_1_0.eagerReducer == v147 then l_l_next_1_0.eagerState else v147(l_baseState_0, l_l_next_1_0.action);
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
            if not (l_l_next_1_0 ~= nil and l_l_next_1_0 ~= l_next_1) then
                break;
            end;
        end;
        if v160 == nil then
            v158 = l_baseState_0;
        else
            v160.next = v159;
        end;
        local l_l_baseState_0_0 = l_baseState_0;
        local l_memoizedState_1 = v150.memoizedState;
        local v166;
        if l_l_baseState_0_0 == l_memoizedState_1 then
            v166 = true;
            if l_l_baseState_0_0 == 0 then
                v166 = true;
                if not (1 / l_l_baseState_0_0 ~= 1 / l_memoizedState_1) then
                    goto label3;
                end;
            else
                goto label3;
            end;
        end;
        v166 = false;
        if l_l_baseState_0_0 ~= l_l_baseState_0_0 then
            v166 = l_memoizedState_1 ~= l_memoizedState_1;
        end;
        ::label3::;
        if not v166 then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v150.memoizedState = l_baseState_0;
        v150.baseState = v158;
        v150.baseQueue = v160;
        l_queue_1.lastRenderedState = l_baseState_0;
    end;
    return v150.memoizedState, l_queue_1.dispatch;
end;
rerenderReducer = function(v167, _, _)
    local v170 = v135();
    local l_queue_2 = v170.queue;
    assert(l_queue_2 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_2.lastRenderedReducer = v167;
    local l_dispatch_0 = l_queue_2.dispatch;
    local l_pending_1 = l_queue_2.pending;
    local l_memoizedState_2 = v170.memoizedState;
    if l_pending_1 ~= nil then
        l_queue_2.pending = nil;
        local l_next_2 = l_pending_1.next;
        local l_l_next_2_0 = l_next_2;
        while true do
            l_memoizedState_2 = v167(l_memoizedState_2, l_l_next_2_0.action);
            l_l_next_2_0 = l_l_next_2_0.next;
            if not (l_l_next_2_0 ~= l_next_2) then
                break;
            end;
        end;
        local l_l_memoizedState_2_0 = l_memoizedState_2;
        local l_memoizedState_3 = v170.memoizedState;
        local v179;
        if l_l_memoizedState_2_0 == l_memoizedState_3 then
            v179 = true;
            if l_l_memoizedState_2_0 == 0 then
                v179 = true;
                if not (1 / l_l_memoizedState_2_0 ~= 1 / l_memoizedState_3) then
                    goto label4;
                end;
            else
                goto label4;
            end;
        end;
        v179 = false;
        if l_l_memoizedState_2_0 ~= l_l_memoizedState_2_0 then
            v179 = l_memoizedState_3 ~= l_memoizedState_3;
        end;
        ::label4::;
        if not v179 then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v170.memoizedState = l_memoizedState_2;
        if v170.baseQueue == nil then
            v170.baseState = l_memoizedState_2;
        end;
        l_queue_2.lastRenderedState = l_memoizedState_2;
    end;
    return l_memoizedState_2, l_dispatch_0;
end;
readFromUnsubcribedMutableSource = function(v180, v181, v182)
    if l___DEV___0 then
        l_warnAboutMultipleRenderersDEV_0(v181);
    end;
    local v183 = v181._getVersion(v181._source);
    local v184 = false;
    local v185 = l_getWorkInProgressVersion_0(v181);
    if v185 ~= nil then
        v184 = v185 == v183;
    else
        v184 = l_isSubsetOfLanes_0(l_l_NoLanes_0_0, v180.mutableReadLanes);
        if v184 then
            l_setWorkInProgressVersion_0(v181, v183);
        end;
    end;
    if not v184 then
        l_markSourceAsDirty_0(v181);
        error(l_Error_0.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."));
        return ;
    else
        local v186 = v182(v181._source);
        if l___DEV___0 and type(v186) == "function" then
            l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
        end;
        return v186;
    end;
end;
useMutableSource = function(v187, v188, v189, v190)
    local v191 = l_getWorkInProgressRoot_0();
    l_invariant_0(v191 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.");
    local l__getVersion_0 = v188._getVersion;
    local v193 = l__getVersion_0(v188._source);
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    assert(l_current_0 ~= nil, "dispatcher was nil, this is a bug in React");
    local v195, v196 = l_current_0.useState(function()
        return readFromUnsubcribedMutableSource(v191, v188, v189);
    end);
    local l_v195_0 = v195;
    local l_v71_1 = v71;
    local l_memoizedState_4 = v187.memoizedState;
    if l_memoizedState_4.refs == nil then
        error((tostring(debug.traceback())));
    end;
    local l_refs_0 = l_memoizedState_4.refs;
    local l_getSnapshot_0 = l_refs_0.getSnapshot;
    local l_source_0 = l_memoizedState_4.source;
    local l_subscribe_0 = l_memoizedState_4.subscribe;
    local l_v69_1 = v69;
    v187.memoizedState = {
        refs = l_refs_0, 
        source = v188, 
        subscribe = v190
    };
    l_current_0.useEffect(function()
        l_refs_0.getSnapshot = v189;
        l_refs_0.setSnapshot = v196;
        local v205 = l__getVersion_0(v188._source);
        local l_v193_0 = v193;
        local v207;
        if l_v193_0 == v205 then
            v207 = true;
            if l_v193_0 == 0 then
                v207 = true;
                if not (1 / l_v193_0 ~= 1 / v205) then
                    goto label7;
                end;
            else
                goto label7;
            end;
        end;
        v207 = false;
        if l_v193_0 ~= l_v193_0 then
            v207 = v205 ~= v205;
        end;
        ::label7::;
        if not v207 then
            v207 = v189(v188._source);
            if l___DEV___0 and type(v207) == "function" then
                l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
            end;
            local l_l_v195_0_0 = l_v195_0;
            if l_l_v195_0_0 == v207 then
                l_v193_0 = true;
                if l_l_v195_0_0 == 0 then
                    l_v193_0 = true;
                    if not (1 / l_l_v195_0_0 ~= 1 / v207) then
                        goto label8;
                    end;
                else
                    goto label8;
                end;
            end;
            l_v193_0 = false;
            if l_l_v195_0_0 ~= l_l_v195_0_0 then
                l_v193_0 = v207 ~= v207;
            end;
            ::label8::;
            if not l_v193_0 then
                v196(v207);
                l_markRootMutableRead_0(v191, (l_requestUpdateLane_0(l_v69_1)));
            end;
            l_markRootEntangled_0(v191, v191.mutableReadLanes);
        end;
    end, {
        v189, 
        v188, 
        v190
    });
    l_current_0.useEffect(function()
        local v213 = v190(v188._source, function()
            local l_getSnapshot_1 = l_refs_0.getSnapshot;
            local l_setSnapshot_0 = l_refs_0.setSnapshot;
            local l_status_0, l_result_0 = pcall(function()
                l_setSnapshot_0(l_getSnapshot_1(v188._source));
                l_markRootMutableRead_0(v191, (l_requestUpdateLane_0(l_v69_1)));
            end);
            if not l_status_0 then
                l_setSnapshot_0(function()
                    error(l_result_0);
                end);
            end;
        end);
        if l___DEV___0 and type(v213) ~= "function" then
            l_console_0.error("Mutable source subscribe function must return an unsubscribe function.");
        end;
        return v213;
    end, {
        v188, 
        v190
    });
    local v214;
    if l_getSnapshot_0 == v189 then
        v214 = true;
        if l_getSnapshot_0 == 0 then
            v214 = true;
            if not (1 / l_getSnapshot_0 ~= 1 / v189) then
                goto label5;
            end;
        else
            goto label5;
        end;
    end;
    v214 = false;
    if l_getSnapshot_0 ~= l_getSnapshot_0 then
        v214 = v189 ~= v189;
    end;
    ::label5::;
    local v215;
    if v214 then
        if l_source_0 == v188 then
            v214 = true;
            if l_source_0 == 0 then
                v214 = true;
                if not (1 / l_source_0 ~= 1 / v188) then
                    goto label9;
                end;
            else
                goto label9;
            end;
        end;
        v214 = false;
        if l_source_0 ~= l_source_0 then
            v214 = v188 ~= v188;
        end;
        ::label9::;
        if v214 then
            if l_subscribe_0 == v190 then
                v214 = true;
                if l_subscribe_0 == 0 then
                    v214 = true;
                    if not (1 / l_subscribe_0 ~= 1 / v190) then
                        goto label10;
                    end;
                else
                    goto label10;
                end;
            end;
            v214 = false;
            if l_subscribe_0 ~= l_subscribe_0 then
                v214 = v190 ~= v190;
            end;
            ::label10::;
            if v214 then
                goto label6;
            end;
        end;
    end;
    v214 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = basicStateReducer, 
        lastRenderedState = l_v195_0
    };
    v215 = v69;
    v196 = function(...)
        dispatchAction(v215, v214, ...);
    end;
    v214.dispatch = v196;
    l_v71_1.queue = v214;
    l_v71_1.baseQueue = nil;
    l_v195_0 = readFromUnsubcribedMutableSource(v191, v188, v189);
    l_v71_1.baseState = l_v195_0;
    l_v71_1.memoizedState = l_v71_1.baseState;
    ::label6::;
    return l_v195_0;
end;
mountMutableSource = function(v216, v217, v218)
    local v219 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v219;
        v71 = v219;
    else
        v71.next = v219;
        v71 = v219;
    end;
    local l_v71_2 = v71;
    l_v71_2.memoizedState = {
        refs = {
            getSnapshot = v217, 
            setSnapshot = nil
        }, 
        source = v216, 
        subscribe = v218
    };
    return useMutableSource(l_v71_2, v216, v217, v218);
end;
updateMutableSource = function(v221, v222, v223)
    return useMutableSource(v135(), v221, v222, v223);
end;
mountState = function(v224)
    local v225 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v225;
        v71 = v225;
    else
        v71.next = v225;
        v71 = v225;
    end;
    local l_v71_3 = v71;
    if type(v224) == "function" then
        v224 = v224();
    end;
    l_v71_3.baseState = v224;
    l_v71_3.memoizedState = l_v71_3.baseState;
    v225 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = nil, 
        lastRenderedState = v224, 
        lastRenderedReducer = basicStateReducer
    };
    l_v71_3.queue = v225;
    local l_v69_2 = v69;
    local function v229(v228, ...)
        dispatchAction(l_v69_2, v225, v228, ...);
    end;
    v225.dispatch = v229;
    return l_v71_3.memoizedState, v229;
end;
updateState = function(v230)
    return updateReducer(basicStateReducer, v230);
end;
rerenderState = function(v231)
    return rerenderReducer(basicStateReducer, v231);
end;
local function v240(v232, v233, v234, v235)
    local v236 = {
        tag = v232, 
        create = v233, 
        destroy = v234, 
        deps = v235, 
        next = nil
    };
    local l_updateQueue_0 = v69.updateQueue;
    if l_updateQueue_0 == nil then
        l_updateQueue_0 = {
            lastEffect = nil
        };
        v69.updateQueue = l_updateQueue_0;
        v236.next = v236;
        l_updateQueue_0.lastEffect = v236;
        return v236;
    else
        local l_lastEffect_0 = l_updateQueue_0.lastEffect;
        if l_lastEffect_0 == nil then
            l_updateQueue_0.lastEffect = v236;
            v236.next = v236;
            return v236;
        else
            local l_next_3 = l_lastEffect_0.next;
            l_lastEffect_0.next = v236;
            v236.next = l_next_3;
            l_updateQueue_0.lastEffect = v236;
            return v236;
        end;
    end;
end;
mountBinding = function(v241)
    local v242 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v242;
        v71 = v242;
    else
        v71.next = v242;
        v71 = v242;
    end;
    local l_v71_4 = v71;
    local v244;
    v242, v244 = l_createBinding_0(v241);
    l_v71_4.memoizedState = {
        v242, 
        v244
    };
    return v242, v244;
end;
updateBinding = function(_)
    return unpack(v135().memoizedState);
end;
mountRef = function(v246)
    local v247 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v247;
        v71 = v247;
    else
        v71.next = v247;
        v71 = v247;
    end;
    local l_v71_5 = v71;
    v247 = l_createRef_0();
    v247.current = v246;
    l_v71_5.memoizedState = v247;
    return v247;
end;
updateRef = function(_)
    return v135().memoizedState;
end;
local function v256(v250, v251, v252, v253)
    local v254 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v254;
        v71 = v254;
    else
        v71.next = v254;
        v71 = v254;
    end;
    local l_v71_6 = v71;
    v69.flags = bit32.bor(v69.flags, v250);
    l_v71_6.memoizedState = v240(bit32.bor(l_HasEffect_0, v251), v252, nil, v253);
end;
updateEffectImpl = function(v257, v258, v259, v260)
    local v261 = v135();
    local v262 = nil;
    if v70 ~= nil then
        local l_memoizedState_5 = v70.memoizedState;
        v262 = l_memoizedState_5.destroy;
        if not (not (v260 ~= nil) or not v122(v260, l_memoizedState_5.deps)) then
            v261.memoizedState = v240(v258, v259, v262, v260);
            return ;
        end;
    end;
    v69.flags = bit32.bor(v69.flags, v257);
    v261.memoizedState = v240(bit32.bor(l_HasEffect_0, v258), v259, v262, v260);
end;
local function v274(v264, v265)
    if not (not l___DEV___0 or type(_G.jest) == "nil" and not _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v69);
    end;
    if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
        local v266 = bit32.bor(l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_0 = l_Passive_1;
        local v268 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v71 == nil then
            v69.memoizedState = v268;
            v71 = v268;
        else
            v71.next = v268;
            v71 = v268;
        end;
        local l_v71_7 = v71;
        v69.flags = bit32.bor(v69.flags, v266);
        l_v71_7.memoizedState = v240(bit32.bor(l_HasEffect_0, l_l_Passive_1_0), v264, nil, v265);
        return ;
    else
        local v270 = bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_1 = l_Passive_1;
        local v272 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v71 == nil then
            v69.memoizedState = v272;
            v71 = v272;
        else
            v71.next = v272;
            v71 = v272;
        end;
        local l_v71_8 = v71;
        v69.flags = bit32.bor(v69.flags, v270);
        l_v71_8.memoizedState = v240(bit32.bor(l_HasEffect_0, l_l_Passive_1_1), v264, nil, v265);
        return ;
    end;
end;
local function v277(v275, v276)
    if not (not l___DEV___0 or type(_G.jest) == "nil" and not _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v69);
    end;
    updateEffectImpl(l_Passive_0, l_Passive_1, v275, v276);
end;
local function v288(v278, v279)
    if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Layout_0_0 = l_Layout_0;
        local v282 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v71 == nil then
            v69.memoizedState = v282;
            v71 = v282;
        else
            v71.next = v282;
            v71 = v282;
        end;
        local l_v71_9 = v71;
        v69.flags = bit32.bor(v69.flags, l_l_Update_0_0);
        l_v71_9.memoizedState = v240(bit32.bor(l_HasEffect_0, l_l_Layout_0_0), v278, nil, v279);
        return ;
    else
        local v284 = bit32.bor(l_MountLayoutDev_0, l_Update_0);
        local l_l_Layout_0_1 = l_Layout_0;
        local v286 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v71 == nil then
            v69.memoizedState = v286;
            v71 = v286;
        else
            v71.next = v286;
            v71 = v286;
        end;
        local l_v71_10 = v71;
        v69.flags = bit32.bor(v69.flags, v284);
        l_v71_10.memoizedState = v240(bit32.bor(l_HasEffect_0, l_l_Layout_0_1), v278, nil, v279);
        return ;
    end;
end;
local function v291(v289, v290)
    updateEffectImpl(l_Update_0, l_Layout_0, v289, v290);
end;
imperativeHandleEffect = function(v292, v293)
    if v293 ~= nil and type(v293) == "function" then
        v293((v292()));
        return function()
            return v293(nil);
        end;
    elseif v293 ~= nil then
        if l___DEV___0 then
            local v294 = false;
            if getmetatable(v293) ~= nil then
                v294 = #l_Object_0.keys(v293) == 0;
            end;
            if not v294 then
                l_console_0.error("Expected useImperativeHandle() first argument to either be a " .. "ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. l_Array_0.join(l_Object_0.keys(v293), ", ") .. "}");
            end;
        end;
        v293.current = v292();
        return function()
            v293.current = nil;
        end;
    else
        return nil;
    end;
end;
mountImperativeHandle = function(v295, v296, v297)
    if l___DEV___0 and type(v296) ~= "function" then
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", if v296 ~= nil then type(v296) else "nil");
    end;
    local v298 = if v297 ~= nil then l_Array_0.concat(v297, {
        v295
    }) else nil;
    if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
        return v256(l_Update_0, l_Layout_0, function()
            return imperativeHandleEffect(v296, v295);
        end, v298);
    else
        return v256(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, function()
            return imperativeHandleEffect(v296, v295);
        end, v298);
    end;
end;
updateImperativeHandle = function(v299, v300, v301)
    if l___DEV___0 and type(v300) ~= "function" then
        local v302 = "nil";
        if v300 then
            v302 = type(v300);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", v302);
    end;
    local v303 = nil;
    if v301 ~= nil then
        v303 = table.clone(v301);
        table.insert(v303, v299);
    end;
    return updateEffectImpl(l_Update_0, l_Layout_0, function()
        return imperativeHandleEffect(v300, v299);
    end, v303);
end;
mountDebugValue = function(_, _)
end;
local l_mountDebugValue_0 = mountDebugValue;
mountCallback = function(v307, v308)
    local v309 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v309;
        v71 = v309;
    else
        v71.next = v309;
        v71 = v309;
    end;
    v71.memoizedState = {
        v307, 
        v308
    };
    return v307;
end;
updateCallback = function(v310, v311)
    local v312 = v135();
    local l_memoizedState_6 = v312.memoizedState;
    if not (l_memoizedState_6 ~= nil and v311 ~= nil) or not v122(v311, l_memoizedState_6[2]) then
        v312.memoizedState = {
            v310, 
            v311
        };
        return v310;
    else
        return l_memoizedState_6[1];
    end;
end;
mountMemo = function(v314, v315)
    local v316 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v71 == nil then
        v69.memoizedState = v316;
        v71 = v316;
    else
        v71.next = v316;
        v71 = v316;
    end;
    local l_v71_11 = v71;
    v316 = {
        v314()
    };
    l_v71_11.memoizedState = {
        v316, 
        v315
    };
    return unpack(v316);
end;
updateMemo = function(v318, v319)
    local v320 = v135();
    local l_memoizedState_7 = v320.memoizedState;
    if not (l_memoizedState_7 ~= nil and v319 ~= nil) or not v122(v319, l_memoizedState_7[2]) then
        local v322 = {
            v318()
        };
        v320.memoizedState = {
            v322, 
            v319
        };
        return unpack(v322);
    else
        return unpack(l_memoizedState_7[1]);
    end;
end;
v67.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function()
    if not l___DEV___0 then
        return nil;
    else
        return false;
    end;
end;
mountOpaqueIdentifier = function()
    local v323 = nil;
    if not l___DEV___0 then
        v323 = l_makeClientId_0;
    else
        l_console_0.warn(" warnOnOpaqueIdentifierAccessInDEV");
    end;
    if not l_getIsHydrating_0() then
        local v324 = v323();
        mountState(v324);
        return v324;
    else
        print("");
        print("");
        print("UNIMPLEMENTED ERROR: " .. "ReactFiberHooks: getIsHydrating() true");
        error("FIXME (roblox): " .. "ReactFiberHooks: getIsHydrating() true" .. " is unimplemented");
        return nil;
    end;
end;
updateOpaqueIdentifier = function()
    local v325, _ = updateState(nil);
    return v325;
end;
rerenderOpaqueIdentifier = function()
    local v327, _ = rerenderState(nil);
    return v327;
end;
dispatchAction = function(v329, v330, v331, ...)
    if l___DEV___0 then
        local v332 = select("#", ...);
        local v333 = nil;
        if v332 == 1 then
            v333 = select(1, ...);
        end;
        if type(v333) == "function" then
            l_console_0.error("State updates from the useState() and useReducer() Hooks don't support the " .. "second callback argument. To execute a side effect after " .. "rendering, declare it in the component body with useEffect().");
        end;
    end;
    local v334 = l_requestEventTime_0();
    local v335 = l_requestUpdateLane_0(v329);
    local v336 = {
        lane = v335, 
        action = v331, 
        eagerReducer = nil, 
        eagerState = nil, 
        next = nil
    };
    local l_pending_2 = v330.pending;
    if l_pending_2 == nil then
        v336.next = v336;
    else
        v336.next = l_pending_2.next;
        l_pending_2.next = v336;
    end;
    v330.pending = v336;
    local l_alternate_1 = v329.alternate;
    if not (v329 ~= v69) or l_alternate_1 ~= nil and l_alternate_1 == v69 then
        v72 = true;
        v73 = true;
    else
        if v329.lanes == l_NoLanes_0 and (not (l_alternate_1 ~= nil) or l_alternate_1.lanes == l_NoLanes_0) then
            local l_lastRenderedReducer_0 = v330.lastRenderedReducer;
            if l_lastRenderedReducer_0 ~= nil then
                local v340 = nil;
                if l___DEV___0 then
                    v340 = l_ReactCurrentDispatcher_0.current;
                    l_ReactCurrentDispatcher_0.current = v82;
                end;
                local l_lastRenderedState_0 = v330.lastRenderedState;
                local l_status_1, l_result_1 = pcall(l_lastRenderedReducer_0, l_lastRenderedState_0, v331);
                if l_status_1 then
                    v336.eagerReducer = l_lastRenderedReducer_0;
                    v336.eagerState = l_result_1;
                end;
                if l___DEV___0 then
                    l_ReactCurrentDispatcher_0.current = v340;
                end;
                local v344;
                if l_result_1 == l_lastRenderedState_0 then
                    v344 = true;
                    if l_result_1 == 0 then
                        v344 = true;
                        if not (1 / l_result_1 ~= 1 / l_lastRenderedState_0) then
                            goto label11;
                        end;
                    else
                        goto label11;
                    end;
                end;
                v344 = false;
                if l_result_1 ~= l_result_1 then
                    v344 = l_lastRenderedState_0 ~= l_lastRenderedState_0;
                end;
                ::label11::;
                if not v344 then
                    if not l_status_1 then
                    end;
                else
                    return ;
                end;
            end;
        end;
        if not (not l___DEV___0 or type(_G.jest) == "nil" and not _G.__TESTEZ_RUNNING_TEST__) then
            l_warnIfNotScopedWithMatchingAct_0(v329);
            l_warnIfNotCurrentlyActingUpdatesInDEV_0(v329);
        end;
        l_scheduleUpdateOnFiber_0(v329, v335, v334);
    end;
    if not (not l___DEV___0 or not l_enableDebugTracing_0) and bit32.band(v329.mode, l_DebugTracingMode_0) ~= 0 then
        l_logStateUpdateScheduled_0(l_getComponentName_0(v329.type) or "Unknown", v335, v331);
    end;
    if l_enableSchedulingProfiler_0 then
        l_markStateUpdateScheduled_0(v329, v335);
    end;
end;
local v345 = {
    readContext = l_readContext_0, 
    useCallback = v108, 
    useContext = v108, 
    useEffect = v108, 
    useImperativeHandle = v108, 
    useLayoutEffect = v108, 
    useMemo = v108, 
    useReducer = v108, 
    useRef = v108, 
    useBinding = v108, 
    useState = v108, 
    useDebugValue = v108, 
    useMutableSource = v108, 
    useOpaqueIdentifier = v108, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
v67.ContextOnlyDispatcher = v345;
local v346 = {
    readContext = l_readContext_0, 
    useCallback = mountCallback, 
    useContext = l_readContext_0, 
    useEffect = v274, 
    useImperativeHandle = mountImperativeHandle, 
    useLayoutEffect = v288, 
    useMemo = mountMemo, 
    useReducer = mountReducer, 
    useRef = mountRef, 
    useBinding = mountBinding, 
    useState = mountState, 
    useDebugValue = mountDebugValue, 
    useMutableSource = mountMutableSource, 
    useOpaqueIdentifier = mountOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v347 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v277, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v291, 
    useMemo = updateMemo, 
    useReducer = updateReducer, 
    useRef = updateRef, 
    useBinding = updateBinding, 
    useState = updateState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = updateOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v348 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v277, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v291, 
    useMemo = updateMemo, 
    useReducer = rerenderReducer, 
    useRef = updateRef, 
    useBinding = updateBinding, 
    useState = rerenderState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = rerenderOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
if l___DEV___0 then
    local function _()
        l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
    end;
    local function _()
        l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
    end;
    v77 = {
        readContext = function(v351, v352)
            return l_readContext_0(v351, v352);
        end, 
        useCallback = function(v353, v354)
            v74 = "useCallback";
            if l___DEV___0 then
                local l_v74_2 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_2
                    };
                else
                    table.insert(v75, l_v74_2);
                end;
            end;
            if l___DEV___0 and v354 ~= nil then
                local v356;
                if type(v354) ~= "table" then
                    v356 = false;
                else
                    for v357, _ in v354, nil, nil do
                        if type(v357) ~= "number" then
                            v356 = false;
                            goto label12 --[[  true, false  ]];
                        end;
                    end;
                    v356 = true;
                end;
                ::label12::;
                if not v356 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v354)));
                end;
            end;
            return mountCallback(v353, v354);
        end, 
        useContext = function(v359, v360)
            v74 = "useContext";
            if l___DEV___0 then
                local l_v74_3 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_3
                    };
                else
                    table.insert(v75, l_v74_3);
                end;
            end;
            return l_readContext_0(v359, v360);
        end, 
        useEffect = function(v362, v363)
            v74 = "useEffect";
            if l___DEV___0 then
                local l_v74_4 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_4
                    };
                else
                    table.insert(v75, l_v74_4);
                end;
            end;
            if l___DEV___0 and v363 ~= nil then
                local v365;
                if type(v363) ~= "table" then
                    v365 = false;
                else
                    for v366, _ in v363, nil, nil do
                        if type(v366) ~= "number" then
                            v365 = false;
                            goto label13 --[[  true, false  ]];
                        end;
                    end;
                    v365 = true;
                end;
                ::label13::;
                if not v365 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v363)));
                end;
            end;
            return v274(v362, v363);
        end, 
        useImperativeHandle = function(v368, v369, v370)
            v74 = "useImperativeHandle";
            if l___DEV___0 then
                local l_v74_5 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_5
                    };
                else
                    table.insert(v75, l_v74_5);
                end;
            end;
            if l___DEV___0 and v370 ~= nil then
                local v372;
                if type(v370) ~= "table" then
                    v372 = false;
                else
                    for v373, _ in v370, nil, nil do
                        if type(v373) ~= "number" then
                            v372 = false;
                            goto label14 --[[  true, false  ]];
                        end;
                    end;
                    v372 = true;
                end;
                ::label14::;
                if not v372 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v370)));
                end;
            end;
            return mountImperativeHandle(v368, v369, v370);
        end, 
        useLayoutEffect = function(v375, v376)
            v74 = "useLayoutEffect";
            if l___DEV___0 then
                local l_v74_6 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_6
                    };
                else
                    table.insert(v75, l_v74_6);
                end;
            end;
            if l___DEV___0 and v376 ~= nil then
                local v378;
                if type(v376) ~= "table" then
                    v378 = false;
                else
                    for v379, _ in v376, nil, nil do
                        if type(v379) ~= "number" then
                            v378 = false;
                            goto label15 --[[  true, false  ]];
                        end;
                    end;
                    v378 = true;
                end;
                ::label15::;
                if not v378 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v376)));
                end;
            end;
            return v288(v375, v376);
        end, 
        useMemo = function(v381, v382)
            v74 = "useMemo";
            if l___DEV___0 then
                local l_v74_7 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_7
                    };
                else
                    table.insert(v75, l_v74_7);
                end;
            end;
            if l___DEV___0 and v382 ~= nil then
                local v384;
                if type(v382) ~= "table" then
                    v384 = false;
                else
                    for v385, _ in v382, nil, nil do
                        if type(v385) ~= "number" then
                            v384 = false;
                            goto label16 --[[  true, false  ]];
                        end;
                    end;
                    v384 = true;
                end;
                ::label16::;
                if not v384 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v382)));
                end;
            end;
            local l_current_1 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v388 = {
                pcall(mountMemo, v381, v382)
            };
            l_ReactCurrentDispatcher_0.current = l_current_1;
            if not v388[1] then
                error(v388[2]);
            end;
            return unpack(v388, 2);
        end, 
        useReducer = function(v389, v390, v391)
            v74 = "useReducer";
            if l___DEV___0 then
                local l_v74_8 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_8
                    };
                else
                    table.insert(v75, l_v74_8);
                end;
            end;
            local l_current_2 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v394, v395, v396 = pcall(mountReducer, v389, v390, v391);
            l_ReactCurrentDispatcher_0.current = l_current_2;
            if not v394 then
                error(v395);
            end;
            return v395, v396;
        end, 
        useRef = function(v397)
            v74 = "useRef";
            if l___DEV___0 then
                local l_v74_9 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_9
                    };
                else
                    table.insert(v75, l_v74_9);
                end;
            end;
            return mountRef(v397);
        end, 
        useBinding = function(v399)
            v74 = "useBinding";
            if l___DEV___0 then
                local l_v74_10 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_10
                    };
                else
                    table.insert(v75, l_v74_10);
                end;
            end;
            return mountBinding(v399);
        end, 
        useState = function(v401)
            v74 = "useState";
            if l___DEV___0 then
                local l_v74_11 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_11
                    };
                else
                    table.insert(v75, l_v74_11);
                end;
            end;
            local l_current_3 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v404, v405, v406 = pcall(mountState, v401);
            l_ReactCurrentDispatcher_0.current = l_current_3;
            if not v404 then
                error(v405);
            end;
            return v405, v406;
        end, 
        useDebugValue = function(v407, v408)
            v74 = "useDebugValue";
            if l___DEV___0 then
                local l_v74_12 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_12
                    };
                else
                    table.insert(v75, l_v74_12);
                end;
            end;
            return mountDebugValue(v407, v408);
        end, 
        useMutableSource = function(v410, v411, v412)
            v74 = "useMutableSource";
            if l___DEV___0 then
                local l_v74_13 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_13
                    };
                else
                    table.insert(v75, l_v74_13);
                end;
            end;
            return mountMutableSource(v410, v411, v412);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            if l___DEV___0 then
                local l_v74_14 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_14
                    };
                else
                    table.insert(v75, l_v74_14);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v78 = {
        readContext = function(v415, v416)
            return l_readContext_0(v415, v416);
        end, 
        useCallback = function(v417, v418)
            v74 = "useCallback";
            updateHookTypesDev();
            if l___DEV___0 and v418 ~= nil then
                local v419;
                if type(v418) ~= "table" then
                    v419 = false;
                else
                    for v420, _ in v418, nil, nil do
                        if type(v420) ~= "number" then
                            v419 = false;
                            goto label17 --[[  true, false  ]];
                        end;
                    end;
                    v419 = true;
                end;
                ::label17::;
                if not v419 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v74, (type(v418)));
                end;
            end;
            return mountCallback(v417, v418);
        end, 
        useContext = function(v422, v423)
            v74 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v422, v423);
        end, 
        useEffect = function(v424, v425)
            v74 = "useEffect";
            updateHookTypesDev();
            return v274(v424, v425);
        end, 
        useImperativeHandle = function(v426, v427, v428)
            v74 = "useImperativeHandle";
            updateHookTypesDev();
            return mountImperativeHandle(v426, v427, v428);
        end, 
        useLayoutEffect = function(v429, v430)
            v74 = "useLayoutEffect";
            updateHookTypesDev();
            return v288(v429, v430);
        end, 
        useMemo = function(v431, v432)
            v74 = "useMemo";
            updateHookTypesDev();
            local l_current_4 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v434 = {
                pcall(mountMemo, v431, v432)
            };
            l_ReactCurrentDispatcher_0.current = l_current_4;
            if not v434[1] then
                error(v434[2]);
            end;
            return unpack(v434, 2);
        end, 
        useReducer = function(v435, v436, v437)
            v74 = "useReducer";
            updateHookTypesDev();
            local l_current_5 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v439, v440, v441 = pcall(mountReducer, v435, v436, v437);
            l_ReactCurrentDispatcher_0.current = l_current_5;
            if not v439 then
                error(v440);
            end;
            return v440, v441;
        end, 
        useRef = function(v442)
            v74 = "useRef";
            updateHookTypesDev();
            return mountRef(v442);
        end, 
        useBinding = function(v443)
            v74 = "useBinding";
            updateHookTypesDev();
            return mountBinding(v443);
        end, 
        useState = function(v444)
            v74 = "useState";
            updateHookTypesDev();
            local l_current_6 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v446, v447, v448 = pcall(mountState, v444);
            l_ReactCurrentDispatcher_0.current = l_current_6;
            if not v446 then
                error(v447);
            end;
            return v447, v448;
        end, 
        useDebugValue = function(v449, v450)
            v74 = "useDebugValue";
            updateHookTypesDev();
            return mountDebugValue(v449, v450);
        end, 
        useMutableSource = function(v451, v452, v453)
            v74 = "useMutableSource";
            updateHookTypesDev();
            return mountMutableSource(v451, v452, v453);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v79 = {
        readContext = function(v454, v455)
            return l_readContext_0(v454, v455);
        end, 
        useCallback = function(v456, v457)
            v74 = "useCallback";
            updateHookTypesDev();
            return updateCallback(v456, v457);
        end, 
        useContext = function(v458, v459)
            v74 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v458, v459);
        end, 
        useEffect = function(v460, v461)
            v74 = "useEffect";
            updateHookTypesDev();
            return v277(v460, v461);
        end, 
        useImperativeHandle = function(v462, v463, v464)
            v74 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v462, v463, v464);
        end, 
        useLayoutEffect = function(v465, v466)
            v74 = "useLayoutEffect";
            updateHookTypesDev();
            return v291(v465, v466);
        end, 
        useMemo = function(v467, v468)
            v74 = "useMemo";
            updateHookTypesDev();
            local l_current_7 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v470 = {
                pcall(updateMemo, v467, v468)
            };
            l_ReactCurrentDispatcher_0.current = l_current_7;
            if not v470[1] then
                error(v470[2]);
            end;
            return unpack(v470, 2);
        end, 
        useReducer = function(v471, v472, v473)
            v74 = "useReducer";
            updateHookTypesDev();
            local l_current_8 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v475, v476, v477 = pcall(updateReducer, v471, v472, v473);
            l_ReactCurrentDispatcher_0.current = l_current_8;
            if not v475 then
                error(v476);
            end;
            return v476, v477;
        end, 
        useRef = function(v478)
            v74 = "useRef";
            updateHookTypesDev();
            return updateRef(v478);
        end, 
        useBinding = function(v479)
            v74 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v479);
        end, 
        useState = function(v480)
            v74 = "useState";
            updateHookTypesDev();
            local l_current_9 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v482, v483, v484 = pcall(updateState, v480);
            l_ReactCurrentDispatcher_0.current = l_current_9;
            if not v482 then
                error(v483);
            end;
            return v483, v484;
        end, 
        useDebugValue = function(v485, v486)
            v74 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v485, v486);
        end, 
        useMutableSource = function(v487, v488, v489)
            v74 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v487, v488, v489);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v80 = {
        readContext = function(v490, v491)
            return l_readContext_0(v490, v491);
        end, 
        useCallback = function(v492, v493)
            v74 = "useCallback";
            updateHookTypesDev();
            return mountCallback(v492, v493);
        end, 
        useContext = function(v494, v495)
            v74 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v494, v495);
        end, 
        useEffect = function(v496, v497)
            v74 = "useEffect";
            updateHookTypesDev();
            return v277(v496, v497);
        end, 
        useImperativeHandle = function(v498, v499, v500)
            v74 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v498, v499, v500);
        end, 
        useLayoutEffect = function(v501, v502)
            v74 = "useLayoutEffect";
            updateHookTypesDev();
            return v291(v501, v502);
        end, 
        useMemo = function(v503, v504)
            v74 = "useMemo";
            updateHookTypesDev();
            local l_current_10 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v506 = {
                pcall(updateMemo, v503, v504)
            };
            l_ReactCurrentDispatcher_0.current = l_current_10;
            if not v506[1] then
                error(v506[2]);
            end;
            return unpack(v506, 2);
        end, 
        useReducer = function(v507, v508, v509)
            v74 = "useReducer";
            updateHookTypesDev();
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v511, v512, v513 = pcall(rerenderReducer, v507, v508, v509);
            l_ReactCurrentDispatcher_0.current = l_current_11;
            if not v511 then
                error(v512);
            end;
            return v512, v513;
        end, 
        useRef = function(v514)
            v74 = "useRef";
            updateHookTypesDev();
            return updateRef(v514);
        end, 
        useBinding = function(v515)
            v74 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v515);
        end, 
        useState = function(v516)
            v74 = "useState";
            updateHookTypesDev();
            local l_current_12 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v518, v519, v520 = pcall(rerenderState, v516);
            l_ReactCurrentDispatcher_0.current = l_current_12;
            if not v518 then
                error(v519);
            end;
            return v519, v520;
        end, 
        useDebugValue = function(v521, v522)
            v74 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v521, v522);
        end, 
        useMutableSource = function(v523, v524, v525)
            v74 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v523, v524, v525);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v81 = {
        readContext = function(v526, v527)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v526, v527);
        end, 
        useCallback = function(v528, v529)
            v74 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_15 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_15
                    };
                else
                    table.insert(v75, l_v74_15);
                end;
            end;
            return mountCallback(v528, v529);
        end, 
        useContext = function(v531, v532)
            v74 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_16 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_16
                    };
                else
                    table.insert(v75, l_v74_16);
                end;
            end;
            return l_readContext_0(v531, v532);
        end, 
        useEffect = function(v534, v535)
            v74 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_17 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_17
                    };
                else
                    table.insert(v75, l_v74_17);
                end;
            end;
            return v274(v534, v535);
        end, 
        useImperativeHandle = function(v537, v538, v539)
            v74 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_18 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_18
                    };
                else
                    table.insert(v75, l_v74_18);
                end;
            end;
            return mountImperativeHandle(v537, v538, v539);
        end, 
        useLayoutEffect = function(v541, v542)
            v74 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_19 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_19
                    };
                else
                    table.insert(v75, l_v74_19);
                end;
            end;
            return v288(v541, v542);
        end, 
        useMemo = function(v544, v545)
            v74 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_20 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_20
                    };
                else
                    table.insert(v75, l_v74_20);
                end;
            end;
            local l_current_13 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v548 = {
                pcall(mountMemo, v544, v545)
            };
            l_ReactCurrentDispatcher_0.current = l_current_13;
            if not v548[1] then
                error(v548[2]);
            end;
            return unpack(v548, 2);
        end, 
        useReducer = function(v549, v550, v551)
            v74 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_21 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_21
                    };
                else
                    table.insert(v75, l_v74_21);
                end;
            end;
            local l_current_14 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v554, v555, v556 = pcall(mountReducer, v549, v550, v551);
            l_ReactCurrentDispatcher_0.current = l_current_14;
            if not v554 then
                error(v555);
            end;
            return v555, v556;
        end, 
        useRef = function(v557)
            v74 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_22 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_22
                    };
                else
                    table.insert(v75, l_v74_22);
                end;
            end;
            return mountRef(v557);
        end, 
        useBinding = function(v559)
            v74 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_23 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_23
                    };
                else
                    table.insert(v75, l_v74_23);
                end;
            end;
            return mountBinding(v559);
        end, 
        useState = function(v561)
            v74 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_24 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_24
                    };
                else
                    table.insert(v75, l_v74_24);
                end;
            end;
            local l_current_15 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v564, v565, v566 = pcall(mountState, v561);
            l_ReactCurrentDispatcher_0.current = l_current_15;
            if not v564 then
                error(v565);
            end;
            return v565, v566;
        end, 
        useDebugValue = function(v567, v568)
            v74 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_25 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_25
                    };
                else
                    table.insert(v75, l_v74_25);
                end;
            end;
            return mountDebugValue(v567, v568);
        end, 
        useMutableSource = function(v570, v571, v572)
            v74 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_26 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_26
                    };
                else
                    table.insert(v75, l_v74_26);
                end;
            end;
            return mountMutableSource(v570, v571, v572);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v74_27 = v74;
                if v75 == nil then
                    v75 = {
                        l_v74_27
                    };
                else
                    table.insert(v75, l_v74_27);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v82 = {
        readContext = function(v575, v576)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v575, v576);
        end, 
        useCallback = function(v577, v578)
            v74 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return mountCallback(v577, v578);
        end, 
        useContext = function(v579, v580)
            v74 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v579, v580);
        end, 
        useEffect = function(v581, v582)
            v74 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v277(v581, v582);
        end, 
        useImperativeHandle = function(v583, v584, v585)
            v74 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v583, v584, v585);
        end, 
        useLayoutEffect = function(v586, v587)
            v74 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v291(v586, v587);
        end, 
        useMemo = function(v588, v589)
            v74 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_16 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v591 = {
                pcall(updateMemo, v588, v589)
            };
            l_ReactCurrentDispatcher_0.current = l_current_16;
            if not v591[1] then
                error(v591[2]);
            end;
            return unpack(v591, 2);
        end, 
        useReducer = function(v592, v593, v594)
            v74 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_17 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v596, v597, v598 = pcall(updateReducer, v592, v593, v594);
            l_ReactCurrentDispatcher_0.current = l_current_17;
            if not v596 then
                error(v597);
            end;
            return v597, v598;
        end, 
        useRef = function(v599)
            v74 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v599);
        end, 
        useBinding = function(v600)
            v74 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v600);
        end, 
        useState = function(v601)
            v74 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_18 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v603, v604, v605 = pcall(updateState, v601);
            l_ReactCurrentDispatcher_0.current = l_current_18;
            if not v603 then
                error(v604);
            end;
            return v604, v605;
        end, 
        useDebugValue = function(v606, v607)
            v74 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v606, v607);
        end, 
        useMutableSource = function(v608, v609, v610)
            v74 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v608, v609, v610);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v83 = {
        readContext = function(v611, v612)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v611, v612);
        end, 
        useCallback = function(v613, v614)
            v74 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateCallback(v613, v614);
        end, 
        useContext = function(v615, v616)
            v74 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v615, v616);
        end, 
        useEffect = function(v617, v618)
            v74 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v277(v617, v618);
        end, 
        useImperativeHandle = function(v619, v620, v621)
            v74 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v619, v620, v621);
        end, 
        useLayoutEffect = function(v622, v623)
            v74 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v291(v622, v623);
        end, 
        useMemo = function(v624, v625)
            v74 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_19 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v627 = {
                pcall(updateMemo, v624, v625)
            };
            l_ReactCurrentDispatcher_0.current = l_current_19;
            if not v627[1] then
                error(v627[2]);
            end;
            return unpack(v627, 2);
        end, 
        useReducer = function(v628, v629, v630)
            v74 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_20 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v632, v633, v634 = pcall(rerenderReducer, v628, v629, v630);
            l_ReactCurrentDispatcher_0.current = l_current_20;
            if not v632 then
                error(v633);
            end;
            return v633, v634;
        end, 
        useRef = function(v635)
            v74 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v635);
        end, 
        useBinding = function(v636)
            v74 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v636);
        end, 
        useState = function(v637)
            v74 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_21 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v639, v640, v641 = pcall(rerenderState, v637);
            l_ReactCurrentDispatcher_0.current = l_current_21;
            if not v639 then
                error(v640);
            end;
            return v640, v641;
        end, 
        useDebugValue = function(v642, v643)
            v74 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v642, v643);
        end, 
        useMutableSource = function(v644, v645, v646)
            v74 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v644, v645, v646);
        end, 
        useOpaqueIdentifier = function()
            v74 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
end;
v67.renderWithHooks = function(v647, v648, v649, v650, v651, v652)
    l_l_NoLanes_0_0 = v652;
    v69 = v648;
    if l___DEV___0 then
        v75 = if v647 ~= nil then v647._debugHookTypes else nil;
        v76 = 0;
    end;
    v648.memoizedState = nil;
    v648.updateQueue = nil;
    v648.lanes = l_NoLanes_0;
    if not l___DEV___0 then
        l_ReactCurrentDispatcher_0.current = (not (v647 ~= nil) or v647.memoizedState == nil) and v346 or v347;
    elseif v647 ~= nil and v647.memoizedState ~= nil then
        l_ReactCurrentDispatcher_0.current = v79;
    elseif v75 ~= nil then
        l_ReactCurrentDispatcher_0.current = v78;
    else
        l_ReactCurrentDispatcher_0.current = v77;
    end;
    local v653 = v649(v650, v651);
    if v73 then
        local v654 = 0;
        while true do
            v73 = false;
            if v654 >= 25 then
                error(l_Error_0.new("Too many re-renders. React limits the number of renders to prevent " .. "an infinite loop."));
            end;
            v654 = v654 + 1;
            v70 = nil;
            v71 = nil;
            v648.updateQueue = nil;
            if l___DEV___0 then
                v76 = 0;
            end;
            l_ReactCurrentDispatcher_0.current = not not l___DEV___0 and v80 or v348;
            v653 = v649(v650, v651);
            if not v73 then
                break;
            end;
        end;
    end;
    l_ReactCurrentDispatcher_0.current = v345;
    if l___DEV___0 then
        v648._debugHookTypes = v75;
    end;
    local v655 = false;
    if v70 ~= nil then
        v655 = v70.next ~= nil;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v69 = nil;
    v70 = nil;
    v71 = nil;
    if l___DEV___0 then
        v74 = nil;
        v75 = nil;
        v76 = 0;
    end;
    v72 = false;
    if v655 then
        error(l_Error_0.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement."));
    end;
    return v653;
end;
return v67;
