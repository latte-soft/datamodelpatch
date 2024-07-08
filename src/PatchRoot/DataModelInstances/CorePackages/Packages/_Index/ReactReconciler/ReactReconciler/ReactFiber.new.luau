local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Array_0 = v2.Array;
local l_inspect_0 = v2.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v9 = require(script.Parent.ReactRootTags);
local v10 = require(script.Parent.ReactWorkTags);
local v11 = require(script.Parent.ReactTypeOfMode);
local v12 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableProfilerTimer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableProfilerTimer;
local v17 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v17.NoFlags;
local l_Placement_0 = v17.Placement;
local l_StaticMask_0 = v17.StaticMask;
local l_ConcurrentRoot_0 = v9.ConcurrentRoot;
local l_BlockingRoot_0 = v9.BlockingRoot;
local l_IndeterminateComponent_0 = v10.IndeterminateComponent;
local l_ClassComponent_0 = v10.ClassComponent;
local l_HostRoot_0 = v10.HostRoot;
local l_HostComponent_0 = v10.HostComponent;
local l_HostText_0 = v10.HostText;
local l_HostPortal_0 = v10.HostPortal;
local l_ForwardRef_0 = v10.ForwardRef;
local l_Fragment_0 = v10.Fragment;
local l_Mode_0 = v10.Mode;
local l_ContextProvider_0 = v10.ContextProvider;
local l_ContextConsumer_0 = v10.ContextConsumer;
local l_Profiler_0 = v10.Profiler;
local l_SuspenseComponent_0 = v10.SuspenseComponent;
local l_SuspenseListComponent_0 = v10.SuspenseListComponent;
local l_DehydratedFragment_0 = v10.DehydratedFragment;
local l_FunctionComponent_0 = v10.FunctionComponent;
local l_MemoComponent_0 = v10.MemoComponent;
local l_SimpleMemoComponent_0 = v10.SimpleMemoComponent;
local l_LazyComponent_0 = v10.LazyComponent;
local l_FundamentalComponent_0 = v10.FundamentalComponent;
local l_ScopeComponent_0 = v10.ScopeComponent;
local l_OffscreenComponent_0 = v10.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v10.LegacyHiddenComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_isDevToolsPresent_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).isDevToolsPresent;
local v48 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveClassForHotReloading_0 = v48.resolveClassForHotReloading;
local l_resolveFunctionForHotReloading_0 = v48.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v48.resolveForwardRefForHotReloading;
local l_NoLanes_0 = v12.NoLanes;
local l_NoMode_0 = v11.NoMode;
local l_ConcurrentMode_0 = v11.ConcurrentMode;
local l_DebugTracingMode_0 = v11.DebugTracingMode;
local l_ProfileMode_0 = v11.ProfileMode;
local l_StrictMode_0 = v11.StrictMode;
local l_BlockingMode_0 = v11.BlockingMode;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_DEBUG_TRACING_MODE_TYPE_0 = l_ReactSymbols_0.REACT_DEBUG_TRACING_MODE_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = l_ReactSymbols_0.REACT_STRICT_MODE_TYPE;
local l_REACT_PROFILER_TYPE_0 = l_ReactSymbols_0.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_OFFSCREEN_TYPE_0 = l_ReactSymbols_0.REACT_OFFSCREEN_TYPE;
local l_REACT_LEGACY_HIDDEN_TYPE_0 = l_ReactSymbols_0.REACT_LEGACY_HIDDEN_TYPE;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = 1;
local function v92(v83, v84, v85, v86, v87, v88, v89, v90)
    local v91 = {
        tag = v83, 
        key = v85, 
        elementType = v87, 
        type = v88, 
        stateNode = v89, 
        index = 1, 
        pendingProps = v84, 
        mode = v86, 
        flags = l_NoFlags_0, 
        subtreeFlags = l_NoFlags_0, 
        lanes = v90 or l_NoLanes_0, 
        childLanes = l_NoLanes_0
    };
    if l_enableProfilerTimer_0 then
        v91.actualDuration = 0;
        v91.actualStartTime = -1;
        v91.selfBaseDuration = 0;
        v91.treeBaseDuration = 0;
    end;
    if l___DEV___0 then
        v91._debugID = v82;
        v82 = v82 + 1;
        v91._debugSource = nil;
        v91._debugOwner = nil;
        v91._debugNeedsRemount = false;
        v91._debugHookTypes = nil;
    end;
    return v91;
end;
_shouldConstruct = function(v93)
    local v94 = false;
    if type(v93) ~= "function" then
        v94 = not not v93.isReactComponent;
    end;
    return v94;
end;
local function v96(v95)
    return type(v95) == "function";
end;
local function v100(v97)
    local v98 = typeof(v97);
    if v98 == "function" then
        return l_FunctionComponent_0;
    else
        if v98 == "table" then
            if not v97.isReactComponent then
                local v99 = v97["$$typeof"];
                if v99 == l_REACT_FORWARD_REF_TYPE_0 then
                    return l_ForwardRef_0;
                elseif v99 == l_REACT_MEMO_TYPE_0 then
                    return l_MemoComponent_0;
                end;
            else
                return l_ClassComponent_0;
            end;
        end;
        return l_IndeterminateComponent_0;
    end;
end;
local function v105(v101, v102)
    local l_alternate_0 = v101.alternate;
    if l_alternate_0 == nil then
        l_alternate_0 = v92(v101.tag, v102, v101.key, v101.mode, v101.elementType, v101.type, v101.stateNode);
        if l___DEV___0 then
            l_alternate_0._debugID = v101._debugID;
            l_alternate_0._debugSource = v101._debugSource;
            l_alternate_0._debugOwner = v101._debugOwner;
            l_alternate_0._debugHookTypes = v101._debugHookTypes;
        end;
        l_alternate_0.alternate = v101;
        v101.alternate = l_alternate_0;
    else
        l_alternate_0.pendingProps = v102;
        l_alternate_0.type = v101.type;
        l_alternate_0.flags = l_NoFlags_0;
        l_alternate_0.subtreeFlags = l_NoFlags_0;
        l_alternate_0.deletions = nil;
        if l_enableProfilerTimer_0 then
            l_alternate_0.actualDuration = 0;
            l_alternate_0.actualStartTime = -1;
        end;
    end;
    l_alternate_0.flags = bit32.band(v101.flags, l_StaticMask_0);
    l_alternate_0.childLanes = v101.childLanes;
    l_alternate_0.lanes = v101.lanes;
    l_alternate_0.child = v101.child;
    l_alternate_0.memoizedProps = v101.memoizedProps;
    l_alternate_0.memoizedState = v101.memoizedState;
    l_alternate_0.updateQueue = v101.updateQueue;
    local l_dependencies_0 = v101.dependencies;
    if l_dependencies_0 == nil then
        l_alternate_0.dependencies = nil;
    else
        l_alternate_0.dependencies = {
            lanes = l_dependencies_0.lanes, 
            firstContext = l_dependencies_0.firstContext
        };
    end;
    l_alternate_0.sibling = v101.sibling;
    l_alternate_0.index = v101.index;
    l_alternate_0.ref = v101.ref;
    if l_enableProfilerTimer_0 then
        l_alternate_0.selfBaseDuration = v101.selfBaseDuration;
        l_alternate_0.treeBaseDuration = v101.treeBaseDuration;
    end;
    if l___DEV___0 then
        l_alternate_0._debugNeedsRemount = v101._debugNeedsRemount;
        if not (l_alternate_0.tag ~= l_IndeterminateComponent_0 and l_alternate_0.tag ~= l_FunctionComponent_0) or l_alternate_0.tag == l_SimpleMemoComponent_0 then
            l_alternate_0.type = l_resolveFunctionForHotReloading_0(v101.type);
            return l_alternate_0;
        elseif l_alternate_0.tag == l_ClassComponent_0 then
            l_alternate_0.type = l_resolveClassForHotReloading_0(v101.type);
            return l_alternate_0;
        elseif l_alternate_0.tag == l_ForwardRef_0 then
            l_alternate_0.type = l_resolveForwardRefForHotReloading_0(v101.type);
        end;
    end;
    return l_alternate_0;
end;
local function v110(v106, v107)
    v106.flags = bit32.band(v106.flags, (bit32.bor(l_StaticMask_0, l_Placement_0)));
    local l_alternate_1 = v106.alternate;
    if l_alternate_1 == nil then
        v106.childLanes = l_NoLanes_0;
        v106.lanes = v107;
        v106.child = nil;
        v106.subtreeFlags = l_NoFlags_0;
        v106.memoizedProps = nil;
        v106.memoizedState = nil;
        v106.updateQueue = nil;
        v106.dependencies = nil;
        v106.stateNode = nil;
        if l_enableProfilerTimer_0 then
            v106.selfBaseDuration = 0;
            v106.treeBaseDuration = 0;
            return v106;
        end;
    else
        v106.childLanes = l_alternate_1.childLanes;
        v106.lanes = l_alternate_1.lanes;
        v106.child = l_alternate_1.child;
        v106.subtreeFlags = l_alternate_1.subtreeFlags;
        v106.deletions = nil;
        v106.memoizedProps = l_alternate_1.memoizedProps;
        v106.memoizedState = l_alternate_1.memoizedState;
        v106.updateQueue = l_alternate_1.updateQueue;
        v106.type = l_alternate_1.type;
        local l_dependencies_1 = l_alternate_1.dependencies;
        if l_dependencies_1 == nil then
            v106.dependencies = nil;
        else
            v106.dependencies = {
                lanes = l_dependencies_1.lanes, 
                firstContext = l_dependencies_1.firstContext
            };
        end;
        if l_enableProfilerTimer_0 then
            v106.selfBaseDuration = l_alternate_1.selfBaseDuration;
            v106.treeBaseDuration = l_alternate_1.treeBaseDuration;
        end;
    end;
    return v106;
end;
local function v113(v111)
    local v112 = nil;
    v112 = if v111 == l_ConcurrentRoot_0 then bit32.bor(l_ConcurrentMode_0, l_BlockingMode_0, l_StrictMode_0) else if v111 == l_BlockingRoot_0 then bit32.bor(l_BlockingMode_0, l_StrictMode_0) else l_NoMode_0;
    if not (not l_enableProfilerTimer_0 or not l_isDevToolsPresent_0()) then
        v112 = bit32.bor(v112, l_ProfileMode_0);
    end;
    return (v92(l_HostRoot_0, nil, nil, v112));
end;
local function v129(v114, v115, v116, v117, v118, v119)
    local l_l_IndeterminateComponent_0_0 = l_IndeterminateComponent_0;
    local l_v114_0 = v114;
    local v122 = type(v114);
    if v122 == "function" then
        if l___DEV___0 then
            l_v114_0 = l_resolveFunctionForHotReloading_0(l_v114_0);
        end;
    elseif not (v122 == "table") or not v114.isReactComponent then
        if v122 == "string" then
            l_l_IndeterminateComponent_0_0 = l_HostComponent_0;
        elseif v114 == l_REACT_FRAGMENT_TYPE_0 then
            return v76(v116.children, v118, v119, v115);
        elseif v114 == l_REACT_DEBUG_TRACING_MODE_TYPE_0 then
            l_l_IndeterminateComponent_0_0 = l_Mode_0;
            v118 = bit32.bor(v118, l_DebugTracingMode_0);
        elseif v114 == l_REACT_STRICT_MODE_TYPE_0 then
            l_l_IndeterminateComponent_0_0 = l_Mode_0;
            v118 = bit32.bor(v118, l_StrictMode_0);
        elseif v114 == l_REACT_PROFILER_TYPE_0 then
            return v75(v116, v118, v119, v115);
        elseif v114 == l_REACT_SUSPENSE_TYPE_0 then
            return v78(v116, v118, v119, v115);
        elseif v114 == l_REACT_OFFSCREEN_TYPE_0 then
            return v79(v116, v118, v119, v115);
        elseif v114 == l_REACT_LEGACY_HIDDEN_TYPE_0 then
            return v80(v116, v118, v119, v115);
        else
            local v123 = false;
            local v124 = nil;
            if v122 == "table" then
                v124 = v114["$$typeof"];
                if v124 == l_REACT_PROVIDER_TYPE_0 then
                    l_l_IndeterminateComponent_0_0 = l_ContextProvider_0;
                    v123 = true;
                elseif v124 == l_REACT_CONTEXT_TYPE_0 then
                    l_l_IndeterminateComponent_0_0 = l_ContextConsumer_0;
                    v123 = true;
                elseif v124 == l_REACT_FORWARD_REF_TYPE_0 then
                    l_l_IndeterminateComponent_0_0 = l_ForwardRef_0;
                    if l___DEV___0 then
                        l_v114_0 = l_resolveForwardRefForHotReloading_0(l_v114_0);
                    end;
                    v123 = true;
                elseif v124 == l_REACT_MEMO_TYPE_0 then
                    l_l_IndeterminateComponent_0_0 = l_MemoComponent_0;
                    v123 = true;
                elseif v124 == l_REACT_LAZY_TYPE_0 then
                    l_l_IndeterminateComponent_0_0 = l_LazyComponent_0;
                    l_v114_0 = nil;
                    v123 = true;
                end;
            end;
            if not v123 then
                local v125 = "";
                if l___DEV___0 then
                    if not (v114 ~= nil) or v122 == "table" and #l_Object_0.keys(v114) == 0 then
                        v125 = v125 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and " .. "named imports.";
                    elseif v114 ~= nil and v122 == "table" then
                        v125 = v125 .. "\n" .. l_inspect_0(v114);
                    end;
                    local v126 = nil;
                    if v117 then
                        v126 = l_getComponentName_0(v117.type);
                    end;
                    if v126 ~= nil and v126 ~= "" then
                        v125 = v125 .. "\n\nCheck the render method of `" .. v126 .. "`.";
                    elseif v117 then
                        v125 = v125 .. "\n" .. l_inspect_0(v117);
                    end;
                end;
                local v127 = nil;
                if v114 == nil then
                    v127 = "nil";
                elseif not l_Array_0.isArray(v114) then
                    if v122 == "table" and v124 == l_REACT_ELEMENT_TYPE_0 then
                        v127 = string.format("<%s />", l_getComponentName_0(v114.type) or "Unknown");
                        v125 = " Did you accidentally export a JSX literal or Element instead of a component?";
                    else
                        v127 = v122;
                    end;
                else
                    v127 = "array";
                end;
                l_invariant_0(false, "Element type is invalid: expected a string (for built-in " .. "components) or a class/function (for composite components) " .. "but got: %s.%s", v127, v125);
            end;
        end;
    else
        l_l_IndeterminateComponent_0_0 = l_ClassComponent_0;
        if l___DEV___0 then
            l_v114_0 = l_resolveClassForHotReloading_0(l_v114_0);
        end;
    end;
    local v128 = v92(l_l_IndeterminateComponent_0_0, v116, v115, v118, v114, l_v114_0, nil, v119);
    if l___DEV___0 then
        v128._debugOwner = v117;
    end;
    return v128;
end;
local function v135(v130, v131, v132)
    local v133 = nil;
    if l___DEV___0 then
        v133 = v130._owner;
    end;
    local v134 = v129(v130.type, v130.key, v130.props, v133, v131, v132);
    if l___DEV___0 then
        v134._debugSource = v130._source;
        v134._debugOwner = v130._owner;
    end;
    return v134;
end;
v76 = function(v136, v137, v138, v139)
    return (v92(l_Fragment_0, v136, v139, v137, nil, nil, nil, v138));
end;
v77 = function(v140, v141, v142, v143, v144)
    return (v92(l_FundamentalComponent_0, v141, v144, v142, v140, v140, nil, v143));
end;
v74 = function(v145, v146, v147, v148, v149)
    return (v92(l_ScopeComponent_0, v146, v149, v147, v145, v145, nil, v148));
end;
v75 = function(v150, v151, v152, v153)
    if l___DEV___0 and typeof(v150.id) ~= "string" then
        l_console_0.error("Profiler must specify an \"id\" as a prop");
    end;
    return (v92(l_Profiler_0, v150, v153, bit32.bor(v151, l_ProfileMode_0), l_REACT_PROFILER_TYPE_0, l_REACT_PROFILER_TYPE_0, if not l_enableProfilerTimer_0 then nil else {
        effectDuration = 0, 
        passiveEffectDuration = 0
    }, v152));
end;
v78 = function(v154, v155, v156, v157)
    return (v92(l_SuspenseComponent_0, v154, v157, v155, l_REACT_SUSPENSE_TYPE_0, l_REACT_SUSPENSE_TYPE_0, nil, v156));
end;
v81 = function(v158, v159, v160, v161)
    return (v92(l_SuspenseListComponent_0, v158, v161, v159, l_REACT_SUSPENSE_LIST_TYPE_0, if not l___DEV___0 then nil else l_REACT_SUSPENSE_LIST_TYPE_0, nil, v160));
end;
v79 = function(v162, v163, v164, v165)
    return (v92(l_OffscreenComponent_0, v162, v165, v163, l_REACT_OFFSCREEN_TYPE_0, if not l___DEV___0 then nil else l_REACT_OFFSCREEN_TYPE_0, nil, v164));
end;
v80 = function(v166, v167, v168, v169)
    return (v92(l_LegacyHiddenComponent_0, v166, v169, v167, l_REACT_LEGACY_HIDDEN_TYPE_0, if not l___DEV___0 then nil else l_REACT_LEGACY_HIDDEN_TYPE_0, nil, v168));
end;
return {
    isSimpleFunctionComponent = v96, 
    resolveLazyComponentTag = v100, 
    createWorkInProgress = v105, 
    resetWorkInProgress = v110, 
    createHostRootFiber = v113, 
    createFiberFromTypeAndProps = v129, 
    createFiberFromElement = v135, 
    createFiberFromFragment = v76, 
    createFiberFromFundamental = v77, 
    createFiberFromSuspense = v78, 
    createFiberFromSuspenseList = v81, 
    createFiberFromOffscreen = v79, 
    createFiberFromLegacyHidden = v80, 
    createFiberFromText = function(v170, v171, v172)
        return (v92(l_HostText_0, v170, nil, v171, nil, nil, nil, v172));
    end, 
    createFiberFromHostInstanceForDeletion = function()
        return (v92(l_HostComponent_0, nil, nil, l_NoMode_0, "DELETED", "DELETED"));
    end, 
    createFiberFromDehydratedFragment = function(v173)
        return (v92(l_DehydratedFragment_0, nil, nil, l_NoMode_0, nil, nil, v173));
    end, 
    createFiberFromPortal = function(v174, v175, v176)
        return (v92(l_HostPortal_0, if v174.children ~= nil then v174.children else {}, v174.key, v175, nil, nil, {
            containerInfo = v174.containerInfo, 
            pendingChildren = nil, 
            implementation = v174.implementation
        }, v176));
    end, 
    assignFiberPropertiesInDEV = function(v177, v178)
        if v177 == nil then
            v177 = v92(l_IndeterminateComponent_0, nil, nil, l_NoMode_0);
        end;
        v177.tag = v178.tag;
        v177.key = v178.key;
        v177.elementType = v178.elementType;
        v177.type = v178.type;
        v177.stateNode = v178.stateNode;
        v177.return_ = v178.return_;
        v177.child = v178.child;
        v177.sibling = v178.sibling;
        v177.index = v178.index;
        v177.ref = v178.ref;
        v177.pendingProps = v178.pendingProps;
        v177.memoizedProps = v178.memoizedProps;
        v177.updateQueue = v178.updateQueue;
        v177.memoizedState = v178.memoizedState;
        v177.dependencies = v178.dependencies;
        v177.mode = v178.mode;
        v177.flags = v178.flags;
        v177.subtreeFlags = v178.subtreeFlags;
        v177.deletions = v178.deletions;
        v177.lanes = v178.lanes;
        v177.childLanes = v178.childLanes;
        v177.alternate = v178.alternate;
        if l_enableProfilerTimer_0 then
            v177.actualDuration = v178.actualDuration;
            v177.actualStartTime = v178.actualStartTime;
            v177.selfBaseDuration = v178.selfBaseDuration;
            v177.treeBaseDuration = v178.treeBaseDuration;
        end;
        v177._debugID = v178._debugID;
        v177._debugSource = v178._debugSource;
        v177._debugOwner = v178._debugOwner;
        v177._debugNeedsRemount = v178._debugNeedsRemount;
        v177._debugHookTypes = v178._debugHookTypes;
        return v177;
    end
};
