local function _(v0)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local l_OffscreenLane_0 = v4.OffscreenLane;
local v6 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_resetWorkInProgressVersions_0 = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions;
local v9 = require(script.Parent.ReactWorkTags);
local l_IndeterminateComponent_0 = v9.IndeterminateComponent;
local l_FunctionComponent_0 = v9.FunctionComponent;
local l_ClassComponent_0 = v9.ClassComponent;
local l_HostRoot_0 = v9.HostRoot;
local l_HostComponent_0 = v9.HostComponent;
local l_HostText_0 = v9.HostText;
local l_HostPortal_0 = v9.HostPortal;
local l_ContextProvider_0 = v9.ContextProvider;
local l_ContextConsumer_0 = v9.ContextConsumer;
local l_ForwardRef_0 = v9.ForwardRef;
local l_Fragment_0 = v9.Fragment;
local l_Mode_0 = v9.Mode;
local l_Profiler_0 = v9.Profiler;
local l_SuspenseComponent_0 = v9.SuspenseComponent;
local l_SuspenseListComponent_0 = v9.SuspenseListComponent;
local l_MemoComponent_0 = v9.MemoComponent;
local l_SimpleMemoComponent_0 = v9.SimpleMemoComponent;
local l_LazyComponent_0 = v9.LazyComponent;
local l_IncompleteClassComponent_0 = v9.IncompleteClassComponent;
local l_FundamentalComponent_0 = v9.FundamentalComponent;
local l_ScopeComponent_0 = v9.ScopeComponent;
local l_Block_0 = v9.Block;
local l_OffscreenComponent_0 = v9.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v9.LegacyHiddenComponent;
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v35 = require(script.Parent.ReactTypeOfMode);
local l_NoMode_0 = v35.NoMode;
local l_ConcurrentMode_0 = v35.ConcurrentMode;
local l_BlockingMode_0 = v35.BlockingMode;
local l_ProfileMode_0 = v35.ProfileMode;
local v40 = require(script.Parent.ReactFiberFlags);
local l_Ref_0 = v40.Ref;
local l_Update_0 = v40.Update;
local l_Callback_0 = v40.Callback;
local l_Passive_0 = v40.Passive;
local l_Deletion_0 = v40.Deletion;
local l_NoFlags_0 = v40.NoFlags;
local l_DidCapture_0 = v40.DidCapture;
local l_Snapshot_0 = v40.Snapshot;
local l_MutationMask_0 = v40.MutationMask;
local l_LayoutMask_0 = v40.LayoutMask;
local l_PassiveMask_0 = v40.PassiveMask;
local l_StaticMask_0 = v40.StaticMask;
local l_PerformedWork_0 = v40.PerformedWork;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_createInstance_0 = v6.createInstance;
local l_createTextInstance_0 = v6.createTextInstance;
local l_appendInitialChild_0 = v6.appendInitialChild;
local l_finalizeInitialChildren_0 = v6.finalizeInitialChildren;
local l_prepareUpdate_0 = v6.prepareUpdate;
local l_supportsMutation_0 = v6.supportsMutation;
local l_supportsPersistence_0 = v6.supportsPersistence;
local l_createContainerChildSet_0 = v6.createContainerChildSet;
local l_finalizeContainerChildren_0 = v6.finalizeContainerChildren;
local l_preparePortalMount_0 = v6.preparePortalMount;
local v65 = require(script.Parent["ReactFiberHostContext.new"]);
local l_getRootHostContainer_0 = v65.getRootHostContainer;
local l_popHostContext_0 = v65.popHostContext;
local l_getHostContext_0 = v65.getHostContext;
local l_popHostContainer_0 = v65.popHostContainer;
local v70 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local l_popSuspenseContext_0 = v70.popSuspenseContext;
local l_suspenseStackCursor_0 = v70.suspenseStackCursor;
local l_InvisibleParentSuspenseContext_0 = v70.InvisibleParentSuspenseContext;
local l_hasSuspenseContext_0 = v70.hasSuspenseContext;
local v75 = require(script.Parent["ReactFiberContext.new"]);
local l_isContextProvider_0 = v75.isContextProvider;
local l_popContext_0 = v75.popContext;
local l_popTopLevelContextObject_0 = v75.popTopLevelContextObject;
local l_popProvider_0 = require(script.Parent["ReactFiberNewContext.new"]).popProvider;
local v80 = require(script.Parent["ReactFiberHydrationContext.new"]);
local l_prepareToHydrateHostSuspenseInstance_0 = v80.prepareToHydrateHostSuspenseInstance;
local l_popHydrationState_0 = v80.popHydrationState;
local l_resetHydrationState_0 = v80.resetHydrationState;
local l_prepareToHydrateHostInstance_0 = v80.prepareToHydrateHostInstance;
local l_prepareToHydrateHostTextInstance_0 = v80.prepareToHydrateHostTextInstance;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableSuspenseServerRenderer_0 = l_ReactFeatureFlags_0.enableSuspenseServerRenderer;
local l_enableFundamentalAPI_0 = l_ReactFeatureFlags_0.enableFundamentalAPI;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local v92 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_popRenderLanes_0 = v92.popRenderLanes;
local l_markSpawnedWork_0 = v92.markSpawnedWork;
local l_renderDidSuspend_0 = v92.renderDidSuspend;
local l_renderDidSuspendDelayIfPossible_0 = v92.renderDidSuspendDelayIfPossible;
local l_NoLanes_0 = v4.NoLanes;
local l_includesSomeLane_0 = v4.includesSomeLane;
local l_mergeLanes_0 = v4.mergeLanes;
local l_transferActualDuration_0 = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration;
local function _(v101)
    v101.flags = bit32.bor(v101.flags, l_Update_0);
end;
local function _(v103)
    v103.flags = bit32.bor(v103.flags, l_Ref_0);
end;
local function v109(v105, v106)
    local v107 = false;
    if v105 ~= nil then
        v107 = v105.child == v106.child;
    end;
    if not v107 then
        local l_child_0 = v106.child;
        while true do
            if l_child_0 ~= nil then
                if bit32.band(l_child_0.flags, l_MutationMask_0) ~= l_NoFlags_0 then
                    return false;
                elseif bit32.band(l_child_0.subtreeFlags, l_MutationMask_0) ~= l_NoFlags_0 then
                    return false;
                else
                    l_child_0 = l_child_0.sibling;
                end;
            else
                return true;
            end;
        end;
    else
        return true;
    end;
end;
local v110 = nil;
local v111 = nil;
local v112 = nil;
local v113 = nil;
if not l_supportsMutation_0 then
    if not l_supportsPersistence_0 then
        v111 = function(_, _)
        end;
    else
        v110 = function(_, _, _, _)
            print("");
            print("");
            print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"));
            error("FIXME (roblox): " .. "appendAllChildren" .. " is unimplemented", 2);
        end;
        local _ = function(_, _, _, _)
            print("");
            print("");
            print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"));
            error("FIXME (roblox): " .. "appendAllChildrenToContainer" .. " is unimplemented", 2);
        end;
        v111 = function(v125, v126)
            local l_stateNode_0 = v126.stateNode;
            if not v109(v125, v126) then
                local l_containerInfo_0 = l_stateNode_0.containerInfo;
                local v129 = l_createContainerChildSet_0(l_containerInfo_0);
                print("");
                print("");
                print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"));
                error("FIXME (roblox): " .. "appendAllChildrenToContainer" .. " is unimplemented", 2);
                l_stateNode_0.pendingChildren = v129;
                v126.flags = bit32.bor(v126.flags, l_Update_0);
                l_finalizeContainerChildren_0(l_containerInfo_0, v129);
                return ;
            else
                return ;
            end;
        end;
    end;
else
    v110 = function(v130, v131, _, _)
        local l_child_1 = v131.child;
        while true do
            if l_child_1 ~= nil then
                if not (l_child_1.tag ~= l_HostComponent_0) or l_child_1.tag == l_HostText_0 then
                    l_appendInitialChild_0(v130, l_child_1.stateNode);
                elseif l_enableFundamentalAPI_0 and l_child_1.tag == l_FundamentalComponent_0 then
                    l_appendInitialChild_0(v130, l_child_1.stateNode.instance);
                elseif not (l_child_1.tag == l_HostPortal_0) and l_child_1.child ~= nil then
                    l_child_1.child.return_ = l_child_1;
                    l_child_1 = l_child_1.child;
                    continue;
                end;
                if l_child_1 == v131 then
                    return ;
                else
                    while true do
                        if l_child_1.sibling == nil then
                            if not (l_child_1.return_ ~= nil) or l_child_1.return_ == v131 then
                                return ;
                            else
                                l_child_1 = l_child_1.return_;
                            end;
                        else
                            l_child_1.sibling.return_ = l_child_1.return_;
                            l_child_1 = l_child_1.sibling;
                            break;
                        end;
                    end;
                end;
            else
                return ;
            end;
        end;
    end;
    v111 = function(_, _)
    end;
    v112 = function(v137, v138, v139, v140, v141)
        local l_memoizedProps_0 = v137.memoizedProps;
        if l_memoizedProps_0 == v140 then
            return ;
        else
            local v143 = l_prepareUpdate_0(v138.stateNode, v139, l_memoizedProps_0, v140, v141, (l_getHostContext_0()));
            v138.updateQueue = v143;
            if v143 then
                v138.flags = bit32.bor(v138.flags, l_Update_0);
            end;
            return ;
        end;
    end;
    v113 = function(_, v145, v146, v147)
        if v146 ~= v147 then
            v145.flags = bit32.bor(v145.flags, l_Update_0);
        end;
    end;
end;
local function v159(v148)
    local v149 = false;
    if v148.alternate ~= nil then
        v149 = v148.alternate.child == v148.child;
    end;
    local l_l_NoLanes_0_0 = l_NoLanes_0;
    local l_l_NoFlags_0_0 = l_NoFlags_0;
    if v149 then
        if l_enableProfilerTimer_0 and bit32.band(v148.mode, l_ProfileMode_0) ~= l_NoMode_0 then
            local l_selfBaseDuration_0 = v148.selfBaseDuration;
            local l_child_2 = v148.child;
            while l_child_2 ~= nil do
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_mergeLanes_0(l_child_2.lanes, l_child_2.childLanes));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, (bit32.band(l_child_2.subtreeFlags, l_StaticMask_0))), (bit32.band(l_child_2.flags, l_StaticMask_0)));
                l_selfBaseDuration_0 = l_selfBaseDuration_0 + l_child_2.treeBaseDuration;
                l_child_2 = l_child_2.sibling;
            end;
            v148.treeBaseDuration = l_selfBaseDuration_0;
        else
            local l_child_3 = v148.child;
            while l_child_3 ~= nil do
                l_l_NoLanes_0_0 = bit32.bor(l_l_NoLanes_0_0, (bit32.bor(l_child_3.lanes, l_child_3.childLanes)));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, (bit32.band(l_child_3.subtreeFlags, l_StaticMask_0))), (bit32.band(l_child_3.flags, l_StaticMask_0)));
                l_child_3.return_ = v148;
                l_child_3 = l_child_3.sibling;
            end;
        end;
        v148.subtreeFlags = bit32.bor(v148.subtreeFlags, l_l_NoFlags_0_0);
    else
        if l_enableProfilerTimer_0 and bit32.band(v148.mode, l_ProfileMode_0) ~= l_NoMode_0 then
            local l_actualDuration_0 = v148.actualDuration;
            local l_selfBaseDuration_1 = v148.selfBaseDuration;
            local l_child_4 = v148.child;
            while l_child_4 ~= nil do
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_mergeLanes_0(l_child_4.lanes, l_child_4.childLanes));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, l_child_4.subtreeFlags), l_child_4.flags);
                l_actualDuration_0 = l_actualDuration_0 + l_child_4.actualDuration;
                l_selfBaseDuration_1 = l_selfBaseDuration_1 + l_child_4.treeBaseDuration;
                l_child_4 = l_child_4.sibling;
            end;
            v148.actualDuration = l_actualDuration_0;
            v148.treeBaseDuration = l_selfBaseDuration_1;
        else
            local l_child_5 = v148.child;
            while l_child_5 ~= nil do
                l_l_NoLanes_0_0 = bit32.bor(l_l_NoLanes_0_0, (bit32.bor(l_child_5.lanes, l_child_5.childLanes)));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, l_child_5.subtreeFlags), l_child_5.flags);
                l_child_5.return_ = v148;
                l_child_5 = l_child_5.sibling;
            end;
        end;
        v148.subtreeFlags = bit32.bor(v148.subtreeFlags, l_l_NoFlags_0_0);
    end;
    v148.childLanes = l_l_NoLanes_0_0;
    return v149;
end;
return {
    completeWork = function(v160, v161, v162)
        local l_pendingProps_0 = v161.pendingProps;
        if not (((((((v161.tag ~= l_IndeterminateComponent_0 and v161.tag ~= l_LazyComponent_0) and v161.tag ~= l_SimpleMemoComponent_0) and v161.tag ~= l_FunctionComponent_0) and v161.tag ~= l_ForwardRef_0) and v161.tag ~= l_Fragment_0) and v161.tag ~= l_Mode_0) and v161.tag ~= l_ContextConsumer_0) or v161.tag == l_MemoComponent_0 then
            v159(v161);
            return nil;
        elseif v161.tag == l_ClassComponent_0 then
            if l_isContextProvider_0(v161.type) then
                l_popContext_0(v161);
            end;
            v159(v161);
            return nil;
        elseif v161.tag == l_HostRoot_0 then
            l_popHostContainer_0(v161);
            l_popTopLevelContextObject_0(v161);
            l_resetWorkInProgressVersions_0();
            local l_stateNode_1 = v161.stateNode;
            if l_stateNode_1.pendingContext then
                l_stateNode_1.context = l_stateNode_1.pendingContext;
                l_stateNode_1.pendingContext = nil;
            end;
            if not (v160 ~= nil) or v160.child == nil then
                if not l_popHydrationState_0(v161) then
                    if not l_stateNode_1.hydrate then
                        v161.flags = bit32.bor(v161.flags, l_Snapshot_0);
                    end;
                else
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
            end;
            v111(v160, v161);
            v159(v161);
            return nil;
        elseif v161.tag == l_HostComponent_0 then
            l_popHostContext_0(v161);
            local v165 = l_getRootHostContainer_0();
            local l_type_0 = v161.type;
            if v160 ~= nil and v161.stateNode ~= nil then
                v112(v160, v161, l_type_0, l_pendingProps_0, v165);
                if v160.ref ~= v161.ref then
                    v161.flags = bit32.bor(v161.flags, l_Ref_0);
                end;
            elseif l_pendingProps_0 then
                local v167 = l_getHostContext_0();
                if not l_popHydrationState_0(v161) then
                    local v168 = l_createInstance_0(l_type_0, l_pendingProps_0, v165, v167, v161);
                    v110(v168, v161, false, false);
                    v161.stateNode = v168;
                    if l_finalizeInitialChildren_0(v168, l_type_0, l_pendingProps_0, v165, v167) then
                        v161.flags = bit32.bor(v161.flags, l_Update_0);
                    end;
                elseif l_prepareToHydrateHostInstance_0(v161, v165, v167) then
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
                if v161.ref ~= nil then
                    v161.flags = bit32.bor(v161.flags, l_Ref_0);
                end;
            else
                l_invariant_0(v161.stateNode ~= nil, "We must have new props for new mounts. This error is likely " .. "caused by a bug in React. Please file an issue.");
                v159(v161);
                return nil;
            end;
            v159(v161);
            return nil;
        elseif v161.tag == l_HostText_0 then
            if v160 and v161.stateNode ~= nil then
                v113(v160, v161, v160.memoizedProps, l_pendingProps_0);
            else
                if typeof(l_pendingProps_0) ~= "string" then
                    l_invariant_0(v161.stateNode ~= nil, "We must have new props for new mounts. This error is likely " .. "caused by a bug in React. Please file an issue.");
                end;
                local v169 = l_getRootHostContainer_0();
                local v170 = l_getHostContext_0();
                if not l_popHydrationState_0(v161) then
                    v161.stateNode = l_createTextInstance_0(l_pendingProps_0, v169, v170, v161);
                elseif l_prepareToHydrateHostTextInstance_0(v161) then
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
            end;
            v159(v161);
            return nil;
        elseif v161.tag == l_Profiler_0 then
            if not v159(v161) then
                local l_l_Update_0_0 = l_Update_0;
                local l_l_Callback_0_0 = l_Callback_0;
                local l_l_Passive_0_0 = l_Passive_0;
                local l_subtreeFlags_0 = v161.subtreeFlags;
                local l_flags_0 = v161.flags;
                local l_l_flags_0_0 = l_flags_0;
                if not (bit32.band(l_flags_0, l_PerformedWork_0) == l_NoFlags_0) or bit32.band(l_subtreeFlags_0, l_PerformedWork_0) ~= l_NoFlags_0 then
                    l_l_flags_0_0 = bit32.bor(l_l_flags_0_0, l_l_Update_0_0);
                end;
                if not (bit32.band(l_flags_0, (bit32.bor(l_LayoutMask_0, l_Deletion_0))) == l_NoFlags_0) or bit32.band(l_subtreeFlags_0, (bit32.bor(l_LayoutMask_0, l_Deletion_0))) ~= l_NoFlags_0 then
                    l_l_flags_0_0 = bit32.bor(l_l_flags_0_0, l_l_Callback_0_0);
                end;
                if not (bit32.band(l_flags_0, l_PassiveMask_0) == l_NoFlags_0) or bit32.band(l_subtreeFlags_0, l_PassiveMask_0) ~= l_NoFlags_0 then
                    l_l_flags_0_0 = bit32.bor(l_l_flags_0_0, l_l_Passive_0_0);
                end;
                v161.flags = l_l_flags_0_0;
            end;
            return nil;
        elseif v161.tag == l_SuspenseComponent_0 then
            l_popSuspenseContext_0(v161);
            local l_memoizedState_0 = v161.memoizedState;
            if (l_enableSuspenseServerRenderer_0 and l_memoizedState_0 ~= nil) and l_memoizedState_0.dehydrated ~= nil then
                if v160 == nil then
                    l_invariant_0(l_popHydrationState_0(v161), "A dehydrated suspense component was completed without a hydrated node. " .. "This is probably a bug in React.");
                    l_prepareToHydrateHostSuspenseInstance_0(v161);
                    if l_enableSchedulerTracing_0 then
                        l_markSpawnedWork_0(l_OffscreenLane_0);
                    end;
                    v159(v161);
                    if not (not (l_enableProfilerTimer_0 and bit32.band(v161.mode, l_ProfileMode_0) ~= l_NoMode_0) or not (l_memoizedState_0 ~= nil)) then
                        local l_child_6 = v161.child;
                        if l_child_6 ~= nil then
                            v161.treeBaseDuration = l_child_6.treeBaseDuration;
                        end;
                    end;
                    return nil;
                else
                    l_resetHydrationState_0();
                    if bit32.band(v161.flags, l_DidCapture_0) == l_NoFlags_0 then
                        v161.memoizedState = nil;
                    end;
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                    v159(v161);
                    if not (not (l_enableProfilerTimer_0 and bit32.band(v161.mode, l_ProfileMode_0) ~= l_NoMode_0) or not (l_memoizedState_0 ~= nil)) then
                        local l_child_7 = v161.child;
                        if l_child_7 ~= nil then
                            v161.treeBaseDuration = v161.treeBaseDuration - l_child_7.treeBaseDuration;
                        end;
                    end;
                    return nil;
                end;
            elseif bit32.band(v161.flags, l_DidCapture_0) ~= l_NoFlags_0 then
                v161.lanes = v162;
                if l_enableProfilerTimer_0 and bit32.band(v161.mode, l_ProfileMode_0) ~= l_NoMode_0 then
                    l_transferActualDuration_0(v161);
                end;
                return v161;
            else
                local v180 = l_memoizedState_0 ~= nil;
                local v181 = false;
                if v160 == nil then
                    if v161.memoizedProps.fallback ~= nil then
                        l_popHydrationState_0(v161);
                    end;
                else
                    v181 = v160.memoizedState ~= nil;
                end;
                if not (not v180 or v181) and bit32.band(v161.mode, l_BlockingMode_0) ~= l_NoMode_0 then
                    local v182 = false;
                    if v160 == nil then
                        v182 = v161.memoizedProps.unstable_avoidThisFallback ~= true;
                    end;
                    if not v182 and not l_hasSuspenseContext_0(l_suspenseStackCursor_0.current, l_InvisibleParentSuspenseContext_0) then
                        l_renderDidSuspendDelayIfPossible_0();
                    else
                        l_renderDidSuspend_0();
                    end;
                end;
                if not (not l_supportsPersistence_0 or not v180) then
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
                if not (not l_supportsMutation_0 or not v180 and not v181) then
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
                if (l_enableSuspenseCallback_0 and v161.updateQueue ~= nil) and v161.memoizedProps.suspenseCallback ~= nil then
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
                v159(v161);
                if not (not (l_enableProfilerTimer_0 and bit32.band(v161.mode, l_ProfileMode_0) ~= l_NoMode_0) or not v180) then
                    local l_child_8 = v161.child;
                    if l_child_8 ~= nil then
                        v161.treeBaseDuration = v161.treeBaseDuration - l_child_8.treeBaseDuration;
                    end;
                end;
                return nil;
            end;
        elseif v161.tag == l_HostPortal_0 then
            l_popHostContainer_0(v161);
            v111(v160, v161);
            if v160 == nil then
                l_preparePortalMount_0(v161.stateNode.containerInfo);
            end;
            v159(v161);
            return nil;
        elseif v161.tag == l_ContextProvider_0 then
            l_popProvider_0(v161);
            v159(v161);
            return nil;
        elseif v161.tag == l_IncompleteClassComponent_0 then
            if l_isContextProvider_0(v161.type) then
                l_popContext_0(v161);
            end;
            v159(v161);
            return nil;
        else
            if v161.tag == l_SuspenseListComponent_0 then
                print("");
                print("");
                print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"));
                error("FIXME (roblox): " .. "SuspenseListComponent" .. " is unimplemented", 2);
            elseif v161.tag == l_FundamentalComponent_0 then
                print("");
                print("");
                print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"));
                error("FIXME (roblox): " .. "FundamentalComponent" .. " is unimplemented", 2);
            elseif v161.tag == l_ScopeComponent_0 then
                print("");
                print("");
                print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"));
                error("FIXME (roblox): " .. "ScopeComponent" .. " is unimplemented", 2);
            elseif v161.tag == l_Block_0 then
                print("");
                print("");
                print("UNIMPLEMENTED ERROR: " .. tostring("Block"));
                error("FIXME (roblox): " .. "Block" .. " is unimplemented", 2);
            elseif not (v161.tag ~= l_OffscreenComponent_0) or v161.tag == l_LegacyHiddenComponent_0 then
                l_popRenderLanes_0(v161);
                local v184 = v161.memoizedState ~= nil;
                if (v160 ~= nil and (v160.memoizedState ~= nil) ~= v184) and l_pendingProps_0.mode ~= "unstable-defer-without-hiding" then
                    v161.flags = bit32.bor(v161.flags, l_Update_0);
                end;
                if (not v184 or l_includesSomeLane_0(v92.subtreeRenderLanes, l_OffscreenLane_0)) or bit32.band(v161.mode, l_ConcurrentMode_0) == l_NoMode_0 then
                    v159(v161);
                end;
                return nil;
            end;
            l_invariant_0(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in " .. "React. Please file an issue.", (tostring(v161.tag)));
            return nil;
        end;
    end
};
