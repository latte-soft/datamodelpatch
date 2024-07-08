local l___DEV___0 = _G.__DEV__;
local l___YOLO___0 = _G.__YOLO__;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v5 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent.ReactFiberLane);
local v9 = require(l_Parent_0.Scheduler);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v11 = require(script.Parent["ReactFiberStack.new"]);
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_skipUnmountedBoundaries_0 = l_ReactFeatureFlags_0.skipUnmountedBoundaries;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v17 = require(l_Parent_0.Shared);
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSharedInternals_0 = v17.ReactSharedInternals;
local l_invariant_0 = v17.invariant;
local v21 = require(script.Parent["SchedulerWithReactIntegration.new"]);
local l_scheduleCallback_0 = v21.scheduleCallback;
local l_cancelCallback_0 = v21.cancelCallback;
local l_getCurrentPriorityLevel_0 = v21.getCurrentPriorityLevel;
local l_runWithPriority_0 = v21.runWithPriority;
local l_shouldYield_0 = v21.shouldYield;
local l_requestPaint_0 = v21.requestPaint;
local l_now_0 = v21.now;
local l_NoPriority_0 = v21.NoPriority;
local l_ImmediatePriority_0 = v21.ImmediatePriority;
local l_UserBlockingPriority_0 = v21.UserBlockingPriority;
local l_NormalPriority_0 = v21.NormalPriority;
local l_flushSyncCallbackQueue_0 = v21.flushSyncCallbackQueue;
local l_scheduleSyncCallback_0 = v21.scheduleSyncCallback;
local v35 = require(script.Parent.DebugTracing);
local v36 = require(script.Parent.SchedulingProfiler);
local l_tracing_0 = require(l_Parent_0.Scheduler).tracing;
local l___interactionsRef_0 = l_tracing_0.__interactionsRef;
local l___subscriberRef_0 = l_tracing_0.__subscriberRef;
local v40 = require(script.Parent.ReactFiberHostConfig);
local v41 = require(script.Parent["ReactFiber.new"]);
local v42 = require(script.Parent.ReactTypeOfMode);
local v43 = require(script.Parent.ReactWorkTags);
local l_LegacyRoot_0 = require(script.Parent.ReactRootTags).LegacyRoot;
local v45 = require(script.Parent.ReactFiberFlags);
local l_SyncLane_0 = v8.SyncLane;
local l_SyncBatchedLane_0 = v8.SyncBatchedLane;
local l_NoTimestamp_0 = v8.NoTimestamp;
local l_findUpdateLane_0 = v8.findUpdateLane;
local l_findTransitionLane_0 = v8.findTransitionLane;
local l_findRetryLane_0 = v8.findRetryLane;
local l_includesSomeLane_0 = v8.includesSomeLane;
local l_isSubsetOfLanes_0 = v8.isSubsetOfLanes;
local l_mergeLanes_0 = v8.mergeLanes;
local l_removeLanes_0 = v8.removeLanes;
local l_pickArbitraryLane_0 = v8.pickArbitraryLane;
local l_hasDiscreteLanes_0 = v8.hasDiscreteLanes;
local l_includesNonIdleWork_0 = v8.includesNonIdleWork;
local l_includesOnlyRetries_0 = v8.includesOnlyRetries;
local l_includesOnlyTransitions_0 = v8.includesOnlyTransitions;
local l_getNextLanes_0 = v8.getNextLanes;
local l_returnNextLanesPriority_0 = v8.returnNextLanesPriority;
local l_setCurrentUpdateLanePriority_0 = v8.setCurrentUpdateLanePriority;
local l_getCurrentUpdateLanePriority_0 = v8.getCurrentUpdateLanePriority;
local l_markStarvedLanesAsExpired_0 = v8.markStarvedLanesAsExpired;
local l_getLanesToRetrySynchronouslyOnError_0 = v8.getLanesToRetrySynchronouslyOnError;
local l_getMostRecentEventTime_0 = v8.getMostRecentEventTime;
local l_markRootUpdated_0 = v8.markRootUpdated;
local l_markRootSuspended_0 = v8.markRootSuspended;
local l_markRootPinged_0 = v8.markRootPinged;
local l_markRootExpired_0 = v8.markRootExpired;
local l_markDiscreteUpdatesExpired_0 = v8.markDiscreteUpdatesExpired;
local l_markRootFinished_0 = v8.markRootFinished;
local l_schedulerPriorityToLanePriority_0 = v8.schedulerPriorityToLanePriority;
local l_lanePriorityToSchedulerPriority_0 = v8.lanePriorityToSchedulerPriority;
local v76 = require(script.Parent.ReactFiberTransition);
local v77 = require(script.Parent["ReactFiberUnwindWork.new"]);
local l_unwindWork_0 = v77.unwindWork;
local l_unwindInterruptedWork_0 = v77.unwindInterruptedWork;
local v80 = require(script.Parent["ReactFiberThrow.new"]);
local l_throwException_0 = v80.throwException;
local l_createRootErrorUpdate_0 = v80.createRootErrorUpdate;
local l_createClassErrorUpdate_0 = v80.createClassErrorUpdate;
local v84 = require(script.Parent["ReactFiberCommitWork.new"]);
local l_commitBeforeMutationLifeCycles_0 = v84.commitBeforeMutationLifeCycles;
local l_commitPlacement_0 = v84.commitPlacement;
local l_commitWork_0 = v84.commitWork;
local l_commitDeletion_0 = v84.commitDeletion;
local l_commitPassiveUnmount_0 = v84.commitPassiveUnmount;
local l_commitPassiveUnmountInsideDeletedTree_0 = v84.commitPassiveUnmountInsideDeletedTree;
local l_commitPassiveMount_0 = v84.commitPassiveMount;
local l_commitDetachRef_0 = v84.commitDetachRef;
local l_invokeLayoutEffectMountInDEV_0 = v84.invokeLayoutEffectMountInDEV;
local l_invokePassiveEffectMountInDEV_0 = v84.invokePassiveEffectMountInDEV;
local l_invokeLayoutEffectUnmountInDEV_0 = v84.invokeLayoutEffectUnmountInDEV;
local l_invokePassiveEffectUnmountInDEV_0 = v84.invokePassiveEffectUnmountInDEV;
local l_recursivelyCommitLayoutEffects_0 = v84.recursivelyCommitLayoutEffects;
local v98 = require(l_Parent_0.Promise);
local l_enqueueUpdate_0 = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate;
local l_resetContextDependencies_0 = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies;
local v101 = nil;
local v102 = {
    resetHooksAfterThrowRef = nil, 
    ContextOnlyDispatcherRef = nil, 
    getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil, 
    originalBeginWorkRef = nil, 
    completeWorkRef = nil
};
local function v106(v103, v104, v105)
    if not v102.originalBeginWorkRef then
        v102.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v102.originalBeginWorkRef(v103, v104, v105);
end;
local function _(v107, v108, v109)
    if not v102.completeWorkRef then
        v102.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v102.completeWorkRef(v107, v108, v109);
end;
local v111 = nil;
local function _()
    v111 = require(script.Parent["ReactFiberHooks.new"]);
    v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
    v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
    v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _()
    if not v102.resetHooksAfterThrowRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v102.resetHooksAfterThrowRef();
end;
local function _()
    if not v102.ContextOnlyDispatcherRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v102.ContextOnlyDispatcherRef;
end;
local function _()
    if not v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef();
end;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_push_0 = v11.push;
local l_pop_0 = v11.pop;
local l_createCursor_0 = v11.createCursor;
local v120 = require(script.Parent["ReactProfilerTimer.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v122 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v123 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v123.current;
local l_resetCurrentFiber_0 = v123.resetCurrentFiber;
local l_setCurrentFiber_0 = v123.setCurrentFiber;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local l_onCommitRoot_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitRoot;
local l_onCommitRoot_1 = require(script.Parent.ReactTestSelectors).onCommitRoot;
local l_enqueueTask_0 = require(l_Parent_0.Shared).enqueueTask;
local l_doesFiberContain_0 = require(script.Parent.ReactFiberTreeReflection).doesFiberContain;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local l_IsSomeRendererActing_0 = l_ReactSharedInternals_0.IsSomeRendererActing;
local v138 = nil;
local v139 = nil;
local v140 = {};
v5.NoContext = 0;
v5.RetryAfterError = 64;
local v141 = {
    Incomplete = 0, 
    FatalErrored = 1, 
    Errored = 2, 
    Suspended = 3, 
    SuspendedWithDelay = 4, 
    Completed = 5
};
local v142 = 0;
local v143 = nil;
local v144 = nil;
local l_NoLanes_0 = v8.NoLanes;
v5.subtreeRenderLanes = v8.NoLanes;
local v146 = l_createCursor_0(v8.NoLanes);
local l_Incomplete_0 = v141.Incomplete;
local v148 = nil;
local l_NoLanes_1 = v8.NoLanes;
local v150 = require(script.Parent.ReactFiberWorkInProgress);
local l_workInProgressRootSkippedLanes_0 = v150.workInProgressRootSkippedLanes;
local l_NoLanes_2 = v8.NoLanes;
local l_NoLanes_3 = v8.NoLanes;
local v154 = nil;
local v155 = 0;
local l_huge_0 = math.huge;
local v157 = nil;
local function _()
    l_huge_0 = l_now_0() + 500;
end;
v5.getRenderTargetTime = function()
    return l_huge_0;
end;
local v159 = false;
local v160 = nil;
local v161 = nil;
local v162 = false;
local v163 = nil;
local l_l_NoPriority_0_0 = l_NoPriority_0;
local l_NoLanes_4 = v8.NoLanes;
local v166 = nil;
local v167 = 0;
local v168 = nil;
local v169 = 0;
local v170 = nil;
local l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
local l_NoLanes_5 = v8.NoLanes;
local l_NoLanes_6 = v8.NoLanes;
local v174 = nil;
local v175 = false;
v5.getWorkInProgressRoot = function()
    return v143;
end;
v5.requestEventTime = function()
    if bit32.band(v142, 48) ~= 0 then
        return l_now_0();
    elseif l_l_NoTimestamp_0_0 ~= l_NoTimestamp_0 then
        return l_l_NoTimestamp_0_0;
    else
        l_l_NoTimestamp_0_0 = l_now_0();
        return l_l_NoTimestamp_0_0;
    end;
end;
v5.requestUpdateLane = function(v176)
    local l_mode_0 = v176.mode;
    if bit32.band(l_mode_0, v42.BlockingMode) == v42.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_0, v42.ConcurrentMode) == v42.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    elseif (not l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch and bit32.band(v142, 16) ~= 0) and l_NoLanes_0 ~= v8.NoLanes then
        return l_pickArbitraryLane_0(l_NoLanes_0);
    else
        if l_NoLanes_5 == v8.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        if not (v76.requestCurrentTransition() ~= v76.NoTransition) then
            local v178 = l_getCurrentPriorityLevel_0();
            local _ = nil;
            if bit32.band(v142, 4) ~= 0 and v178 == l_UserBlockingPriority_0 then
                return (l_findUpdateLane_0(v8.InputDiscreteLanePriority, l_NoLanes_5));
            else
                local v180 = l_schedulerPriorityToLanePriority_0(v178);
                if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                    local v181 = l_getCurrentUpdateLanePriority_0();
                    if not (not (v180 ~= v181 and v181 ~= v8.NoLanePriority) or not l___DEV___0) then
                        l_console_0.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v180), (tostring(v181)));
                    end;
                end;
                return (l_findUpdateLane_0(v180, l_NoLanes_5));
            end;
        else
            if l_NoLanes_6 ~= v8.NoLanes then
                if v154 ~= nil then
                    l_NoLanes_6 = v154.pendingLanes;
                else
                    l_NoLanes_6 = v8.NoLanes;
                end;
            end;
            return l_findTransitionLane_0(l_NoLanes_5, l_NoLanes_6);
        end;
    end;
end;
requestRetryLane = function(v182)
    local l_mode_1 = v182.mode;
    if bit32.band(l_mode_1, v42.BlockingMode) == v42.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_1, v42.ConcurrentMode) == v42.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    else
        if l_NoLanes_5 == v8.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        return l_findRetryLane_0(l_NoLanes_5);
    end;
end;
v5.scheduleUpdateOnFiber = function(v184, v185, v186)
    v140.checkForNestedUpdates();
    local v187 = v140.markUpdateLaneFromFiberToRoot(v184, v185);
    if v187 == nil then
        return nil;
    else
        l_markRootUpdated_0(v187, v185, v186);
        if v187 == v143 then
            v140.warnAboutRenderPhaseUpdatesInDEV(v184);
            if l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch or bit32.band(v142, 16) == 0 then
                l_NoLanes_2 = l_mergeLanes_0(l_NoLanes_2, v185);
            end;
            if l_Incomplete_0 == v141.SuspendedWithDelay then
                v140.markRootSuspended(v187, l_NoLanes_0);
            end;
        end;
        local v188 = l_getCurrentPriorityLevel_0();
        if v185 == l_SyncLane_0 then
            if bit32.band(v142, 8) ~= 0 and bit32.band(v142, 48) == 0 then
                v140.schedulePendingInteractions(v187, v185);
                v140.performSyncWorkOnRoot(v187);
            else
                v101(v187, v186);
                v140.schedulePendingInteractions(v187, v185);
                if v142 == 0 then
                    l_huge_0 = l_now_0() + 500;
                    l_flushSyncCallbackQueue_0();
                end;
            end;
        else
            if bit32.band(v142, 4) ~= 0 and (not (v188 ~= l_UserBlockingPriority_0) or v188 == l_ImmediatePriority_0) then
                if v166 == nil then
                    v166 = l_Set_0.new({
                        v187
                    });
                else
                    v166:add(v187);
                end;
            end;
            v101(v187, v186);
            v140.schedulePendingInteractions(v187, v185);
        end;
        v154 = v187;
        return v187;
    end;
end;
v140.markUpdateLaneFromFiberToRoot = function(v189, v190)
    v189.lanes = l_mergeLanes_0(v189.lanes, v190);
    local l_alternate_0 = v189.alternate;
    if l_alternate_0 ~= nil then
        l_alternate_0.lanes = l_mergeLanes_0(l_alternate_0.lanes, v190);
    end;
    if (l___DEV___0 and l_alternate_0 == nil) and bit32.band(v189.flags, (bit32.bor(v45.Placement, v45.Hydrating))) ~= v45.NoFlags then
        v140.warnAboutUpdateOnNotYetMountedFiberInDEV(v189);
    end;
    local l_v189_0 = v189;
    local l_return__0 = v189.return_;
    while l_return__0 ~= nil do
        l_return__0.childLanes = l_mergeLanes_0(l_return__0.childLanes, v190);
        l_alternate_0 = l_return__0.alternate;
        if l_alternate_0 ~= nil then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v190);
        elseif l___DEV___0 and bit32.band(l_return__0.flags, (bit32.bor(v45.Placement, v45.Hydrating))) ~= v45.NoFlags then
            v140.warnAboutUpdateOnNotYetMountedFiberInDEV(v189);
        end;
        l_v189_0 = l_return__0;
        l_return__0 = l_return__0.return_;
    end;
    if l_v189_0.tag == v43.HostRoot then
        return l_v189_0.stateNode;
    else
        return nil;
    end;
end;
v101 = function(v194, v195)
    local l_callbackNode_0 = v194.callbackNode;
    l_markStarvedLanesAsExpired_0(v194, v195);
    local _ = nil;
    local v198 = l_getNextLanes_0(v194, if v194 == v143 then l_NoLanes_0 else v8.NoLanes);
    local v199 = l_returnNextLanesPriority_0();
    if v198 == v8.NoLanes then
        if l_callbackNode_0 ~= nil then
            l_cancelCallback_0(l_callbackNode_0);
            v194.callbackNode = nil;
            v194.callbackPriority = v8.NoLanePriority;
        end;
        return ;
    else
        if l_callbackNode_0 ~= nil then
            if v194.callbackPriority == v199 then
                return ;
            else
                l_cancelCallback_0(l_callbackNode_0);
            end;
        end;
        local v200 = nil;
        v200 = if v199 == v8.SyncLanePriority then l_scheduleSyncCallback_0(function()
            return v140.performSyncWorkOnRoot(v194);
        end) else if v199 == v8.SyncBatchedLanePriority then l_scheduleCallback_0(l_ImmediatePriority_0, function()
            return v140.performSyncWorkOnRoot(v194);
        end) else l_scheduleCallback_0(l_lanePriorityToSchedulerPriority_0(v199), function()
            return v140.performConcurrentWorkOnRoot(v194);
        end);
        v194.callbackPriority = v199;
        v194.callbackNode = v200;
        return ;
    end;
end;
v140.performConcurrentWorkOnRoot = function(v201)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v8.NoLanes;
    l_NoLanes_6 = v8.NoLanes;
    l_invariant_0(bit32.band(v142, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v201.callbackNode;
    if v5.flushPassiveEffects() and v201.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v203 = l_getNextLanes_0(v201, if v201 == v143 then l_NoLanes_0 else v8.NoLanes);
        if v203 == v8.NoLanes then
            return nil;
        else
            local v204 = v140.renderRootConcurrent(v201, v203);
            if not l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                if v204 ~= v141.Incomplete then
                    if v204 == v141.Errored then
                        v142 = bit32.bor(v142, 64);
                        if v201.hydrate then
                            v201.hydrate = false;
                            v40.clearContainer(v201.containerInfo);
                        end;
                        v203 = l_getLanesToRetrySynchronouslyOnError_0(v201);
                        if v203 ~= v8.NoLanes then
                            v204 = v140.renderRootSync(v201, v203);
                        end;
                    end;
                    if v204 == v141.FatalErrored then
                        local l_v148_0 = v148;
                        v140.prepareFreshStack(v201, v8.NoLanes);
                        v140.markRootSuspended(v201, v203);
                        v101(v201, l_now_0());
                        error(l_v148_0);
                    end;
                    v201.finishedWork = v201.current.alternate;
                    v201.finishedLanes = v203;
                    v140.finishConcurrentRender(v201, v204, v203);
                end;
            else
                v140.prepareFreshStack(v201, v8.NoLanes);
            end;
            v101(v201, l_now_0());
            if v201.callbackNode == l_callbackNode_1 then
                return function()
                    return v140.performConcurrentWorkOnRoot(v201);
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v206 = 0;
local v207 = false;
shouldForceFlushFallbacksInDEV = function()
    return l___DEV___0 and v206 > 0;
end;
v140.finishConcurrentRender = function(v208, v209, v210)
    if not (v209 ~= v141.Incomplete) or v209 == v141.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return ;
    elseif v209 == v141.Errored then
        v140.commitRoot(v208);
        return ;
    elseif v209 == v141.Suspended then
        v140.markRootSuspended(v208, v210);
        if not (not l_includesOnlyRetries_0(v210) or shouldForceFlushFallbacksInDEV()) then
            local v211 = (v155 + 500) - l_now_0();
            if v211 > 10 then
                if l_getNextLanes_0(v208, v8.NoLanes) ~= v8.NoLanes then
                    return ;
                else
                    local l_suspendedLanes_0 = v208.suspendedLanes;
                    if l_isSubsetOfLanes_0(l_suspendedLanes_0, v210) then
                        v208.timeoutHandle = v40.scheduleTimeout(function()
                            return v140.commitRoot(v208);
                        end, v211);
                        return ;
                    else
                        l_markRootPinged_0(v208, l_suspendedLanes_0, (v5.requestEventTime()));
                        return ;
                    end;
                end;
            end;
        end;
        v140.commitRoot(v208);
        return ;
    elseif v209 == v141.SuspendedWithDelay then
        v140.markRootSuspended(v208, v210);
        if not l_includesOnlyTransitions_0(v210) then
            if not shouldForceFlushFallbacksInDEV() then
                local v213 = l_now_0() - l_getMostRecentEventTime_0(v208, v210);
                local v214 = jnd(v213) - v213;
                if v214 > 10 then
                    v208.timeoutHandle = v40.scheduleTimeout(function()
                        return v140.commitRoot(v208);
                    end, v214);
                    return ;
                end;
            end;
            v140.commitRoot(v208);
            return ;
        else
            return ;
        end;
    elseif v209 == v141.Completed then
        v140.commitRoot(v208);
        return ;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return ;
    end;
end;
v140.markRootSuspended = function(v215, v216)
    l_markRootSuspended_0(v215, (l_removeLanes_0(l_removeLanes_0(v216, l_NoLanes_3), l_NoLanes_2)));
end;
v140.performSyncWorkOnRoot = function(v217)
    l_invariant_0(bit32.band(v142, 48) == 0, "Should not already be working.");
    v5.flushPassiveEffects();
    local v218 = nil;
    local v219 = nil;
    if not (v217 == v143) or not l_includesSomeLane_0(v217.expiredLanes, l_NoLanes_0) then
        v218 = l_getNextLanes_0(v217, v8.NoLanes);
        v219 = v140.renderRootSync(v217, v218);
    else
        v218 = l_NoLanes_0;
        v219 = v140.renderRootSync(v217, v218);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v218 = l_getNextLanes_0(v217, v218);
            v219 = v140.renderRootSync(v217, v218);
        end;
    end;
    if v217.tag ~= l_LegacyRoot_0 and v219 == v141.Errored then
        v142 = bit32.bor(v142, 64);
        if v217.hydrate then
            v217.hydrate = false;
            v40.clearContainer(v217.containerInfo);
        end;
        v218 = l_getLanesToRetrySynchronouslyOnError_0(v217);
        if v218 ~= v8.NoLanes then
            v219 = v140.renderRootSync(v217, v218);
        end;
    end;
    if v219 == v141.FatalErrored then
        local l_v148_1 = v148;
        v140.prepareFreshStack(v217, v8.NoLanes);
        v140.markRootSuspended(v217, v218);
        v101(v217, l_now_0());
        error(l_v148_1);
    end;
    v217.finishedWork = v217.current.alternate;
    v217.finishedLanes = v218;
    v140.commitRoot(v217);
    v101(v217, l_now_0());
    return nil;
end;
v5.flushRoot = function(v221, v222)
    l_markRootExpired_0(v221, v222);
    v101(v221, l_now_0());
    if bit32.band(v142, 48) == 0 then
        l_huge_0 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v5.getExecutionContext = function()
    return v142;
end;
v5.flushDiscreteUpdates = function()
    if bit32.band(v142, 49) ~= 0 then
        if l___DEV___0 and bit32.band(v142, 16) ~= 0 then
            l_console_0.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is " .. "already rendering.");
        end;
        return ;
    else
        v140.flushPendingDiscreteUpdates();
        v5.flushPassiveEffects();
        return ;
    end;
end;
v5.deferredUpdates = function(v223)
    if not l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        return l_runWithPriority_0(l_NormalPriority_0, v223);
    else
        local v224 = l_getCurrentUpdateLanePriority_0();
        local v225 = nil;
        local v226 = nil;
        if l___YOLO___0 then
            v225 = true;
            l_setCurrentUpdateLanePriority_0(v8.DefaultLanePriority);
            v226 = l_runWithPriority_0(l_NormalPriority_0, v223);
        else
            l_setCurrentUpdateLanePriority_0(v8.DefaultLanePriority);
            local v227, v228 = xpcall(l_runWithPriority_0, l_describeError_0, l_NormalPriority_0, v223);
            v225 = v227;
            v226 = v228;
        end;
        l_setCurrentUpdateLanePriority_0(v224);
        if not v225 then
            error(v226);
            return ;
        else
            return v226;
        end;
    end;
end;
v140.flushPendingDiscreteUpdates = function()
    if v166 ~= nil then
        local l_v166_0 = v166;
        v166 = nil;
        l_v166_0:forEach(function(v230)
            l_markDiscreteUpdatesExpired_0(v230);
            v101(v230, l_now_0());
        end);
    end;
    l_flushSyncCallbackQueue_0();
end;
v5.batchedUpdates = function(v231, v232)
    local l_v142_0 = v142;
    v142 = bit32.bor(v142, 1);
    local v234 = nil;
    local v235 = nil;
    if l___YOLO___0 then
        v234 = true;
        v235 = v231(v232);
    else
        local v236, v237 = xpcall(v231, l_describeError_0, v232);
        v234 = v236;
        v235 = v237;
    end;
    v142 = l_v142_0;
    if v142 == 0 then
        l_huge_0 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if not v234 then
        error(v235);
        return ;
    else
        return v235;
    end;
end;
v5.batchedEventUpdates = function(v238, v239)
    local l_v142_1 = v142;
    v142 = bit32.bor(v142, 2);
    local v241 = nil;
    local v242 = nil;
    if l___YOLO___0 then
        v241 = true;
        v242 = v238(v239);
    else
        local v243, v244 = xpcall(v238, l_describeError_0, v239);
        v241 = v243;
        v242 = v244;
    end;
    v142 = l_v142_1;
    if v142 == 0 then
        l_huge_0 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if not v241 then
        error(v242);
        return ;
    else
        return v242;
    end;
end;
v5.discreteUpdates = function(v245, v246, v247, v248, v249)
    local l_v142_2 = v142;
    v142 = bit32.bor(v142, 4);
    if not l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v251, v252 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function()
            return v245(v246, v247, v248, v249);
        end);
        v142 = l_v142_2;
        if v142 == 0 then
            l_huge_0 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v251 then
            error(v252);
            return ;
        else
            return v252;
        end;
    else
        local v253 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v8.InputDiscreteLanePriority);
        local v254, v255 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function()
            return v245(v246, v247, v248, v249);
        end);
        l_setCurrentUpdateLanePriority_0(v253);
        v142 = l_v142_2;
        if v142 == 0 then
            l_huge_0 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v254 then
            error(v255);
            return ;
        else
            return v255;
        end;
    end;
end;
v5.unbatchedUpdates = function(v256, v257)
    local l_v142_3 = v142;
    v142 = bit32.band(v142, 4294967294);
    v142 = bit32.bor(v142, 8);
    local v259 = nil;
    local v260 = nil;
    if l___YOLO___0 then
        v259 = true;
        v260 = v256(v257);
    else
        local v261, v262 = xpcall(v256, l_describeError_0, v257);
        v259 = v261;
        v260 = v262;
    end;
    v142 = l_v142_3;
    if v142 == 0 then
        l_huge_0 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if not v259 then
        error(v260);
        return ;
    else
        return v260;
    end;
end;
v5.flushSync = function(v263, v264)
    local l_v142_4 = v142;
    if bit32.band(l_v142_4, 48) ~= 0 then
        if l___DEV___0 then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot " .. "flush when React is already rendering. Consider moving this call to " .. "a scheduler task or micro task.");
        end;
        return v263(v264);
    else
        v142 = bit32.bor(v142, 1);
        if not l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v266 = nil;
            local v267 = nil;
            if l___YOLO___0 then
                v266 = true;
                v267 = if not v263 then nil else l_runWithPriority_0(l_ImmediatePriority_0, function()
                    return v263(v264);
                end);
            elseif not v263 then
                v266 = true;
                v267 = nil;
            else
                local v268, v269 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function()
                    return v263(v264);
                end);
                v266 = v268;
                v267 = v269;
            end;
            v142 = l_v142_4;
            l_flushSyncCallbackQueue_0();
            if not v266 then
                error(v267);
            end;
            return v267;
        else
            local v270 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
            local v271 = nil;
            local v272 = nil;
            if l___YOLO___0 then
                v271 = true;
                l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
                v272 = if not v263 then nil else l_runWithPriority_0(l_ImmediatePriority_0, function()
                    return v263(v264);
                end);
            elseif not v263 then
                v271 = true;
                v272 = nil;
            else
                local v273, v274 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function()
                    return v263(v264);
                end);
                v271 = v273;
                v272 = v274;
            end;
            l_setCurrentUpdateLanePriority_0(v270);
            v142 = l_v142_4;
            l_flushSyncCallbackQueue_0();
            if not v271 then
                error(v272);
            end;
            return v272;
        end;
    end;
end;
v5.flushControlled = function(v275)
    local l_v142_5 = v142;
    v142 = bit32.bor(v142, 1);
    if not l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v277, v278 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v275);
        v142 = l_v142_5;
        if v142 == 0 then
            l_huge_0 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v277 then
            error(v278);
        end;
    else
        local v279 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
        local v280, v281 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v275);
        l_setCurrentUpdateLanePriority_0(v279);
        v142 = l_v142_5;
        if v142 == 0 then
            l_huge_0 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v280 then
            error(v281);
            return ;
        end;
    end;
end;
v5.pushRenderLanes = function(v282, v283)
    l_push_0(v146, v5.subtreeRenderLanes, v282);
    v5.subtreeRenderLanes = l_mergeLanes_0(v5.subtreeRenderLanes, v283);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v283);
end;
v5.popRenderLanes = function(v284)
    v5.subtreeRenderLanes = v146.current;
    l_pop_0(v146, v284);
end;
v140.prepareFreshStack = function(v285, v286)
    v285.finishedWork = nil;
    v285.finishedLanes = v8.NoLanes;
    local l_timeoutHandle_0 = v285.timeoutHandle;
    if l_timeoutHandle_0 ~= v40.noTimeout then
        v285.timeoutHandle = v40.noTimeout;
        v40.cancelTimeout(l_timeoutHandle_0);
    end;
    if v144 ~= nil then
        local l_return__1 = v144.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v143 = v285;
    v144 = v41.createWorkInProgress(v285.current, nil);
    l_NoLanes_0 = v286;
    v5.subtreeRenderLanes = v286;
    l_NoLanes_1 = v286;
    l_Incomplete_0 = v141.Incomplete;
    v148 = nil;
    l_workInProgressRootSkippedLanes_0(v8.NoLanes);
    l_NoLanes_2 = v8.NoLanes;
    l_NoLanes_3 = v8.NoLanes;
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v170 = nil;
    end;
    if l___DEV___0 then
        v122.discardPendingWarnings();
    end;
end;
v140.handleError = function(v289, v290)
    while true do
        local l_v144_0 = v144;
        local l_status_0, l_result_0 = pcall(function()
            l_resetContextDependencies_0();
            if not v102.resetHooksAfterThrowRef then
                v111 = require(script.Parent["ReactFiberHooks.new"]);
                v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
                v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
                v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v102.resetHooksAfterThrowRef();
            l_resetCurrentFiber_0();
            l_ReactCurrentOwner_0.current = nil;
            if not (l_v144_0 ~= nil) or l_v144_0.return_ == nil then
                l_Incomplete_0 = v141.FatalErrored;
                v148 = v290;
                v144 = nil;
                return ;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v144_0.mode, v42.ProfileMode) ~= 0 then
                    v120.stopProfilerTimerIfRunningAndRecordDelta(l_v144_0, true);
                end;
                l_throwException_0(v289, l_v144_0.return_, l_v144_0, v290, l_NoLanes_0, v5.onUncaughtError, v5.renderDidError);
                v140.completeUnitOfWork(l_v144_0);
                return ;
            end;
        end);
        if not l_status_0 then
            v290 = l_result_0;
            if v144 == l_v144_0 and l_v144_0 ~= nil then
                l_v144_0 = l_v144_0.return_;
                v144 = l_v144_0;
            else
                l_v144_0 = v144;
            end;
            --[[ close >= 2 ]]
        else
            break;
        end;
    end;
end;
v140.pushDispatcher = function()
    local l_current_1 = l_ReactCurrentDispatcher_0.current;
    local l_l_ReactCurrentDispatcher_0_0 = l_ReactCurrentDispatcher_0;
    if not v102.ContextOnlyDispatcherRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    l_l_ReactCurrentDispatcher_0_0.current = v102.ContextOnlyDispatcherRef;
    if l_current_1 == nil then
        if not v102.ContextOnlyDispatcherRef then
            v111 = require(script.Parent["ReactFiberHooks.new"]);
            v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
            v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
            v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        return v102.ContextOnlyDispatcherRef;
    else
        return l_current_1;
    end;
end;
v140.popDispatcher = function(v297)
    l_ReactCurrentDispatcher_0.current = v297;
end;
v140.pushInteractions = function(v298)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return nil;
    else
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v298.memoizedInteractions;
        return l_current_2;
    end;
end;
v140.popInteractions = function(v300)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v300;
    end;
end;
v5.markCommitTimeOfFallback = function()
    v155 = l_now_0();
end;
v5.markSkippedUpdateLanes = function(v301)
    v150.markSkippedUpdateLanes(v301);
end;
v5.renderDidSuspend = function()
    if l_Incomplete_0 == v141.Incomplete then
        l_Incomplete_0 = v141.Suspended;
    end;
end;
v5.renderDidSuspendDelayIfPossible = function()
    if not (l_Incomplete_0 ~= v141.Incomplete) or l_Incomplete_0 == v141.Suspended then
        l_Incomplete_0 = v141.SuspendedWithDelay;
    end;
    if not (not (v143 ~= nil) or not l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) and not l_includesNonIdleWork_0(l_NoLanes_2)) then
        v140.markRootSuspended(v143, l_NoLanes_0);
    end;
end;
v5.renderDidError = function()
    if l_Incomplete_0 ~= v141.Completed then
        l_Incomplete_0 = v141.Errored;
    end;
end;
v5.renderHasNotSuspendedYet = function()
    return l_Incomplete_0 == v141.Incomplete;
end;
v140.renderRootSync = function(v302, v303)
    local l_v142_6 = v142;
    v142 = bit32.bor(v142, 16);
    local v305 = v140.pushDispatcher();
    if not (v143 == v302) or l_NoLanes_0 ~= v303 then
        v140.prepareFreshStack(v302, v303);
        v140.startWorkOnPendingInteractions(v302, v303);
    end;
    local v306 = v140.pushInteractions(v302);
    if not (not l___DEV___0 or not l_enableDebugTracing_0) then
        v35.logRenderStarted(v303);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStarted(v303);
    end;
    while true do
        local v307 = nil;
        local v308 = nil;
        if l___YOLO___0 then
            v307 = true;
            v140.workLoopSync();
        else
            local v309, v310 = xpcall(v140.workLoopSync, l_describeError_0);
            v307 = v309;
            v308 = v310;
        end;
        if not v307 then
            v140.handleError(v302, v308);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v140.popInteractions(v306);
    end;
    v142 = l_v142_6;
    v140.popDispatcher(v305);
    if v144 ~= nil then
        l_invariant_0(false, "Cannot commit an incomplete root. This error is likely caused by a " .. "bug in React. Please file an issue.");
    end;
    if not (not l___DEV___0 or not l_enableDebugTracing_0) then
        v35.logRenderStopped();
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStopped();
    end;
    v143 = nil;
    l_NoLanes_0 = v8.NoLanes;
    return l_Incomplete_0;
end;
v140.workLoopSync = function()
    while v144 ~= nil do
        v140.performUnitOfWork(v144);
    end;
end;
v140.renderRootConcurrent = function(v311, v312)
    local l_v142_7 = v142;
    v142 = bit32.bor(v142, 16);
    local v314 = v140.pushDispatcher();
    if not (v143 == v311) or l_NoLanes_0 ~= v312 then
        l_huge_0 = l_now_0() + 500;
        v140.prepareFreshStack(v311, v312);
        v140.startWorkOnPendingInteractions(v311, v312);
    end;
    local v315 = v140.pushInteractions(v311);
    if not (not l___DEV___0 or not l_enableDebugTracing_0) then
        v35.logRenderStarted(v312);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStarted(v312);
    end;
    while true do
        local v316 = nil;
        local v317 = nil;
        if l___YOLO___0 then
            v316 = true;
            v317 = "break";
            v140.workLoopConcurrent();
        else
            local v318, v319 = xpcall(v140.workLoopConcurrent, l_describeError_0);
            v316 = v318;
            v317 = v319;
            if v316 then
                v317 = "break";
            end;
        end;
        if v317 ~= "break" then
            if not v316 then
                v140.handleError(v311, v317);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v140.popInteractions(v315);
    end;
    v140.popDispatcher(v314);
    v142 = l_v142_7;
    if not (not l___DEV___0 or not l_enableDebugTracing_0) then
        v35.logRenderStopped();
    end;
    if v144 ~= nil then
        if l_enableSchedulingProfiler_0 then
            v36.markRenderYielded();
        end;
        return v141.Incomplete;
    else
        if l_enableSchedulingProfiler_0 then
            v36.markRenderStopped();
        end;
        v143 = nil;
        l_NoLanes_0 = v8.NoLanes;
        return l_Incomplete_0;
    end;
end;
v140.workLoopConcurrent = function()
    while not (not (v144 ~= nil) or l_shouldYield_0()) do
        v140.performUnitOfWork(v144);
    end;
end;
v140.performUnitOfWork = function(v320)
    local l_alternate_1 = v320.alternate;
    l_setCurrentFiber_0(v320);
    local v322 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v320.mode, v42.ProfileMode) ~= v42.NoMode then
        v120.startProfilerTimer(v320);
        v322 = v140.beginWork(l_alternate_1, v320, v5.subtreeRenderLanes);
        v120.stopProfilerTimerIfRunningAndRecordDelta(v320, true);
    else
        v322 = v140.beginWork(l_alternate_1, v320, v5.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v320.memoizedProps = v320.pendingProps;
    if v322 == nil then
        v140.completeUnitOfWork(v320);
    else
        v144 = v322;
    end;
    l_ReactCurrentOwner_0.current = nil;
end;
v140.completeUnitOfWork = function(v323)
    local l_v323_0 = v323;
    while true do
        local l_alternate_2 = l_v323_0.alternate;
        local l_return__2 = l_v323_0.return_;
        if bit32.band(l_v323_0.flags, v45.Incomplete) == v45.NoFlags then
            l_setCurrentFiber_0(l_v323_0);
            local v327 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v323_0.mode, v42.ProfileMode) == v42.NoMode then
                local l_l_v323_0_0 = l_v323_0;
                local l_subtreeRenderLanes_0 = v5.subtreeRenderLanes;
                if not v102.completeWorkRef then
                    v102.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v327 = v102.completeWorkRef(l_alternate_2, l_l_v323_0_0, l_subtreeRenderLanes_0);
            else
                v120.startProfilerTimer(l_v323_0);
                local l_l_v323_0_1 = l_v323_0;
                local l_subtreeRenderLanes_1 = v5.subtreeRenderLanes;
                if not v102.completeWorkRef then
                    v102.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v327 = v102.completeWorkRef(l_alternate_2, l_l_v323_0_1, l_subtreeRenderLanes_1);
                v120.stopProfilerTimerIfRunningAndRecordDelta(l_v323_0, false);
            end;
            l_resetCurrentFiber_0();
            if v327 ~= nil then
                v144 = v327;
                return ;
            end;
        else
            local v332 = l_unwindWork_0(l_v323_0, v5.subtreeRenderLanes);
            if v332 ~= nil then
                v332.flags = bit32.band(v332.flags, v45.HostEffectMask);
                v144 = v332;
                return ;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v323_0.mode, v42.ProfileMode) ~= v42.NoMode then
                    v120.stopProfilerTimerIfRunningAndRecordDelta(l_v323_0, false);
                    local v333 = l_v323_0.actualDuration or 0;
                    local l_child_0 = l_v323_0.child;
                    while l_child_0 ~= nil do
                        v333 = v333 + (l_child_0.actualDuration or 0);
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v323_0.actualDuration = v333;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v45.Incomplete);
                    l_return__2.subtreeFlags = v45.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v323_0.sibling;
        if l_sibling_0 ~= nil then
            v144 = l_sibling_0;
            return ;
        else
            l_v323_0 = l_return__2;
            v144 = l_v323_0;
            if not (l_v323_0 ~= nil) then
                if l_Incomplete_0 == v141.Incomplete then
                    l_Incomplete_0 = v141.Completed;
                end;
                return ;
            end;
        end;
    end;
end;
v140.commitRoot = function(v336)
    local v337 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function()
        return v140.commitRootImpl(v336, v337);
    end);
    return nil;
end;
v140.commitRootImpl = function(v338, v339)
    while true do
        v5.flushPassiveEffects();
        if not (v163 ~= nil) then
            break;
        end;
    end;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v142, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v338.finishedWork;
    local l_finishedLanes_0 = v338.finishedLanes;
    if not (not l___DEV___0 or not l_enableDebugTracing_0) then
        v35.logCommitStarted(l_finishedLanes_0);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markCommitStarted(l_finishedLanes_0);
    end;
    if l_finishedWork_0 == nil then
        if not (not l___DEV___0 or not l_enableDebugTracing_0) then
            v35.logCommitStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markCommitStopped();
        end;
        return nil;
    else
        v338.finishedWork = nil;
        v338.finishedLanes = v8.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v338.current, "Cannot commit the same tree as before. This error is likely caused by " .. "a bug in React. Please file an issue.");
        v338.callbackNode = nil;
        local v342 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v338, v342);
        if not ((not (v166 ~= nil) or l_hasDiscreteLanes_0(v342)) or not v166:has(v338)) then
            v166:delete(v338);
        end;
        if v338 == v143 then
            v143 = nil;
            v144 = nil;
            l_NoLanes_0 = v8.NoLanes;
        end;
        local v343 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v45.BeforeMutationMask, v45.MutationMask, v45.LayoutMask, v45.PassiveMask))) ~= v45.NoFlags;
        local v344 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v45.BeforeMutationMask, v45.MutationMask, v45.LayoutMask, v45.PassiveMask))) ~= v45.NoFlags;
        if not v343 and not v344 then
            v338.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v120.recordCommitTime();
            end;
        else
            local v345 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v345 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
            end;
            local l_v142_8 = v142;
            v142 = bit32.bor(v142, 32);
            local v347 = v140.pushInteractions(v338);
            l_ReactCurrentOwner_0.current = nil;
            v174 = v40.prepareForCommit(v338.containerInfo);
            v175 = false;
            v140.commitBeforeMutationEffects(l_finishedWork_0);
            v174 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v120.recordCommitTime();
            end;
            v140.commitMutationEffects(l_finishedWork_0, v338, v339);
            if v175 then
                v40.afterActiveInstanceBlur();
            end;
            v40.resetAfterCommit(v338.containerInfo);
            v338.current = l_finishedWork_0;
            if not (not l___DEV___0 or not l_enableDebugTracing_0) then
                v35.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if not l___DEV___0 then
                local v348 = nil;
                local v349 = nil;
                if l___YOLO___0 then
                    v348 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v338, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                else
                    local v350, v351 = xpcall(l_recursivelyCommitLayoutEffects_0, l_describeError_0, l_finishedWork_0, v338, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                    v348 = v350;
                    v349 = v351;
                end;
                if not v348 then
                    v138(l_finishedWork_0, l_finishedWork_0, v349);
                end;
            else
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v338, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    v138(l_finishedWork_0, l_finishedWork_0, (l_clearCaughtError_0()));
                end;
                l_resetCurrentFiber_0();
            end;
            if not (not l___DEV___0 or not l_enableDebugTracing_0) then
                v35.logLayoutEffectsStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markLayoutEffectsStopped();
            end;
            if not (not (not (bit32.band(l_finishedWork_0.subtreeFlags, v45.PassiveMask) == v45.NoFlags) or bit32.band(l_finishedWork_0.flags, v45.PassiveMask) ~= v45.NoFlags) or v162) then
                v162 = true;
                l_scheduleCallback_0(l_NormalPriority_0, function()
                    v5.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v140.popInteractions(v347);
            end;
            v142 = l_v142_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v345 ~= nil then
                l_setCurrentUpdateLanePriority_0(v345);
            end;
        end;
        local l_v162_0 = v162;
        if v162 then
            v162 = false;
            v163 = v338;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v339;
        end;
        v342 = v338.pendingLanes;
        if v342 ~= v8.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v170 ~= nil then
                    local l_v170_0 = v170;
                    v170 = nil;
                    for v354 = 1, #l_v170_0 do
                        scheduleInteractions(v338, l_v170_0[v354], v338.memoizedInteractions);
                    end;
                end;
                v140.schedulePendingInteractions(v338, v342);
            end;
        else
            v161 = nil;
        end;
        if not ((not l___DEV___0 or not l_enableDoubleInvokingEffects_0) or l_v162_0) then
            commitDoubleInvokeEffectsInDEV(v338.current, false);
        end;
        if not (not l_ReactFeatureFlags_0.enableSchedulerTracing or l_v162_0) then
            v140.finishPendingInteractions(v338, l_finishedLanes_0);
        end;
        if v342 == l_SyncLane_0 then
            if v338 == v168 then
                v167 = v167 + 1;
            else
                v167 = 0;
                v168 = v338;
            end;
        else
            v167 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v339);
        if l___DEV___0 then
            l_onCommitRoot_1();
        end;
        v101(v338, l_now_0());
        if v159 then
            v159 = false;
            local l_v160_0 = v160;
            v160 = nil;
            error(l_v160_0);
        end;
        if bit32.band(v142, 8) ~= 0 then
            if not (not l___DEV___0 or not l_enableDebugTracing_0) then
                v35.logCommitStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markCommitStopped();
            end;
            return nil;
        else
            l_flushSyncCallbackQueue_0();
            if not (not l___DEV___0 or not l_enableDebugTracing_0) then
                v35.logCommitStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markCommitStopped();
            end;
            return nil;
        end;
    end;
end;
v140.commitBeforeMutationEffects = function(v356)
    local l_v356_0 = v356;
    while l_v356_0 ~= nil do
        if l_v356_0.deletions ~= nil then
            v140.commitBeforeMutationEffectsDeletions(l_v356_0.deletions);
        end;
        if l_v356_0.child ~= nil and bit32.band(l_v356_0.subtreeFlags, v45.BeforeMutationMask) ~= v45.NoFlags then
            v140.commitBeforeMutationEffects(l_v356_0.child);
        end;
        if not l___DEV___0 then
            local v358 = nil;
            local v359 = nil;
            if l___YOLO___0 then
                v358 = true;
                v140.commitBeforeMutationEffectsImpl(l_v356_0);
            else
                local v360, v361 = xpcall(v140.commitBeforeMutationEffectsImpl, l_describeError_0, l_v356_0);
                v358 = v360;
                v359 = v361;
            end;
            if not v358 then
                v5.captureCommitPhaseError(l_v356_0, l_v356_0.return_, v359);
            end;
        else
            l_setCurrentFiber_0(l_v356_0);
            l_invokeGuardedCallback_0(nil, v140.commitBeforeMutationEffectsImpl, nil, l_v356_0);
            if l_hasCaughtError_0() then
                v5.captureCommitPhaseError(l_v356_0, l_v356_0.return_, (l_clearCaughtError_0()));
            end;
            l_resetCurrentFiber_0();
        end;
        l_v356_0 = l_v356_0.sibling;
    end;
end;
v140.commitBeforeMutationEffectsImpl = function(v362)
    local l_alternate_3 = v362.alternate;
    local l_flags_0 = v362.flags;
    if not ((not ((not v175 and v174 ~= nil) and v362.tag == v43.SuspenseComponent) or not v84.isSuspenseBoundaryBeingHidden(l_alternate_3, v362)) or not l_doesFiberContain_0(v362, v174)) then
        v175 = true;
        v40.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v45.Snapshot) ~= v45.NoFlags then
        l_setCurrentFiber_0(v362);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v362);
        l_resetCurrentFiber_0();
    end;
    if not (not (bit32.band(l_flags_0, v45.Passive) ~= v45.NoFlags) or v162) then
        v162 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function()
            v5.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v140.commitBeforeMutationEffectsDeletions = function(v365)
    for v366 = 1, #v365 do
        if l_doesFiberContain_0(v365[v366], v174) then
            v175 = true;
            v40.beforeActiveInstanceBlur();
        end;
    end;
end;
v140.commitMutationEffects = function(v367, v368, v369)
    local l_v367_0 = v367;
    while l_v367_0 ~= nil do
        local l_deletions_0 = l_v367_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v373 in l_deletions_0, nil, nil do
                local v374, v375 = xpcall(l_commitDeletion_0, l_describeError_0, v368, v373, l_v367_0, v369);
                if not v374 then
                    v5.captureCommitPhaseError(v373, l_v367_0, v375);
                end;
            end;
        end;
        if l_v367_0.child ~= nil and bit32.band(l_v367_0.subtreeFlags, v45.MutationMask) ~= v45.NoFlags then
            v140.commitMutationEffects(l_v367_0.child, v368, v369);
        end;
        if not l___DEV___0 then
            local v376 = nil;
            local v377 = nil;
            if l___YOLO___0 then
                v376 = true;
                v140.commitMutationEffectsImpl(l_v367_0, v368, v369);
            else
                local v378, v379 = xpcall(v140.commitMutationEffectsImpl, l_describeError_0, l_v367_0, v368, v369);
                v376 = v378;
                v377 = v379;
            end;
            if not v376 then
                v5.captureCommitPhaseError(l_v367_0, l_v367_0.return_, v377);
            end;
        else
            l_setCurrentFiber_0(l_v367_0);
            l_invokeGuardedCallback_0(nil, v140.commitMutationEffectsImpl, nil, l_v367_0, v368, v369);
            if l_hasCaughtError_0() then
                v5.captureCommitPhaseError(l_v367_0, l_v367_0.return_, (l_clearCaughtError_0()));
            end;
            l_resetCurrentFiber_0();
        end;
        l_v367_0 = l_v367_0.sibling;
    end;
end;
v140.commitMutationEffectsImpl = function(v380, _, _)
    local l_flags_1 = v380.flags;
    if bit32.band(l_flags_1, v45.Ref) ~= 0 then
        local l_alternate_4 = v380.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v385 = bit32.band(l_flags_1, (bit32.bor(v45.Placement, v45.Update, v45.Hydrating)));
    if v385 == v45.Placement then
        l_commitPlacement_0(v380);
        v380.flags = bit32.band(v380.flags, (bit32.bnot(v45.Placement)));
        return ;
    elseif v385 == v45.PlacementAndUpdate then
        l_commitPlacement_0(v380);
        v380.flags = bit32.band(v380.flags, (bit32.bnot(v45.Placement)));
        l_commitWork_0(v380.alternate, v380);
        return ;
    else
        if v385 == v45.Update then
            l_commitWork_0(v380.alternate, v380);
        end;
        return ;
    end;
end;
v140.commitMutationEffectsDeletions = function(v386, v387, v388, v389)
    for _, v391 in v386, nil, nil do
        local v392, v393 = xpcall(l_commitDeletion_0, l_describeError_0, v388, v391, v387, v389);
        if not v392 then
            v5.captureCommitPhaseError(v391, v387, v393);
        end;
    end;
end;
v5.schedulePassiveEffectCallback = function()
    if not v162 then
        v162 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function()
            v5.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v394 = nil;
v5.flushPassiveEffects = function()
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v395 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if not l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            return l_runWithPriority_0(v395, v394);
        else
            local v396 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v395));
            local v397 = nil;
            local v398 = nil;
            if l___YOLO___0 then
                v397 = true;
                l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v395));
                v398 = l_runWithPriority_0(v395, v394);
            else
                local v399, v400 = xpcall(l_runWithPriority_0, l_describeError_0, v395, v394);
                v397 = v399;
                v398 = v400;
            end;
            l_setCurrentUpdateLanePriority_0(v396);
            if not v397 then
                error(v398);
            end;
            return v398;
        end;
    else
        return false;
    end;
end;
v139 = function(v401, v402)
    local l_v402_0 = v402;
    while l_v402_0 ~= nil do
        local v404 = nil;
        if not (not l_ReactFeatureFlags_0.enableProfilerTimer or not l_ReactFeatureFlags_0.enableProfilerCommitHooks) and l_v402_0.tag == v43.Profiler then
            v404 = v157;
            v157 = l_v402_0;
        end;
        local v405 = bit32.band(l_v402_0.subtreeFlags, v45.PassiveMask);
        if l_v402_0.child ~= nil and v405 ~= v45.NoFlags then
            v139(v401, l_v402_0.child);
        end;
        if bit32.band(l_v402_0.flags, v45.Passive) ~= v45.NoFlags then
            if not l___DEV___0 then
                local v406 = nil;
                local v407 = nil;
                if l___YOLO___0 then
                    v406 = true;
                    l_commitPassiveMount_0(v401, l_v402_0);
                else
                    local v408, v409 = xpcall(l_commitPassiveMount_0, l_describeError_0, v401, l_v402_0);
                    v406 = v408;
                    v407 = v409;
                end;
                if not v406 then
                    v5.captureCommitPhaseError(l_v402_0, l_v402_0.return_, v407);
                end;
            else
                l_setCurrentFiber_0(l_v402_0);
                l_invokeGuardedCallback_0(nil, l_commitPassiveMount_0, nil, v401, l_v402_0);
                if l_hasCaughtError_0() then
                    v5.captureCommitPhaseError(l_v402_0, l_v402_0.return_, (l_clearCaughtError_0()));
                end;
                l_resetCurrentFiber_0();
            end;
        end;
        if not (not l_ReactFeatureFlags_0.enableProfilerTimer or not l_ReactFeatureFlags_0.enableProfilerCommitHooks) and l_v402_0.tag == v43.Profiler then
            if v404 ~= nil then
                local l_stateNode_0 = v404.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v402_0.stateNode.passiveEffectDuration;
            end;
            v157 = v404;
        end;
        l_v402_0 = l_v402_0.sibling;
    end;
end;
local function v411(v412)
    local l_v412_0 = v412;
    while l_v412_0 ~= nil do
        local l_deletions_1 = l_v412_0.deletions;
        if l_deletions_1 ~= nil then
            for v415 = 1, #l_deletions_1 do
                local v416 = l_deletions_1[v415];
                v140.flushPassiveUnmountEffectsInsideOfDeletedTree(v416, l_v412_0);
                v140.detachFiberAfterEffects(v416);
            end;
        end;
        local l_child_1 = l_v412_0.child;
        if l_child_1 ~= nil and bit32.band(l_v412_0.subtreeFlags, v45.PassiveMask) ~= v45.NoFlags then
            v411(l_child_1);
        end;
        if bit32.band(l_v412_0.flags, v45.Passive) ~= v45.NoFlags then
            l_setCurrentFiber_0(l_v412_0);
            l_commitPassiveUnmount_0(l_v412_0);
            l_resetCurrentFiber_0();
        end;
        l_v412_0 = l_v412_0.sibling;
    end;
end;
v140.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v418, v419)
    if bit32.band(v418.subtreeFlags, v45.PassiveStatic) ~= v45.NoFlags then
        local l_child_2 = v418.child;
        while l_child_2 ~= nil do
            v140.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_2, v419);
            l_child_2 = l_child_2.sibling;
        end;
    end;
    if bit32.band(v418.flags, v45.PassiveStatic) ~= v45.NoFlags then
        l_setCurrentFiber_0(v418);
        l_commitPassiveUnmountInsideDeletedTree_0(v418, v419);
        l_resetCurrentFiber_0();
    end;
end;
v394 = function()
    if v163 == nil then
        return false;
    else
        local l_v163_0 = v163;
        local l_l_NoLanes_4_0 = l_NoLanes_4;
        v163 = nil;
        l_NoLanes_4 = v8.NoLanes;
        l_invariant_0(bit32.band(v142, 48) == 0, "Cannot flush passive effects while already rendering.");
        if not (not l___DEV___0 or not l_enableDebugTracing_0) then
            v35.logPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        local l_v142_9 = v142;
        v142 = bit32.bor(v142, 32);
        local v424 = v140.pushInteractions(l_v163_0);
        v411(l_v163_0.current);
        v139(l_v163_0, l_v163_0.current);
        if not (not l___DEV___0 or not l_enableDebugTracing_0) then
            v35.logPassiveEffectsStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markPassiveEffectsStopped();
        end;
        if not (not l___DEV___0 or not l_enableDoubleInvokingEffects_0) then
            commitDoubleInvokeEffectsInDEV(l_v163_0.current, true);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing then
            v140.popInteractions(v424);
            v140.finishPendingInteractions(l_v163_0, l_l_NoLanes_4_0);
        end;
        v142 = l_v142_9;
        l_flushSyncCallbackQueue_0();
        if v163 == nil then
            v169 = 0;
        else
            v169 = v169 + 1;
        end;
        return true;
    end;
end;
v5.isAlreadyFailedLegacyErrorBoundary = function(v425)
    local v426 = false;
    if v161 ~= nil then
        v426 = v161:has(v425);
    end;
    return v426;
end;
v5.markLegacyErrorBoundaryAsFailed = function(v427)
    if v161 == nil then
        v161 = l_Set_0.new({
            v427
        });
        return ;
    else
        v161:add(v427);
        return ;
    end;
end;
v5.onUncaughtError = function(v428)
    if not v159 then
        v159 = true;
        v160 = v428;
    end;
end;
v138 = function(v429, v430, v431)
    l_enqueueUpdate_0(v429, (l_createRootErrorUpdate_0(v429, l_createCapturedValue_0(v431, v430), l_SyncLane_0, v5.onUncaughtError)));
    local v432 = v5.requestEventTime();
    local v433 = v140.markUpdateLaneFromFiberToRoot(v429, l_SyncLane_0);
    if v433 ~= nil then
        l_markRootUpdated_0(v433, l_SyncLane_0, v432);
        v101(v433, v432);
        v140.schedulePendingInteractions(v433, l_SyncLane_0);
    end;
end;
v5.captureCommitPhaseError = function(v434, v435, v436)
    if v434.tag == v43.HostRoot then
        v138(v434, v434, v436);
        return ;
    else
        local v437 = nil;
        v437 = if not l_skipUnmountedBoundaries_0 then v434.return_ else v435;
        while true do
            if v437 ~= nil then
                if v437.tag == v43.HostRoot then
                    v138(v437, v434, v436);
                    return ;
                else
                    if v437.tag == v43.ClassComponent then
                        local l_type_0 = v437.type;
                        local l_stateNode_1 = v437.stateNode;
                        if not (typeof(l_type_0.getDerivedStateFromError) ~= "function" and (not (typeof(l_stateNode_1.componentDidCatch) == "function") or v5.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1))) then
                            l_enqueueUpdate_0(v437, (l_createClassErrorUpdate_0(v437, l_createCapturedValue_0(v436, v434), l_SyncLane_0)));
                            local v440 = v5.requestEventTime();
                            local v441 = v140.markUpdateLaneFromFiberToRoot(v437, l_SyncLane_0);
                            if v441 ~= nil then
                                l_markRootUpdated_0(v441, l_SyncLane_0, v440);
                                v101(v441, v440);
                                v140.schedulePendingInteractions(v441, l_SyncLane_0);
                            end;
                            return ;
                        end;
                    end;
                    v437 = v437.return_;
                end;
            else
                return ;
            end;
        end;
    end;
end;
v5.pingSuspendedRoot = function(v442, v443, v444)
    local l_pingCache_0 = v442.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v443] = nil;
    end;
    local v446 = v5.requestEventTime();
    l_markRootPinged_0(v442, v444, v446);
    if not (not (v143 == v442) or not l_isSubsetOfLanes_0(l_NoLanes_0, v444)) then
        if not (l_Incomplete_0 ~= v141.SuspendedWithDelay) or not (not (l_Incomplete_0 == v141.Suspended) or not l_includesOnlyRetries_0(l_NoLanes_0)) and l_now_0() - v155 < 500 then
            v140.prepareFreshStack(v442, v8.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v444);
        end;
    end;
    v101(v442, v446);
    v140.schedulePendingInteractions(v442, v444);
end;
retryTimedOutBoundary = function(v447, v448)
    if v448 == v8.NoLane then
        v448 = requestRetryLane(v447);
    end;
    local v449 = v5.requestEventTime();
    local v450 = v140.markUpdateLaneFromFiberToRoot(v447, v448);
    if v450 ~= nil then
        l_markRootUpdated_0(v450, v448, v449);
        v101(v450, v449);
        v140.schedulePendingInteractions(v450, v448);
    end;
end;
v5.resolveRetryWakeable = function(v451, v452)
    local l_NoLane_0 = v8.NoLane;
    local v454 = nil;
    v454 = v451.stateNode;
    if v454 ~= nil then
        v454:delete(v452);
    end;
    retryTimedOutBoundary(v451, l_NoLane_0);
end;
jnd = function(v455)
    if v455 < 120 then
        return 120;
    elseif v455 < 480 then
        return 480;
    elseif v455 < 1080 then
        return 1080;
    elseif v455 < 1920 then
        return 1920;
    elseif v455 < 3000 then
        return 3000;
    elseif v455 < 4320 then
        return 4320;
    else
        return math.ceil(v455 / 1960) * 1960;
    end;
end;
v140.checkForNestedUpdates = function()
    if v167 > 50 then
        v167 = 0;
        v168 = nil;
        l_invariant_0(false, "Maximum update depth exceeded. This can happen when a component " .. "repeatedly calls setState inside componentWillUpdate or " .. "componentDidUpdate. React limits the number of nested updates to " .. "prevent infinite loops.");
    end;
    if l___DEV___0 and v169 > 50 then
        v169 = 0;
        l_console_0.error("Maximum update depth exceeded. This can happen when a component " .. "calls setState inside useEffect, but useEffect either doesn't " .. "have a dependency array, or one of the dependencies changes on " .. "every render.");
    end;
end;
flushRenderPhaseStrictModeWarningsInDEV = function()
    if l___DEV___0 then
        v122.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v122.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v456, v457)
    if not (not l___DEV___0 or not l_enableDoubleInvokingEffects_0) then
        l_setCurrentFiber_0(v456);
        invokeEffectsInDev(v456, v45.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v457 then
            invokeEffectsInDev(v456, v45.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v456, v45.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v457 then
            invokeEffectsInDev(v456, v45.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v458, v459, v460)
    if not (not l___DEV___0 or not l_enableDoubleInvokingEffects_0) then
        local l_v458_0 = v458;
        while l_v458_0 ~= nil do
            if l_v458_0.child ~= nil and bit32.band(l_v458_0.subtreeFlags, v459) ~= v45.NoFlags then
                invokeEffectsInDev(l_v458_0.child, v459, v460);
            end;
            if bit32.band(l_v458_0.flags, v459) ~= v45.NoFlags then
                v460(l_v458_0);
            end;
            l_v458_0 = l_v458_0.sibling;
        end;
    end;
end;
local v462 = nil;
v140.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v463)
    if l___DEV___0 then
        if bit32.band(v142, 16) ~= 0 then
            return ;
        elseif bit32.band(v463.mode, (bit32.bor(v42.BlockingMode, v42.ConcurrentMode))) == 0 then
            return ;
        else
            local l_tag_0 = v463.tag;
            if ((((((l_tag_0 ~= v43.IndeterminateComponent and l_tag_0 ~= v43.HostRoot) and l_tag_0 ~= v43.ClassComponent) and l_tag_0 ~= v43.FunctionComponent) and l_tag_0 ~= v43.ForwardRef) and l_tag_0 ~= v43.MemoComponent) and l_tag_0 ~= v43.SimpleMemoComponent) and l_tag_0 ~= v43.Block then
                return ;
            else
                local v465 = l_getComponentName_0(v463.type) or "ReactComponent";
                if v462 ~= nil then
                    if not v462[v465] then
                        v462[v465] = true;
                    else
                        return ;
                    end;
                else
                    v462 = {
                        [v465] = true
                    };
                end;
                local l_current_3 = v123.current;
                local l_status_1, l_result_1 = pcall(function()
                    l_setCurrentFiber_0(v463);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. " .. "This indicates that you have a side-effect in your render function that " .. "asynchronously later calls tries to update the component. Move this work to " .. "useEffect instead.");
                end);
                if not l_current_3 then
                    l_resetCurrentFiber_0();
                else
                    l_setCurrentFiber_0(v463);
                end;
                if not l_status_1 then
                    error(l_result_1);
                end;
            end;
        end;
    end;
end;
if not l___DEV___0 or not l_ReactFeatureFlags_0.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    v140.beginWork = v106;
else
    v140.beginWork = function(v469, v470, v471)
        local v472 = v41.assignFiberPropertiesInDEV(nil, v470);
        local v473, v474 = xpcall(v106, l_describeError_0, v469, v470, v471);
        if not v473 then
            if (v474 ~= nil and typeof(v474) == "table") and typeof(v474.andThen) == "function" then
                error(v474);
            end;
            l_resetContextDependencies_0();
            if not v102.resetHooksAfterThrowRef then
                v111 = require(script.Parent["ReactFiberHooks.new"]);
                v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
                v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
                v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v102.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v470);
            v41.assignFiberPropertiesInDEV(v470, v472);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v470.mode, v42.ProfileMode) ~= 0 then
                v120.startProfilerTimer(v470);
            end;
            l_invokeGuardedCallback_0(nil, v106, nil, v469, v470, v471);
            if not l_hasCaughtError_0() then
                error(v474);
            else
                error((l_clearCaughtError_0()));
                return v474;
            end;
        end;
        return v474;
    end;
end;
local v476 = false;
local v477 = nil;
if l___DEV___0 then
    v477 = {};
end;
v140.warnAboutRenderPhaseUpdatesInDEV = function(v478)
    if not (not l___DEV___0 or not v123.isRendering) and bit32.band(v142, 16) ~= 0 then
        if not v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v111 = require(script.Parent["ReactFiberHooks.new"]);
            v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
            v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
            v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if not (v478.tag ~= v43.FunctionComponent and v478.tag ~= v43.ForwardRef) or v478.tag == v43.SimpleMemoComponent then
                local v479 = if v144 ~= nil then l_getComponentName_0(v144.type) else "Unknown";
                if v477[v479] == nil then
                    v477[v479] = true;
                    l_console_0.error("Cannot update a component (`%s`) while rendering a " .. "different component (`%s`). To locate the bad setState() call inside `%s`, " .. "follow the stack trace as described in https://reactjs.org/link/setstate-in-render", l_getComponentName_0(v478.type) or "Unknown", v479, v479);
                    return ;
                end;
            elseif not (not (v478.tag == v43.ClassComponent) or v476) then
                l_console_0.error("Cannot update during an existing state transition (such as " .. "within `render`). Render methods should be a pure " .. "function of props and state.");
                v476 = true;
            end;
        end;
    end;
end;
v5.IsThisRendererActing = {
    current = false
};
v5.warnIfNotScopedWithMatchingAct = function(v480)
    if ((l___DEV___0 and v40.warnsIfNotActing == true) and l_IsSomeRendererActing_0.current == true) and v5.IsThisRendererActing.current ~= true then
        local l_current_4 = v123.current;
        local l_status_2, l_result_2 = pcall(function()
            l_setCurrentFiber_0(v480);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\n" .. "Be sure to use the matching version of act() corresponding to your renderer:\n\n" .. "-- for react-roblox:\n" .. "local React = require(Packages.React)\n" .. "-- ...\n" .. "React.TestUtils.act(function() ... end)\n\n" .. "-- for react-test-renderer:\n" .. "local TestRenderer = require(Packages.ReactTestRenderer)\n" .. "-- ...\n" .. "TestRenderer.act(function() ... end)");
        end);
        if not l_current_4 then
            l_resetCurrentFiber_0();
        else
            l_setCurrentFiber_0(v480);
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v5.warnIfNotCurrentlyActingEffectsInDEV = function(v484)
    if (((l___DEV___0 and v40.warnsIfNotActing == true) and bit32.band(v484.mode, v42.StrictMode) ~= v42.NoMode) and l_IsSomeRendererActing_0.current == false) and v5.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the real client." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v484.type));
    end;
end;
v5.warnIfNotCurrentlyActingUpdatesInDEV = function(v485)
    if (((l___DEV___0 and v40.warnsIfNotActing == true) and v142 == 0) and l_IsSomeRendererActing_0.current == false) and v5.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_3, l_result_3 = pcall(function()
            l_setCurrentFiber_0(v485);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the client application." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v485.type));
        end);
        if not l_l_current_0_0 then
            l_resetCurrentFiber_0();
        else
            l_setCurrentFiber_0(v485);
        end;
        if l_status_3 then
            return l_result_3;
        end;
    end;
end;
local v489 = false;
v5.warnIfUnmockedScheduler = function(v490)
    if (l___DEV___0 and v489 == false) and v9.unstable_flushAllWithoutAsserting == nil then
        if not (bit32.band(v490.mode, v42.BlockingMode) == 0) or bit32.band(v490.mode, v42.ConcurrentMode) ~= 0 then
            v489 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked " .. "to guarantee consistent behaviour across tests and client application. " .. "For example, with Jest: \n" .. "jest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
            return ;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v489 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked " .. "to guarantee consistent behaviour across tests and client applications. " .. "For example, with Jest: \n" .. "jest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v491, v492)
    return v492 * 1000 + v491.interactionThreadID;
end;
v5.markSpawnedWork = function(v493)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        if v170 == nil then
            v170 = {
                v493
            };
            return ;
        else
            table.insert(v170, v493);
            return ;
        end;
    else
        return ;
    end;
end;
scheduleInteractions = function(v494, v495, v496)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        if v496.size > 0 then
            local l_pendingInteractionMap_0 = v494.pendingInteractionMap;
            local v498 = l_pendingInteractionMap_0:get(v495);
            if v498 ~= nil then
                v496:forEach(function(v499)
                    if not v498:has(v499) then
                        v499.__count = v499.__count + 1;
                    end;
                    v498:add(v499);
                end);
            else
                l_pendingInteractionMap_0:set(v495, l_Set_0.new(v496));
                for _, v501 in v496, nil, nil do
                    v501.__count = v501.__count + 1;
                end;
            end;
            local l_current_5 = l___subscriberRef_0.current;
            if l_current_5 ~= nil then
                l_current_5.onWorkScheduled(v496, (computeThreadID(v494, v495)));
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v140.schedulePendingInteractions = function(v503, v504)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        scheduleInteractions(v503, v504, l___interactionsRef_0.current);
        return ;
    else
        return ;
    end;
end;
v140.startWorkOnPendingInteractions = function(v505, v506)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local v507 = l_Set_0.new();
        v505.pendingInteractionMap:forEach(function(v508, v509)
            if l_includesSomeLane_0(v506, v509) then
                v508:forEach(function(v510)
                    v507:add(v510);
                end);
            end;
        end);
        v505.memoizedInteractions = v507;
        if v507.size > 0 then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v512, v513 = xpcall(l_current_6.onWorkStarted, l_describeError_0, v507, (computeThreadID(v505, v506)));
                if not v512 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function()
                        error(v513);
                    end);
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v140.finishPendingInteractions = function(v514, v515)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_pendingLanes_0 = v514.pendingLanes;
        local v517 = nil;
        local v518 = true;
        local v519 = nil;
        if v517 ~= nil and v514.memoizedInteractions.size > 0 then
            local v520 = computeThreadID(v514, v515);
            v517 = l___subscriberRef_0.current;
            local v521, v522 = xpcall(v517.onWorkStopped, l_describeError_0, v514.memoizedInteractions, v520);
            v518 = v521;
            v519 = v522;
        end;
        local l_pendingInteractionMap_1 = v514.pendingInteractionMap;
        l_pendingInteractionMap_1:forEach(function(v524, v525)
            if not l_includesSomeLane_0(l_pendingLanes_0, v525) then
                l_pendingInteractionMap_1:delete(v525);
                v524:forEach(function(v526)
                    v526.__count = v526.__count - 1;
                    if v517 ~= nil and v526.__count == 0 then
                        local v527, v528 = xpcall(v517.onInteractionScheduledWorkCompleted, l_describeError_0, v526);
                        if not v527 then
                            l_scheduleCallback_0(l_ImmediatePriority_0, function()
                                error(v528);
                            end);
                        end;
                    end;
                end);
            end;
        end);
        if not v518 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function()
                error(v519);
            end);
        end;
        return ;
    else
        return ;
    end;
end;
local v529 = false;
local v530 = false;
local l_unstable_flushAllWithoutAsserting_0 = v9.unstable_flushAllWithoutAsserting;
local v532 = typeof(l_unstable_flushAllWithoutAsserting_0) == "function";
local function v540()
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v529_0 = v529;
        v529 = true;
        local v534, v535 = xpcall(l_unstable_flushAllWithoutAsserting_0, l_describeError_0);
        v529 = l_v529_0;
        if v534 then
            return v535;
        else
            error(v535);
            return ;
        end;
    else
        local l_v529_1 = v529;
        v529 = true;
        local v538, v539 = xpcall(function()
            local v537 = false;
            while v5.flushPassiveEffects() do
                v537 = true;
            end;
            return v537;
        end, l_describeError_0);
        v529 = l_v529_1;
        if v538 then
            return v539;
        else
            error(v539);
            return ;
        end;
    end;
end;
local function v541(v542)
    local v543, v544 = xpcall(v540, l_describeError_0);
    if v543 then
        local v545, v546 = xpcall(l_enqueueTask_0, l_describeError_0, function()
            if not v540() then
                v542();
                return ;
            else
                v541(v542);
                return ;
            end;
        end);
        v543 = v545;
        v544 = v546;
    end;
    if not v543 then
        v542(v544);
    end;
end;
v5.act = function(v547)
    if not (l___DEV___0 or _G.__ROACT_17_MOCK_SCHEDULER__) and v207 == false then
        v207 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v206_0 = v206;
    v206 = v206 + 1;
    local l_current_7 = l_IsSomeRendererActing_0.current;
    local l_current_8 = v5.IsThisRendererActing.current;
    local l_v530_0 = v530;
    l_IsSomeRendererActing_0.current = true;
    v5.IsThisRendererActing.current = true;
    v530 = true;
    local function _()
        v206 = v206 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v5.IsThisRendererActing.current = l_current_8;
        v530 = l_v530_0;
        if l___DEV___0 and l_v206_0 < v206 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v553, v554 = xpcall(v5.batchedUpdates, l_describeError_0, v547);
    if not v553 then
        v206 = v206 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v5.IsThisRendererActing.current = l_current_8;
        v530 = l_v530_0;
        if l___DEV___0 and l_v206_0 < v206 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(v554);
    end;
    if (v554 ~= nil and typeof(v554) == "table") and typeof(v554.andThen) == "function" then
        local v555 = false;
        if l___DEV___0 and typeof(v98) ~= nil then
            v98.resolve():andThen(function()
            end):andThen(function()
                if v555 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v557, v558)
                v555 = true;
                return v554:andThen(function()
                    if not (v206 <= 1) or v532 == true and l_current_7 == true then
                        v206 = v206 - 1;
                        l_IsSomeRendererActing_0.current = l_current_7;
                        v5.IsThisRendererActing.current = l_current_8;
                        v530 = l_v530_0;
                        if l___DEV___0 and l_v206_0 < v206 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        v557();
                        return ;
                    else
                        v541(function(v559)
                            v206 = v206 - 1;
                            l_IsSomeRendererActing_0.current = l_current_7;
                            v5.IsThisRendererActing.current = l_current_8;
                            v530 = l_v530_0;
                            if l___DEV___0 and l_v206_0 < v206 then
                                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                            end;
                            if not v559 then
                                v557();
                                return ;
                            else
                                v558(v559);
                                return ;
                            end;
                        end);
                        return ;
                    end;
                end, function(v560)
                    v206 = v206 - 1;
                    l_IsSomeRendererActing_0.current = l_current_7;
                    v5.IsThisRendererActing.current = l_current_8;
                    v530 = l_v530_0;
                    if l___DEV___0 and l_v206_0 < v206 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v558(v560);
                end);
            end
        };
    else
        if l___DEV___0 and v554 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return nil, or a Promise. You returned %s", (tostring(v554)));
        end;
        local v561, v562 = xpcall(function()
            if v206 == 1 and (not (v532 ~= false) or l_current_7 == false) then
                v540();
            end;
            v206 = v206 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v5.IsThisRendererActing.current = l_current_8;
            v530 = l_v530_0;
            if l___DEV___0 and l_v206_0 < v206 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end, l_describeError_0);
        if not v561 then
            v206 = v206 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v5.IsThisRendererActing.current = l_current_8;
            v530 = l_v530_0;
            if l___DEV___0 and l_v206_0 < v206 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(v562);
        end;
        return {
            andThen = function(_, v564, _)
                if l___DEV___0 then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v564();
            end
        };
    end;
end;
v140.detachFiberAfterEffects = function(v566)
    v566.child = nil;
    v566.deletions = nil;
    v566.dependencies = nil;
    v566.memoizedProps = nil;
    v566.memoizedState = nil;
    v566.pendingProps = nil;
    v566.sibling = nil;
    v566.stateNode = nil;
    v566.updateQueue = nil;
    if l___DEV___0 then
        v566._debugOwner = nil;
    end;
end;
return v5;
