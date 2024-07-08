local function _(v0)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l___DEV___0 = _G.__DEV__;
local l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__;
local l___COMPAT_WARNINGS___0 = _G.__COMPAT_WARNINGS__;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v7 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v7.Array;
local l_Object_0 = v7.Object;
local l_inspect_0 = v7.util.inspect;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local v14 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local v19 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v19.FunctionComponent;
local l_ClassComponent_0 = v19.ClassComponent;
local l_HostRoot_0 = v19.HostRoot;
local l_HostComponent_0 = v19.HostComponent;
local l_HostText_0 = v19.HostText;
local l_HostPortal_0 = v19.HostPortal;
local l_ForwardRef_0 = v19.ForwardRef;
local l_Fragment_0 = v19.Fragment;
local l_Mode_0 = v19.Mode;
local l_ContextProvider_0 = v19.ContextProvider;
local l_ContextConsumer_0 = v19.ContextConsumer;
local l_Profiler_0 = v19.Profiler;
local l_SuspenseComponent_0 = v19.SuspenseComponent;
local l_SuspenseListComponent_0 = v19.SuspenseListComponent;
local l_MemoComponent_0 = v19.MemoComponent;
local l_SimpleMemoComponent_0 = v19.SimpleMemoComponent;
local l_LazyComponent_0 = v19.LazyComponent;
local l_IncompleteClassComponent_0 = v19.IncompleteClassComponent;
local l_OffscreenComponent_0 = v19.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v19.LegacyHiddenComponent;
local v40 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v40.NoFlags;
local l_StaticMask_0 = v40.StaticMask;
local l_PerformedWork_0 = v40.PerformedWork;
local l_Placement_0 = v40.Placement;
local l_Hydrating_0 = v40.Hydrating;
local l_ContentReset_0 = v40.ContentReset;
local l_DidCapture_0 = v40.DidCapture;
local l_Ref_0 = v40.Ref;
local l_Deletion_0 = v40.Deletion;
local l_ForceUpdateForLegacySuspense_0 = v40.ForceUpdateForLegacySuspense;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_disableModulePatternComponents_0 = l_ReactFeatureFlags_0.disableModulePatternComponents;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseServerRenderer_0 = l_ReactFeatureFlags_0.enableSuspenseServerRenderer;
local l_warnAboutDefaultPropsOnFunctionComponents_0 = l_ReactFeatureFlags_0.warnAboutDefaultPropsOnFunctionComponents;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local _ = l_ReactSymbols_0.getIteratorFn;
local v67 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v68 = require(script.Parent.ReactCurrentFiber);
local l_getCurrentFiberOwnerNameInDevOrNull_0 = v68.getCurrentFiberOwnerNameInDevOrNull;
local l_setIsRendering_0 = v68.setIsRendering;
local v71 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveFunctionForHotReloading_0 = v71.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v71.resolveForwardRefForHotReloading;
local l_resolveClassForHotReloading_0 = v71.resolveClassForHotReloading;
local v75 = require(script.Parent["ReactChildFiber.new"]);
local l_mountChildFibers_0 = v75.mountChildFibers;
local l_reconcileChildFibers_0 = v75.reconcileChildFibers;
local l_cloneChildFibers_0 = v75.cloneChildFibers;
local v79 = require(script.Parent["ReactUpdateQueue.new"]);
local l_processUpdateQueue_0 = v79.processUpdateQueue;
local l_cloneUpdateQueue_0 = v79.cloneUpdateQueue;
local l_initializeUpdateQueue_0 = v79.initializeUpdateQueue;
local v83 = require(script.Parent.ReactTypeOfMode);
local l_ConcurrentMode_0 = v83.ConcurrentMode;
local l_NoMode_0 = v83.NoMode;
local l_ProfileMode_0 = v83.ProfileMode;
local l_StrictMode_0 = v83.StrictMode;
local l_BlockingMode_0 = v83.BlockingMode;
local v89 = require(script.Parent.ReactFiberHostConfig);
local l_shouldSetTextContent_0 = v89.shouldSetTextContent;
local l_isSuspenseInstancePending_0 = v89.isSuspenseInstancePending;
local l_isSuspenseInstanceFallback_0 = v89.isSuspenseInstanceFallback;
local l_registerSuspenseInstanceRetry_0 = v89.registerSuspenseInstanceRetry;
local l_supportsHydration_0 = v89.supportsHydration;
local v95 = require(script.Parent["ReactFiberHostContext.new"]);
local l_pushHostContext_0 = v95.pushHostContext;
local l_pushHostContainer_0 = v95.pushHostContainer;
local l_suspenseStackCursor_0 = v16.suspenseStackCursor;
local l_hasSuspenseContext_0 = v16.hasSuspenseContext;
local l_ForceSuspenseFallback_0 = v16.ForceSuspenseFallback;
local l_addSubtreeSuspenseContext_0 = v16.addSubtreeSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v16.InvisibleParentSuspenseContext;
local l_pushSuspenseContext_0 = v16.pushSuspenseContext;
local l_setDefaultShallowSuspenseContext_0 = v16.setDefaultShallowSuspenseContext;
local v105 = require(script.Parent["ReactFiberNewContext.new"]);
local l_propagateContextChange_0 = v105.propagateContextChange;
local l_readContext_0 = v105.readContext;
local l_calculateChangedBits_0 = v105.calculateChangedBits;
local l_prepareToReadContext_0 = v105.prepareToReadContext;
local l_pushProvider_0 = v105.pushProvider;
local v111 = {
    renderWithHooksRef = nil, 
    bailoutHooksRef = nil, 
    shouldSuspendRef = nil
};
local function _(v112)
    if not v111.shouldSuspendRef then
        v111.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
    end;
    return v111.shouldSuspendRef(v112);
end;
local function _()
    local v114 = require(script.Parent["ReactFiberHooks.new"]);
    v111.renderWithHooksRef = v114.renderWithHooks;
    v111.bailoutHooksRef = v114.bailoutHooks;
end;
local function v117(...)
    if not v111.renderWithHooksRef then
        local v116 = require(script.Parent["ReactFiberHooks.new"]);
        v111.renderWithHooksRef = v116.renderWithHooks;
        v111.bailoutHooksRef = v116.bailoutHooks;
    end;
    return v111.renderWithHooksRef(...);
end;
local function v119(...)
    if not v111.bailoutHooksRef then
        local v118 = require(script.Parent["ReactFiberHooks.new"]);
        v111.renderWithHooksRef = v118.renderWithHooks;
        v111.bailoutHooksRef = v118.bailoutHooks;
    end;
    return v111.bailoutHooksRef(...);
end;
local l_stopProfilerTimerIfRunning_0 = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning;
local v121 = require(script.Parent["ReactFiberContext.new"]);
local l_getMaskedContext_0 = v121.getMaskedContext;
local l_getUnmaskedContext_0 = v121.getUnmaskedContext;
local l_hasContextChanged_0 = v121.hasContextChanged;
local l_pushContextProvider_0 = v121.pushContextProvider;
local l_isContextProvider_0 = v121.isContextProvider;
local l_pushTopLevelContextObject_0 = v121.pushTopLevelContextObject;
local l_invalidateContextProvider_0 = v121.invalidateContextProvider;
local v129 = require(script.Parent["ReactFiberHydrationContext.new"]);
local l_resetHydrationState_0 = v129.resetHydrationState;
local l_enterHydrationState_0 = v129.enterHydrationState;
local l_reenterHydrationStateFromDehydratedSuspenseInstance_0 = v129.reenterHydrationStateFromDehydratedSuspenseInstance;
local l_tryToClaimNextHydratableInstance_0 = v129.tryToClaimNextHydratableInstance;
local l_warnIfHydrating_0 = v129.warnIfHydrating;
local v135 = require(script.Parent["ReactFiberClassComponent.new"]);
local l_adoptClassInstance_0 = v135.adoptClassInstance;
local l_applyDerivedStateFromProps_0 = v135.applyDerivedStateFromProps;
local l_constructClassInstance_0 = v135.constructClassInstance;
local l_mountClassInstance_0 = v135.mountClassInstance;
local l_resumeMountClassInstance_0 = v135.resumeMountClassInstance;
local l_updateClassInstance_0 = v135.updateClassInstance;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v143 = require(script.Parent["ReactFiber.new"]);
local l_resolveLazyComponentTag_0 = v143.resolveLazyComponentTag;
local l_createFiberFromFragment_0 = v143.createFiberFromFragment;
local l_createFiberFromOffscreen_0 = v143.createFiberFromOffscreen;
local l_createFiberFromTypeAndProps_0 = v143.createFiberFromTypeAndProps;
local l_isSimpleFunctionComponent_0 = v143.isSimpleFunctionComponent;
local l_createWorkInProgress_0 = v143.createWorkInProgress;
local v150 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_pushRenderLanes_0 = v150.pushRenderLanes;
local l_markSpawnedWork_0 = v150.markSpawnedWork;
local l_retryDehydratedSuspenseBoundary_0 = v150.retryDehydratedSuspenseBoundary;
local l_scheduleUpdateOnFiber_0 = v150.scheduleUpdateOnFiber;
local l_renderDidSuspendDelayIfPossible_0 = v150.renderDidSuspendDelayIfPossible;
local l_getWorkInProgressRoot_0 = v150.getWorkInProgressRoot;
local l_getExecutionContext_0 = v150.getExecutionContext;
local l_RetryAfterError_0 = v150.RetryAfterError;
local l_NoContext_0 = v150.NoContext;
local v160 = nil;
local l_setWorkInProgressVersion_0 = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local v167 = {};
local v168 = nil;
local v169 = nil;
local v170 = false;
local v171 = {
    didWarnAboutBadClass = {}, 
    didWarnAboutModulePatternComponent = {}, 
    didWarnAboutContextTypeOnFunctionComponent = {}, 
    didWarnAboutGetDerivedStateOnFunctionComponent = {}, 
    didWarnAboutFunctionRefs = {}, 
    didWarnAboutDefaultPropsOnFunctionComponent = {}
};
local v172 = nil;
if l___DEV___0 then
    v171.didWarnAboutBadClass = {};
    v171.didWarnAboutModulePatternComponent = {};
    v171.didWarnAboutContextTypeOnFunctionComponent = {};
    v171.didWarnAboutGetDerivedStateOnFunctionComponent = {};
    v171.didWarnAboutFunctionRefs = {};
    v167.didWarnAboutReassigningProps = false;
    v171.didWarnAboutDefaultPropsOnFunctionComponent = {};
end;
local function _(v173, v174, v175, v176)
    if v173 == nil then
        v174.child = l_mountChildFibers_0(v174, nil, v175, v176);
        return ;
    else
        v174.child = l_reconcileChildFibers_0(v174, v173.child, v175, v176);
        return ;
    end;
end;
local function _(v178, v179, v180, v181)
    v179.child = l_reconcileChildFibers_0(v179, v178.child, nil, v181);
    v179.child = l_reconcileChildFibers_0(v179, nil, v180, v181);
end;
local function v196(v183, v184, v185, v186, v187)
    if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v184.type ~= v184.elementType then
        local l_propTypes_0 = v185.propTypes;
        local l_validateProps_0 = v185.validateProps;
        if not (not l_propTypes_0 and not l_validateProps_0) then
            l_checkPropTypes_0(l_propTypes_0, l_validateProps_0, v186, "prop", l_getComponentName_0(v185));
        end;
    end;
    local l_render_0 = v185.render;
    local l_ref_0 = v184.ref;
    local v192 = nil;
    l_prepareToReadContext_0(v184, v187, v167.markWorkInProgressReceivedUpdate);
    if not l___DEV___0 then
        v192 = v117(v183, v184, l_render_0, v186, l_ref_0, v187);
    else
        l_ReactCurrentOwner_0.current = v184;
        l_setIsRendering_0(true);
        v192 = v117(v183, v184, l_render_0, v186, l_ref_0, v187);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v184.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v193, v194 = xpcall(v117, l_describeError_0, v183, v184, l_render_0, v186, l_ref_0, v187);
            if v193 then
                v192 = v194;
            end;
            l_reenableLogs_0();
            if not v193 then
                error(v194);
            end;
        end;
        l_setIsRendering_0(false);
    end;
    if not (v183 ~= nil) or v170 then
        v184.flags = bit32.bor(v184.flags, l_PerformedWork_0);
        local l_v192_0 = v192;
        if v183 == nil then
            v184.child = l_mountChildFibers_0(v184, nil, l_v192_0, v187);
        else
            v184.child = l_reconcileChildFibers_0(v184, v183.child, l_v192_0, v187);
        end;
        return v184.child;
    else
        v119(v183, v184, v187);
        return v168(v183, v184, v187);
    end;
end;
local function v215(v197, v198, v199, v200, v201, v202)
    if v197 == nil then
        local l_type_0 = v199.type;
        if (l_isSimpleFunctionComponent_0(l_type_0) and v199.compare == nil) and v199.defaultProps == nil then
            local l_l_type_0_0 = l_type_0;
            if l___DEV___0 then
                l_l_type_0_0 = l_resolveFunctionForHotReloading_0(l_type_0);
            end;
            v198.tag = l_SimpleMemoComponent_0;
            v198.type = l_l_type_0_0;
            if l___DEV___0 then
                validateFunctionComponentInDev(v198, l_type_0);
            end;
            return v172(v197, v198, l_l_type_0_0, v200, v201, v202);
        else
            if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) then
                local v205 = nil;
                local v206 = nil;
                if type(l_type_0) == "table" then
                    v205 = l_type_0.propTypes;
                    v206 = l_type_0.validateProps;
                end;
                if not (not v205 and not v206) then
                    l_checkPropTypes_0(v205, v206, v200, "prop", l_getComponentName_0(l_type_0));
                end;
            end;
            local v207 = l_createFiberFromTypeAndProps_0(v199.type, nil, v200, v198, v198.mode, v202);
            v207.ref = v198.ref;
            v207.return_ = v198;
            v198.child = v207;
            return v207;
        end;
    else
        if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) then
            local l_type_1 = v199.type;
            local v209 = nil;
            local v210 = nil;
            if type(l_type_1) == "table" then
                v209 = l_type_1.propTypes;
                v210 = l_type_1.validateProps;
            end;
            if not (not v209 and not v210) then
                l_checkPropTypes_0(v209, v210, v200, "prop", l_getComponentName_0(l_type_1));
            end;
        end;
        local l_child_0 = v197.child;
        if not v14.includesSomeLane(v201, v202) then
            local l_memoizedProps_0 = l_child_0.memoizedProps;
            local l_compare_0 = v199.compare;
            if l_compare_0 == nil then
                l_compare_0 = l_shallowEqual_0;
            end;
            if l_compare_0(l_memoizedProps_0, v200) and v197.ref == v198.ref then
                return v168(v197, v198, v202);
            end;
        end;
        v198.flags = bit32.bor(v198.flags, l_PerformedWork_0);
        local v214 = l_createWorkInProgress_0(l_child_0, v200);
        v214.ref = v198.ref;
        v214.return_ = v198;
        v198.child = v214;
        return v214;
    end;
end;
v172 = function(v216, v217, v218, v219, v220, v221)
    if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v217.type ~= v217.elementType then
        local l_elementType_0 = v217.elementType;
        if l_elementType_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
            local l_l_elementType_0_0 = l_elementType_0;
            local v224, v225 = xpcall(l_l_elementType_0_0._init, l_describeError_0, l_l_elementType_0_0._payload);
            l_elementType_0 = if not v224 then nil else v225;
            local v226 = nil;
            local v227 = nil;
            if l_elementType_0 ~= nil and type(l_elementType_0) == "table" then
                v226 = l_elementType_0.propTypes;
                v227 = l_elementType_0.validateProps;
            end;
            if not (not v226 and not v227) then
                l_checkPropTypes_0(v226, v227, v219, "prop", l_getComponentName_0(l_elementType_0));
            end;
        end;
    end;
    if v216 ~= nil then
        local l_memoizedProps_1 = v216.memoizedProps;
        local v229 = true;
        if l___DEV___0 then
            v229 = v217.type == v216.type;
        end;
        if not (not (l_shallowEqual_0(l_memoizedProps_1, v219) and v216.ref == v217.ref) or not v229) then
            v170 = false;
            if v14.includesSomeLane(v221, v220) then
                if bit32.band(v216.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                    v170 = true;
                end;
            else
                v217.lanes = v216.lanes;
                return v168(v216, v217, v221);
            end;
        end;
    end;
    return v169(v216, v217, v218, v219, v221);
end;
local function v239(v230, v231, v232)
    local l_pendingProps_0 = v231.pendingProps;
    local l_children_0 = l_pendingProps_0.children;
    local v235 = nil;
    if v230 ~= nil then
        v235 = v230.memoizedState;
    end;
    if not (l_pendingProps_0.mode ~= "hidden") or l_pendingProps_0.mode == "unstable-defer-without-hiding" then
        if bit32.band(v231.mode, l_ConcurrentMode_0) == l_NoMode_0 then
            v231.memoizedState = {
                baseLanes = v14.NoLanes
            };
            l_pushRenderLanes_0(v231, v232);
        elseif v14.includesSomeLane(v232, v14.OffscreenLane) then
            v231.memoizedState = {
                baseLanes = v14.NoLanes
            };
            local l_v232_0 = v232;
            if v235 ~= nil then
                l_v232_0 = v235.baseLanes;
            end;
            l_pushRenderLanes_0(v231, l_v232_0);
        else
            local v237 = nil;
            v237 = if v235 ~= nil then v14.mergeLanes(v235.baseLanes, v232) else v232;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v14.OffscreenLane);
            end;
            v231.childLanes = v14.laneToLanes(v14.OffscreenLane);
            v231.lanes = v231.childLanes;
            v231.memoizedState = {
                baseLanes = v237
            };
            l_pushRenderLanes_0(v231, v237);
            return nil;
        end;
    else
        local v238 = nil;
        if v235 ~= nil then
            v238 = v14.mergeLanes(v235.baseLanes, v232);
            v231.memoizedState = nil;
        else
            v238 = v232;
        end;
        l_pushRenderLanes_0(v231, v238);
    end;
    if v230 == nil then
        v231.child = l_mountChildFibers_0(v231, nil, l_children_0, v232);
    else
        v231.child = l_reconcileChildFibers_0(v231, v230.child, l_children_0, v232);
    end;
    return v231.child;
end;
updateFragment = function(v240, v241, v242)
    local l_pendingProps_1 = v241.pendingProps;
    if v240 == nil then
        v241.child = l_mountChildFibers_0(v241, nil, l_pendingProps_1, v242);
    else
        v241.child = l_reconcileChildFibers_0(v241, v240.child, l_pendingProps_1, v242);
    end;
    return v241.child;
end;
updateMode = function(v244, v245, v246)
    local l_children_1 = v245.pendingProps.children;
    if v244 == nil then
        v245.child = l_mountChildFibers_0(v245, nil, l_children_1, v246);
    else
        v245.child = l_reconcileChildFibers_0(v245, v244.child, l_children_1, v246);
    end;
    return v245.child;
end;
updateProfiler = function(v248, v249, v250)
    if l_enableProfilerTimer_0 then
        local l_stateNode_0 = v249.stateNode;
        l_stateNode_0.effectDuration = 0;
        l_stateNode_0.passiveEffectDuration = 0;
    end;
    local l_children_2 = v249.pendingProps.children;
    if v248 == nil then
        v249.child = l_mountChildFibers_0(v249, nil, l_children_2, v250);
    else
        v249.child = l_reconcileChildFibers_0(v249, v248.child, l_children_2, v250);
    end;
    return v249.child;
end;
local function _(v253, v254)
    local l_ref_1 = v254.ref;
    if not (not (v253 == nil) or l_ref_1 == nil) or v253 ~= nil and v253.ref ~= l_ref_1 then
        v254.flags = bit32.bor(v254.flags, l_Ref_0);
    end;
end;
v169 = function(v257, v258, v259, v260, v261)
    if (not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and type(v259) ~= "function") and v258.type ~= v258.elementType then
        local v262 = nil;
        local v263 = nil;
        if type(v259) == "table" then
            v262 = v259.propTypes;
            v263 = v259.validateProps;
        end;
        if not (not v262 and not v263) then
            l_checkPropTypes_0(v262, v263, v260, "prop", l_getComponentName_0(v259));
        end;
    end;
    local v264 = nil;
    if not l_disableLegacyContext_0 then
        v264 = l_getMaskedContext_0(v258, (l_getUnmaskedContext_0(v258, v259, true)));
    end;
    local v265 = nil;
    l_prepareToReadContext_0(v258, v261, v167.markWorkInProgressReceivedUpdate);
    if not l___DEV___0 then
        v265 = v117(v257, v258, v259, v260, v264, v261);
    else
        l_ReactCurrentOwner_0.current = v258;
        l_setIsRendering_0(true);
        v265 = v117(v257, v258, v259, v260, v264, v261);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v258.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v266, v267 = xpcall(v117, l_describeError_0, v257, v258, v259, v260, v264, v261);
            l_reenableLogs_0();
            if not v266 then
                error(v267);
            else
                v265 = v267;
            end;
        end;
        l_setIsRendering_0(false);
    end;
    if not (v257 ~= nil) or v170 then
        v258.flags = bit32.bor(v258.flags, l_PerformedWork_0);
        local l_v265_0 = v265;
        if v257 == nil then
            v258.child = l_mountChildFibers_0(v258, nil, l_v265_0, v261);
        else
            v258.child = l_reconcileChildFibers_0(v258, v257.child, l_v265_0, v261);
        end;
        return v258.child;
    else
        v119(v257, v258, v261);
        return v168(v257, v258, v261);
    end;
end;
local function v281(v269, v270, v271, v272, v273)
    if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v270.type ~= v270.elementType then
        local l_propTypes_1 = v271.propTypes;
        local l_validateProps_1 = v271.validateProps;
        if not (not l_propTypes_1 and not l_validateProps_1) then
            l_checkPropTypes_0(l_propTypes_1, l_validateProps_1, v272, "prop", l_getComponentName_0(v271));
        end;
    end;
    local v276 = nil;
    if not l_isContextProvider_0(v271) then
        v276 = false;
    else
        v276 = true;
        l_pushContextProvider_0(v270);
    end;
    l_prepareToReadContext_0(v270, v273, v167.markWorkInProgressReceivedUpdate);
    local l_stateNode_1 = v270.stateNode;
    local v278 = nil;
    if l_stateNode_1 == nil then
        if v269 ~= nil then
            v269.alternate = nil;
            v270.alternate = nil;
            v270.flags = bit32.bor(v270.flags, l_Placement_0);
        end;
        l_constructClassInstance_0(v270, v271, v272);
        l_mountClassInstance_0(v270, v271, v272, v273);
        v278 = true;
    else
        v278 = if v269 == nil then l_resumeMountClassInstance_0(v270, v271, v272, v273) else l_updateClassInstance_0(v269, v270, v271, v272, v273);
    end;
    local v279 = finishClassComponent(v269, v270, v271, v278, v276, v273);
    if l___DEV___0 then
        local l_stateNode_2 = v270.stateNode;
        if v278 and l_stateNode_2.props ~= v272 then
            if not v167.didWarnAboutReassigningProps then
                l_console_0.error("It looks like %s is reassigning its own `this.props` while rendering. " .. "This is not supported and can lead to confusing bugs.", l_getComponentName_0(v270.type) or "a component");
            end;
            v167.didWarnAboutReassigningProps = true;
        end;
    end;
    return v279;
end;
finishClassComponent = function(v282, v283, v284, v285, v286, v287)
    local l_ref_2 = v283.ref;
    if not (not (v282 == nil) or l_ref_2 == nil) or v282 ~= nil and v282.ref ~= l_ref_2 then
        v283.flags = bit32.bor(v283.flags, l_Ref_0);
    end;
    l_ref_2 = bit32.band(v283.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if v285 or l_ref_2 then
        local l_stateNode_3 = v283.stateNode;
        l_ReactCurrentOwner_0.current = v283;
        local v290 = nil;
        if l_ref_2 and (not (v284.getDerivedStateFromError ~= nil) or type(v284.getDerivedStateFromError) ~= "function") then
            v290 = nil;
            if l_enableProfilerTimer_0 then
                l_stopProfilerTimerIfRunning_0(v283);
            end;
        elseif not l___DEV___0 then
            v290 = l_stateNode_3:render();
        else
            l_setIsRendering_0(true);
            v290 = l_stateNode_3:render();
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v283.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local v291, v292 = xpcall(l_stateNode_3.render, l_describeError_0, l_stateNode_3);
                l_reenableLogs_0();
                if not v291 then
                    error(v292);
                end;
            end;
            l_setIsRendering_0(false);
        end;
        v283.flags = bit32.bor(v283.flags, l_PerformedWork_0);
        if not (v282 ~= nil) or not l_ref_2 then
            local l_v290_0 = v290;
            if v282 == nil then
                v283.child = l_mountChildFibers_0(v283, nil, l_v290_0, v287);
            else
                v283.child = l_reconcileChildFibers_0(v283, v282.child, l_v290_0, v287);
            end;
        else
            local l_v290_1 = v290;
            v283.child = l_reconcileChildFibers_0(v283, v282.child, nil, v287);
            v283.child = l_reconcileChildFibers_0(v283, nil, l_v290_1, v287);
        end;
        v283.memoizedState = l_stateNode_3.state;
        if v286 then
            l_invalidateContextProvider_0(v283, v284, true);
        end;
        return v283.child;
    else
        if v286 then
            l_invalidateContextProvider_0(v283, v284, false);
        end;
        return v168(v282, v283, v287);
    end;
end;
local function _(v295)
    local l_stateNode_4 = v295.stateNode;
    if not l_stateNode_4.pendingContext then
        if l_stateNode_4.context then
            l_pushTopLevelContextObject_0(v295, l_stateNode_4.context, false);
        end;
    else
        l_pushTopLevelContextObject_0(v295, l_stateNode_4.pendingContext, l_stateNode_4.pendingContext ~= l_stateNode_4.context);
    end;
    l_pushHostContainer_0(v295, l_stateNode_4.containerInfo);
end;
local function v311(v298, v299, v300)
    local l_stateNode_5 = v299.stateNode;
    if not l_stateNode_5.pendingContext then
        if l_stateNode_5.context then
            l_pushTopLevelContextObject_0(v299, l_stateNode_5.context, false);
        end;
    else
        l_pushTopLevelContextObject_0(v299, l_stateNode_5.pendingContext, l_stateNode_5.pendingContext ~= l_stateNode_5.context);
    end;
    l_pushHostContainer_0(v299, l_stateNode_5.containerInfo);
    l_stateNode_5 = v299.updateQueue;
    local l_l_invariant_0_0 = l_invariant_0;
    local v303 = false;
    if v298 ~= nil then
        v303 = l_stateNode_5 ~= nil;
    end;
    l_l_invariant_0_0(v303, "If the root does not have an updateQueue, we should have already " .. "bailed out. This error is likely caused by a bug in React. Please " .. "file an issue.");
    l_l_invariant_0_0 = v299.pendingProps;
    v303 = v299.memoizedState;
    local v304 = nil;
    if v303 ~= nil then
        v304 = v303.element;
    end;
    l_cloneUpdateQueue_0(v298, v299);
    l_processUpdateQueue_0(v299, l_l_invariant_0_0, nil, v300);
    local l_element_0 = v299.memoizedState.element;
    if l_element_0 == v304 then
        l_resetHydrationState_0();
        return v168(v298, v299, v300);
    else
        local l_stateNode_6 = v299.stateNode;
        if not l_stateNode_6.hydrate or not l_enterHydrationState_0(v299) then
            if v298 == nil then
                v299.child = l_mountChildFibers_0(v299, nil, l_element_0, v300);
            else
                v299.child = l_reconcileChildFibers_0(v299, v298.child, l_element_0, v300);
            end;
            l_resetHydrationState_0();
        else
            if l_supportsHydration_0 then
                local l_mutableSourceEagerHydrationData_0 = l_stateNode_6.mutableSourceEagerHydrationData;
                if l_mutableSourceEagerHydrationData_0 ~= nil then
                    for v308 = 1, #l_mutableSourceEagerHydrationData_0, 2 do
                        l_setWorkInProgressVersion_0(l_mutableSourceEagerHydrationData_0[v308], l_mutableSourceEagerHydrationData_0[v308 + 1]);
                    end;
                end;
            end;
            local v309 = l_mountChildFibers_0(v299, nil, l_element_0, v300);
            v299.child = v309;
            local l_v309_0 = v309;
            while l_v309_0 do
                l_v309_0.flags = bit32.bor(bit32.band(l_v309_0.flags, (bit32.bnot(l_Placement_0))), l_Hydrating_0);
                l_v309_0 = l_v309_0.sibling;
            end;
        end;
        return v299.child;
    end;
end;
local function v320(v312, v313, v314)
    l_pushHostContext_0(v313);
    if v312 == nil then
        l_tryToClaimNextHydratableInstance_0(v313);
    end;
    local l_type_2 = v313.type;
    local l_pendingProps_2 = v313.pendingProps;
    local v317 = nil;
    if v312 ~= nil then
        v317 = v312.memoizedProps;
    end;
    local l_children_3 = l_pendingProps_2.children;
    if not l_shouldSetTextContent_0(l_type_2, l_pendingProps_2) then
        if not (not (v317 ~= nil) or not l_shouldSetTextContent_0(l_type_2, v317)) then
            v313.flags = bit32.bor(v313.flags, l_ContentReset_0);
        end;
    else
        l_children_3 = nil;
    end;
    v313.flags = bit32.bor(v313.flags, l_PerformedWork_0);
    local l_ref_3 = v313.ref;
    if not (not (v312 == nil) or l_ref_3 == nil) or v312 ~= nil and v312.ref ~= l_ref_3 then
        v313.flags = bit32.bor(v313.flags, l_Ref_0);
    end;
    l_ref_3 = l_children_3;
    if v312 == nil then
        v313.child = l_mountChildFibers_0(v313, nil, l_ref_3, v314);
    else
        v313.child = l_reconcileChildFibers_0(v313, v312.child, l_ref_3, v314);
    end;
    return v313.child;
end;
local function _(v321, v322)
    if v321 == nil then
        l_tryToClaimNextHydratableInstance_0(v322);
    end;
    return nil;
end;
local function v337(v324, v325, v326, v327, v328)
    if v324 ~= nil then
        v324.alternate = nil;
        v325.alternate = nil;
        v325.flags = bit32.bor(v325.flags, l_Placement_0);
    end;
    local l_pendingProps_3 = v325.pendingProps;
    local v330 = v326._init(v326._payload);
    v325.type = v330;
    v325.tag = l_resolveLazyComponentTag_0(v330);
    local l_tag_0 = v325.tag;
    local v332 = l_resolveDefaultProps_0(v330, l_pendingProps_3);
    local _ = nil;
    if l_tag_0 == l_FunctionComponent_0 then
        if l___DEV___0 then
            validateFunctionComponentInDev(v325, v330);
            v330 = l_resolveFunctionForHotReloading_0(v330);
            v325.type = v330;
        end;
        return (v169(nil, v325, v330, v332, v328));
    elseif l_tag_0 == l_ClassComponent_0 then
        if l___DEV___0 then
            v330 = l_resolveClassForHotReloading_0(v330);
            v325.type = v330;
        end;
        return (v281(nil, v325, v330, v332, v328));
    elseif l_tag_0 == l_ForwardRef_0 then
        if l___DEV___0 then
            v330 = l_resolveForwardRefForHotReloading_0(v330);
            v325.type = v330;
        end;
        return (v196(nil, v325, v330, v332, v328));
    elseif l_tag_0 == l_MemoComponent_0 then
        if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v325.type ~= v325.elementType then
            local l_propTypes_2 = v330.propTypes;
            local l_validateProps_2 = v330.validateProps;
            if not (not l_propTypes_2 and not l_validateProps_2) then
                l_checkPropTypes_0(l_propTypes_2, l_validateProps_2, v332, "prop", l_getComponentName_0(v330));
            end;
        end;
        return (v215(nil, v325, v330, l_resolveDefaultProps_0(v330.type, v332), v327, v328));
    else
        local v336 = "";
        if l___DEV___0 then
            if (v330 ~= nil and type(v330) == "table") and v330["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                v336 = " Did you wrap a component in React.lazy() more than once?";
            elseif type(v330) == "table" and v330["$$typeof"] == nil then
                v336 = "\n" .. l_inspect_0(v330);
            end;
        end;
        l_invariant_0(false, "Element type is invalid. Received a promise that resolves to: %s. " .. "Lazy element type must resolve to a class or function.%s", tostring(v330), v336);
        return nil;
    end;
end;
mountIncompleteClassComponent = function(v338, v339, v340, v341, v342)
    if v338 ~= nil then
        v338.alternate = nil;
        v339.alternate = nil;
        v339.flags = bit32.bor(v339.flags, l_Placement_0);
    end;
    v339.tag = l_ClassComponent_0;
    local v343 = nil;
    if not l_isContextProvider_0(v340) then
        v343 = false;
    else
        v343 = true;
        l_pushContextProvider_0(v339);
    end;
    l_prepareToReadContext_0(v339, v342, v167.markWorkInProgressReceivedUpdate);
    l_constructClassInstance_0(v339, v340, v341);
    l_mountClassInstance_0(v339, v340, v341, v342);
    return finishClassComponent(nil, v339, v340, true, v343, v342);
end;
local function v359(v344, v345, v346, v347)
    if v344 ~= nil then
        v344.alternate = nil;
        v345.alternate = nil;
        v345.flags = bit32.bor(v345.flags, l_Placement_0);
    end;
    local l_pendingProps_4 = v345.pendingProps;
    local v349 = nil;
    if not l_disableLegacyContext_0 then
        v349 = l_getMaskedContext_0(v345, (l_getUnmaskedContext_0(v345, v346, false)));
    end;
    l_prepareToReadContext_0(v345, v347, v167.markWorkInProgressReceivedUpdate);
    local v350 = nil;
    if not l___DEV___0 then
        v350 = v117(nil, v345, v346, l_pendingProps_4, v349, v347);
    else
        if type(v346) == "table" and type(v346.render) == "function" then
            local v351 = l_getComponentName_0(v346) or "Unknown";
            if not v171.didWarnAboutBadClass[v351] then
                l_console_0.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. " .. "This is likely to cause errors. Change %s to extend React.Component instead.", v351, v351);
                v171.didWarnAboutBadClass[v351] = true;
            end;
        end;
        if bit32.band(v345.mode, l_StrictMode_0) ~= 0 then
            v67.recordLegacyContextWarning(v345);
        end;
        l_setIsRendering_0(true);
        l_ReactCurrentOwner_0.current = v345;
        v350 = v117(nil, v345, v346, l_pendingProps_4, v349, v347);
        l_setIsRendering_0(false);
    end;
    v345.flags = bit32.bor(v345.flags, l_PerformedWork_0);
    local v352 = type(v350);
    if (((l___DEV___0 and v350 ~= nil) and v352 == "table") and type(v350.render) == "function") and v350["$$typeof"] == nil then
        local v353 = l_getComponentName_0(v346) or "Unknown";
        if not v171.didWarnAboutModulePatternComponent[v353] then
            l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. ", v353, v353);
            v171.didWarnAboutModulePatternComponent[v353] = true;
        end;
    end;
    if (((not l_disableModulePatternComponents_0 and v350 ~= nil) and v352 == "table") and type(v350.render) == "function") and v350["$$typeof"] == nil then
        if l___DEV___0 then
            local v354 = l_getComponentName_0(v346) or "Unknown";
            if not v171.didWarnAboutModulePatternComponent[v354] then
                l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v354, v354);
                v171.didWarnAboutModulePatternComponent[v354] = true;
            end;
        end;
        v345.tag = l_ClassComponent_0;
        v345.memoizedState = nil;
        v345.updateQueue = nil;
        local v355 = false;
        if not l_isContextProvider_0(v346) then
            v355 = false;
        else
            v355 = true;
            l_pushContextProvider_0(v345);
        end;
        v345.memoizedState = v350.state;
        l_initializeUpdateQueue_0(v345);
        local v356 = nil;
        if type(v346) ~= "function" then
            v356 = v346.getDerivedStateFromProps;
        end;
        if v356 ~= nil and type(v356) == "function" then
            l_applyDerivedStateFromProps_0(v345, v346, v356, l_pendingProps_4);
        end;
        l_adoptClassInstance_0(v345, v350);
        l_mountClassInstance_0(v345, v346, l_pendingProps_4, v347);
        return finishClassComponent(nil, v345, v346, true, v355, v347);
    else
        v345.tag = l_FunctionComponent_0;
        if l___DEV___0 then
            if not (not l_disableLegacyContext_0 or not v346.contextTypes) then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with React.useContext() instead.", l_getComponentName_0(v346) or "Unknown");
            end;
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v345.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local v357, v358 = xpcall(v117, l_describeError_0, nil, v345, v346, l_pendingProps_4, v349, v347);
                l_reenableLogs_0();
                if not v357 then
                    error(v358);
                else
                    v350 = v358;
                end;
            end;
        end;
        v345.child = l_mountChildFibers_0(v345, nil, v350, v347);
        if l___DEV___0 then
            validateFunctionComponentInDev(v345, v346);
        end;
        return v345.child;
    end;
end;
validateFunctionComponentInDev = function(v360, v361)
    if l___DEV___0 then
        if v360.ref ~= nil then
            local v362 = "";
            local v363 = l_getCurrentFiberOwnerNameInDevOrNull_0();
            if v363 then
                v362 = v362 .. "\n\nCheck the render method of `" .. v363 .. "`.";
            end;
            local v364 = (v363 or v360._debugID) or "";
            local l__debugSource_0 = v360._debugSource;
            if l__debugSource_0 then
                v364 = l__debugSource_0.fileName .. ":" .. l__debugSource_0.lineNumber;
            end;
            if not v171.didWarnAboutFunctionRefs[v364] then
                v171.didWarnAboutFunctionRefs[v364] = true;
                l_console_0.error("Function components cannot be given refs. " .. "Attempts to access this ref will fail. " .. "Did you mean to use React.forwardRef()?%s", v362);
            end;
        end;
        if (l_warnAboutDefaultPropsOnFunctionComponents_0 and type(v361) ~= "function") and v361.defaultProps ~= nil then
            local v366 = l_getComponentName_0(v361) or "Unknown";
            if not v171.didWarnAboutDefaultPropsOnFunctionComponent[v366] then
                l_console_0.error("%s: Support for defaultProps will be removed from function components " .. "in a future major release.", v366);
                v171.didWarnAboutDefaultPropsOnFunctionComponent[v366] = true;
            end;
        end;
        if (type(v361) ~= "function" and v361.getDerivedStateFromProps ~= nil) and type(v361.getDerivedStateFromProps) == "function" then
            local v367 = l_getComponentName_0(v361) or "Unknown";
            if not v171.didWarnAboutGetDerivedStateOnFunctionComponent[v367] then
                l_console_0.error("%s: Function components do not support getDerivedStateFromProps.", v367);
                v171.didWarnAboutGetDerivedStateOnFunctionComponent[v367] = true;
            end;
        end;
        if (type(v361) ~= "function" and v361.contextType ~= nil) and type(v361.contextType) == "table" then
            local v368 = l_getComponentName_0(v361) or "Unknown";
            if not v171.didWarnAboutContextTypeOnFunctionComponent[v368] then
                l_console_0.error("%s: Function components do not support contextType.", v368);
                v171.didWarnAboutContextTypeOnFunctionComponent[v368] = true;
            end;
        end;
    end;
end;
local v369 = {
    dehydrated = nil, 
    retryLane = v14.NoLane
};
local function _(v370)
    return {
        baseLanes = v370
    };
end;
local function _(v372, v373)
    return {
        baseLanes = v14.mergeLanes(v372.baseLanes, v373)
    };
end;
local _ = function(v375, v376, _, _)
    if v376 ~= nil and v376.memoizedState == nil then
        return false;
    else
        return l_hasSuspenseContext_0(v375, l_ForceSuspenseFallback_0);
    end;
end;
local function _(v380, v381)
    return v14.removeLanes(v380.childLanes, v381);
end;
local v383 = nil;
local v384 = nil;
local v385 = nil;
local v386 = nil;
local v387 = nil;
local function v412(v388, v389, v390)
    local l_pendingProps_5 = v389.pendingProps;
    if l___DEV___0 then
        if not v111.shouldSuspendRef then
            v111.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
        end;
        if v111.shouldSuspendRef(v389) then
            v389.flags = bit32.bor(v389.flags, l_DidCapture_0);
        end;
    end;
    local l_current_0 = l_suspenseStackCursor_0.current;
    local v393 = false;
    local v394 = bit32.band(v389.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v394 and not ((not (v388 ~= nil) or not (v388.memoizedState == nil)) and l_hasSuspenseContext_0(l_current_0, l_ForceSuspenseFallback_0)) then
        if ((not (v388 ~= nil) or v388.memoizedState ~= nil) and l_pendingProps_5.fallback ~= nil) and l_pendingProps_5.unstable_avoidThisFallback ~= true then
            l_current_0 = l_addSubtreeSuspenseContext_0(l_current_0, l_InvisibleParentSuspenseContext_0);
        end;
    else
        v393 = true;
        v389.flags = bit32.band(v389.flags, (bit32.bnot(l_DidCapture_0)));
    end;
    l_pushSuspenseContext_0(v389, (l_setDefaultShallowSuspenseContext_0(l_current_0)));
    if v388 == nil then
        if l_pendingProps_5.fallback ~= nil then
            l_tryToClaimNextHydratableInstance_0(v389);
            if l_enableSuspenseServerRenderer_0 then
                local l_memoizedState_0 = v389.memoizedState;
                if l_memoizedState_0 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_0.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        return v384(v389, l_dehydrated_0, v390);
                    end;
                end;
            end;
        end;
        local l_children_4 = l_pendingProps_5.children;
        local l_fallback_0 = l_pendingProps_5.fallback;
        if not v393 then
            if l_pendingProps_5.unstable_expectedLoadTime ~= nil and type(l_pendingProps_5.unstable_expectedLoadTime) == "number" then
                local v399 = mountSuspenseFallbackChildren(v389, l_children_4, l_fallback_0, v390);
                v389.child.memoizedState = {
                    baseLanes = v390
                };
                v389.memoizedState = v369;
                v389.lanes = v14.SomeRetryLane;
                if l_enableSchedulerTracing_0 then
                    l_markSpawnedWork_0(v14.SomeRetryLane);
                end;
                return v399;
            else
                return v385(v389, l_children_4, v390);
            end;
        else
            local v400 = mountSuspenseFallbackChildren(v389, l_children_4, l_fallback_0, v390);
            v389.child.memoizedState = {
                baseLanes = v390
            };
            v389.memoizedState = v369;
            return v400;
        end;
    else
        local l_memoizedState_1 = v388.memoizedState;
        if l_memoizedState_1 ~= nil then
            if l_enableSuspenseServerRenderer_0 then
                local l_dehydrated_1 = l_memoizedState_1.dehydrated;
                if l_dehydrated_1 ~= nil then
                    if v394 then
                        if v389.memoizedState ~= nil then
                            v389.child = v388.child;
                            v389.flags = bit32.bor(v389.flags, l_DidCapture_0);
                            return nil;
                        else
                            local v403 = mountSuspenseFallbackAfterRetryWithoutHydrating(v388, v389, l_pendingProps_5.children, l_pendingProps_5.fallback, v390);
                            v389.child.memoizedState = {
                                baseLanes = v390
                            };
                            v389.memoizedState = v369;
                            return v403;
                        end;
                    else
                        return v387(v388, v389, l_dehydrated_1, l_memoizedState_1, v390);
                    end;
                end;
            end;
            if not v393 then
                local v404 = v383(v388, v389, l_pendingProps_5.children, v390);
                v389.memoizedState = nil;
                return v404;
            else
                local v405 = v386(v388, v389, l_pendingProps_5.children, l_pendingProps_5.fallback, v390);
                local l_child_1 = v389.child;
                local l_memoizedState_2 = v388.child.memoizedState;
                if l_memoizedState_2 == nil then
                    l_child_1.memoizedState = {
                        baseLanes = v390
                    };
                else
                    l_child_1.memoizedState = {
                        baseLanes = v14.mergeLanes(l_memoizedState_2.baseLanes, v390)
                    };
                end;
                l_child_1.childLanes = v14.removeLanes(v388.childLanes, v390);
                v389.memoizedState = v369;
                return v405;
            end;
        elseif not v393 then
            local v408 = v383(v388, v389, l_pendingProps_5.children, v390);
            v389.memoizedState = nil;
            return v408;
        else
            local v409 = v386(v388, v389, l_pendingProps_5.children, l_pendingProps_5.fallback, v390);
            local l_child_2 = v389.child;
            local l_memoizedState_3 = v388.child.memoizedState;
            if l_memoizedState_3 == nil then
                l_child_2.memoizedState = {
                    baseLanes = v390
                };
            else
                l_child_2.memoizedState = {
                    baseLanes = v14.mergeLanes(l_memoizedState_3.baseLanes, v390)
                };
            end;
            l_child_2.childLanes = v14.removeLanes(v388.childLanes, v390);
            v389.memoizedState = v369;
            return v409;
        end;
    end;
end;
v385 = function(v413, v414, v415)
    local v416 = l_createFiberFromOffscreen_0({
        mode = "visible", 
        children = v414
    }, v413.mode, v415, nil);
    v416.return_ = v413;
    v413.child = v416;
    return v416;
end;
mountSuspenseFallbackChildren = function(v417, v418, v419, v420)
    local l_mode_0 = v417.mode;
    local l_child_3 = v417.child;
    local v423 = {
        mode = "hidden", 
        children = v418
    };
    local v424 = nil;
    local v425 = nil;
    if bit32.band(l_mode_0, l_BlockingMode_0) == l_NoMode_0 and l_child_3 ~= nil then
        v424 = l_child_3;
        v424.childLanes = v14.NoLanes;
        v424.pendingProps = v423;
        if l_enableProfilerTimer_0 and bit32.band(v417.mode, l_ProfileMode_0) ~= 0 then
            v424.actualDuration = 0;
            v424.actualStartTime = -1;
            v424.selfBaseDuration = 0;
            v424.treeBaseDuration = 0;
        end;
        v425 = l_createFiberFromFragment_0(v419, l_mode_0, v420, nil);
    else
        v424 = l_createFiberFromOffscreen_0(v423, l_mode_0, v14.NoLanes, nil);
        v425 = l_createFiberFromFragment_0(v419, l_mode_0, v420, nil);
    end;
    v424.return_ = v417;
    v425.return_ = v417;
    v424.sibling = v425;
    v417.child = v424;
    return v425;
end;
local function _(v426, v427)
    return l_createWorkInProgress_0(v426, v427);
end;
v383 = function(v429, v430, v431, v432)
    local l_child_4 = v429.child;
    local l_sibling_0 = l_child_4.sibling;
    local v435 = l_createWorkInProgress_0(l_child_4, {
        mode = "visible", 
        children = v431
    });
    if bit32.band(v430.mode, l_BlockingMode_0) == l_NoMode_0 then
        v435.lanes = v432;
    end;
    v435.return_ = v430;
    v435.sibling = nil;
    if l_sibling_0 ~= nil then
        local l_deletions_0 = v430.deletions;
        if l_deletions_0 == nil then
            v430.deletions = {
                l_sibling_0
            };
            v430.flags = bit32.bor(v430.flags, l_Deletion_0);
        else
            table.insert(l_deletions_0, l_sibling_0);
        end;
    end;
    v430.child = v435;
    return v435;
end;
v386 = function(v437, v438, v439, v440, v441)
    local l_mode_1 = v438.mode;
    local l_child_5 = v437.child;
    local l_sibling_1 = l_child_5.sibling;
    local v445 = {
        mode = "hidden", 
        children = v439
    };
    local v446 = nil;
    if bit32.band(l_mode_1, l_BlockingMode_0) == l_NoMode_0 and v438.child ~= l_child_5 then
        v446 = v438.child;
        v446.childLanes = v14.NoLanes;
        v446.pendingProps = v445;
        if l_enableProfilerTimer_0 and bit32.band(v438.mode, l_ProfileMode_0) ~= 0 then
            v446.actualDuration = 0;
            v446.actualStartTime = -1;
            v446.selfBaseDuration = l_child_5.selfBaseDuration;
            v446.treeBaseDuration = l_child_5.treeBaseDuration;
        end;
        v438.deletions = nil;
    else
        v446 = l_createWorkInProgress_0(l_child_5, v445);
        v446.subtreeFlags = bit32.band(l_child_5.subtreeFlags, l_StaticMask_0);
    end;
    local v447 = nil;
    if l_sibling_1 ~= nil then
        v447 = l_createWorkInProgress_0(l_sibling_1, v440);
    else
        v447 = l_createFiberFromFragment_0(v440, l_mode_1, v441, nil);
        v447.flags = bit32.bor(v447.flags, l_Placement_0);
    end;
    v447.return_ = v438;
    v446.return_ = v438;
    v446.sibling = v447;
    v438.child = v446;
    return v447;
end;
local function _(v448, v449, v450)
    l_reconcileChildFibers_0(v449, v448.child, nil, v450);
    local v451 = v385(v449, v449.pendingProps.children, v450);
    v451.flags = bit32.bor(v451.flags, l_Placement_0);
    v449.memoizedState = nil;
    return v451;
end;
mountSuspenseFallbackAfterRetryWithoutHydrating = function(v453, v454, v455, v456, v457)
    local l_mode_2 = v454.mode;
    local v459 = l_createFiberFromOffscreen_0(v455, l_mode_2, v14.NoLanes, nil);
    local v460 = l_createFiberFromFragment_0(v456, l_mode_2, v457, nil);
    v460.flags = bit32.bor(v460.flags, l_Placement_0);
    v459.return_ = v454;
    v460.return_ = v454;
    v459.sibling = v460;
    v454.child = v459;
    if bit32.band(v454.mode, l_BlockingMode_0) ~= l_NoMode_0 then
        l_reconcileChildFibers_0(v454, v453.child, nil, v457);
    end;
    return v460;
end;
v384 = function(v461, v462, _)
    if bit32.band(v461.mode, l_BlockingMode_0) == l_NoMode_0 then
        if l___DEV___0 then
            l_console_0.error("Cannot hydrate Suspense in legacy mode. Switch from" .. "ReactDOM.hydrate(element, container) to " .. "ReactDOM.createBlockingRoot(container, { hydrate: true })" .. ".render(element) or remove the Suspense components" .. "the server rendered components.");
        end;
        v461.lanes = v14.laneToLanes(v14.SyncLane);
    elseif not l_isSuspenseInstanceFallback_0(v462) then
        v461.lanes = v14.laneToLanes(v14.OffscreenLane);
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v14.OffscreenLane);
        end;
    else
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v14.DefaultHydrationLane);
        end;
        v461.lanes = v14.laneToLanes(v14.DefaultHydrationLane);
    end;
    return nil;
end;
v387 = function(v464, v465, v466, v467, v468)
    l_warnIfHydrating_0();
    if bit32.band(l_getExecutionContext_0(), l_RetryAfterError_0) ~= l_NoContext_0 then
        l_reconcileChildFibers_0(v465, v464.child, nil, v468);
        local v469 = v385(v465, v465.pendingProps.children, v468);
        v469.flags = bit32.bor(v469.flags, l_Placement_0);
        v465.memoizedState = nil;
        return v469;
    elseif bit32.band(v465.mode, l_BlockingMode_0) == l_NoMode_0 then
        l_reconcileChildFibers_0(v465, v464.child, nil, v468);
        local v470 = v385(v465, v465.pendingProps.children, v468);
        v470.flags = bit32.bor(v470.flags, l_Placement_0);
        v465.memoizedState = nil;
        return v470;
    elseif not l_isSuspenseInstanceFallback_0(v466) then
        local v471 = v14.includesSomeLane(v468, v464.childLanes);
        if not v170 and not v471 then
            if not l_isSuspenseInstancePending_0(v466) then
                l_reenterHydrationStateFromDehydratedSuspenseInstance_0(v465, v466);
                local v472 = v385(v465, v465.pendingProps.children, v468);
                v472.flags = bit32.bor(v472.flags, l_Hydrating_0);
                return v472;
            else
                v465.flags = bit32.bor(v465.flags, l_DidCapture_0);
                v465.child = v464.child;
                local function v473()
                    return l_retryDehydratedSuspenseBoundary_0(v464);
                end;
                if l_enableSchedulerTracing_0 then
                    if v160 == nil then
                        v160 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
                    end;
                    v473 = v160(v473);
                end;
                l_registerSuspenseInstanceRetry_0(v466, v473);
                return nil;
            end;
        else
            local v474 = l_getWorkInProgressRoot_0();
            if v474 ~= nil then
                local v475 = v14.getBumpedLaneForHydration(v474, v468);
                if v475 ~= v14.NoLane and v475 ~= v467.retryLane then
                    v467.retryLane = v475;
                    l_scheduleUpdateOnFiber_0(v464, v475, v14.NoTimestamp);
                end;
            end;
            l_renderDidSuspendDelayIfPossible_0();
            l_reconcileChildFibers_0(v465, v464.child, nil, v468);
            local v476 = v385(v465, v465.pendingProps.children, v468);
            v476.flags = bit32.bor(v476.flags, l_Placement_0);
            v465.memoizedState = nil;
            return v476;
        end;
    else
        l_reconcileChildFibers_0(v465, v464.child, nil, v468);
        local v477 = v385(v465, v465.pendingProps.children, v468);
        v477.flags = bit32.bor(v477.flags, l_Placement_0);
        v465.memoizedState = nil;
        return v477;
    end;
end;
updatePortalComponent = function(v478, v479, v480)
    l_pushHostContainer_0(v479, v479.stateNode.containerInfo);
    local l_pendingProps_6 = v479.pendingProps;
    if v478 == nil then
        v479.child = l_reconcileChildFibers_0(v479, nil, l_pendingProps_6, v480);
    elseif v478 == nil then
        v479.child = l_mountChildFibers_0(v479, nil, l_pendingProps_6, v480);
    else
        v479.child = l_reconcileChildFibers_0(v479, v478.child, l_pendingProps_6, v480);
    end;
    return v479.child;
end;
local v482 = false;
local function v494(v483, v484, v485)
    local l__context_0 = v484.type._context;
    local l_pendingProps_7 = v484.pendingProps;
    local l_memoizedProps_2 = v484.memoizedProps;
    local l_value_0 = l_pendingProps_7.value;
    if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) then
        if not (not (l_Array_0.indexOf(l_Object_0.keys(l_pendingProps_7), "value") < 1) or v482) then
            v482 = true;
            l_console_0.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?");
        end;
        local l_propTypes_3 = v484.type.propTypes;
        local l_validateProps_3 = v484.type.validateProps;
        if not (not l_propTypes_3 and not l_validateProps_3) then
            l_checkPropTypes_0(l_propTypes_3, l_validateProps_3, l_pendingProps_7, "prop", "Context.Provider");
        end;
    end;
    l_pushProvider_0(v484, l_value_0);
    if l_memoizedProps_2 ~= nil then
        local v492 = l_calculateChangedBits_0(l__context_0, l_value_0, l_memoizedProps_2.value);
        if v492 == 0 then
            if not (not (l_memoizedProps_2.children == l_pendingProps_7.children) or l_hasContextChanged_0()) then
                return v168(v483, v484, v485);
            end;
        else
            l_propagateContextChange_0(v484, l__context_0, v492, v485);
        end;
    end;
    local l_children_5 = l_pendingProps_7.children;
    if v483 == nil then
        v484.child = l_mountChildFibers_0(v484, nil, l_children_5, v485);
    else
        v484.child = l_reconcileChildFibers_0(v484, v483.child, l_children_5, v485);
    end;
    return v484.child;
end;
local v495 = {
    usingContextAsConsumer = false, 
    usingLegacyConsumer = false
};
updateContextConsumer = function(v496, v497, v498)
    local l_type_3 = v497.type;
    if l___DEV___0 then
        if l_type_3._context == nil then
            if not (not (l_type_3 ~= l_type_3.Consumer) or v495.usingContextAsConsumer) then
                v495.usingContextAsConsumer = true;
                l_console_0.error("Rendering <Context> directly is not supported and will be removed in " .. "a future major release. Did you mean to render <Context.Consumer> instead?");
            end;
        else
            l_type_3 = l_type_3._context;
        end;
    end;
    local l_pendingProps_8 = v497.pendingProps;
    local v501 = nil;
    if not l_pendingProps_8.render then
        v501 = l_pendingProps_8.children;
    else
        if not ((not l___DEV___0 or not l___COMPAT_WARNINGS___0) or v495.usingLegacyConsumer) then
            v495.usingLegacyConsumer = true;
            l_console_0.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \n" .. "Please provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n" .. "       createElement(ContextConsumer, {render = function(...) end})\n" .. "becomes:\n" .. "       createElement(ContextConsumer, nil, function(...) end)\n" .. "For more info, reference the React documentation here: \n" .. "https://reactjs.org/docs/context.html#contextconsumer");
        end;
        v501 = l_pendingProps_8.render;
    end;
    if l___DEV___0 and type(v501) ~= "function" then
        l_console_0.error("A context consumer was rendered with multiple children, or a child " .. "that isn't a function. A context consumer expects a single child " .. "that is a function. If you did pass a function, make sure there " .. "is no trailing or leading whitespace around it.");
    end;
    l_prepareToReadContext_0(v497, v498, v167.markWorkInProgressReceivedUpdate);
    local v502 = l_readContext_0(l_type_3, l_pendingProps_8.unstable_observedBits);
    local v503 = nil;
    if not l___DEV___0 then
        v503 = v501(v502);
    else
        l_ReactCurrentOwner_0.current = v497;
        l_setIsRendering_0(true);
        v503 = v501(v502);
        l_setIsRendering_0(false);
    end;
    v497.flags = bit32.bor(v497.flags, l_PerformedWork_0);
    local l_v503_0 = v503;
    if v496 == nil then
        v497.child = l_mountChildFibers_0(v497, nil, l_v503_0, v498);
    else
        v497.child = l_reconcileChildFibers_0(v497, v496.child, l_v503_0, v498);
    end;
    return v497.child;
end;
v167.markWorkInProgressReceivedUpdate = function()
    v170 = true;
end;
v168 = function(v505, v506, v507)
    if v505 then
        v506.dependencies = v505.dependencies;
    end;
    if l_enableProfilerTimer_0 then
        l_stopProfilerTimerIfRunning_0(v506);
    end;
    l_markSkippedUpdateLanes_0(v506.lanes);
    if v14.includesSomeLane(v507, v506.childLanes) then
        l_cloneChildFibers_0(v505, v506);
        return v506.child;
    else
        return nil;
    end;
end;
remountFiber = function(v508, v509, v510)
    if not l___DEV___0 then
        error("Did not expect this call in production. " .. "This is a bug in React. Please file an issue.");
        return ;
    else
        local l_return__0 = v509.return_;
        if l_return__0 == nil then
            error("Cannot swap the root fiber.");
        end;
        assert(l_return__0 ~= nil, "returnFiber was nil in remountFiber");
        v508.alternate = nil;
        v509.alternate = nil;
        v510.index = v509.index;
        v510.sibling = v509.sibling;
        v510.return_ = v509.return_;
        v510.ref = v509.ref;
        if v509 == l_return__0.child then
            l_return__0.child = v510;
        else
            local l_child_6 = l_return__0.child;
            if l_child_6 == nil then
                error("Expected parent to have a child.");
            end;
            assert(l_child_6 ~= nil, "prevSibling was nil in remountFiber");
            while l_child_6.sibling ~= v509 do
                l_child_6 = l_child_6.sibling;
                if l_child_6 == nil then
                    error("Expected to find the previous sibling.");
                end;
            end;
            l_child_6.sibling = v510;
        end;
        local l_deletions_1 = l_return__0.deletions;
        if l_deletions_1 == nil then
            l_return__0.deletions = {
                v508
            };
            l_return__0.flags = bit32.bor(l_return__0.flags, l_Deletion_0);
        else
            table.insert(l_deletions_1, v508);
        end;
        v510.flags = bit32.bor(v510.flags, l_Placement_0);
        return v510;
    end;
end;
v167.beginWork = function(v514, v515, v516)
    local l_lanes_0 = v515.lanes;
    if not (not l___DEV___0 or not v515._debugNeedsRemount) and v514 ~= nil then
        return remountFiber(v514, v515, l_createFiberFromTypeAndProps_0(v515.type, v515.key, v515.pendingProps, v515._debugOwner or nil, v515.mode, v515.lanes));
    else
        if v514 ~= nil then
            if not (not (v514.memoizedProps == v515.pendingProps) or l_hasContextChanged_0()) and not (not not l___DEV___0 and v515.type ~= v514.type) then
                if v14.includesSomeLane(v516, l_lanes_0) then
                    if bit32.band(v514.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                        v170 = true;
                    else
                        v170 = false;
                    end;
                else
                    v170 = false;
                    if v515.tag == l_HostRoot_0 then
                        local l_stateNode_7 = v515.stateNode;
                        if not l_stateNode_7.pendingContext then
                            if l_stateNode_7.context then
                                l_pushTopLevelContextObject_0(v515, l_stateNode_7.context, false);
                            end;
                        else
                            l_pushTopLevelContextObject_0(v515, l_stateNode_7.pendingContext, l_stateNode_7.pendingContext ~= l_stateNode_7.context);
                        end;
                        l_pushHostContainer_0(v515, l_stateNode_7.containerInfo);
                        l_resetHydrationState_0();
                    elseif v515.tag == l_HostComponent_0 then
                        l_pushHostContext_0(v515);
                    elseif v515.tag == l_ClassComponent_0 then
                        if l_isContextProvider_0(v515.type) then
                            l_pushContextProvider_0(v515);
                        end;
                    elseif v515.tag == l_HostPortal_0 then
                        l_pushHostContainer_0(v515, v515.stateNode.containerInfo);
                    elseif v515.tag == l_ContextProvider_0 then
                        l_pushProvider_0(v515, v515.memoizedProps.value);
                    elseif v515.tag == l_Profiler_0 then
                        if l_enableProfilerTimer_0 then
                            local l_stateNode_8 = v515.stateNode;
                            l_stateNode_8.effectDuration = 0;
                            l_stateNode_8.passiveEffectDuration = 0;
                        end;
                    elseif v515.tag == l_SuspenseComponent_0 then
                        local l_memoizedState_4 = v515.memoizedState;
                        if l_memoizedState_4 ~= nil then
                            if l_enableSuspenseServerRenderer_0 and l_memoizedState_4.dehydrated ~= nil then
                                l_pushSuspenseContext_0(v515, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                                v515.flags = bit32.bor(v515.flags, l_DidCapture_0);
                                return nil;
                            elseif not v14.includesSomeLane(v516, v515.child.childLanes) then
                                l_pushSuspenseContext_0(v515, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                                local v521 = v168(v514, v515, v516);
                                if v521 ~= nil then
                                    return v521.sibling;
                                else
                                    return nil;
                                end;
                            else
                                return v412(v514, v515, v516);
                            end;
                        else
                            l_pushSuspenseContext_0(v515, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                        end;
                    elseif v515.tag == l_SuspenseListComponent_0 then
                        print("");
                        print("");
                        print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"));
                        error("FIXME (roblox): " .. "beginWork: SuspenseListComponent" .. " is unimplemented", 2);
                    elseif not (v515.tag ~= l_OffscreenComponent_0) or v515.tag == l_LegacyHiddenComponent_0 then
                        v515.lanes = v14.NoLanes;
                        return (v239(v514, v515, v516));
                    end;
                    return v168(v514, v515, v516);
                end;
            else
                v170 = true;
            end;
        else
            v170 = false;
        end;
        v515.lanes = v14.NoLanes;
        if v515.tag == v19.IndeterminateComponent then
            return v359(v514, v515, v515.type, v516);
        elseif v515.tag == l_LazyComponent_0 then
            return (v337(v514, v515, v515.elementType, l_lanes_0, v516));
        elseif v515.tag == l_FunctionComponent_0 then
            local l_type_4 = v515.type;
            local l_pendingProps_9 = v515.pendingProps;
            local _ = nil;
            return v169(v514, v515, l_type_4, if v515.elementType == l_type_4 then l_pendingProps_9 else l_resolveDefaultProps_0(l_type_4, l_pendingProps_9), v516);
        elseif v515.tag == l_ClassComponent_0 then
            local l_type_5 = v515.type;
            local l_pendingProps_10 = v515.pendingProps;
            return (v281(v514, v515, l_type_5, v515.elementType == l_type_5 and l_pendingProps_10 or l_resolveDefaultProps_0(l_type_5, l_pendingProps_10), v516));
        elseif v515.tag == l_HostRoot_0 then
            return v311(v514, v515, v516);
        elseif v515.tag == l_HostComponent_0 then
            return (v320(v514, v515, v516));
        elseif v515.tag == l_HostText_0 then
            if v514 == nil then
                l_tryToClaimNextHydratableInstance_0(v515);
            end;
            return nil;
        elseif v515.tag == l_SuspenseComponent_0 then
            return v412(v514, v515, v516);
        elseif v515.tag == l_HostPortal_0 then
            return updatePortalComponent(v514, v515, v516);
        elseif v515.tag == l_ForwardRef_0 then
            local l_type_6 = v515.type;
            local l_pendingProps_11 = v515.pendingProps;
            local l_l_pendingProps_11_0 = l_pendingProps_11;
            if v515.elementType ~= l_type_6 then
                l_l_pendingProps_11_0 = l_resolveDefaultProps_0(l_type_6, l_pendingProps_11);
            end;
            return v196(v514, v515, l_type_6, l_l_pendingProps_11_0, v516);
        elseif v515.tag == l_Fragment_0 then
            return updateFragment(v514, v515, v516);
        elseif v515.tag == l_Mode_0 then
            return updateMode(v514, v515, v516);
        elseif v515.tag == l_Profiler_0 then
            return updateProfiler(v514, v515, v516);
        elseif v515.tag == l_ContextProvider_0 then
            return v494(v514, v515, v516);
        elseif v515.tag == l_ContextConsumer_0 then
            return updateContextConsumer(v514, v515, v516);
        elseif v515.tag == l_MemoComponent_0 then
            local l_type_7 = v515.type;
            local v531 = l_resolveDefaultProps_0(l_type_7, v515.pendingProps);
            if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v515.type ~= v515.elementType then
                local v532 = nil;
                local v533 = nil;
                if type(l_type_7) == "table" then
                    v532 = l_type_7.propTypes;
                    v533 = l_type_7.validateProps;
                end;
                if not (not v532 and not v533) then
                    l_checkPropTypes_0(v532, v533, v531, "prop", l_getComponentName_0(l_type_7));
                end;
            end;
            return v215(v514, v515, l_type_7, l_resolveDefaultProps_0(l_type_7.type, v531), l_lanes_0, v516);
        elseif v515.tag == l_SimpleMemoComponent_0 then
            return v172(v514, v515, v515.type, v515.pendingProps, l_lanes_0, v516);
        elseif v515.tag == l_IncompleteClassComponent_0 then
            local l_type_8 = v515.type;
            local l_pendingProps_12 = v515.pendingProps;
            return mountIncompleteClassComponent(v514, v515, l_type_8, v515.elementType == l_type_8 and l_pendingProps_12 or l_resolveDefaultProps_0(l_type_8, l_pendingProps_12), v516);
        elseif v515.tag == l_OffscreenComponent_0 then
            return (v239(v514, v515, v516));
        elseif v515.tag == l_LegacyHiddenComponent_0 then
            return (v239(v514, v515, v516));
        else
            l_invariant_0(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in " .. "React. Please file an issue.", (tostring(v515.tag)));
            return nil;
        end;
    end;
end;
return v167;
