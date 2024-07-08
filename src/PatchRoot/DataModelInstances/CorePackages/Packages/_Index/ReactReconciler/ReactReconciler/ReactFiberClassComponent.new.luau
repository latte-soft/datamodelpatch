local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v5 = require(script.Parent.ReactFiberLane);
local v6 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v8 = require(l_Parent_0.React);
local v9 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v9.Update;
local l_Snapshot_0 = v9.Snapshot;
local l_MountLayoutDev_0 = v9.MountLayoutDev;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_warnAboutDeprecatedLifecycles_0 = l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v20 = require(script.Parent["ReactStrictModeWarnings.new"]);
local l_isMounted_0 = require(script.Parent.ReactFiberTreeReflection).isMounted;
local l_ReactInstanceMap_0 = require(l_Parent_0.Shared).ReactInstanceMap;
local l_get_0 = l_ReactInstanceMap_0.get;
local l_set_0 = l_ReactInstanceMap_0.set;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v33 = require(script.Parent.ReactTypeOfMode);
local l_DebugTracingMode_0 = v33.DebugTracingMode;
local l_StrictMode_0 = v33.StrictMode;
local l_enqueueUpdate_0 = v6.enqueueUpdate;
local l_processUpdateQueue_0 = v6.processUpdateQueue;
local l_checkHasForceUpdateAfterProcessing_0 = v6.checkHasForceUpdateAfterProcessing;
local l_resetHasForceUpdateBeforeProcessing_0 = v6.resetHasForceUpdateBeforeProcessing;
local l_createUpdate_0 = v6.createUpdate;
local l_ReplaceState_0 = v6.ReplaceState;
local l_ForceUpdate_0 = v6.ForceUpdate;
local l_initializeUpdateQueue_0 = v6.initializeUpdateQueue;
local l_cloneUpdateQueue_0 = v6.cloneUpdateQueue;
local l_NoLanes_0 = v5.NoLanes;
local v46 = require(script.Parent["ReactFiberContext.new"]);
local l_cacheContext_0 = v46.cacheContext;
local l_getMaskedContext_0 = v46.getMaskedContext;
local l_getUnmaskedContext_0 = v46.getUnmaskedContext;
local l_hasContextChanged_0 = v46.hasContextChanged;
local l_emptyContextObject_0 = v46.emptyContextObject;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v53 = require(script.Parent.DebugTracing);
local l_logForceUpdateScheduled_0 = v53.logForceUpdateScheduled;
local l_logStateUpdateScheduled_0 = v53.logStateUpdateScheduled;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v59 = require(script.Parent.SchedulingProfiler);
local l_markForceUpdateScheduled_0 = v59.markForceUpdateScheduled;
local l_markStateUpdateScheduled_0 = v59.markStateUpdateScheduled;
local v62 = {};
local l___refs_0 = v8.Component:extend("").__refs;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
if l___DEV___0 then
    v64 = {};
    v65 = {};
    v66 = {};
    v67 = {};
    v71 = {};
    v68 = {};
    v72 = {};
    v73 = {};
    local v74 = {};
    local l_v74_0 = v74 --[[ copy: 76 -> 85 ]];
    v70 = function(v76, v77)
        if not (v76 ~= nil) or type(v76) == "function" then
            return ;
        else
            local v78 = v77 .. "_" .. tostring(v76);
            if not l_v74_0[v78] then
                l_v74_0[v78] = true;
                l_console_0.error("%s(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", v77, (tostring(v76)));
            end;
            return ;
        end;
    end;
    v69 = function(_, _)
    end;
end;
local function v90(v81, v82, v83, v84)
    local l_memoizedState_0 = v81.memoizedState;
    if not (not l___DEV___0 or not l_debugRenderPhaseSideEffectsForStrictMode_0) and bit32.band(v81.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v86, v87 = xpcall(v83, l_describeError_0, v84, l_memoizedState_0);
        l_reenableLogs_0();
        if not v86 then
            error(v87);
        end;
    end;
    local v88 = v83(v84, l_memoizedState_0);
    if l___DEV___0 then
        v69(v82, v88);
    end;
    local v89 = if v88 == nil then l_memoizedState_0 else l_Object_0.assign({}, l_memoizedState_0, v88);
    v81.memoizedState = v89;
    if v81.lanes == l_NoLanes_0 then
        v81.updateQueue.baseState = v89;
    end;
end;
local v91 = nil;
local function v116()
    local v92 = require(script.Parent["ReactFiberWorkLoop.new"]);
    local l_requestEventTime_0 = v92.requestEventTime;
    local l_requestUpdateLane_0 = v92.requestUpdateLane;
    local l_scheduleUpdateOnFiber_0 = v92.scheduleUpdateOnFiber;
    v91 = {
        isMounted = l_isMounted_0, 
        enqueueSetState = function(v96, v97, v98)
            local v99 = l_get_0(v96);
            local v100 = l_requestEventTime_0();
            local v101 = l_requestUpdateLane_0(v99);
            local v102 = l_createUpdate_0(v100, v101, v97, v98);
            if not (not (v98 ~= nil) or not l___DEV___0) then
                v70(v98, "setState");
            end;
            l_enqueueUpdate_0(v99, v102);
            l_scheduleUpdateOnFiber_0(v99, v101, v100);
            if not (not l___DEV___0 or not l_enableDebugTracing_0) and bit32.band(v99.mode, l_DebugTracingMode_0) ~= 0 then
                l_logStateUpdateScheduled_0(l_getComponentName_0(v99.type) or "Unknown", v101, v97);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v99, v101);
            end;
        end, 
        enqueueReplaceState = function(v103, v104, v105)
            local v106 = l_get_0(v103);
            local v107 = l_requestEventTime_0();
            local v108 = l_requestUpdateLane_0(v106);
            local v109 = l_createUpdate_0(v107, v108, v104, v105);
            v109.tag = l_ReplaceState_0;
            if not (not (v105 ~= nil) or not l___DEV___0) then
                v70(v105, "replaceState");
            end;
            l_enqueueUpdate_0(v106, v109);
            l_scheduleUpdateOnFiber_0(v106, v108, v107);
            if not (not l___DEV___0 or not l_enableDebugTracing_0) and bit32.band(v106.mode, l_DebugTracingMode_0) ~= 0 then
                l_logStateUpdateScheduled_0(l_getComponentName_0(v106.type) or "Unknown", v108, v104);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v106, v108);
            end;
        end, 
        enqueueForceUpdate = function(v110, v111)
            local v112 = l_get_0(v110);
            local v113 = l_requestEventTime_0();
            local v114 = l_requestUpdateLane_0(v112);
            local v115 = l_createUpdate_0(v113, v114, nil, v111);
            v115.tag = l_ForceUpdate_0;
            if not (not (v111 ~= nil) or not l___DEV___0) then
                v70(v111, "forceUpdate");
            end;
            l_enqueueUpdate_0(v112, v115);
            l_scheduleUpdateOnFiber_0(v112, v114, v113);
            if not (not l___DEV___0 or not l_enableDebugTracing_0) and bit32.band(v112.mode, l_DebugTracingMode_0) ~= 0 then
                l_logForceUpdateScheduled_0(l_getComponentName_0(v112.type) or "Unknown", v114);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markForceUpdateScheduled_0(v112, v114);
            end;
        end
    };
end;
local function _()
    if v91 == nil then
        v116();
    end;
    return v91;
end;
checkShouldComponentUpdate = function(v118, v119, v120, v121, v122, v123, v124)
    local l_stateNode_0 = v118.stateNode;
    if l_stateNode_0.shouldComponentUpdate ~= nil and type(l_stateNode_0.shouldComponentUpdate) == "function" then
        if not (not l___DEV___0 or not l_debugRenderPhaseSideEffectsForStrictMode_0) and bit32.band(v118.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v126, v127 = xpcall(l_stateNode_0.shouldComponentUpdate, l_describeError_0, l_stateNode_0, v121, v123, v124);
            l_reenableLogs_0();
            if not v126 then
                error(v127);
            end;
        end;
        local v128 = l_stateNode_0:shouldComponentUpdate(v121, v123, v124);
        if l___DEV___0 and v128 == nil then
            l_console_0.error("%s.shouldComponentUpdate(): Returned nil instead of a " .. "boolean value. Make sure to return true or false.", l_getComponentName_0(v119) or "Component");
        end;
        return v128;
    elseif not (type(v119) == "table") or not v119.isPureReactComponent then
        return true;
    else
        return not l_shallowEqual_0(v120, v121) or not l_shallowEqual_0(v122, v123);
    end;
end;
local function v136(v129, v130, v131)
    local l_stateNode_1 = v129.stateNode;
    if l___DEV___0 then
        local v133 = l_getComponentName_0(v130) or "Component";
        if not l_stateNode_1.render then
            if type(v130.render) == "function" then
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: did you accidentally return an object from the constructor?", v133);
            else
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: you may have forgotten to define `render`.", v133);
            end;
        end;
        if not ((not l_stateNode_1.getInitialState or l_stateNode_1.getInitialState.isReactClassApproved) or l_stateNode_1.state) then
            l_console_0.error("getInitialState was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Did you mean to define a state property instead?", v133);
        end;
        if not (not l_stateNode_1.getDefaultProps or l_stateNode_1.getDefaultProps.isReactClassApproved) then
            l_console_0.error("getDefaultProps was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Use a static property to define defaultProps instead.", v133);
        end;
        if not (not l_stateNode_1.propTypes or v130.propTypes) then
            l_console_0.error("propTypes was defined as an instance property on %s. Use a static " .. "property to define propTypes instead.", v133);
        end;
        if not (not l_stateNode_1.contextType or v130.contextType) then
            l_console_0.error("contextType was defined as an instance property on %s. Use a static " .. "property to define contextType instead.", v133);
        end;
        if not l_disableLegacyContext_0 then
            if not (not l_stateNode_1.contextTypes or v130.contextTypes) then
                l_console_0.error("contextTypes was defined as an instance property on %s. Use a static " .. "property to define contextTypes instead.", v133);
            end;
            if not (((not (type(v130) == "table") or not v130.contextType) or not v130.contextTypes) or v72[v130]) then
                v72[v130] = true;
                l_console_0.error("%s declares both contextTypes and contextType static properties. " .. "The legacy contextTypes property will be ignored.", v133);
            end;
        else
            if v130.childContextTypes then
                l_console_0.error("%s uses the legacy childContextTypes API which is no longer supported. " .. "Use React.createContext() instead.", v133);
            end;
            if v130.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with static contextType instead.", v133);
            end;
        end;
        if type(l_stateNode_1.componentShouldUpdate) == "function" then
            l_console_0.error("%s has a method called " .. "componentShouldUpdate(). Did you mean shouldComponentUpdate()? " .. "The name is phrased as a question because the function is " .. "expected to return a value.", v133);
        end;
        if not (not (type(v130) == "table") or not v130.isPureReactComponent) and l_stateNode_1.shouldComponentUpdate ~= nil then
            l_console_0.error("%s has a method called shouldComponentUpdate(). " .. "shouldComponentUpdate should not be used when extending React.PureComponent. " .. "Please extend React.Component if shouldComponentUpdate is used.", l_getComponentName_0(v130) or "A pure component");
        end;
        if type(l_stateNode_1.componentDidUnmount) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidUnmount(). But there is no such lifecycle method. " .. "Did you mean componentWillUnmount()?", v133);
        end;
        if type(l_stateNode_1.componentDidReceiveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidReceiveProps(). But there is no such lifecycle method. " .. "If you meant to update the state in response to changing props, " .. "use componentWillReceiveProps(). If you meant to fetch data or " .. "run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v133);
        end;
        if type(l_stateNode_1.componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v133);
        end;
        if type(l_stateNode_1.UNSAFE_componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v133);
        end;
        local v134 = l_stateNode_1.props ~= v131;
        if not (not (l_stateNode_1.props ~= nil) or not v134) then
            l_console_0.error("%s(...): When calling super() in `%s`, make sure to pass " .. "up the same props that your component's constructor was passed.", v133, v133);
        end;
        if rawget(l_stateNode_1, "defaultProps") then
            l_console_0.error("Setting defaultProps as an instance property on %s is not supported and will be ignored." .. " Instead, define defaultProps as a static property on %s.", v133, v133);
        end;
        if not (not (type(l_stateNode_1.getSnapshotBeforeUpdate) == "function" and type(l_stateNode_1.componentDidUpdate) ~= "function") or v66[v130]) then
            v66[v130] = true;
            l_console_0.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). " .. "This component defines getSnapshotBeforeUpdate() only.", l_getComponentName_0(v130));
        end;
        local l_state_0 = l_stateNode_1.state;
        if l_state_0 ~= nil and type(l_state_0) ~= "table" then
            l_console_0.error("%s.state: must be set to an object or nil", v133);
        end;
        if (type(v130) == "table" and type(l_stateNode_1.getChildContext) == "function") and type(v130.childContextTypes) ~= "table" then
            l_console_0.error("%s.getChildContext(): childContextTypes must be defined in order to " .. "use getChildContext().", v133);
        end;
    end;
end;
local function v139(v137, v138)
    if v91 == nil then
        v116();
    end;
    v138.__updater = v91;
    v137.stateNode = v138;
    l_set_0(v138, v137);
    if l___DEV___0 then
        v138._reactInternalInstance = v62;
    end;
end;
local function v164(v140, v141, v142)
    local v143 = false;
    local l_l_emptyContextObject_0_0 = l_emptyContextObject_0;
    local l_l_emptyContextObject_0_1 = l_emptyContextObject_0;
    local l_contextType_0 = v141.contextType;
    if l___DEV___0 and v141.contextType ~= nil then
        local v147 = true;
        if l_contextType_0 ~= nil then
            v147 = false;
            if l_contextType_0["$$typeof"] == l_REACT_CONTEXT_TYPE_0 then
                v147 = l_contextType_0._context == nil;
            end;
        end;
        if not (v147 or v73[v141]) then
            v73[v141] = true;
            local v148 = "";
            if l_contextType_0 == nil then
                v148 = " However, it is set to nil. " .. "This can be caused by a typo or by mixing up named and default imports. " .. "This can also happen due to a circular dependency, so " .. "try moving the createContext() call to a separate file.";
            elseif type(l_contextType_0) ~= "table" then
                v148 = " However, it is set to a " .. type(l_contextType_0) .. ".";
            elseif l_contextType_0["$$typeof"] == l_REACT_PROVIDER_TYPE_0 then
                v148 = " Did you accidentally pass the Context.Provider instead?";
            elseif l_contextType_0._context ~= nil then
                v148 = " Did you accidentally pass the Context.Consumer instead?";
            else
                v148 = v148 .. " However, it is set to an object with keys {";
                for v149, _ in l_contextType_0, nil, nil do
                    v148 = v148 .. v149 .. ", ";
                end;
                v148 = v148 .. "}.";
            end;
            l_console_0.error("%s defines an invalid contextType. " .. "contextType should point to the Context object returned by React.createContext().%s", l_getComponentName_0(v141) or "Component", v148);
        end;
    end;
    if l_contextType_0 ~= nil and type(l_contextType_0) == "table" then
        l_l_emptyContextObject_0_1 = l_readContext_0(l_contextType_0);
    elseif not l_disableLegacyContext_0 then
        l_l_emptyContextObject_0_0 = l_getUnmaskedContext_0(v140, v141, true);
        v143 = v141.contextTypes ~= nil;
        l_l_emptyContextObject_0_1 = not not v143 and l_getMaskedContext_0(v140, l_l_emptyContextObject_0_0) or l_emptyContextObject_0;
    end;
    if not (not l___DEV___0 or not l_debugRenderPhaseSideEffectsForStrictMode_0) and bit32.band(v140.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v151, v152 = xpcall(v141.__ctor, l_describeError_0, v142, l_l_emptyContextObject_0_1);
        l_reenableLogs_0();
        if not v151 then
            error(v152);
        end;
    end;
    local v153 = v141.__ctor(v142, l_l_emptyContextObject_0_1);
    v140.memoizedState = v153.state;
    local l_memoizedState_1 = v140.memoizedState;
    if v91 == nil then
        v116();
    end;
    v153.__updater = v91;
    v140.stateNode = v153;
    l_set_0(v153, v140);
    if l___DEV___0 then
        v153._reactInternalInstance = v62;
    end;
    if l___DEV___0 then
        if type(v141.getDerivedStateFromProps) == "function" and l_memoizedState_1 == l_UninitializedState_0 then
            local v155 = l_getComponentName_0(v141) or "Component";
            if not v65[v155] then
                v65[v155] = true;
                l_console_0.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. " .. "This is not recommended. Instead, define the initial state by " .. "passing an object to `self:setState` in the `init` method of `%s`. " .. "This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v155, v155);
            end;
        end;
        if not (type(v141.getDerivedStateFromProps) ~= "function") or type(v153.getSnapshotBeforeUpdate) == "function" then
            local v156 = nil;
            local v157 = nil;
            local v158 = nil;
            if type(v153.componentWillMount) == "function" then
                v156 = "componentWillMount";
            elseif type(v153.UNSAFE_componentWillMount) == "function" then
                v156 = "UNSAFE_componentWillMount";
            end;
            if type(v153.componentWillReceiveProps) == "function" then
                v157 = "componentWillReceiveProps";
            elseif type(v153.UNSAFE_componentWillReceiveProps) == "function" then
                v157 = "UNSAFE_componentWillReceiveProps";
            end;
            if type(v153.componentWillUpdate) == "function" then
                v158 = "componentWillUpdate";
            elseif type(v153.UNSAFE_componentWillUpdate) == "function" then
                v158 = "UNSAFE_componentWillUpdate";
            end;
            if not (v156 == nil and v157 == nil) or v158 ~= nil then
                local v159 = l_getComponentName_0(v141) or "Component";
                local v160 = nil;
                v160 = type(v141.getDerivedStateFromProps) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()";
                local v161 = nil;
                v161 = if v156 ~= nil then "\n  " .. tostring(v156) else "";
                local v162 = nil;
                v162 = if v157 ~= nil then "\n  " .. tostring(v157) else "";
                local v163 = nil;
                v163 = if v158 ~= nil then "\n  " .. tostring(v158) else "";
                if not v67[v159] then
                    v67[v159] = true;
                    l_console_0.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n" .. "%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\n" .. "The above lifecycles should be removed. Learn more about this warning here:\n" .. "https://reactjs.org/link/unsafe-component-lifecycles", v159, v160, v161, v162, v163);
                end;
            end;
        end;
    end;
    if v143 then
        l_cacheContext_0(v140, l_l_emptyContextObject_0_0, l_l_emptyContextObject_0_1);
    end;
    return v153;
end;
local function v168(v165, v166)
    local l_state_1 = v166.state;
    if v166.componentWillMount ~= nil and type(v166.componentWillMount) == "function" then
        v166:componentWillMount();
    end;
    if v166.UNSAFE_componentWillMount ~= nil and type(v166.UNSAFE_componentWillMount) == "function" then
        v166:UNSAFE_componentWillMount();
    end;
    if l_state_1 ~= v166.state then
        if l___DEV___0 then
            l_console_0.error("%s.componentWillMount(): Assigning directly to this.state is " .. "deprecated (except inside a component's " .. "constructor). Use setState instead.", l_getComponentName_0(v165.type) or "Component");
        end;
        if v91 == nil then
            v116();
        end;
        v91.enqueueReplaceState(v166, v166.state);
    end;
end;
callComponentWillReceiveProps = function(v169, v170, v171, v172)
    local l_state_2 = v170.state;
    if v170.componentWillReceiveProps ~= nil and type(v170.componentWillReceiveProps) == "function" then
        v170:componentWillReceiveProps(v171, v172);
    end;
    if v170.UNSAFE_componentWillReceiveProps ~= nil and type(v170.UNSAFE_componentWillReceiveProps) == "function" then
        v170:UNSAFE_componentWillReceiveProps(v171, v172);
    end;
    if v170.state ~= l_state_2 then
        if l___DEV___0 then
            local v174 = l_getComponentName_0(v169.type) or "Component";
            if not v64[v174] then
                v64[v174] = true;
                l_console_0.error("%s.componentWillReceiveProps(): Assigning directly to " .. "this.state is deprecated (except inside a component's " .. "constructor). Use setState instead.", v174);
            end;
        end;
        if v91 == nil then
            v116();
        end;
        v91.enqueueReplaceState(v170, v170.state);
    end;
end;
local function v184(v175, v176, v177, v178)
    if l___DEV___0 then
        v136(v175, v176, v177);
    end;
    local l_stateNode_2 = v175.stateNode;
    l_stateNode_2.props = v177;
    l_stateNode_2.state = v175.memoizedState;
    l_stateNode_2.__refs = l___refs_0;
    l_initializeUpdateQueue_0(v175);
    local v180 = nil;
    if type(v176) == "table" then
        v180 = v176.contextType;
    end;
    if v180 ~= nil and type(v180) == "table" then
        l_stateNode_2.context = l_readContext_0(v180);
    elseif not l_disableLegacyContext_0 then
        l_stateNode_2.context = l_getMaskedContext_0(v175, (l_getUnmaskedContext_0(v175, v176, true)));
    else
        l_stateNode_2.context = l_emptyContextObject_0;
    end;
    if l___DEV___0 then
        if l_stateNode_2.state == v177 then
            local v181 = l_getComponentName_0(v176) or "Component";
            if not v71[v181] then
                v71[v181] = true;
                l_console_0.error("%s: It is not recommended to assign props directly to state " .. "because updates to props won't be reflected in state. " .. "In most cases, it is better to use props directly.", v181);
            end;
        end;
        if bit32.band(v175.mode, l_StrictMode_0) ~= 0 then
            v20.recordLegacyContextWarning(v175, l_stateNode_2);
        end;
        if l_warnAboutDeprecatedLifecycles_0 then
            v20.recordUnsafeLifecycleWarnings(v175, l_stateNode_2);
        end;
    end;
    l_processUpdateQueue_0(v175, v177, l_stateNode_2, v178);
    l_stateNode_2.state = v175.memoizedState;
    local v182 = type(v176);
    local v183 = nil;
    if type(v176) == "table" then
        v183 = v176.getDerivedStateFromProps;
    end;
    if v183 ~= nil and type(v183) == "function" then
        v90(v175, v176, v183, v177);
        l_stateNode_2.state = v175.memoizedState;
    end;
    if ((v182 == "table" and type(v176.getDerivedStateFromProps) ~= "function") and type(l_stateNode_2.getSnapshotBeforeUpdate) ~= "function") and (not (type(l_stateNode_2.UNSAFE_componentWillMount) ~= "function") or type(l_stateNode_2.componentWillMount) == "function") then
        v168(v175, l_stateNode_2);
        l_processUpdateQueue_0(v175, v177, l_stateNode_2, v178);
        l_stateNode_2.state = v175.memoizedState;
    end;
    if type(l_stateNode_2.componentDidMount) == "function" then
        if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
            v175.flags = bit32.bor(v175.flags, l_Update_0);
        else
            v175.flags = bit32.bor(v175.flags, (bit32.bor(l_MountLayoutDev_0, l_Update_0)));
            return ;
        end;
    end;
end;
resumeMountClassInstance = function(v185, v186, v187, v188)
    local l_stateNode_3 = v185.stateNode;
    local l_memoizedProps_0 = v185.memoizedProps;
    l_stateNode_3.props = l_memoizedProps_0;
    local l_context_0 = l_stateNode_3.context;
    local l_contextType_1 = v186.contextType;
    local l_l_emptyContextObject_0_2 = l_emptyContextObject_0;
    if l_contextType_1 ~= nil and type(l_contextType_1) == "table" then
        l_l_emptyContextObject_0_2 = l_readContext_0(l_contextType_1);
    elseif not l_disableLegacyContext_0 then
        l_l_emptyContextObject_0_2 = l_getMaskedContext_0(v185, (l_getUnmaskedContext_0(v185, v186, true)));
    end;
    local l_getDerivedStateFromProps_0 = v186.getDerivedStateFromProps;
    local v195 = true;
    if type(l_getDerivedStateFromProps_0) ~= "function" then
        v195 = type(l_stateNode_3.getSnapshotBeforeUpdate) == "function";
    end;
    if (not v195 and (not (type(l_stateNode_3.UNSAFE_componentWillReceiveProps) ~= "function") or type(l_stateNode_3.componentWillReceiveProps) == "function")) and (not (l_memoizedProps_0 == v187) or l_context_0 ~= l_l_emptyContextObject_0_2) then
        callComponentWillReceiveProps(v185, l_stateNode_3, v187, l_l_emptyContextObject_0_2);
    end;
    l_resetHasForceUpdateBeforeProcessing_0();
    local l_memoizedState_2 = v185.memoizedState;
    l_stateNode_3.state = l_memoizedState_2;
    local l_l_memoizedState_2_0 = l_memoizedState_2;
    l_processUpdateQueue_0(v185, v187, l_stateNode_3, v188);
    l_l_memoizedState_2_0 = v185.memoizedState;
    if (not (l_memoizedProps_0 == v187 and l_memoizedState_2 == l_l_memoizedState_2_0) or l_hasContextChanged_0()) or l_checkHasForceUpdateAfterProcessing_0() then
        if l_getDerivedStateFromProps_0 ~= nil and type(l_getDerivedStateFromProps_0) == "function" then
            v90(v185, v186, l_getDerivedStateFromProps_0, v187);
            l_l_memoizedState_2_0 = v185.memoizedState;
        end;
        local v198 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v185, v186, l_memoizedProps_0, v187, l_memoizedState_2, l_l_memoizedState_2_0, l_l_emptyContextObject_0_2);
        if not v198 then
            if type(l_stateNode_3.componentDidMount) == "function" then
                if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
                    v185.flags = bit32.bor(v185.flags, l_Update_0);
                else
                    v185.flags = bit32.bor(v185.flags, l_MountLayoutDev_0, l_Update_0);
                end;
            end;
            v185.memoizedProps = v187;
            v185.memoizedState = l_l_memoizedState_2_0;
        else
            if not v195 and (not (type(l_stateNode_3.UNSAFE_componentWillMount) ~= "function") or type(l_stateNode_3.componentWillMount) == "function") then
                if type(l_stateNode_3.componentWillMount) == "function" then
                    l_stateNode_3:componentWillMount();
                end;
                if type(l_stateNode_3.UNSAFE_componentWillMount) == "function" then
                    l_stateNode_3:UNSAFE_componentWillMount();
                end;
            end;
            if type(l_stateNode_3.componentDidMount) == "function" then
                if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
                    v185.flags = bit32.bor(v185.flags, l_Update_0);
                else
                    v185.flags = bit32.bor(v185.flags, l_MountLayoutDev_0, l_Update_0);
                end;
            end;
        end;
        l_stateNode_3.props = v187;
        l_stateNode_3.state = l_l_memoizedState_2_0;
        l_stateNode_3.context = l_l_emptyContextObject_0_2;
        return v198;
    else
        if type(l_stateNode_3.componentDidMount) == "function" then
            if not l___DEV___0 or not l_enableDoubleInvokingEffects_0 then
                v185.flags = bit32.bor(v185.flags, l_Update_0);
            else
                v185.flags = bit32.bor(v185.flags, l_MountLayoutDev_0, l_Update_0);
            end;
        end;
        return false;
    end;
end;
return {
    adoptClassInstance = v139, 
    constructClassInstance = v164, 
    mountClassInstance = v184, 
    resumeMountClassInstance = resumeMountClassInstance, 
    updateClassInstance = function(v199, v200, v201, v202, v203)
        local l_stateNode_4 = v200.stateNode;
        l_cloneUpdateQueue_0(v199, v200);
        local l_memoizedProps_1 = v200.memoizedProps;
        local v206 = if v200.type == v200.elementType then l_memoizedProps_1 else l_resolveDefaultProps_0(v200.type, l_memoizedProps_1);
        l_stateNode_4.props = v206;
        local l_pendingProps_0 = v200.pendingProps;
        local l_context_1 = l_stateNode_4.context;
        local v209 = nil;
        local v210 = nil;
        if type(v201) == "table" then
            v209 = v201.contextType;
            v210 = v201.getDerivedStateFromProps;
        end;
        local l_l_emptyContextObject_0_3 = l_emptyContextObject_0;
        if type(v209) == "table" then
            l_l_emptyContextObject_0_3 = l_readContext_0(v209);
        elseif not l_disableLegacyContext_0 then
            l_l_emptyContextObject_0_3 = l_getMaskedContext_0(v200, (l_getUnmaskedContext_0(v200, v201, true)));
        end;
        local v212;
        if v210 ~= nil then
            v212 = true;
            if not (type(v210) ~= "function") then
                goto label0;
            end;
        end;
        v212 = false;
        if l_stateNode_4.getSnapshotBeforeUpdate ~= nil then
            v212 = type(l_stateNode_4.getSnapshotBeforeUpdate) == "function";
        end;
        ::label0::;
        if (not v212 and (not (not (l_stateNode_4.UNSAFE_componentWillReceiveProps ~= nil) or type(l_stateNode_4.UNSAFE_componentWillReceiveProps) ~= "function") or l_stateNode_4.componentWillReceiveProps ~= nil and type(l_stateNode_4.componentWillReceiveProps) == "function")) and (not (l_memoizedProps_1 == l_pendingProps_0) or l_context_1 ~= l_l_emptyContextObject_0_3) then
            callComponentWillReceiveProps(v200, l_stateNode_4, v202, l_l_emptyContextObject_0_3);
        end;
        l_resetHasForceUpdateBeforeProcessing_0();
        local l_memoizedState_3 = v200.memoizedState;
        l_stateNode_4.state = l_memoizedState_3;
        local l_state_3 = l_stateNode_4.state;
        l_processUpdateQueue_0(v200, v202, l_stateNode_4, v203);
        l_state_3 = v200.memoizedState;
        if (not (l_memoizedProps_1 == l_pendingProps_0 and l_memoizedState_3 == l_state_3) or l_hasContextChanged_0()) or l_checkHasForceUpdateAfterProcessing_0() then
            if v210 ~= nil and type(v210) == "function" then
                v90(v200, v201, v210, v202);
                l_state_3 = v200.memoizedState;
            end;
            local v215 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v200, v201, v206, v202, l_memoizedState_3, l_state_3, l_l_emptyContextObject_0_3);
            if not v215 then
                if (l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function") and (not (l_memoizedProps_1 == v199.memoizedProps) or l_memoizedState_3 ~= v199.memoizedState) then
                    v200.flags = bit32.bor(v200.flags, l_Update_0);
                end;
                if (l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function") and (not (l_memoizedProps_1 == v199.memoizedProps) or l_memoizedState_3 ~= v199.memoizedState) then
                    v200.flags = bit32.bor(v200.flags, l_Snapshot_0);
                end;
                v200.memoizedProps = v202;
                v200.memoizedState = l_state_3;
            else
                if not v212 and (not (not (l_stateNode_4.UNSAFE_componentWillUpdate ~= nil) or type(l_stateNode_4.UNSAFE_componentWillUpdate) ~= "function") or l_stateNode_4.componentWillUpdate ~= nil and type(l_stateNode_4.componentWillUpdate) == "function") then
                    if l_stateNode_4.componentWillUpdate ~= nil and type(l_stateNode_4.componentWillUpdate) == "function" then
                        l_stateNode_4:componentWillUpdate(v202, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                    if l_stateNode_4.UNSAFE_componentWillUpdate ~= nil and type(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" then
                        l_stateNode_4:UNSAFE_componentWillUpdate(v202, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                end;
                if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" then
                    v200.flags = bit32.bor(v200.flags, l_Update_0);
                end;
                if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" then
                    v200.flags = bit32.bor(v200.flags, l_Snapshot_0);
                end;
            end;
            l_stateNode_4.props = v202;
            l_stateNode_4.state = l_state_3;
            l_stateNode_4.context = l_l_emptyContextObject_0_3;
            return v215;
        else
            if (l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function") and (not (l_memoizedProps_1 == v199.memoizedProps) or l_memoizedState_3 ~= v199.memoizedState) then
                v200.flags = bit32.bor(v200.flags, l_Update_0);
            end;
            if (l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function") and (not (l_memoizedProps_1 == v199.memoizedProps) or l_memoizedState_3 ~= v199.memoizedState) then
                v200.flags = bit32.bor(v200.flags, l_Snapshot_0);
            end;
            return false;
        end;
    end, 
    applyDerivedStateFromProps = v90, 
    emptyRefsObject = l___refs_0
};
