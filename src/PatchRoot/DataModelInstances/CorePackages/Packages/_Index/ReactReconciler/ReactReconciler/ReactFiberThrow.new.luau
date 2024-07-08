local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactCapturedValue);
local v6 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v8 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v10 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v10.ClassComponent;
local l_HostRoot_0 = v10.HostRoot;
local l_SuspenseComponent_0 = v10.SuspenseComponent;
local l_IncompleteClassComponent_0 = v10.IncompleteClassComponent;
local v15 = require(script.Parent.ReactFiberFlags);
local l_DidCapture_0 = v15.DidCapture;
local l_Incomplete_0 = v15.Incomplete;
local l_NoFlags_0 = v15.NoFlags;
local l_ShouldCapture_0 = v15.ShouldCapture;
local l_LifecycleEffectMask_0 = v15.LifecycleEffectMask;
local l_ForceUpdateForLegacySuspense_0 = v15.ForceUpdateForLegacySuspense;
local l_shouldCaptureSuspense_0 = require(script.Parent["ReactFiberSuspenseComponent.new"]).shouldCaptureSuspense;
local v23 = require(script.Parent.ReactTypeOfMode);
local l_NoMode_0 = v23.NoMode;
local l_BlockingMode_0 = v23.BlockingMode;
local l_DebugTracingMode_0 = v23.DebugTracingMode;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_enqueueCapturedUpdate_0 = v6.enqueueCapturedUpdate;
local l_createUpdate_0 = v6.createUpdate;
local l_CaptureUpdate_0 = v6.CaptureUpdate;
local l_ForceUpdate_0 = v6.ForceUpdate;
local l_enqueueUpdate_0 = v6.enqueueUpdate;
local l_markFailedErrorBoundaryForHotReloading_0 = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading;
local l_hasSuspenseContext_0 = v8.hasSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v8.InvisibleParentSuspenseContext;
local l_suspenseStackCursor_0 = v8.suspenseStackCursor;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local function v44(...)
    if not v41 then
        v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
        v41 = v40.markLegacyErrorBoundaryAsFailed;
    end;
    return v41(...);
end;
local function v45(...)
    if v40 == nil then
        v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v43 = v40.pingSuspendedRoot;
    return v43(...);
end;
local function v46(...)
    if v40 == nil then
        v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v42 = v40.isAlreadyFailedLegacyErrorBoundary;
    return v42(...);
end;
local l_logCapturedError_0 = require(script.Parent.ReactFiberErrorLogger).logCapturedError;
local l_logComponentSuspended_0 = require(script.Parent.DebugTracing).logComponentSuspended;
local l_markComponentSuspended_0 = require(script.Parent.SchedulingProfiler).markComponentSuspended;
local l_SyncLane_0 = v4.SyncLane;
local l_NoTimestamp_0 = v4.NoTimestamp;
local l_includesSomeLane_0 = v4.includesSomeLane;
local l_mergeLanes_0 = v4.mergeLanes;
local l_pickArbitraryLane_0 = v4.pickArbitraryLane;
createRootErrorUpdate = function(v55, v56, v57, v58)
    local v59 = l_createUpdate_0(l_NoTimestamp_0, v57);
    v59.tag = l_CaptureUpdate_0;
    v59.payload = {
        element = l_Object_0.None
    };
    local l_value_0 = v56.value;
    v59.callback = function()
        if v58 ~= nil then
            v58(l_value_0);
        end;
        l_logCapturedError_0(v55, v56);
    end;
    return v59;
end;
createClassErrorUpdate = function(v61, v62, v63)
    local v64 = l_createUpdate_0(l_NoTimestamp_0, v63);
    v64.tag = l_CaptureUpdate_0;
    local l_getDerivedStateFromError_0 = v61.type.getDerivedStateFromError;
    if typeof(l_getDerivedStateFromError_0) == "function" then
        local l_value_1 = v62.value;
        local l_l_value_1_0 = l_value_1 --[[ copy: 5 -> 6 ]];
        v64.payload = function()
            l_logCapturedError_0(v61, v62);
            return l_getDerivedStateFromError_0(l_l_value_1_0);
        end;
    end;
    local l_stateNode_0 = v61.stateNode;
    if l_stateNode_0 ~= nil and typeof(l_stateNode_0.componentDidCatch) == "function" then
        v64.callback = function()
            if _G.__DEV__ then
                l_markFailedErrorBoundaryForHotReloading_0(v61);
            end;
            if typeof(l_getDerivedStateFromError_0) ~= "function" then
                v44(l_stateNode_0);
                l_logCapturedError_0(v61, v62);
            end;
            l_stateNode_0:componentDidCatch(v62.value, {
                componentStack = v62.stack or ""
            });
            if not (not (_G.__DEV__ and typeof(l_getDerivedStateFromError_0) ~= "function") or l_includesSomeLane_0(v61.lanes, l_SyncLane_0)) then
                l_console_0.error("%s: Error boundaries should implement getDerivedStateFromError(). " .. "In that method, return a state update to display an error message or fallback UI.", l_getComponentName_0(v61.type) or "Unknown");
            end;
        end;
        return v64;
    else
        if _G.__DEV__ then
            v64.callback = function()
                l_markFailedErrorBoundaryForHotReloading_0(v61);
            end;
        end;
        return v64;
    end;
end;
local function v75(v69, v70, v71)
    local l_pingCache_0 = v69.pingCache;
    local v73 = nil;
    if l_pingCache_0 == nil then
        v73 = {};
        v69.pingCache = {
            [v70] = v73
        };
        l_pingCache_0 = v69.pingCache;
    else
        v73 = l_pingCache_0[v70];
        if v73 == nil then
            v73 = {};
            l_pingCache_0[v70] = v73;
        end;
    end;
    if not v73[v71] then
        v73[v71] = true;
        local function v74()
            return v45(v69, v70, v71);
        end;
        v70:andThen(v74, v74);
    end;
end;
throwException = function(v76, v77, v78, v79, v80, v81, v82)
    v78.flags = bit32.bor(v78.flags, l_Incomplete_0);
    if (v79 ~= nil and typeof(v79) == "table") and typeof(v79.andThen) == "function" then
        local l_v79_0 = v79;
        if not (not _G.__DEV__ or not l_enableDebugTracing_0) and bit32.band(v78.mode, l_DebugTracingMode_0) ~= 0 then
            l_logComponentSuspended_0(l_getComponentName_0(v78.type) or "Unknown", l_v79_0);
        end;
        if l_enableSchedulingProfiler_0 then
            l_markComponentSuspended_0(v78, l_v79_0);
        end;
        if bit32.band(v78.mode, l_BlockingMode_0) == l_NoMode_0 then
            local l_alternate_0 = v78.alternate;
            if not l_alternate_0 then
                v78.updateQueue = nil;
                v78.memoizedState = nil;
            else
                v78.updateQueue = l_alternate_0.updateQueue;
                v78.memoizedState = l_alternate_0.memoizedState;
                v78.lanes = l_alternate_0.lanes;
            end;
        end;
        local v85 = l_hasSuspenseContext_0(l_suspenseStackCursor_0.current, l_InvisibleParentSuspenseContext_0);
        local l_v77_0 = v77;
        while true do
            if not (l_v77_0.tag == l_SuspenseComponent_0) or not l_shouldCaptureSuspense_0(l_v77_0, v85) then
                l_v77_0 = l_v77_0.return_;
                if not (l_v77_0 ~= nil) then
                    v79 = (l_getComponentName_0(v78.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n" .. "\n" .. "Add a <Suspense fallback=...> component higher in the tree to " .. "provide a loading indicator or placeholder to display.";
                    break;
                end;
            else
                local l_updateQueue_0 = l_v77_0.updateQueue;
                if l_updateQueue_0 == nil then
                    l_v77_0.updateQueue = {
                        [l_v79_0] = true
                    };
                else
                    l_updateQueue_0[l_v79_0] = true;
                end;
                if bit32.band(l_v77_0.mode, l_BlockingMode_0) == l_NoMode_0 then
                    l_v77_0.flags = bit32.bor(l_v77_0.flags, l_DidCapture_0);
                    v78.flags = bit32.bor(v78.flags, l_ForceUpdateForLegacySuspense_0);
                    v78.flags = bit32.band(v78.flags, (bit32.bnot((bit32.bor(l_LifecycleEffectMask_0, l_Incomplete_0)))));
                    if v78.tag == l_ClassComponent_0 then
                        if v78.alternate == nil then
                            v78.tag = l_IncompleteClassComponent_0;
                        else
                            local v88 = l_createUpdate_0(l_NoTimestamp_0, l_SyncLane_0);
                            v88.tag = l_ForceUpdate_0;
                            l_enqueueUpdate_0(v78, v88);
                        end;
                    end;
                    v78.lanes = l_mergeLanes_0(v78.lanes, l_SyncLane_0);
                    return ;
                else
                    v75(v76, l_v79_0, v80);
                    l_v77_0.flags = bit32.bor(l_v77_0.flags, l_ShouldCapture_0);
                    l_v77_0.lanes = v80;
                    return ;
                end;
            end;
        end;
    end;
    v82();
    v79 = l_createCapturedValue_0(v79, v78);
    local l_v77_1 = v77;
    while true do
        if l_v77_1.tag == l_HostRoot_0 then
            local l_v79_1 = v79;
            l_v77_1.flags = bit32.bor(l_v77_1.flags, l_ShouldCapture_0);
            local v91 = l_pickArbitraryLane_0(v80);
            l_v77_1.lanes = l_mergeLanes_0(l_v77_1.lanes, v91);
            l_enqueueCapturedUpdate_0(l_v77_1, (createRootErrorUpdate(l_v77_1, l_v79_1, v91, v81)));
            return ;
        else
            if l_v77_1.tag == l_ClassComponent_0 then
                local l_v79_2 = v79;
                local l_type_0 = l_v77_1.type;
                local l_stateNode_1 = l_v77_1.stateNode;
                if not (not (bit32.band(l_v77_1.flags, l_DidCapture_0) == l_NoFlags_0) or typeof(l_type_0.getDerivedStateFromError) ~= "function" and (not (l_stateNode_1 ~= nil and typeof(l_stateNode_1.componentDidCatch) == "function") or v46(l_stateNode_1))) then
                    l_v77_1.flags = bit32.bor(l_v77_1.flags, l_ShouldCapture_0);
                    local v95 = l_pickArbitraryLane_0(v80);
                    l_v77_1.lanes = l_mergeLanes_0(l_v77_1.lanes, v95);
                    l_enqueueCapturedUpdate_0(l_v77_1, (createClassErrorUpdate(l_v77_1, l_v79_2, v95)));
                    return ;
                end;
            end;
            l_v77_1 = l_v77_1.return_;
            if not (l_v77_1 ~= nil) then
                return ;
            end;
        end;
    end;
end;
return {
    throwException = throwException, 
    createRootErrorUpdate = createRootErrorUpdate, 
    createClassErrorUpdate = createClassErrorUpdate
};
