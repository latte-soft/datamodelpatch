local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent.ReactRootTags);
local v9 = require(script.Parent.ReactFiberFlags);
local _ = require(script.Parent.ReactFiberHostConfig);
local v11 = require(script.Parent.ReactWorkTags);
local l_FundamentalComponent_0 = v11.FundamentalComponent;
local _ = require(l_Parent_0.Shared);
local v14 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent.ReactFiberTreeReflection);
local l_findCurrentHostFiber_0 = v16.findCurrentHostFiber;
local l_findCurrentHostFiberWithNoPortals_0 = v16.findCurrentHostFiberWithNoPortals;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_HostComponent_0 = v11.HostComponent;
local l_ClassComponent_0 = v11.ClassComponent;
local l_HostRoot_0 = v11.HostRoot;
local l_SuspenseComponent_0 = v11.SuspenseComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getPublicInstance_0 = require(script.Parent.ReactFiberHostConfig).getPublicInstance;
local v30 = require(script.Parent["ReactFiberContext.new"]);
local l_findCurrentUnmaskedContext_0 = v30.findCurrentUnmaskedContext;
local l_processChildContext_0 = v30.processChildContext;
local l_emptyContextObject_0 = v30.emptyContextObject;
local l_isContextProvider_0 = v30.isContextProvider;
local l_createFiberRoot_0 = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot;
local v36 = require(script.Parent["ReactFiberDevToolsHook.new"]);
local l_injectInternals_0 = v36.injectInternals;
local l_onScheduleRoot_0 = v36.onScheduleRoot;
local v39 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_requestEventTime_0 = v39.requestEventTime;
local l_requestUpdateLane_0 = v39.requestUpdateLane;
local l_scheduleUpdateOnFiber_0 = v39.scheduleUpdateOnFiber;
local l_flushRoot_0 = v39.flushRoot;
local l_batchedEventUpdates_0 = v39.batchedEventUpdates;
local l_batchedUpdates_0 = v39.batchedUpdates;
local l_unbatchedUpdates_0 = v39.unbatchedUpdates;
local l_flushSync_0 = v39.flushSync;
local l_flushControlled_0 = v39.flushControlled;
local l_deferredUpdates_0 = v39.deferredUpdates;
local l_discreteUpdates_0 = v39.discreteUpdates;
local l_flushDiscreteUpdates_0 = v39.flushDiscreteUpdates;
local l_flushPassiveEffects_0 = v39.flushPassiveEffects;
local l_warnIfNotScopedWithMatchingAct_0 = v39.warnIfNotScopedWithMatchingAct;
local l_warnIfUnmockedScheduler_0 = v39.warnIfUnmockedScheduler;
local l_IsThisRendererActing_0 = v39.IsThisRendererActing;
local l_act_0 = v39.act;
local v57 = require(script.Parent["ReactUpdateQueue.new"]);
local l_createUpdate_0 = v57.createUpdate;
local l_enqueueUpdate_0 = v57.enqueueUpdate;
local v60 = require(script.Parent.ReactCurrentFiber);
local l_isRendering_0 = v60.isRendering;
local l_resetCurrentFiber_0 = v60.resetCurrentFiber;
local l_setCurrentFiber_0 = v60.setCurrentFiber;
local v64 = require(script.Parent.ReactTypeOfMode);
local l_StrictMode_0 = v64.StrictMode;
local l_SyncLane_0 = v14.SyncLane;
local l_InputDiscreteHydrationLane_0 = v14.InputDiscreteHydrationLane;
local l_SelectiveHydrationLane_0 = v14.SelectiveHydrationLane;
local l_NoTimestamp_0 = v14.NoTimestamp;
local l_getHighestPriorityPendingLanes_0 = v14.getHighestPriorityPendingLanes;
local l_higherPriorityLane_0 = v14.higherPriorityLane;
local l_getCurrentUpdateLanePriority_0 = v14.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v14.setCurrentUpdateLanePriority;
local l_markRenderScheduled_0 = require(script.Parent.SchedulingProfiler).markRenderScheduled;
local v75 = {
    ReactRootTags = v8, 
    ReactWorkTags = v11, 
    ReactTypeOfMode = v64, 
    ReactFiberFlags = v9, 
    getNearestMountedFiber = v16.getNearestMountedFiber, 
    findCurrentFiberUsingSlowPath = v16.findCurrentFiberUsingSlowPath, 
    createPortal = require(script.Parent.ReactPortal).createPortal
};
local v76 = nil;
local v77 = nil;
if l___DEV___0 then
    v76 = false;
    v77 = {};
end;
local function _(v78)
    if v78 then
        local v79 = l_get_0(v78);
        local v80 = l_findCurrentUnmaskedContext_0(v79);
        if v79.tag == l_ClassComponent_0 then
            local l_type_0 = v79.type;
            if l_isContextProvider_0(l_type_0) then
                return l_processChildContext_0(v79, l_type_0, v80);
            end;
        end;
        return v80;
    else
        return l_emptyContextObject_0;
    end;
end;
local function v86(v83)
    local v84 = l_get_0(v83);
    if v84 == nil then
        if typeof(v83.render) == "function" then
            l_invariant_0(false, "Unable to find node on an unmounted component.");
        else
            l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v83)));
        end;
    end;
    local v85 = l_findCurrentHostFiber_0(v84);
    if v85 == nil then
        return nil;
    else
        return v85.stateNode;
    end;
end;
local function v95(v87, v88)
    if not l___DEV___0 then
        return (v86(v87));
    else
        local v89 = l_get_0(v87);
        if v89 == nil then
            if typeof(v87.render) == "function" then
                l_invariant_0(false, "Unable to find node on an unmounted component.");
            else
                l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v87)));
            end;
        end;
        local v90 = l_findCurrentHostFiber_0(v89);
        if v90 == nil then
            return nil;
        else
            if bit32.band(v90.mode, l_StrictMode_0) ~= 0 then
                local v91 = l_getComponentName_0(v89.type) or "Component";
                if not v77[v91] then
                    v77[v91] = true;
                    local l_current_0 = v60.current;
                    local v93, v94 = xpcall(function()
                        l_setCurrentFiber_0(v90);
                        if bit32.band(v89.mode, l_StrictMode_0) ~= 0 then
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which is inside StrictMode. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v88, v88, v91);
                            return ;
                        else
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which renders StrictMode children. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v88, v88, v91);
                            return ;
                        end;
                    end, l_describeError_0);
                    if not l_current_0 then
                        l_resetCurrentFiber_0();
                    else
                        l_setCurrentFiber_0(l_current_0);
                    end;
                    if not v93 then
                        error(v94);
                    end;
                end;
            end;
            return v90.stateNode;
        end;
    end;
end;
v75.createContainer = function(v96, v97, v98, v99)
    return l_createFiberRoot_0(v96, v97, v98, v99);
end;
v75.updateContainer = function(v100, v101, v102, v103)
    if l___DEV___0 then
        l_onScheduleRoot_0(v101, v100);
    end;
    local l_current_1 = v101.current;
    local v105 = l_requestEventTime_0();
    if not (not l___DEV___0 or not _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfUnmockedScheduler_0(l_current_1);
        l_warnIfNotScopedWithMatchingAct_0(l_current_1);
    end;
    local v106 = l_requestUpdateLane_0(l_current_1);
    if l_enableSchedulingProfiler_0 then
        l_markRenderScheduled_0(v106);
    end;
    local v107;
    if v102 then
        local v108 = l_get_0(v102);
        local v109 = l_findCurrentUnmaskedContext_0(v108);
        if v108.tag == l_ClassComponent_0 then
            local l_type_1 = v108.type;
            if l_isContextProvider_0(l_type_1) then
                v107 = l_processChildContext_0(v108, l_type_1, v109);
                goto label0 --[[  true, true  ]];
            end;
        end;
        v107 = v109;
    else
        v107 = l_emptyContextObject_0;
    end;
    ::label0::;
    if v101.context == nil then
        v101.context = v107;
    else
        v101.pendingContext = v107;
    end;
    if not (not (not (not l___DEV___0 or not l_isRendering_0) and v60.current ~= nil) or v76) then
        v76 = true;
        l_console_0.error("Render methods should be a pure function of props and state; " .. "triggering nested component updates from render is not allowed. " .. "If necessary, trigger nested updates in componentDidUpdate.\n\n" .. "Check the render method of %s.", l_getComponentName_0(v60.current.type) or "Unknown");
    end;
    local v111 = l_createUpdate_0(v105, v106);
    if v100 == nil then
        v100 = l_Object_0.None;
    end;
    v111.payload = {
        element = v100
    };
    if v103 ~= nil then
        if l___DEV___0 and typeof(v103) ~= "function" then
            l_console_0.error("render(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", (tostring(v103)));
        end;
        v111.callback = v103;
    end;
    l_enqueueUpdate_0(l_current_1, v111);
    l_scheduleUpdateOnFiber_0(l_current_1, v106, v105);
    return v106;
end;
v75.batchedEventUpdates = l_batchedEventUpdates_0;
v75.batchedUpdates = l_batchedUpdates_0;
v75.unbatchedUpdates = l_unbatchedUpdates_0;
v75.deferredUpdates = l_deferredUpdates_0;
v75.discreteUpdates = l_discreteUpdates_0;
v75.flushDiscreteUpdates = l_flushDiscreteUpdates_0;
v75.flushControlled = l_flushControlled_0;
v75.flushSync = l_flushSync_0;
v75.flushPassiveEffects = l_flushPassiveEffects_0;
v75.IsThisRendererActing = l_IsThisRendererActing_0;
v75.act = l_act_0;
v75.getPublicRootInstance = function(v112)
    local l_current_2 = v112.current;
    if l_current_2.child then
        if l_current_2.child.tag == l_HostComponent_0 then
            return l_getPublicInstance_0(l_current_2.child.stateNode);
        else
            return l_current_2.child.stateNode;
        end;
    else
        return nil;
    end;
end;
local v114 = nil;
v75.attemptSynchronousHydration = function(v115)
    if v115.tag == l_HostRoot_0 then
        local l_stateNode_0 = v115.stateNode;
        if l_stateNode_0.hydrate then
            l_flushRoot_0(l_stateNode_0, (l_getHighestPriorityPendingLanes_0(l_stateNode_0)));
            return ;
        end;
    elseif v115.tag == l_SuspenseComponent_0 then
        local v117 = l_requestEventTime_0();
        l_flushSync_0(function()
            return l_scheduleUpdateOnFiber_0(v115, l_SyncLane_0, v117);
        end);
        v114(v115, l_InputDiscreteHydrationLane_0);
    end;
end;
local function _(v118, v119)
    local l_memoizedState_0 = v118.memoizedState;
    if (l_memoizedState_0 and l_memoizedState_0 ~= nil) and l_memoizedState_0.dehydrated ~= nil then
        l_memoizedState_0.retryLane = l_higherPriorityLane_0(l_memoizedState_0.retryLane, v119);
    end;
end;
v114 = function(v122, v123)
    local l_memoizedState_1 = v122.memoizedState;
    if (l_memoizedState_1 and l_memoizedState_1 ~= nil) and l_memoizedState_1.dehydrated ~= nil then
        l_memoizedState_1.retryLane = l_higherPriorityLane_0(l_memoizedState_1.retryLane, v123);
    end;
    l_memoizedState_1 = v122.alternate;
    if l_memoizedState_1 then
        local l_memoizedState_2 = l_memoizedState_1.memoizedState;
        if (l_memoizedState_2 and l_memoizedState_2 ~= nil) and l_memoizedState_2.dehydrated ~= nil then
            l_memoizedState_2.retryLane = l_higherPriorityLane_0(l_memoizedState_2.retryLane, v123);
        end;
    end;
end;
v75.attemptUserBlockingHydration = function(v126)
    if v126.tag ~= l_SuspenseComponent_0 then
        return ;
    else
        local v127 = l_requestEventTime_0();
        local l_l_InputDiscreteHydrationLane_0_0 = l_InputDiscreteHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v126, l_l_InputDiscreteHydrationLane_0_0, v127);
        v114(v126, l_l_InputDiscreteHydrationLane_0_0);
        return ;
    end;
end;
v75.attemptContinuousHydration = function(v129)
    if v129.tag ~= l_SuspenseComponent_0 then
        return ;
    else
        local v130 = l_requestEventTime_0();
        local l_l_SelectiveHydrationLane_0_0 = l_SelectiveHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v129, l_l_SelectiveHydrationLane_0_0, v130);
        v114(v129, l_l_SelectiveHydrationLane_0_0);
        return ;
    end;
end;
v75.attemptHydrationAtCurrentPriority = function(v132)
    if v132.tag ~= l_SuspenseComponent_0 then
        return ;
    else
        local v133 = l_requestEventTime_0();
        local v134 = l_requestUpdateLane_0(v132);
        l_scheduleUpdateOnFiber_0(v132, v134, v133);
        v114(v132, v134);
        return ;
    end;
end;
v75.runWithPriority = function(v135, v136)
    local v137 = l_getCurrentUpdateLanePriority_0();
    l_setCurrentUpdateLanePriority_0(v135);
    local v138, v139 = xpcall(v136, l_describeError_0);
    l_setCurrentUpdateLanePriority_0(v137);
    if not v138 then
        error(v139);
    end;
    return v139;
end;
v75.getCurrentUpdateLanePriority = l_getCurrentUpdateLanePriority_0;
v75.findHostInstance = v86;
v75.findHostInstanceWithWarning = v95;
v75.findHostInstanceWithNoPortals = function(v140)
    local v141 = l_findCurrentHostFiberWithNoPortals_0(v140);
    if v141 == nil then
        return nil;
    elseif v141.tag == l_FundamentalComponent_0 then
        return v141.stateNode.instance;
    else
        return v141.stateNode;
    end;
end;
local function v143(_)
    return false;
end;
v75.shouldSuspend = function(v144)
    return v143(v144);
end;
local v145 = nil;
local v146 = nil;
local v147 = nil;
local v148 = nil;
local v149 = nil;
local v150 = nil;
local v151 = nil;
local v152 = nil;
if l___DEV___0 then
    local function v153(v154, v155, v156)
        local v157 = v155[v156];
        local v158 = nil;
        v158 = if not l_Array_0.isArray(v154) then table.clone(v154) else l_Array_0.slice(v154);
        if v156 + 1 == #v155 then
            if not l_Array_0.isArray(v158) then
                v158[v157] = nil;
                return v158;
            else
                l_Array_0.splice(v158, v157, 1);
                return v158;
            end;
        else
            v158[v157] = v153(v154[v157], v155, v156 + 1);
            return v158;
        end;
    end;
    local function _(v159, v160)
        return (v153(v159, v160, 0));
    end;
    local function v162(v163, v164, v165, v166)
        local v167 = v164[v166];
        local v168 = nil;
        v168 = if not l_Array_0.isArray(v163) then table.clone(v163) else l_Array_0.slice(v163);
        if v166 + 1 == #v164 then
            v168[v165[v166]] = v168[v167];
            if not l_Array_0.isArray(v168) then
                v168[v167] = nil;
                return v168;
            else
                l_Array_0.splice(v168, v167, 1);
                return v168;
            end;
        else
            v168[v167] = v162(v163[v167], v164, v165, v166 + 1);
            return v168;
        end;
    end;
    local function v173(v169, v170, v171)
        if #v170 ~= #v171 then
            l_console_0.warn("copyWithRename() expects paths of the same length");
            return nil;
        else
            for v172 = 1, #v171 do
                if v170[v172] ~= v171[v172] then
                    l_console_0.warn("copyWithRename() expects paths to be the same except for the deepest key");
                    return nil;
                end;
            end;
            return (v162(v169, v170, v171, 0));
        end;
    end;
    local function v174(v175, v176, v177, v178)
        if #v176 + 1 <= v177 then
            return v178;
        else
            local v179 = v176[v177];
            local v180 = nil;
            v180 = if not l_Array_0.isArray(v175) then table.clone(v175) else l_Array_0.slice(v175);
            v180[v179] = v174(v175[v179], v176, v177 + 2, v178);
            return v180;
        end;
    end;
    local function _(v181, v182, v183)
        return (v174(v181, v182, 1, v183));
    end;
    local function _(v185, v186)
        local l_memoizedState_3 = v185.memoizedState;
        while l_memoizedState_3 ~= nil and v186 > 1 do
            l_memoizedState_3 = l_memoizedState_3.next;
            v186 = v186 - 1;
        end;
        return l_memoizedState_3;
    end;
    v145 = function(v189, v190, v191, v192)
        local l_v190_0 = v190;
        local l_memoizedState_4 = v189.memoizedState;
        while l_memoizedState_4 ~= nil and l_v190_0 > 1 do
            l_memoizedState_4 = l_memoizedState_4.next;
            l_v190_0 = l_v190_0 - 1;
        end;
        local l_l_memoizedState_4_0 = l_memoizedState_4;
        if l_l_memoizedState_4_0 ~= nil then
            l_v190_0 = v174(l_l_memoizedState_4_0.memoizedState, v191, 1, v192);
            l_l_memoizedState_4_0.memoizedState = l_v190_0;
            l_l_memoizedState_4_0.baseState = l_v190_0;
            v189.memoizedProps = table.clone(v189.memoizedProps);
            l_scheduleUpdateOnFiber_0(v189, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v146 = function(v196, v197, v198)
        local l_v197_0 = v197;
        local l_memoizedState_5 = v196.memoizedState;
        while l_memoizedState_5 ~= nil and l_v197_0 > 1 do
            l_memoizedState_5 = l_memoizedState_5.next;
            l_v197_0 = l_v197_0 - 1;
        end;
        local l_l_memoizedState_5_0 = l_memoizedState_5;
        if l_l_memoizedState_5_0 ~= nil then
            l_v197_0 = v153(l_l_memoizedState_5_0.memoizedState, v198, 0);
            l_l_memoizedState_5_0.memoizedState = l_v197_0;
            l_l_memoizedState_5_0.baseState = l_v197_0;
            v196.memoizedProps = table.clone(v196.memoizedProps);
            l_scheduleUpdateOnFiber_0(v196, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v147 = function(v202, v203, v204, v205)
        local l_v203_0 = v203;
        local l_memoizedState_6 = v202.memoizedState;
        while l_memoizedState_6 ~= nil and l_v203_0 > 1 do
            l_memoizedState_6 = l_memoizedState_6.next;
            l_v203_0 = l_v203_0 - 1;
        end;
        local l_l_memoizedState_6_0 = l_memoizedState_6;
        if l_l_memoizedState_6_0 ~= nil then
            l_v203_0 = v173(l_l_memoizedState_6_0.memoizedState, v204, v205);
            l_l_memoizedState_6_0.memoizedState = l_v203_0;
            l_l_memoizedState_6_0.baseState = l_v203_0;
            v202.memoizedProps = table.clone(v202.memoizedProps);
            l_scheduleUpdateOnFiber_0(v202, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v148 = function(v209, v210, v211)
        v209.pendingProps = v174(v209.memoizedProps, v210, 1, v211);
        local l_alternate_0 = v209.alternate;
        if l_alternate_0 then
            l_alternate_0.pendingProps = v209.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v209, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v149 = function(v213, v214)
        v213.pendingProps = v153(v213.memoizedProps, v214, 0);
        local l_alternate_1 = v213.alternate;
        if l_alternate_1 then
            l_alternate_1.pendingProps = v213.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v213, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v150 = function(v216, v217, v218)
        v216.pendingProps = v173(v216.memoizedProps, v217, v218);
        local l_alternate_2 = v216.alternate;
        if l_alternate_2 then
            l_alternate_2.pendingProps = v216.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v216, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v151 = function(v220)
        l_scheduleUpdateOnFiber_0(v220, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v152 = function(v221)
        v143 = v221;
    end;
end;
findHostInstanceByFiber = function(v222)
    local v223 = l_findCurrentHostFiber_0(v222);
    if v223 == nil then
        return nil;
    else
        return v223.stateNode;
    end;
end;
emptyFindFiberByHostInstance = function(_)
    return nil;
end;
getCurrentFiberForDevTools = function()
    return v60.current;
end;
v75.injectIntoDevTools = function(v225)
    local l_findFiberByHostInstance_0 = v225.findFiberByHostInstance;
    local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    local v228 = nil;
    if l___DEV___0 then
        v228 = getCurrentFiberForDevTools;
    end;
    return l_injectInternals_0({
        bundleType = v225.bundleType, 
        version = v225.version, 
        rendererPackageName = v225.rendererPackageName, 
        rendererConfig = v225.rendererConfig, 
        overrideHookState = v145, 
        overrideHookStateDeletePath = v146, 
        overrideHookStateRenamePath = v147, 
        overrideProps = v148, 
        overridePropsDeletePath = v149, 
        overridePropsRenamePath = v150, 
        setSuspenseHandler = v152, 
        scheduleUpdate = v151, 
        currentDispatcherRef = l_ReactCurrentDispatcher_0, 
        findHostInstanceByFiber = findHostInstanceByFiber, 
        findFiberByHostInstance = l_findFiberByHostInstance_0 or emptyFindFiberByHostInstance, 
        getCurrentFiber = v228
    });
end;
return v75;
