local function v1(v0)
    print("");
    print("");
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l___DEV___0 = _G.__DEV__;
local l___YOLO___0 = _G.__YOLO__;
local v4 = 0;
local function _(v5)
    if typeof(v5) == "function" then
        return true;
    else
        if typeof(v5) == "table" then
            local v6 = getmetatable(v5);
            if not v6 or not rawget(v6, "__call") then
                if v5._isMockFunction then
                    return true;
                end;
            else
                return true;
            end;
        end;
        return false;
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v10 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v10.Error;
local l_Set_0 = v10.Set;
local v13 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local v19 = require(script.Parent.ReactHookEffectTags);
local l_unstable_wrap_0 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableProfilerCommitHooks_0 = l_ReactFeatureFlags_0.enableProfilerCommitHooks;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v27 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v27.FunctionComponent;
local l_ForwardRef_0 = v27.ForwardRef;
local l_ClassComponent_0 = v27.ClassComponent;
local l_HostRoot_0 = v27.HostRoot;
local l_HostComponent_0 = v27.HostComponent;
local l_HostText_0 = v27.HostText;
local l_HostPortal_0 = v27.HostPortal;
local l_Profiler_0 = v27.Profiler;
local l_SuspenseComponent_0 = v27.SuspenseComponent;
local l_DehydratedFragment_0 = v27.DehydratedFragment;
local l_IncompleteClassComponent_0 = v27.IncompleteClassComponent;
local l_MemoComponent_0 = v27.MemoComponent;
local l_SimpleMemoComponent_0 = v27.SimpleMemoComponent;
local l_SuspenseListComponent_0 = v27.SuspenseListComponent;
local l_FundamentalComponent_0 = v27.FundamentalComponent;
local l_ScopeComponent_0 = v27.ScopeComponent;
local l_Block_0 = v27.Block;
local l_OffscreenComponent_0 = v27.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v27.LegacyHiddenComponent;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local v51 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v51.NoFlags;
local l_ContentReset_0 = v51.ContentReset;
local l_Placement_0 = v51.Placement;
local l_Snapshot_0 = v51.Snapshot;
local l_Update_0 = v51.Update;
local l_Callback_0 = v51.Callback;
local l_LayoutMask_0 = v51.LayoutMask;
local l_PassiveMask_0 = v51.PassiveMask;
local l_Ref_0 = v51.Ref;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v64 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v64.current;
local l_resetCurrentFiber_0 = v64.resetCurrentFiber;
local l_setCurrentFiber_0 = v64.setCurrentFiber;
local l_onCommitUnmount_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v70 = require(script.Parent["ReactProfilerTimer.new"]);
local l_startLayoutEffectTimer_0 = v70.startLayoutEffectTimer;
local l_recordPassiveEffectDuration_0 = v70.recordPassiveEffectDuration;
local l_recordLayoutEffectDuration_0 = v70.recordLayoutEffectDuration;
local l_startPassiveEffectTimer_0 = v70.startPassiveEffectTimer;
local l_getCommitTime_0 = v70.getCommitTime;
local l_ProfileMode_0 = require(script.Parent.ReactTypeOfMode).ProfileMode;
local l_commitUpdateQueue_0 = v16.commitUpdateQueue;
local l_getPublicInstance_0 = v13.getPublicInstance;
local l_supportsMutation_0 = v13.supportsMutation;
local l_supportsPersistence_0 = v13.supportsPersistence;
local l_supportsHydration_0 = v13.supportsHydration;
local l_commitMount_0 = v13.commitMount;
local l_commitUpdate_0 = v13.commitUpdate;
local l_resetTextContent_0 = v13.resetTextContent;
local l_commitTextUpdate_0 = v13.commitTextUpdate;
local l_appendChild_0 = v13.appendChild;
local l_appendChildToContainer_0 = v13.appendChildToContainer;
local l_insertBefore_0 = v13.insertBefore;
local l_insertInContainerBefore_0 = v13.insertInContainerBefore;
local l_removeChild_0 = v13.removeChild;
local l_removeChildFromContainer_0 = v13.removeChildFromContainer;
local l_hideInstance_0 = v13.hideInstance;
local l_hideTextInstance_0 = v13.hideTextInstance;
local l_unhideInstance_0 = v13.unhideInstance;
local l_unhideTextInstance_0 = v13.unhideTextInstance;
local l_commitHydratedSuspenseInstance_0 = v13.commitHydratedSuspenseInstance;
local l_clearContainer_0 = v13.clearContainer;
local v98 = nil;
local function v101(v99, v100)
    if not v98 then
        v98 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v98.resolveRetryWakeable(v99, v100);
end;
local function _()
    if not v98 then
        v98 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v98.markCommitTimeOfFallback();
end;
local function v103()
    l_console_0.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback());
end;
local function v107(_, _, v106)
    l_console_0.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle");
    error(v106);
end;
local l_NoFlags_1 = v19.NoFlags;
local l_HasEffect_0 = v19.HasEffect;
local l_Layout_0 = v19.Layout;
local l_Passive_0 = v19.Passive;
local v112 = nil;
local function v113()
    if not v112 then
        v112 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps;
    end;
    return v112;
end;
local v114 = nil;
local v115 = nil;
local v116 = nil;
local v117 = nil;
local v118 = nil;
local v119 = nil;
local v120 = nil;
local v121 = nil;
local v122 = nil;
local v123 = nil;
local v124 = nil;
local function v129(v125, v126)
    v126.props = v125.memoizedProps;
    v126.state = v125.memoizedState;
    if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v125.mode, l_ProfileMode_0) ~= 0 then
        local v127, v128 = xpcall(function()
            l_startLayoutEffectTimer_0();
            v126:componentWillUnmount();
        end, l_describeError_0);
        l_recordLayoutEffectDuration_0(v125);
        if not v127 then
            error(v128);
            return ;
        end;
    else
        v126:componentWillUnmount();
    end;
end;
safelyCallComponentWillUnmount = function(v130, v131, v132)
    local v133, v134 = xpcall(v129, l_describeError_0, v130, v131);
    if not v133 then
        v107(v130, v132, v134);
    end;
end;
local function _(v135, v136)
    local l_ref_0 = v135.ref;
    if l_ref_0 ~= nil then
        if typeof(l_ref_0) == "function" then
            local v138, v139 = xpcall(l_ref_0, l_describeError_0);
            if not v138 then
                v107(v135, v136, v139);
                return ;
            end;
        else
            l_ref_0.current = nil;
        end;
    end;
end;
local function v146(v141, v142, v143)
    local v144, v145 = xpcall(v143, l_describeError_0);
    if not v144 then
        v107(v141, v142, v145);
    end;
end;
local function v153(v147, v148)
    if not ((v148.tag ~= l_FunctionComponent_0 and v148.tag ~= l_ForwardRef_0) and v148.tag ~= l_SimpleMemoComponent_0) or v148.tag == l_Block_0 then
        return ;
    elseif v148.tag == l_ClassComponent_0 then
        if bit32.band(v148.flags, l_Snapshot_0) ~= 0 and v147 ~= nil then
            local l_memoizedProps_0 = v147.memoizedProps;
            local l_memoizedState_0 = v147.memoizedState;
            local l_stateNode_0 = v148.stateNode;
            if not (not (l___DEV___0 and v148.type == v148.elementType) or v113) then
                if l_stateNode_0.props ~= v148.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v148.type) or "instance");
                end;
                if l_stateNode_0.state ~= v148.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v148.type) or "instance");
                end;
            end;
            local v152 = l_stateNode_0:getSnapshotBeforeUpdate(v148.elementType == v148.type and l_memoizedProps_0 or l_resolveDefaultProps_0(v148.type, l_memoizedProps_0), l_memoizedState_0);
            if l___DEV___0 then
            end;
            l_stateNode_0.__reactInternalSnapshotBeforeUpdate = v152;
        end;
        return ;
    elseif v148.tag == l_HostRoot_0 then
        if l_supportsMutation_0 and bit32.band(v148.flags, l_Snapshot_0) ~= 0 then
            l_clearContainer_0(v148.stateNode.containerInfo);
        end;
        return ;
    elseif not ((v148.tag ~= l_HostComponent_0 and v148.tag ~= l_HostText_0) and v148.tag ~= l_HostPortal_0) or v148.tag == l_IncompleteClassComponent_0 then
        return ;
    else
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return ;
    end;
end;
local function v164(v154, v155, v156)
    local l_updateQueue_0 = v155.updateQueue;
    local v158 = nil;
    if l_updateQueue_0 ~= nil then
        v158 = l_updateQueue_0.lastEffect;
    end;
    if v158 ~= nil then
        local l_next_0 = v158.next;
        local l_l_next_0_0 = l_next_0;
        while true do
            if bit32.band(l_l_next_0_0.tag, v154) == v154 then
                local l_destroy_0 = l_l_next_0_0.destroy;
                l_l_next_0_0.destroy = nil;
                if l_destroy_0 ~= nil then
                    local v162, v163 = xpcall(l_destroy_0, l_describeError_0);
                    if not v162 then
                        v107(v155, v156, v163);
                    end;
                end;
            end;
            l_l_next_0_0 = l_l_next_0_0.next;
            if not (l_l_next_0_0 ~= l_next_0) then
                break;
            end;
        end;
    end;
end;
local function v173(v165, v166)
    local l_updateQueue_1 = v166.updateQueue;
    local v168 = if l_updateQueue_1 ~= nil then l_updateQueue_1.lastEffect else nil;
    if v168 ~= nil then
        local l_next_1 = v168.next;
        local l_l_next_1_0 = l_next_1;
        while true do
            if bit32.band(l_l_next_1_0.tag, v165) == v165 then
                l_l_next_1_0.destroy = l_l_next_1_0.create();
                if l___DEV___0 then
                    local l_destroy_1 = l_l_next_1_0.destroy;
                    if l_destroy_1 ~= nil and typeof(l_destroy_1) ~= "function" then
                        local _ = nil;
                        l_console_0.error("An effect function must not return anything besides a function, " .. "which is used for clean-up.%s", if l_destroy_1 == nil then " You returned nil. If your effect does not require clean " .. "up, return nil (or nothing)." else if typeof(l_destroy_1.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. " .. "Instead, write the async function inside your effect " .. "and call it immediately:\n\n" .. "useEffect(function()\n" .. "  function fetchData()\n" .. "    -- You can await here\n" .. "    local response = MyAPI.getData(someId):await()\n" .. "    -- ...\n" .. "  end\n" .. "  fetchData()\n" .. "end, {someId}) -- Or {} if effect doesn't need props or state\n\n" .. "Learn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. l_destroy_1);
                    end;
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
            if not (l_l_next_1_0 ~= l_next_1) then
                break;
            end;
        end;
    end;
end;
commitProfilerPassiveEffect = function(v174, v175)
    if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and v175.tag == l_Profiler_0 then
        local l_passiveEffectDuration_0 = v175.stateNode.passiveEffectDuration;
        local l_id_0 = v175.memoizedProps.id;
        local l_onPostCommit_0 = v175.memoizedProps.onPostCommit;
        local v179 = l_getCommitTime_0();
        if typeof(l_onPostCommit_0) == "function" then
            if not l_enableSchedulerTracing_0 then
                l_onPostCommit_0(l_id_0, v175.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v179);
            else
                l_onPostCommit_0(l_id_0, v175.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v179, v174.memoizedInteractions);
                return ;
            end;
        end;
    end;
end;
local function v180(v181, v182, v183, v184)
    if v183 ~= nil then
        v107 = v183;
    end;
    if v184 ~= nil then
        v103 = v184;
    end;
    local l_flags_0 = v181.flags;
    local l_tag_0 = v181.tag;
    if l_tag_0 == l_Profiler_0 then
        local v187 = nil;
        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) then
            v187 = v124;
            v124 = v181;
        end;
        local l_child_0 = v181.child;
        while l_child_0 ~= nil do
            if bit32.band(v181.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if not l___DEV___0 then
                    local v189, v190 = xpcall(v180, l_describeError_0, l_child_0, v182, v107, v103);
                    if not v189 then
                        v107(l_child_0, v181, v190);
                    end;
                else
                    local l_l_current_0_0 = l_current_0;
                    l_setCurrentFiber_0(l_child_0);
                    l_invokeGuardedCallback_0(nil, v180, nil, l_child_0, v182, v107, v103);
                    if l_hasCaughtError_0() then
                        v107(l_child_0, v181, (l_clearCaughtError_0()));
                    end;
                    if l_l_current_0_0 ~= nil then
                        l_setCurrentFiber_0(l_l_current_0_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                end;
            end;
            l_child_0 = l_child_0.sibling;
        end;
        if not (not (bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0) or not l_enableProfilerTimer_0) then
            if not l___DEV___0 then
                local v192, v193 = xpcall(commitLayoutEffectsForProfiler, l_describeError_0, v181, v182);
                if not v192 then
                    v107(v181, v181.return_, v193);
                end;
            else
                local l_l_current_0_1 = l_current_0;
                l_setCurrentFiber_0(v181);
                l_invokeGuardedCallback_0(nil, commitLayoutEffectsForProfiler, nil, v181, v182);
                if l_hasCaughtError_0() then
                    v107(v181, v181.return_, (l_clearCaughtError_0()));
                end;
                if l_l_current_0_1 ~= nil then
                    l_setCurrentFiber_0(l_l_current_0_1);
                else
                    l_resetCurrentFiber_0();
                end;
            end;
        end;
        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) then
            if v187 ~= nil then
                local l_stateNode_1 = v187.stateNode;
                l_stateNode_1.effectDuration = l_stateNode_1.effectDuration + v181.stateNode.effectDuration;
            end;
            v124 = v187;
            return ;
        end;
    else
        local l_child_1 = v181.child;
        while l_child_1 ~= nil do
            if bit32.band(v181.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if not l___DEV___0 then
                    local v197 = nil;
                    local v198 = nil;
                    if not l___YOLO___0 and v4 < 20 then
                        v4 = v4 + 1;
                        local v199, v200 = xpcall(v180, l_describeError_0, l_child_1, v182, v107, v103);
                        v197 = v199;
                        v198 = v200;
                        v4 = v4 - 1;
                    else
                        v197 = true;
                        v180(l_child_1, v182, v107, v103);
                    end;
                    if not v197 then
                        v107(l_child_1, v181, v198);
                    end;
                else
                    local l_current_1 = v64.current;
                    l_setCurrentFiber_0(l_child_1);
                    if v4 < 20 then
                        v4 = v4 + 1;
                        l_invokeGuardedCallback_0(nil, v180, nil, l_child_1, v182, v107, v103);
                        v4 = v4 - 1;
                        if l_hasCaughtError_0() then
                            v107(l_child_1, v181, (l_clearCaughtError_0()));
                        end;
                    else
                        v180(l_child_1, v182, v107, v103);
                    end;
                    if l_current_1 ~= nil then
                        l_setCurrentFiber_0(l_current_1);
                    else
                        l_resetCurrentFiber_0();
                    end;
                end;
            end;
            l_child_1 = l_child_1.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 then
            if not ((l_tag_0 ~= l_FunctionComponent_0 and l_tag_0 ~= l_ForwardRef_0) and l_tag_0 ~= l_SimpleMemoComponent_0) or l_tag_0 == l_Block_0 then
                if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v181.mode, l_ProfileMode_0) ~= 0 then
                    local v202, v203 = xpcall(function()
                        l_startLayoutEffectTimer_0();
                        v173(bit32.bor(l_Layout_0, l_HasEffect_0), v181);
                    end, l_describeError_0);
                    l_recordLayoutEffectDuration_0(v181);
                    if not v202 then
                        error(v203);
                    end;
                else
                    v173(bit32.bor(l_Layout_0, l_HasEffect_0), v181);
                end;
                if bit32.band(v181.subtreeFlags, l_PassiveMask_0) ~= l_NoFlags_0 then
                    v103();
                end;
            elseif l_tag_0 == l_ClassComponent_0 then
                v120(v181);
            elseif l_tag_0 == l_HostRoot_0 then
                v118(v181);
            elseif l_tag_0 == l_HostComponent_0 then
                v119(v181);
            elseif l_tag_0 == l_SuspenseComponent_0 then
                commitSuspenseHydrationCallbacks(v182, v181);
            elseif not (not ((((((l_tag_0 ~= l_FundamentalComponent_0 and l_tag_0 ~= l_HostPortal_0) and l_tag_0 ~= l_HostText_0) and l_tag_0 ~= l_IncompleteClassComponent_0) and l_tag_0 ~= l_LegacyHiddenComponent_0) and l_tag_0 ~= l_OffscreenComponent_0) and l_tag_0 ~= l_ScopeComponent_0) or l_tag_0 == l_SuspenseListComponent_0) then
                l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
            end;
        end;
        if bit32.band(l_flags_0, l_Ref_0) ~= 0 then
            commitAttachRef(v181);
        end;
    end;
end;
commitLayoutEffectsForProfiler = function(v204, v205)
    if l_enableProfilerTimer_0 then
        local l_flags_1 = v204.flags;
        local l_alternate_0 = v204.alternate;
        local l_onCommit_0 = v204.memoizedProps.onCommit;
        local l_onRender_0 = v204.memoizedProps.onRender;
        local l_effectDuration_0 = v204.stateNode.effectDuration;
        local v211 = l_getCommitTime_0();
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Callback_0_0 = l_Callback_0;
        if bit32.band(l_flags_1, l_l_Update_0_0) ~= l_NoFlags_0 then
            local v214;
            if typeof(l_onRender_0) == "function" then
                v214 = true;
            else
                if typeof(l_onRender_0) == "table" then
                    local v215 = getmetatable(l_onRender_0);
                    if not v215 or not rawget(v215, "__call") then
                        if l_onRender_0._isMockFunction then
                            v214 = true;
                            goto label0 --[[  true, true  ]];
                        end;
                    else
                        v214 = true;
                        goto label0 --[[  true, true  ]];
                    end;
                end;
                v214 = false;
            end;
            ::label0::;
            if v214 then
                if not l_enableSchedulerTracing_0 then
                    l_onRender_0(v204.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v204.actualDuration, v204.treeBaseDuration, v204.actualStartTime, v211);
                else
                    l_onRender_0(v204.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v204.actualDuration, v204.treeBaseDuration, v204.actualStartTime, v211, v205.memoizedInteractions);
                end;
            end;
        end;
        if l_enableProfilerCommitHooks_0 and bit32.band(l_flags_1, l_l_Callback_0_0) ~= l_NoFlags_0 then
            local v216;
            if typeof(l_onCommit_0) == "function" then
                v216 = true;
            else
                if typeof(l_onCommit_0) == "table" then
                    local v217 = getmetatable(l_onCommit_0);
                    if not v217 or not rawget(v217, "__call") then
                        if l_onCommit_0._isMockFunction then
                            v216 = true;
                            goto label1 --[[  true, true  ]];
                        end;
                    else
                        v216 = true;
                        goto label1 --[[  true, true  ]];
                    end;
                end;
                v216 = false;
            end;
            ::label1::;
            if v216 then
                if not l_enableSchedulerTracing_0 then
                    l_onCommit_0(v204.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v211);
                else
                    l_onCommit_0(v204.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v211, v205.memoizedInteractions);
                    return ;
                end;
            end;
        end;
    end;
end;
v120 = function(v218)
    local l_stateNode_2 = v218.stateNode;
    local l_alternate_1 = v218.alternate;
    if bit32.band(v218.flags, l_Update_0) ~= 0 then
        if l_alternate_1 == nil then
            if not (not (l___DEV___0 and v218.type == v218.elementType) or v113) then
                if l_stateNode_2.props ~= v218.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v218.type) or "instance");
                end;
                if l_stateNode_2.state ~= v218.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v218.type) or "instance");
                end;
            end;
            if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v218.mode, l_ProfileMode_0) ~= 0 then
                local v221, v222 = xpcall(function()
                    l_startLayoutEffectTimer_0();
                    l_stateNode_2:componentDidMount();
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v218);
                if not v221 then
                    error(v222);
                end;
            else
                l_stateNode_2:componentDidMount();
            end;
        else
            local v223 = v218.elementType == v218.type and l_alternate_1.memoizedProps or l_resolveDefaultProps_0(v218.type, l_alternate_1.memoizedProps);
            local l_memoizedState_1 = l_alternate_1.memoizedState;
            if not (not (l___DEV___0 and v218.type == v218.elementType) or v113) then
                if l_stateNode_2.props ~= v218.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v218.type) or "instance");
                end;
                if l_stateNode_2.state ~= v218.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v218.type) or "instance");
                end;
            end;
            if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v218.mode, l_ProfileMode_0) ~= 0 then
                local l_v223_0 = v223 --[[ copy: 3 -> 7 ]];
                local v226, v227 = xpcall(function()
                    l_startLayoutEffectTimer_0();
                    l_stateNode_2:componentDidUpdate(l_v223_0, l_memoizedState_1, l_stateNode_2.__reactInternalSnapshotBeforeUpdate);
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v218);
                if not v226 then
                    error(v227);
                end;
            else
                l_stateNode_2:componentDidUpdate(v223, l_memoizedState_1, l_stateNode_2.__reactInternalSnapshotBeforeUpdate);
            end;
        end;
    end;
    local l_updateQueue_2 = v218.updateQueue;
    if l_updateQueue_2 ~= nil then
        if not (not (l___DEV___0 and v218.type == v218.elementType) or v113) then
            if l_stateNode_2.props ~= v218.memoizedProps then
                l_console_0.error("Expected %s props to match memoized props before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v218.type) or "instance");
            end;
            if l_stateNode_2.state ~= v218.memoizedState then
                l_console_0.error("Expected %s state to match memoized state before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v218.type) or "instance");
            end;
        end;
        l_commitUpdateQueue_0(v218, l_updateQueue_2, l_stateNode_2);
    end;
end;
v118 = function(v229)
    local l_updateQueue_3 = v229.updateQueue;
    if l_updateQueue_3 ~= nil then
        local v231 = nil;
        if v229.child ~= nil then
            local l_child_2 = v229.child;
            if l_child_2.tag == l_HostComponent_0 then
                v231 = l_getPublicInstance_0(l_child_2.stateNode);
            elseif l_child_2.tag == l_ClassComponent_0 then
                v231 = l_child_2.stateNode;
            end;
        end;
        l_commitUpdateQueue_0(v229, l_updateQueue_3, v231);
    end;
end;
v119 = function(v233)
    local l_stateNode_3 = v233.stateNode;
    if v233.alternate == nil and bit32.band(v233.flags, l_Update_0) ~= 0 then
        l_commitMount_0(l_stateNode_3, v233.type, v233.memoizedProps, v233);
    end;
end;
local function v240(v235, v236)
    if not l_supportsMutation_0 then
        return ;
    else
        local l_v235_0 = v235;
        while true do
            if l_v235_0.tag == l_HostComponent_0 then
                local l_stateNode_4 = l_v235_0.stateNode;
                if not v236 then
                    l_unhideInstance_0(l_v235_0.stateNode, l_v235_0.memoizedProps);
                else
                    l_hideInstance_0(l_stateNode_4);
                end;
            elseif l_v235_0.tag == l_HostText_0 then
                local l_stateNode_5 = l_v235_0.stateNode;
                if not v236 then
                    l_unhideTextInstance_0(l_stateNode_5, l_v235_0.memoizedProps);
                else
                    l_hideTextInstance_0(l_stateNode_5);
                end;
            elseif not (((not (l_v235_0.tag ~= l_OffscreenComponent_0) or l_v235_0.tag == l_LegacyHiddenComponent_0) and l_v235_0.memoizedState ~= nil) and l_v235_0 ~= v235) and l_v235_0.child ~= nil then
                l_v235_0.child.return_ = l_v235_0;
                l_v235_0 = l_v235_0.child;
                continue;
            end;
            if l_v235_0 == v235 then
                return ;
            else
                while true do
                    if l_v235_0.sibling == nil then
                        if not (l_v235_0.return_ ~= nil) or l_v235_0.return_ == v235 then
                            return ;
                        else
                            l_v235_0 = l_v235_0.return_;
                        end;
                    else
                        l_v235_0.sibling.return_ = l_v235_0.return_;
                        l_v235_0 = l_v235_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
commitAttachRef = function(v241)
    local l_ref_1 = v241.ref;
    if l_ref_1 ~= nil then
        local l_stateNode_6 = v241.stateNode;
        local v244 = nil;
        v244 = if v241.tag == l_HostComponent_0 then l_getPublicInstance_0(l_stateNode_6) else l_stateNode_6;
        if typeof(l_ref_1) == "function" then
            l_ref_1(v244);
            return ;
        elseif l___DEV___0 and typeof(l_ref_1) ~= "table" then
            l_console_0.error("Unexpected ref object provided for %s. " .. "Use either a ref-setter function or React.createRef().", l_getComponentName_0(v241.type) or "instance");
            return ;
        else
            l_ref_1.current = v244;
        end;
    end;
end;
commitDetachRef = function(v245)
    local l_ref_2 = v245.ref;
    if l_ref_2 ~= nil then
        if typeof(l_ref_2) == "function" then
            l_ref_2(nil);
            return ;
        else
            l_ref_2.current = nil;
        end;
    end;
end;
v123 = function(v247, v248, v249, v250)
    l_onCommitUnmount_0(v248);
    if not (((v248.tag ~= l_FunctionComponent_0 and v248.tag ~= l_ForwardRef_0) and v248.tag ~= l_MemoComponent_0) and v248.tag ~= l_SimpleMemoComponent_0) or v248.tag == l_Block_0 then
        local l_updateQueue_4 = v248.updateQueue;
        if l_updateQueue_4 ~= nil then
            local l_lastEffect_0 = l_updateQueue_4.lastEffect;
            if l_lastEffect_0 ~= nil then
                local l_next_2 = l_lastEffect_0.next;
                local l_l_next_2_0 = l_next_2;
                while true do
                    if l_l_next_2_0.destroy ~= nil and bit32.band(l_l_next_2_0.tag, l_Layout_0) ~= l_NoFlags_1 then
                        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v248.mode, l_ProfileMode_0) ~= 0 then
                            l_startLayoutEffectTimer_0();
                            local v255, v256 = xpcall(l_l_next_2_0.destroy, l_describeError_0);
                            if not v255 then
                                v107(v248, v249, v256);
                            end;
                            l_recordLayoutEffectDuration_0(v248);
                        else
                            local v257, v258 = xpcall(l_l_next_2_0.destroy, l_describeError_0);
                            if not v257 then
                                v107(v248, v249, v258);
                            end;
                        end;
                    end;
                    l_l_next_2_0 = l_l_next_2_0.next;
                    if not (l_l_next_2_0 ~= l_next_2) then
                        break;
                    end;
                end;
            end;
        end;
        return ;
    elseif v248.tag == l_ClassComponent_0 then
        local l_ref_3 = v248.ref;
        if l_ref_3 ~= nil then
            if typeof(l_ref_3) == "function" then
                local v260, v261 = xpcall(l_ref_3, l_describeError_0);
                if not v260 then
                    v107(v248, v249, v261);
                end;
            else
                l_ref_3.current = nil;
            end;
        end;
        l_ref_3 = v248.stateNode;
        if typeof(l_ref_3.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v248, l_ref_3, v249);
        end;
        return ;
    elseif v248.tag == l_HostComponent_0 then
        local l_ref_4 = v248.ref;
        if l_ref_4 ~= nil then
            if typeof(l_ref_4) == "function" then
                local v263, v264 = xpcall(l_ref_4, l_describeError_0);
                if not v263 then
                    v107(v248, v249, v264);
                    return ;
                end;
            else
                l_ref_4.current = nil;
            end;
        end;
        return ;
    elseif v248.tag == l_HostPortal_0 then
        if not l_supportsMutation_0 then
            if l_supportsPersistence_0 then
                v1("emptyPortalContainer");
            end;
            return ;
        else
            v121(v247, v248, v249, v250);
            return ;
        end;
    else
        return ;
    end;
end;
v122 = function(v265, v266, v267, v268)
    local l_v266_0 = v266;
    while true do
        v123(v265, l_v266_0, v267, v268);
        if l_v266_0.child ~= nil and (not l_supportsMutation_0 or l_v266_0.tag ~= l_HostPortal_0) then
            l_v266_0.child.return_ = l_v266_0;
            l_v266_0 = l_v266_0.child;
            continue;
        end;
        if l_v266_0 == v266 then
            return ;
        else
            while true do
                if l_v266_0.sibling == nil then
                    if not (l_v266_0.return_ ~= nil) or l_v266_0.return_ == v266 then
                        return ;
                    else
                        l_v266_0 = l_v266_0.return_;
                    end;
                else
                    l_v266_0.sibling.return_ = l_v266_0.return_;
                    l_v266_0 = l_v266_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function _(v270)
    local l_alternate_2 = v270.alternate;
    if l_alternate_2 ~= nil then
        l_alternate_2.return_ = nil;
        v270.alternate = nil;
    end;
    v270.return_ = nil;
end;
local function v275(v273)
    local l_return__0 = v273.return_;
    while true do
        if l_return__0 ~= nil then
            if not v114(l_return__0) then
                l_return__0 = l_return__0.return_;
            else
                return l_return__0;
            end;
        else
            error(l_Error_0.new("Expected to find a host parent. This error is likely caused by a bug " .. "in React. Please file an issue."));
            return ;
        end;
    end;
end;
v114 = function(v276)
    local v277 = true;
    if v276.tag ~= l_HostComponent_0 then
        v277 = true;
        if v276.tag ~= l_HostRoot_0 then
            v277 = v276.tag == l_HostPortal_0;
        end;
    end;
    return v277;
end;
v115 = function(v278)
    local l_v278_0 = v278;
    while true do
        local v280 = false;
        while true do
            if l_v278_0.sibling == nil then
                if l_v278_0.return_ ~= nil and not v114(l_v278_0.return_) then
                    l_v278_0 = l_v278_0.return_;
                else
                    return nil;
                end;
            else
                l_v278_0.sibling.return_ = l_v278_0.return_;
                l_v278_0 = l_v278_0.sibling;
                while (l_v278_0.tag ~= l_HostComponent_0 and l_v278_0.tag ~= l_HostText_0) and l_v278_0.tag ~= l_DehydratedFragment_0 do
                    if bit32.band(l_v278_0.flags, l_Placement_0) ~= 0 then
                        v280 = true;
                        break;
                    elseif not (l_v278_0.child ~= nil) or l_v278_0.tag == l_HostPortal_0 then
                        v280 = true;
                        break;
                    else
                        l_v278_0.child.return_ = l_v278_0;
                        l_v278_0 = l_v278_0.child;
                    end;
                end;
                if not v280 and bit32.band(l_v278_0.flags, l_Placement_0) == 0 then
                    return l_v278_0.stateNode;
                else
                    break;
                end;
            end;
        end;
    end;
end;
local function v287(v281)
    if l_supportsMutation_0 then
        local v282 = v275(v281);
        local v283 = nil;
        local v284 = nil;
        local l_stateNode_7 = v282.stateNode;
        if v282.tag == l_HostComponent_0 then
            v283 = l_stateNode_7;
            v284 = false;
        elseif v282.tag == l_HostRoot_0 then
            v283 = l_stateNode_7.containerInfo;
            v284 = true;
        elseif v282.tag == l_HostPortal_0 then
            v283 = l_stateNode_7.containerInfo;
            v284 = true;
        else
            l_invariant_0(false, "Invalid host parent fiber. This error is likely caused by a bug " .. "in React. Please file an issue.");
        end;
        if bit32.band(v282.flags, l_ContentReset_0) ~= 0 then
            l_resetTextContent_0(v283);
            v282.flags = bit32.band(v282.flags, (bit32.bnot(l_ContentReset_0)));
        end;
        local v286 = v115(v281);
        if not v284 then
            v116(v281, v286, v283);
            return ;
        else
            v117(v281, v286, v283);
            return ;
        end;
    else
        return ;
    end;
end;
v117 = function(v288, v289, v290)
    local l_tag_1 = v288.tag;
    local v292 = true;
    if l_tag_1 ~= l_HostComponent_0 then
        v292 = l_tag_1 == l_HostText_0;
    end;
    if not v292 then
        if l_tag_1 == l_HostPortal_0 then
            return ;
        else
            local l_child_3 = v288.child;
            if l_child_3 ~= nil then
                v117(l_child_3, v289, v290);
                local l_sibling_0 = l_child_3.sibling;
                while l_sibling_0 ~= nil do
                    v117(l_sibling_0, v289, v290);
                    l_sibling_0 = l_sibling_0.sibling;
                end;
            end;
            return ;
        end;
    else
        local l_stateNode_8 = v288.stateNode;
        if not v289 then
            l_appendChildToContainer_0(v290, l_stateNode_8);
            return ;
        else
            l_insertInContainerBefore_0(v290, l_stateNode_8, v289);
            return ;
        end;
    end;
end;
v116 = function(v296, v297, v298)
    local l_tag_2 = v296.tag;
    local v300 = true;
    if l_tag_2 ~= l_HostComponent_0 then
        v300 = l_tag_2 == l_HostText_0;
    end;
    if not v300 then
        if l_tag_2 == l_HostPortal_0 then
            return ;
        else
            local l_child_4 = v296.child;
            if l_child_4 ~= nil then
                v116(l_child_4, v297, v298);
                local l_sibling_1 = l_child_4.sibling;
                while l_sibling_1 ~= nil do
                    v116(l_sibling_1, v297, v298);
                    l_sibling_1 = l_sibling_1.sibling;
                end;
            end;
            return ;
        end;
    else
        local l_stateNode_9 = v296.stateNode;
        if not v297 then
            l_appendChild_0(v298, l_stateNode_9);
            return ;
        else
            l_insertBefore_0(v298, l_stateNode_9, v297);
            return ;
        end;
    end;
end;
v121 = function(v304, v305, v306, v307)
    local l_v305_0 = v305;
    local v309 = false;
    local v310 = nil;
    local v311 = nil;
    while true do
        if not v309 then
            local l_return__1 = l_v305_0.return_;
            while true do
                if l_return__1 == nil then
                    error(l_Error_0.new("Expected to find a host parent. This error is likely caused by " .. "a bug in React. Please file an issue."));
                end;
                local l_stateNode_10 = l_return__1.stateNode;
                if l_return__1.tag == l_HostComponent_0 then
                    v310 = l_stateNode_10;
                    v311 = false;
                    break;
                elseif l_return__1.tag == l_HostRoot_0 then
                    v310 = l_stateNode_10.containerInfo;
                    v311 = true;
                    break;
                elseif l_return__1.tag == l_HostPortal_0 then
                    v310 = l_stateNode_10.containerInfo;
                    v311 = true;
                    break;
                else
                    l_return__1 = l_return__1.return_;
                end;
            end;
            v309 = true;
        end;
        if not (l_v305_0.tag ~= l_HostComponent_0) or l_v305_0.tag == l_HostText_0 then
            v122(v304, l_v305_0, v306, v307);
            if not v311 then
                l_removeChild_0(v310, l_v305_0.stateNode);
            else
                l_removeChildFromContainer_0(v310, l_v305_0.stateNode);
            end;
        elseif l_v305_0.tag == l_HostPortal_0 then
            if l_v305_0.child ~= nil then
                v310 = l_v305_0.stateNode.containerInfo;
                v311 = true;
                l_v305_0.child.return_ = l_v305_0;
                l_v305_0 = l_v305_0.child;
                continue;
            end;
        else
            v123(v304, l_v305_0, v306, v307);
            if l_v305_0.child ~= nil then
                l_v305_0.child.return_ = l_v305_0;
                l_v305_0 = l_v305_0.child;
                continue;
            end;
        end;
        if l_v305_0 == v305 then
            return ;
        else
            while true do
                if l_v305_0.sibling == nil then
                    if not (l_v305_0.return_ ~= nil) or l_v305_0.return_ == v305 then
                        return ;
                    else
                        l_v305_0 = l_v305_0.return_;
                        if l_v305_0.tag == l_HostPortal_0 then
                            v309 = false;
                        end;
                    end;
                else
                    l_v305_0.sibling.return_ = l_v305_0.return_;
                    l_v305_0 = l_v305_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function v320(v314, v315, v316, v317)
    v121(v314, v315, v316, v317);
    local l_alternate_3 = v315.alternate;
    local l_alternate_4 = v315.alternate;
    if l_alternate_4 ~= nil then
        l_alternate_4.return_ = nil;
        v315.alternate = nil;
    end;
    v315.return_ = nil;
    if l_alternate_3 ~= nil then
        l_alternate_4 = l_alternate_3.alternate;
        if l_alternate_4 ~= nil then
            l_alternate_4.return_ = nil;
            l_alternate_3.alternate = nil;
        end;
        l_alternate_3.return_ = nil;
    end;
end;
local function v334(v321, v322)
    if not (((v322.tag ~= l_FunctionComponent_0 and v322.tag ~= l_ForwardRef_0) and v322.tag ~= l_MemoComponent_0) and v322.tag ~= l_SimpleMemoComponent_0) or v322.tag == l_Block_0 then
        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v322.mode, l_ProfileMode_0) ~= 0 then
            local v323, v324 = xpcall(function()
                l_startLayoutEffectTimer_0();
                v164(bit32.bor(l_Layout_0, l_HasEffect_0), v322, v322.return_);
            end, l_describeError_0);
            l_recordLayoutEffectDuration_0(v322);
            if not v323 then
                error(v324);
                return ;
            end;
        else
            v164(bit32.bor(l_Layout_0, l_HasEffect_0), v322, v322.return_);
        end;
        return ;
    elseif v322.tag == l_ClassComponent_0 then
        return ;
    elseif v322.tag == l_HostComponent_0 then
        local l_stateNode_11 = v322.stateNode;
        if l_stateNode_11 ~= nil then
            local l_memoizedProps_1 = v322.memoizedProps;
            local v327 = nil;
            v327 = if not v321 then l_memoizedProps_1 else v321.memoizedProps;
            local l_type_0 = v322.type;
            local l_updateQueue_5 = v322.updateQueue;
            v322.updateQueue = nil;
            if l_updateQueue_5 ~= nil then
                l_commitUpdate_0(l_stateNode_11, l_updateQueue_5, l_type_0, v327, l_memoizedProps_1, v322);
            end;
        end;
        return ;
    elseif v322.tag == l_HostText_0 then
        l_invariant_0(v322.stateNode ~= nil, "This should have a text node initialized. This error is likely " .. "caused by a bug in React. Please file an issue.");
        local l_stateNode_12 = v322.stateNode;
        local l_memoizedProps_2 = v322.memoizedProps;
        local v332 = nil;
        if v321 ~= nil then
            v332 = v321.memoizedProps;
            v332 = l_memoizedProps_2;
        end;
        l_commitTextUpdate_0(l_stateNode_12, v332, l_memoizedProps_2);
        return ;
    elseif v322.tag == l_HostRoot_0 then
        if l_supportsHydration_0 then
            local l_stateNode_13 = v322.stateNode;
            if l_stateNode_13.hydrate then
                l_stateNode_13.hydrate = false;
                v1("commitWork: HostRoot: commitHydratedContainer");
            end;
        end;
        return ;
    elseif v322.tag == l_Profiler_0 then
        return ;
    elseif v322.tag == l_SuspenseComponent_0 then
        commitSuspenseComponent(v322);
        attachSuspenseRetryListeners(v322);
        return ;
    else
        if v322.tag == l_SuspenseListComponent_0 then
            v1("commitWork: SuspenseListComponent");
        elseif v322.tag == l_IncompleteClassComponent_0 then
            return ;
        elseif not (v322.tag ~= l_OffscreenComponent_0) or v322.tag == l_LegacyHiddenComponent_0 then
            v240(v322, v322.memoizedState ~= nil);
            return ;
        end;
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return ;
    end;
end;
commitSuspenseComponent = function(v335)
    local l_memoizedState_2 = v335.memoizedState;
    if l_memoizedState_2 ~= nil then
        if not v98 then
            v98 = require(script.Parent["ReactFiberWorkLoop.new"]);
        end;
        v98.markCommitTimeOfFallback();
        if l_supportsMutation_0 then
            v240(v335.child, true);
        end;
    end;
    if l_enableSuspenseCallback_0 and l_memoizedState_2 ~= nil then
        local l_suspenseCallback_0 = v335.memoizedProps.suspenseCallback;
        if typeof(l_suspenseCallback_0) == "function" then
            local l_updateQueue_6 = v335.updateQueue;
            if l_updateQueue_6 ~= nil then
                l_suspenseCallback_0(table.clone(l_updateQueue_6));
                return ;
            end;
        elseif l___DEV___0 and l_suspenseCallback_0 ~= nil then
            l_console_0.error("Unexpected type for suspenseCallback: %s", (tostring(l_suspenseCallback_0)));
        end;
    end;
end;
commitSuspenseHydrationCallbacks = function(v339, v340)
    if l_supportsHydration_0 then
        if v340.memoizedState == nil then
            local l_alternate_5 = v340.alternate;
            if l_alternate_5 ~= nil then
                local l_memoizedState_3 = l_alternate_5.memoizedState;
                if l_memoizedState_3 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_3.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        l_commitHydratedSuspenseInstance_0(l_dehydrated_0);
                        if l_enableSuspenseCallback_0 then
                            local l_hydrationCallbacks_0 = v339.hydrationCallbacks;
                            if l_hydrationCallbacks_0 ~= nil then
                                local l_onHydrated_0 = l_hydrationCallbacks_0.onHydrated;
                                if l_onHydrated_0 then
                                    l_onHydrated_0(l_dehydrated_0);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
attachSuspenseRetryListeners = function(v346)
    local l_updateQueue_7 = v346.updateQueue;
    if l_updateQueue_7 ~= nil then
        v346.updateQueue = nil;
        local l_stateNode_14 = v346.stateNode;
        if l_stateNode_14 == nil then
            v346.stateNode = l_Set_0.new();
            l_stateNode_14 = v346.stateNode;
        end;
        for v349, _ in l_updateQueue_7, nil, nil do
            local function v351()
                return v101(v346, v349);
            end;
            do
                local l_v351_0 = v351;
                if not l_stateNode_14:has(v349) then
                    if l_enableSchedulerTracing_0 and v349.__reactDoNotTraceInteractions ~= true then
                        l_v351_0 = l_unstable_wrap_0(l_v351_0);
                    end;
                    l_stateNode_14:add(v349);
                    v349:andThen(function()
                        return l_v351_0();
                    end, function()
                        return l_v351_0();
                    end);
                end;
            end;
        end;
    end;
end;
isSuspenseBoundaryBeingHidden = function(v353, v354)
    if v353 ~= nil then
        local l_memoizedState_4 = v353.memoizedState;
        if not (l_memoizedState_4 ~= nil) or l_memoizedState_4.dehydrated ~= nil then
            local l_memoizedState_5 = v354.memoizedState;
            local v357 = false;
            if l_memoizedState_5 ~= nil then
                v357 = l_memoizedState_5.dehydrated == nil;
            end;
            return v357;
        end;
    end;
    return false;
end;
commitResetTextContent = function(v358)
    if l_supportsMutation_0 then
        l_resetTextContent_0(v358.stateNode);
        return ;
    else
        return ;
    end;
end;
local function v360(v359)
    if not ((v359.tag ~= l_FunctionComponent_0 and v359.tag ~= l_ForwardRef_0) and v359.tag ~= l_SimpleMemoComponent_0) or v359.tag == l_Block_0 then
        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v359.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v164(bit32.bor(l_Passive_0, l_HasEffect_0), v359, v359.return_);
            l_recordPassiveEffectDuration_0(v359);
            return ;
        else
            v164(bit32.bor(l_Passive_0, l_HasEffect_0), v359, v359.return_);
        end;
    end;
end;
local function v363(v361, v362)
    if not ((v361.tag ~= l_FunctionComponent_0 and v361.tag ~= l_ForwardRef_0) and v361.tag ~= l_SimpleMemoComponent_0) or v361.tag == l_Block_0 then
        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v361.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v164(l_Passive_0, v361, v362);
            l_recordPassiveEffectDuration_0(v361);
            return ;
        else
            v164(l_Passive_0, v361, v362);
        end;
    end;
end;
local function v368(v364, v365)
    if not ((v365.tag ~= l_FunctionComponent_0 and v365.tag ~= l_ForwardRef_0) and v365.tag ~= l_SimpleMemoComponent_0) or v365.tag == l_Block_0 then
        if not (not l_enableProfilerTimer_0 or not l_enableProfilerCommitHooks_0) and bit32.band(v365.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            local v366, v367 = xpcall(v173, l_describeError_0, bit32.bor(l_Passive_0, l_HasEffect_0), v365);
            l_recordPassiveEffectDuration_0(v365);
            if not v366 then
                error(v367);
                return ;
            end;
        else
            v173(bit32.bor(l_Passive_0, l_HasEffect_0), v365);
            return ;
        end;
    elseif v365.tag == l_Profiler_0 then
        commitProfilerPassiveEffect(v364, v365);
    end;
end;
invokeLayoutEffectMountInDEV = function(v369)
    if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
        if v369.tag == l_ClassComponent_0 then
            local l_stateNode_15 = v369.stateNode;
            l_invokeGuardedCallback_0(nil, l_stateNode_15.componentDidMount, l_stateNode_15);
            if l_hasCaughtError_0() then
                v107(v369, v369.return_, (l_clearCaughtError_0()));
            end;
            return ;
        end;
    elseif not ((v369.tag ~= l_FunctionComponent_0 and v369.tag ~= l_ForwardRef_0) and v369.tag ~= l_SimpleMemoComponent_0) or v369.tag == l_Block_0 then
        l_invokeGuardedCallback_0(nil, v173, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v369);
        if l_hasCaughtError_0() then
            v107(v369, v369.return_, (l_clearCaughtError_0()));
        end;
        return ;
    end;
end;
invokePassiveEffectMountInDEV = function(v371)
    if not (not l___DEV___0 or not l_enableDoubleInvokingEffects_0) and (not ((v371.tag ~= l_FunctionComponent_0 and v371.tag ~= l_ForwardRef_0) and v371.tag ~= l_SimpleMemoComponent_0) or v371.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v173, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v371);
        if l_hasCaughtError_0() then
            v107(v371, v371.return_, (l_clearCaughtError_0()));
        end;
        return ;
    else
        return ;
    end;
end;
invokeLayoutEffectUnmountInDEV = function(v372)
    if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
        if v372.tag == l_ClassComponent_0 then
            local l_stateNode_16 = v372.stateNode;
            if typeof(l_stateNode_16.componentWillUnmount) == "function" then
                safelyCallComponentWillUnmount(v372, l_stateNode_16, v372.return_);
            end;
            return ;
        end;
    elseif not ((v372.tag ~= l_FunctionComponent_0 and v372.tag ~= l_ForwardRef_0) and v372.tag ~= l_SimpleMemoComponent_0) or v372.tag == l_Block_0 then
        l_invokeGuardedCallback_0(nil, v164, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v372, v372.return_);
        if l_hasCaughtError_0() then
            v107(v372, v372.return_, (l_clearCaughtError_0()));
        end;
        return ;
    end;
end;
invokePassiveEffectUnmountInDEV = function(v374)
    if not (not l___DEV___0 or not l_enableDoubleInvokingEffects_0) and (not ((v374.tag ~= l_FunctionComponent_0 and v374.tag ~= l_ForwardRef_0) and v374.tag ~= l_SimpleMemoComponent_0) or v374.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v164, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v374, v374.return_);
        if l_hasCaughtError_0() then
            v107(v374, v374.return_, (l_clearCaughtError_0()));
        end;
        return ;
    else
        return ;
    end;
end;
return {
    safelyCallDestroy = v146, 
    commitBeforeMutationLifeCycles = v153, 
    commitResetTextContent = commitResetTextContent, 
    commitPlacement = v287, 
    commitDeletion = v320, 
    commitWork = v334, 
    commitAttachRef = commitAttachRef, 
    commitDetachRef = commitDetachRef, 
    commitPassiveUnmount = v360, 
    commitPassiveUnmountInsideDeletedTree = v363, 
    commitPassiveMount = v368, 
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV, 
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV, 
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV, 
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV, 
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden, 
    recursivelyCommitLayoutEffects = v180
};
