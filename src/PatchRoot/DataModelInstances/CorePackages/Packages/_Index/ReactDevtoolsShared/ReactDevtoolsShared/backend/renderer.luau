local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Shared);
local l_console_0 = v2.console;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_Number_0 = v1.Number;
local l_String_0 = v1.String;
local l__G_0 = _G;
local v12 = {};
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local v14 = require(script.Parent.Parent.types);
local l_ComponentFilterDisplayName_0 = v14.ComponentFilterDisplayName;
local l_ComponentFilterElementType_0 = v14.ComponentFilterElementType;
local l_ComponentFilterHOC_0 = v14.ComponentFilterHOC;
local l_ComponentFilterLocation_0 = v14.ComponentFilterLocation;
local l_ElementTypeClass_0 = v14.ElementTypeClass;
local l_ElementTypeContext_0 = v14.ElementTypeContext;
local l_ElementTypeFunction_0 = v14.ElementTypeFunction;
local l_ElementTypeForwardRef_0 = v14.ElementTypeForwardRef;
local l_ElementTypeHostComponent_0 = v14.ElementTypeHostComponent;
local l_ElementTypeMemo_0 = v14.ElementTypeMemo;
local l_ElementTypeOtherOrUnknown_0 = v14.ElementTypeOtherOrUnknown;
local l_ElementTypeProfiler_0 = v14.ElementTypeProfiler;
local l_ElementTypeRoot_0 = v14.ElementTypeRoot;
local l_ElementTypeSuspense_0 = v14.ElementTypeSuspense;
local l_ElementTypeSuspenseList_0 = v14.ElementTypeSuspenseList;
local v30 = require(script.Parent.Parent.utils);
local l_deletePathInObject_0 = v30.deletePathInObject;
local l_getDisplayName_0 = v30.getDisplayName;
local l_getDefaultComponentFilters_0 = v30.getDefaultComponentFilters;
local l_getInObject_0 = v30.getInObject;
local l_getUID_0 = v30.getUID;
local l_renamePathInObject_0 = v30.renamePathInObject;
local l_setInObject_0 = v30.setInObject;
local l_sessionStorageGetItem_0 = require(script.Parent.Parent.storage).sessionStorageGetItem;
local v39 = require(script.Parent.utils);
local l_cleanForBridge_0 = v39.cleanForBridge;
local l_copyToClipboard_0 = v39.copyToClipboard;
local l_copyWithDelete_0 = v39.copyWithDelete;
local l_copyWithRename_0 = v39.copyWithRename;
local l_copyWithSet_0 = v39.copyWithSet;
local v45 = require(script.Parent.Parent.constants);
local l___DEBUG___0 = v45.__DEBUG__;
local l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 = v45.SESSION_STORAGE_RELOAD_AND_PROFILE_KEY;
local l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 = v45.SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY;
local l_TREE_OPERATION_ADD_0 = v45.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v45.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v45.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v45.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local l_inspectHooksOfFiber_0 = require(l_Parent_0.ReactDebugTools).inspectHooksOfFiber;
local v54 = require(script.Parent.console);
local l_patch_0 = v54.patch;
local l_registerRenderer_0 = v54.registerRenderer;
local v57 = require(script.Parent.ReactSymbols);
local l_CONCURRENT_MODE_NUMBER_0 = v57.CONCURRENT_MODE_NUMBER;
local l_CONCURRENT_MODE_SYMBOL_STRING_0 = v57.CONCURRENT_MODE_SYMBOL_STRING;
local l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 = v57.DEPRECATED_ASYNC_MODE_SYMBOL_STRING;
local l_PROVIDER_NUMBER_0 = v57.PROVIDER_NUMBER;
local l_PROVIDER_SYMBOL_STRING_0 = v57.PROVIDER_SYMBOL_STRING;
local l_CONTEXT_NUMBER_0 = v57.CONTEXT_NUMBER;
local l_CONTEXT_SYMBOL_STRING_0 = v57.CONTEXT_SYMBOL_STRING;
local l_STRICT_MODE_NUMBER_0 = v57.STRICT_MODE_NUMBER;
local l_STRICT_MODE_SYMBOL_STRING_0 = v57.STRICT_MODE_SYMBOL_STRING;
local l_PROFILER_NUMBER_0 = v57.PROFILER_NUMBER;
local l_PROFILER_SYMBOL_STRING_0 = v57.PROFILER_SYMBOL_STRING;
local l_SCOPE_NUMBER_0 = v57.SCOPE_NUMBER;
local l_SCOPE_SYMBOL_STRING_0 = v57.SCOPE_SYMBOL_STRING;
local l_FORWARD_REF_NUMBER_0 = v57.FORWARD_REF_NUMBER;
local l_FORWARD_REF_SYMBOL_STRING_0 = v57.FORWARD_REF_SYMBOL_STRING;
local l_MEMO_NUMBER_0 = v57.MEMO_NUMBER;
local l_MEMO_SYMBOL_STRING_0 = v57.MEMO_SYMBOL_STRING;
local l_objectIs_0 = v2.objectIs;
local l_getNearestMountedFiber_0 = require(l_Parent_0.ReactReconciler)({}).getNearestMountedFiber;
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.devtools.views.Profiler.types);
local _ = require(script.Parent.Parent.types);
local function _(v81)
    if v81.flags ~= nil then
        return v81.flags;
    else
        return v81.effectTag;
    end;
end;
local function _()
    return os.clock();
end;
v12.getInternalReactConstants = function(_)
    local v85 = {
        NoFlags = 0, 
        PerformedWork = 1, 
        Placement = 2
    };
    local v86 = {
        ImmediatePriority = 99, 
        UserBlockingPriority = 98, 
        NormalPriority = 97, 
        LowPriority = 96, 
        IdlePriority = 95, 
        NoPriority = 90
    };
    local v87 = {
        Block = 22, 
        ClassComponent = 1, 
        ContextConsumer = 9, 
        ContextProvider = 10, 
        CoroutineComponent = -1, 
        CoroutineHandlerPhase = -1, 
        DehydratedSuspenseComponent = 18, 
        ForwardRef = 11, 
        Fragment = 7, 
        FunctionComponent = 0, 
        HostComponent = 5, 
        HostPortal = 4, 
        HostRoot = 3, 
        HostText = 6, 
        IncompleteClassComponent = 17, 
        IndeterminateComponent = 2, 
        LazyComponent = 16, 
        MemoComponent = 14, 
        Mode = 8, 
        OffscreenComponent = 23, 
        Profiler = 12, 
        SimpleMemoComponent = 15, 
        SuspenseComponent = 13, 
        SuspenseListComponent = 19, 
        YieldComponent = -1
    };
    local function v90(v88)
        local v89 = if typeof(v88) == "table" then v88["$$typeof"] else v88;
        if typeof(v89) == "table" then
            return (tostring(v89));
        else
            return v89;
        end;
    end;
    local l_ClassComponent_0 = v87.ClassComponent;
    local l_IncompleteClassComponent_0 = v87.IncompleteClassComponent;
    local l_FunctionComponent_0 = v87.FunctionComponent;
    local l_IndeterminateComponent_0 = v87.IndeterminateComponent;
    local l_ForwardRef_0 = v87.ForwardRef;
    local l_HostRoot_0 = v87.HostRoot;
    local l_HostComponent_0 = v87.HostComponent;
    local l_HostPortal_0 = v87.HostPortal;
    local l_HostText_0 = v87.HostText;
    local l_Fragment_0 = v87.Fragment;
    local l_MemoComponent_0 = v87.MemoComponent;
    local l_SimpleMemoComponent_0 = v87.SimpleMemoComponent;
    local l_SuspenseComponent_0 = v87.SuspenseComponent;
    local l_SuspenseListComponent_0 = v87.SuspenseListComponent;
    local function v105(v106)
        local v107 = if typeof(v106) == "table" then v106["$$typeof"] else v106;
        local v108 = if typeof(v107) == "table" then tostring(v107) else v107;
        if not (v108 ~= l_MEMO_NUMBER_0) or v108 == l_MEMO_SYMBOL_STRING_0 then
            return v105(v106.type);
        elseif not (v108 ~= l_FORWARD_REF_NUMBER_0) or v108 == l_FORWARD_REF_SYMBOL_STRING_0 then
            return v106.render;
        else
            return v106;
        end;
    end;
    return {
        getDisplayNameForFiber = function(v109)
            local l_type_0 = v109.type;
            local l_tag_0 = v109.tag;
            local l_l_type_0_0 = l_type_0;
            if typeof(l_type_0) == "table" and l_type_0 ~= nil then
                local v113 = if typeof(l_type_0) == "table" then l_type_0["$$typeof"] else l_type_0;
                local v114 = if typeof(v113) == "table" then tostring(v113) else v113;
                l_l_type_0_0 = if not (v114 ~= l_MEMO_NUMBER_0) or v114 == l_MEMO_SYMBOL_STRING_0 then v105(l_type_0.type) else if not (v114 ~= l_FORWARD_REF_NUMBER_0) or v114 == l_FORWARD_REF_SYMBOL_STRING_0 then l_type_0.render else l_type_0;
            end;
            local _ = nil;
            if not (l_tag_0 ~= l_ClassComponent_0) or l_tag_0 == l_IncompleteClassComponent_0 then
                return l_getDisplayName_0(l_l_type_0_0);
            elseif not (l_tag_0 ~= l_FunctionComponent_0) or l_tag_0 == l_IndeterminateComponent_0 then
                return l_getDisplayName_0(l_l_type_0_0);
            elseif l_tag_0 == l_ForwardRef_0 then
                return not not l_type_0 and l_type_0.displayName or l_getDisplayName_0(l_l_type_0_0, "Anonymous");
            elseif l_tag_0 == l_HostRoot_0 then
                return nil;
            elseif l_tag_0 == l_HostComponent_0 then
                return l_type_0;
            elseif not (l_tag_0 ~= l_HostPortal_0 and l_tag_0 ~= l_HostText_0) or l_tag_0 == l_Fragment_0 then
                return nil;
            elseif not (l_tag_0 ~= l_MemoComponent_0) or l_tag_0 == l_SimpleMemoComponent_0 then
                return l_getDisplayName_0(l_l_type_0_0, "Anonymous");
            elseif l_tag_0 == l_SuspenseComponent_0 then
                return "Suspense";
            elseif l_tag_0 == l_SuspenseListComponent_0 then
                return "SuspenseList";
            else
                local v116 = if typeof(l_type_0) == "table" then l_type_0["$$typeof"] else l_type_0;
                local v117 = if typeof(v116) == "table" then tostring(v116) else v116;
                if not (v117 ~= l_CONCURRENT_MODE_NUMBER_0 and v117 ~= l_CONCURRENT_MODE_SYMBOL_STRING_0) or v117 == l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 then
                    return nil;
                elseif not (v117 ~= l_PROVIDER_NUMBER_0) or v117 == l_PROVIDER_SYMBOL_STRING_0 then
                    return string.format("%s.Provider", (v109.type._context or v109.type.context).displayName or "Context");
                elseif not (v117 ~= l_CONTEXT_NUMBER_0) or v117 == l_CONTEXT_SYMBOL_STRING_0 then
                    return string.format("%s.Consumer", (v109.type._context or v109.type).displayName or "Context");
                elseif not (v117 ~= l_STRICT_MODE_NUMBER_0) or v117 == l_STRICT_MODE_SYMBOL_STRING_0 then
                    return nil;
                elseif not (v117 ~= l_PROFILER_NUMBER_0) or v117 == l_PROFILER_SYMBOL_STRING_0 then
                    return string.format("Profiler(%s)", v109.memoizedProps.id);
                elseif not (v117 ~= l_SCOPE_NUMBER_0) or v117 == l_SCOPE_SYMBOL_STRING_0 then
                    return "Scope";
                else
                    return nil;
                end;
            end;
        end, 
        getTypeSymbol = v90, 
        ReactPriorityLevels = v86, 
        ReactTypeOfWork = v87, 
        ReactTypeOfSideEffect = v85
    };
end;
v12.attach = function(v118, v119, v120, v121)
    local v122 = l_Map_0.new();
    local v123 = l_Map_0.new();
    local v124 = l_Set_0.new();
    local v125 = l_Map_0.new();
    local v126 = l_Map_0.new();
    local v127 = -1;
    local function _(v128)
        if not v122:has(v128) then
            local v129 = l_getUID_0();
            v122:set(v128, v129);
            v123:set(v129, v128);
        end;
        return (v122:get(v128));
    end;
    local v131 = v12.getInternalReactConstants(v120.version);
    local l_getDisplayNameForFiber_0 = v131.getDisplayNameForFiber;
    local l_getTypeSymbol_0 = v131.getTypeSymbol;
    local l_ReactPriorityLevels_0 = v131.ReactPriorityLevels;
    local l_ReactTypeOfWork_0 = v131.ReactTypeOfWork;
    local l_PerformedWork_0 = v131.ReactTypeOfSideEffect.PerformedWork;
    local l_FunctionComponent_1 = l_ReactTypeOfWork_0.FunctionComponent;
    local l_ClassComponent_1 = l_ReactTypeOfWork_0.ClassComponent;
    local l_ContextConsumer_0 = l_ReactTypeOfWork_0.ContextConsumer;
    local l_DehydratedSuspenseComponent_0 = l_ReactTypeOfWork_0.DehydratedSuspenseComponent;
    local l_Fragment_1 = l_ReactTypeOfWork_0.Fragment;
    local l_ForwardRef_1 = l_ReactTypeOfWork_0.ForwardRef;
    local l_HostRoot_1 = l_ReactTypeOfWork_0.HostRoot;
    local l_HostPortal_1 = l_ReactTypeOfWork_0.HostPortal;
    local l_HostComponent_1 = l_ReactTypeOfWork_0.HostComponent;
    local l_HostText_1 = l_ReactTypeOfWork_0.HostText;
    local l_IncompleteClassComponent_1 = l_ReactTypeOfWork_0.IncompleteClassComponent;
    local l_IndeterminateComponent_1 = l_ReactTypeOfWork_0.IndeterminateComponent;
    local l_MemoComponent_1 = l_ReactTypeOfWork_0.MemoComponent;
    local l_OffscreenComponent_0 = l_ReactTypeOfWork_0.OffscreenComponent;
    local l_SimpleMemoComponent_1 = l_ReactTypeOfWork_0.SimpleMemoComponent;
    local l_SuspenseComponent_1 = l_ReactTypeOfWork_0.SuspenseComponent;
    local l_SuspenseListComponent_1 = l_ReactTypeOfWork_0.SuspenseListComponent;
    local l_ImmediatePriority_0 = l_ReactPriorityLevels_0.ImmediatePriority;
    local l_UserBlockingPriority_0 = l_ReactPriorityLevels_0.UserBlockingPriority;
    local l_NormalPriority_0 = l_ReactPriorityLevels_0.NormalPriority;
    local l_LowPriority_0 = l_ReactPriorityLevels_0.LowPriority;
    local l_IdlePriority_0 = l_ReactPriorityLevels_0.IdlePriority;
    local function v159(...)
        return v120.overrideHookState(...);
    end;
    local function v160(...)
        return v120.overrideHookStateDeletePath(...);
    end;
    local function v161(...)
        return v120.overrideHookStateRenamePath(...);
    end;
    local function v162(...)
        return v120.overrideProps(...);
    end;
    local function v163(...)
        return v120.overridePropsDeletePath(...);
    end;
    local function v164(...)
        return v120.overridePropsRenamePath(...);
    end;
    local function v165(...)
        return v120.setSuspenseHandler(...);
    end;
    local function v166(...)
        return v120.scheduleUpdate(...);
    end;
    local v167 = false;
    if typeof(v165) == "function" then
        v167 = typeof(v166) == "function";
    end;
    if _G.__DEV__ then
        l_registerRenderer_0(v120);
        local v168 = l__G_0.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__ ~= false;
        local v169 = l__G_0.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__ == true;
        if not (not v168 and not v169) then
            l_patch_0({
                appendComponentStack = v168, 
                breakOnConsoleErrors = v169
            });
        end;
    end;
    local function v179(v170, v171, v172)
        if l___DEBUG___0 then
            local v173 = l_getDisplayNameForFiber_0(v171) or "nil";
            if not v122:has(v171) then
                local v174 = l_getUID_0();
                v122:set(v171, v174);
                v123:set(v174, v171);
            end;
            local v175 = v122:get(v171);
            local v176 = if v172 ~= nil then l_getDisplayNameForFiber_0(v172) else "nil";
            local v177;
            if not v172 then
                v177 = "";
            else
                if not v122:has(v172) then
                    local v178 = l_getUID_0();
                    v122:set(v172, v178);
                    v123:set(v178, v172);
                end;
                v177 = v122:get(v172);
            end;
            l_console_0.log(string.format("[renderer] %s %s (%d) %s", v170, v173, v175, not v172 and "" or string.format("%s (%s)", tostring(v176), (tostring(v177)))));
        end;
    end;
    local v180 = l_Set_0.new();
    local v181 = l_Set_0.new();
    local v182 = l_Set_0.new();
    local v183 = l_Map_0.new();
    local v184 = l_Map_0.new();
    local v185 = nil;
    local v186 = nil;
    local v187 = nil;
    local v188 = nil;
    local v189 = nil;
    local v190 = false;
    local v191 = 0;
    local v192 = false;
    local v193 = nil;
    local v194 = nil;
    local v195 = false;
    local v196 = {};
    local v197 = l_Set_0.new();
    local v198 = false;
    local v199 = l_Set_0.new();
    local v200 = nil;
    local v201 = nil;
    local v202 = -1;
    local v203 = false;
    local v204 = nil;
    local v205 = nil;
    local v206 = nil;
    local v207 = nil;
    local v208 = nil;
    local v209 = nil;
    local v210 = nil;
    local v211 = nil;
    local v212 = nil;
    local v213 = nil;
    local v214 = nil;
    local v215 = nil;
    local v216 = nil;
    local v217 = nil;
    local v218 = nil;
    local v219 = nil;
    local v220 = nil;
    local v221 = nil;
    local v222 = nil;
    local v223 = nil;
    local v224 = nil;
    local v225 = nil;
    local function v229(v226)
        v182:clear();
        v180:clear();
        v181:clear();
        for _, v228 in v226, nil, nil do
            if v228.isEnabled then
                if v228.type == l_ComponentFilterDisplayName_0 then
                    v180:add(v228.value);
                elseif v228.type == l_ComponentFilterElementType_0 then
                    v182:add(v228.value);
                elseif v228.type == l_ComponentFilterLocation_0 then
                    if v228.isValid and v228.value ~= "" then
                        v181:add(v228.value);
                    end;
                elseif v228.type == l_ComponentFilterHOC_0 then
                    v180:add("%(");
                else
                    l_console_0.warn(string.format("Invalid component filter type \"%d\"", v228.type));
                end;
            end;
        end;
    end;
    if l__G_0.__REACT_DEVTOOLS_COMPONENT_FILTERS__ ~= nil then
        v229(l__G_0.__REACT_DEVTOOLS_COMPONENT_FILTERS__);
    else
        v229(l_getDefaultComponentFilters_0());
    end;
    local function v237(v230)
        if v190 then
            error("Cannot modify filter preferences while profiling");
        end;
        v118.getFiberRoots(v119):forEach(function(v231)
            local v232 = v208(v231.current);
            if not v122:has(v232) then
                local v233 = l_getUID_0();
                v122:set(v232, v233);
                v123:set(v233, v232);
            end;
            v127 = v122:get(v232);
            v209(v231.current);
            v210(v231.current, false);
            v127 = -1;
        end);
        v229(v230);
        v184:clear();
        v118.getFiberRoots(v119):forEach(function(v234)
            local v235 = v208(v234.current);
            if not v122:has(v235) then
                local v236 = l_getUID_0();
                v122:set(v235, v236);
                v123:set(v236, v235);
            end;
            v127 = v122:get(v235);
            v211(v127, v234.current);
            v205(v234.current, nil, false, false);
            v213(v234);
            v127 = -1;
        end);
    end;
    local function v249(v238)
        local l__debugSource_0 = v238._debugSource;
        local l_tag_1 = v238.tag;
        local l_type_1 = v238.type;
        if l_tag_1 == l_DehydratedSuspenseComponent_0 then
            return true;
        elseif not ((l_tag_1 ~= l_HostPortal_1 and l_tag_1 ~= l_HostText_1) and l_tag_1 ~= l_Fragment_1) or l_tag_1 == l_OffscreenComponent_0 then
            return true;
        elseif l_tag_1 == l_HostRoot_1 then
            return false;
        else
            local v242 = l_getTypeSymbol_0(l_type_1);
            if not (((v242 ~= l_CONCURRENT_MODE_NUMBER_0 and v242 ~= l_CONCURRENT_MODE_SYMBOL_STRING_0) and v242 ~= l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0) and v242 ~= l_STRICT_MODE_NUMBER_0) or v242 == l_STRICT_MODE_SYMBOL_STRING_0 then
                return true;
            elseif not v182:has((v214(v238))) then
                if v180.size > 0 then
                    local v243 = l_getDisplayNameForFiber_0(v238);
                    if v243 ~= nil then
                        for _, v245 in v180, nil, nil do
                            if string.match(v243, v245) then
                                return true;
                            end;
                        end;
                    end;
                end;
                if l__debugSource_0 ~= nil and v181.size > 0 then
                    local l_fileName_0 = l__debugSource_0.fileName;
                    for _, v248 in v181, nil, nil do
                        if string.match(l_fileName_0, v248) then
                            return true;
                        end;
                    end;
                end;
                return false;
            else
                return true;
            end;
        end;
    end;
    v214 = function(v250)
        local l_type_2 = v250.type;
        local l_tag_2 = v250.tag;
        if not (l_tag_2 ~= l_ClassComponent_1) or l_tag_2 == l_IncompleteClassComponent_1 then
            return l_ElementTypeClass_0;
        elseif not (l_tag_2 ~= l_FunctionComponent_1) or l_tag_2 == l_IndeterminateComponent_1 then
            return l_ElementTypeFunction_0;
        elseif l_tag_2 == l_ForwardRef_1 then
            return l_ElementTypeForwardRef_0;
        elseif l_tag_2 == l_HostRoot_1 then
            return l_ElementTypeRoot_0;
        elseif l_tag_2 == l_HostComponent_1 then
            return l_ElementTypeHostComponent_0;
        elseif not (l_tag_2 ~= l_HostPortal_1 and l_tag_2 ~= l_HostText_1) or l_tag_2 == l_Fragment_1 then
            return l_ElementTypeOtherOrUnknown_0;
        elseif not (l_tag_2 ~= l_MemoComponent_1) or l_tag_2 == l_SimpleMemoComponent_1 then
            return l_ElementTypeMemo_0;
        elseif l_tag_2 == l_SuspenseComponent_1 then
            return l_ElementTypeSuspense_0;
        elseif l_tag_2 == l_SuspenseListComponent_1 then
            return l_ElementTypeSuspenseList_0;
        else
            local v253 = l_getTypeSymbol_0(l_type_2);
            if not (v253 ~= l_CONCURRENT_MODE_NUMBER_0 and v253 ~= l_CONCURRENT_MODE_SYMBOL_STRING_0) or v253 == l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 then
                return l_ElementTypeContext_0;
            elseif not (v253 ~= l_PROVIDER_NUMBER_0) or v253 == l_PROVIDER_SYMBOL_STRING_0 then
                return l_ElementTypeContext_0;
            elseif not (v253 ~= l_CONTEXT_NUMBER_0) or v253 == l_CONTEXT_SYMBOL_STRING_0 then
                return l_ElementTypeContext_0;
            elseif not (v253 ~= l_STRICT_MODE_NUMBER_0) or v253 == l_STRICT_MODE_SYMBOL_STRING_0 then
                return l_ElementTypeOtherOrUnknown_0;
            elseif not (v253 ~= l_PROFILER_NUMBER_0) or v253 == l_PROFILER_SYMBOL_STRING_0 then
                return l_ElementTypeProfiler_0;
            else
                return l_ElementTypeOtherOrUnknown_0;
            end;
        end;
    end;
    v208 = function(v254)
        if not v124:has(v254) then
            local l_alternate_0 = v254.alternate;
            if not (l_alternate_0 ~= nil) or not v124:has(l_alternate_0) then
                v124:add(v254);
                return v254;
            else
                return l_alternate_0;
            end;
        else
            return v254;
        end;
    end;
    local function v259(v256, v257)
        local v258 = v214(v257);
        if not (((v258 ~= l_ElementTypeClass_0 and v258 ~= l_ElementTypeFunction_0) and v258 ~= l_ElementTypeMemo_0) and v258 ~= l_ElementTypeForwardRef_0) or v258 == l_ElementTypeHostComponent_0 then
            if v256 == nil then
                return {
                    context = nil, 
                    didHooksChange = false, 
                    isFirstMount = true, 
                    props = nil, 
                    state = nil
                };
            else
                return {
                    context = v215(v257), 
                    didHooksChange = v216(v256.memoizedState, v257.memoizedState), 
                    isFirstMount = false, 
                    props = v204(v256.memoizedProps, v257.memoizedProps), 
                    state = v204(v256.memoizedState, v257.memoizedState)
                };
            end;
        else
            return nil;
        end;
    end;
    local function _(v260)
        if v214(v260) == l_ElementTypeClass_0 and v187 ~= nil then
            local v261 = v208(v260);
            if not v122:has(v261) then
                local v262 = l_getUID_0();
                v122:set(v261, v262);
                v123:set(v262, v261);
            end;
            local v263 = v122:get(v261);
            v261 = v217(v260);
            if v261 ~= nil then
                v187:set(v263, v261);
            end;
        end;
    end;
    local v265 = {};
    v217 = function(v266)
        if v214(v266) == l_ElementTypeClass_0 then
            local l_stateNode_0 = v266.stateNode;
            local l_v265_0 = v265;
            local l_v265_1 = v265;
            if l_stateNode_0 ~= nil then
                if l_stateNode_0.constructor and l_stateNode_0.constructor.contextType ~= nil then
                    l_v265_1 = l_stateNode_0.context;
                else
                    l_v265_0 = l_stateNode_0.context and (#l_Object_0.keys(l_v265_0) == 0 and v265);
                end;
            end;
            return {
                l_v265_0, 
                l_v265_1
            };
        else
            return nil;
        end;
    end;
    local function v270(v271)
        if v214(v271) == l_ElementTypeClass_0 and v187 ~= nil then
            local v272 = v208(v271);
            if not v122:has(v272) then
                local v273 = l_getUID_0();
                v122:set(v272, v273);
                v123:set(v273, v272);
            end;
            local v274 = v122:get(v272);
            v272 = v217(v271);
            if v272 ~= nil then
                v187:set(v274, v272);
            end;
        end;
        local l_child_0 = v271.child;
        while l_child_0 ~= nil do
            v270(l_child_0);
            l_child_0 = l_child_0.sibling;
        end;
    end;
    v215 = function(v276)
        if v214(v276) == l_ElementTypeClass_0 and v187 ~= nil then
            local v277 = v208(v276);
            if not v122:has(v277) then
                local v278 = l_getUID_0();
                v122:set(v277, v278);
                v123:set(v278, v277);
            end;
            local v279 = v122:get(v277);
            v277 = if not v187:has(v279) then nil else v187:get(v279);
            local v280 = v217(v276);
            if not (v277 ~= nil) or v280 == nil then
                return nil;
            else
                local v281 = v277[1];
                local v282 = v277[2];
                local v283 = v280[1];
                local v284 = v280[2];
                if v283 ~= v265 then
                    return v204(v281, v283);
                elseif v284 ~= v265 then
                    return v282 ~= v284;
                end;
            end;
        end;
        return nil;
    end;
    local _ = function(v285)
        local v286 = 0;
        for v287, _ in v285, nil, nil do
            if v286 < v287 then
                v286 = v287;
            end;
        end;
        return v286;
    end;
    local function v300(v290, v291)
        if v291 == nil then
            return false;
        else
            local v292 = 0;
            for v293, _ in v291, nil, nil do
                if v292 < v293 then
                    v292 = v293;
                end;
            end;
            local l_v292_0 = v292;
            local v296 = 0;
            for v297, _ in v290, nil, nil do
                if v296 < v297 then
                    v296 = v297;
                end;
            end;
            if l_v292_0 ~= v296 then
                return false;
            else
                for v299 = 1, l_v292_0 do
                    if not l_objectIs_0(v290[v299], v291[v299]) then
                        return false;
                    end;
                end;
                return true;
            end;
        end;
    end;
    local function v303(v301)
        local v302 = false;
        if v301 ~= nil then
            v302 = false;
            if typeof(v301) == "table" then
                v302 = false;
                if v301.tag ~= nil then
                    v302 = false;
                    if v301.create ~= nil then
                        v302 = false;
                        if v301.destroy ~= nil then
                            v302 = false;
                            if v301.deps ~= nil then
                                v302 = (not (v301.deps ~= nil) or l_Array_0.isArray(v301.deps)) and v301.next;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v302;
    end;
    local function _(v304, v305)
        local l_memoizedState_0 = v304.memoizedState;
        local l_memoizedState_1 = v305.memoizedState;
        if not v303(l_memoizedState_0) or not v303(l_memoizedState_1) then
            return l_memoizedState_1 ~= l_memoizedState_0;
        else
            local v308 = false;
            if l_memoizedState_0 ~= l_memoizedState_1 then
                v308 = not v300(l_memoizedState_1.deps, l_memoizedState_0.deps);
            end;
            return v308;
        end;
    end;
    v216 = function(v310, v311)
        if not (v310 ~= nil) or v311 == nil then
            return false;
        else
            if not (((not v311.baseState or not v311.memoizedState) or not v311.next) or not v311.queue) then
                while v311 ~= nil do
                    local l_v310_0 = v310;
                    local l_v311_0 = v311;
                    local l_memoizedState_2 = l_v310_0.memoizedState;
                    local l_memoizedState_3 = l_v311_0.memoizedState;
                    local v316;
                    if not v303(l_memoizedState_2) or not v303(l_memoizedState_3) then
                        v316 = l_memoizedState_3 ~= l_memoizedState_2;
                    else
                        v316 = false;
                        if l_memoizedState_2 ~= l_memoizedState_3 then
                            v316 = not v300(l_memoizedState_3.deps, l_memoizedState_2.deps);
                        end;
                    end;
                    if not v316 then
                        v311 = v311.next;
                        v310 = v310.next;
                    else
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end;
    v204 = function(v317, v318)
        if not (v317 ~= nil) or v318 == nil then
            return nil;
        elseif ((v318.baseState ~= nil and v318.memoizedState ~= nil) and v318.next ~= nil) and v318.queue ~= nil then
            return nil;
        else
            local v319 = l_Set_0.new(l_Array_0.concat(l_Object_0.keys(v317), l_Object_0.keys(v318)));
            local v320 = {};
            for _, v322 in v319, nil, nil do
                if v317[v322] ~= v318[v322] then
                    table.insert(v320, v322);
                end;
            end;
            return v320;
        end;
    end;
    local function v327(v323, v324)
        local l_tag_3 = v324.tag;
        if not (((l_tag_3 ~= l_ClassComponent_1 and l_tag_3 ~= l_FunctionComponent_1) and l_tag_3 ~= l_ContextConsumer_0) and l_tag_3 ~= l_MemoComponent_1) or l_tag_3 == l_SimpleMemoComponent_1 then
            return bit32.band(if v324.flags ~= nil then v324.flags else v324.effectTag, l_PerformedWork_0) == l_PerformedWork_0;
        else
            local v326 = true;
            if v323.memoizedProps == v324.memoizedProps then
                v326 = true;
                if v323.memoizedState == v324.memoizedState then
                    v326 = v323.ref ~= v324.ref;
                end;
            end;
            return v326;
        end;
    end;
    local v328 = {};
    local v329 = {};
    local v330 = {};
    local v331 = {};
    local v332 = l_Map_0.new();
    local v333 = 0;
    local v334 = nil;
    local function _(v335)
        if not (not v121.__DEV__ or l_Number_0.isInteger(v335)) then
            l_console_0.error("pushOperation() was called but the value is not an integer.", v335);
        end;
        table.insert(v328, v335);
    end;
    v213 = function(_)
        if not (((#v328 == 0 and #v329 == 0) and #v330 == 0) and v334 == nil) or v190 then
            local v338 = (#v329 + #v330) + (v334 == nil and 0 or 1);
            local v339 = {};
            local v340 = 1;
            local function _()
                local l_v340_0 = v340;
                v340 = v340 + 1;
                return l_v340_0;
            end;
            local l_v340_1 = v340;
            v340 = v340 + 1;
            v339[l_v340_1] = v119;
            l_v340_1 = v340;
            v340 = v340 + 1;
            v339[l_v340_1] = v127;
            l_v340_1 = v340;
            v340 = v340 + 1;
            v339[l_v340_1] = v333;
            local v344 = #v339;
            v332:forEach(function(v345, v346)
                v339[v344 + v345] = v346;
                local _ = v340;
                v340 = v340 + 1;
            end);
            if v338 > 0 then
                local l_v340_3 = v340;
                v340 = v340 + 1;
                v339[l_v340_3] = l_TREE_OPERATION_REMOVE_0;
                l_v340_3 = v340;
                v340 = v340 + 1;
                v339[l_v340_3] = v338;
                for v349 = #v329, 1, -1 do
                    local l_v340_4 = v340;
                    v340 = v340 + 1;
                    v339[l_v340_4] = v329[v349];
                end;
                for v351 = 1, #v330 do
                    v339[(v340 + v351) - 1] = v330[v351];
                end;
                v340 = v340 + #v330;
                if v334 ~= nil then
                    v339[v340] = v334;
                    v340 = v340 + 1;
                end;
            end;
            for v352 = 1, #v328 do
                v339[(v340 + v352) - 1] = v328[v352];
            end;
            v340 = v340 + #v328;
            if v331 ~= nil then
                table.insert(v331, v339);
            else
                v118.emit("operations", v339);
            end;
            v328 = {};
            v329 = {};
            v330 = {};
            v334 = nil;
            v332:clear();
            v333 = 0;
            return ;
        else
            return ;
        end;
    end;
    local function _(v353)
        if not (v353 ~= nil) or v353 == "" then
            return 0;
        else
            local v354 = v332:get(v353);
            if v354 ~= nil then
                return v354;
            else
                local v355 = v332.size + 1;
                v332:set(v353, v355);
                v333 = v333 + 1;
                return v355;
            end;
        end;
    end;
    local function v383(v357, v358)
        if v121.__DEBUG__ then
            v179("recordMount()", v357, v358);
        end;
        local v359 = v357.tag == l_HostRoot_1;
        local v360 = v208(v357);
        if not v122:has(v360) then
            local v361 = l_getUID_0();
            v122:set(v360, v361);
            v123:set(v361, v360);
        end;
        local v362 = v122:get(v360);
        v360 = v357._debugOwner ~= nil;
        local v363 = v357.treeBaseDuration ~= nil;
        if not v359 then
            local l_key_0 = v357.key;
            local v365 = l_getDisplayNameForFiber_0(v357);
            local v366 = v214(v357);
            local l__debugOwner_0 = v357._debugOwner;
            local v368;
            if l__debugOwner_0 ~= nil then
                local v369 = v208(l__debugOwner_0);
                if not v122:has(v369) then
                    local v370 = l_getUID_0();
                    v122:set(v369, v370);
                    v123:set(v370, v369);
                end;
                v368 = v122:get(v369);
            else
                v368 = 0;
            end;
            local v371;
            if not l_Boolean_0.toJSBoolean(v358) then
                v371 = 0;
            else
                local v372 = v208(v358);
                if not v122:has(v372) then
                    local v373 = l_getUID_0();
                    v122:set(v372, v373);
                    v123:set(v373, v372);
                end;
                v371 = v122:get(v372);
            end;
            local v374;
            if not (v365 ~= nil) or v365 == "" then
                v374 = 0;
            else
                local v375 = v332:get(v365);
                if v375 ~= nil then
                    v374 = v375;
                else
                    local v376 = v332.size + 1;
                    v332:set(v365, v376);
                    v333 = v333 + 1;
                    v374 = v376;
                end;
            end;
            local v377 = if l_key_0 == nil then nil else tostring(l_key_0);
            local v378;
            if not (v377 ~= nil) or v377 == "" then
                v378 = 0;
            else
                local v379 = v332:get(v377);
                if v379 ~= nil then
                    v378 = v379;
                else
                    local v380 = v332.size + 1;
                    v332:set(v377, v380);
                    v333 = v333 + 1;
                    v378 = v380;
                end;
            end;
            local l_l_TREE_OPERATION_ADD_0_0 = l_TREE_OPERATION_ADD_0;
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_0)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_0);
            end;
            table.insert(v328, l_l_TREE_OPERATION_ADD_0_0);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v362)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v362);
            end;
            table.insert(v328, v362);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v366)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v366);
            end;
            table.insert(v328, v366);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v371)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v371);
            end;
            table.insert(v328, v371);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v368)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v368);
            end;
            table.insert(v328, v368);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v374)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v374);
            end;
            table.insert(v328, v374);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v378)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v378);
            end;
            table.insert(v328, v378);
        else
            local l_l_TREE_OPERATION_ADD_0_1 = l_TREE_OPERATION_ADD_0;
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_1)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_1);
            end;
            table.insert(v328, l_l_TREE_OPERATION_ADD_0_1);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v362)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v362);
            end;
            table.insert(v328, v362);
            l_l_TREE_OPERATION_ADD_0_1 = l_ElementTypeRoot_0;
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_1)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_1);
            end;
            table.insert(v328, l_l_TREE_OPERATION_ADD_0_1);
            l_l_TREE_OPERATION_ADD_0_1 = not v363 and 0 or 1;
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_1)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_1);
            end;
            table.insert(v328, l_l_TREE_OPERATION_ADD_0_1);
            l_l_TREE_OPERATION_ADD_0_1 = not v360 and 0 or 1;
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_1)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_1);
            end;
            table.insert(v328, l_l_TREE_OPERATION_ADD_0_1);
            if v190 and v186 ~= nil then
                v186:set(v362, v218(v357));
            end;
        end;
        if v363 then
            v126:set(v362, v127);
            v219(v357);
        end;
    end;
    v210 = function(v384, v385)
        if v121.__DEBUG__ then
            v179("recordUnmount()", v384);
        end;
        if v201 ~= nil and (not (v384 ~= v201) or v384 == v201.alternate) then
            v207(nil);
        end;
        local v386 = v384.tag == l_HostRoot_1;
        local v387 = v208(v384);
        if v122:has(v387) then
            if not v122:has(v387) then
                local v388 = l_getUID_0();
                v122:set(v387, v388);
                v123:set(v388, v387);
            end;
            local v389 = v122:get(v387);
            if not v386 then
                if not v249(v384) then
                    if not v385 then
                        table.insert(v329, v389);
                    else
                        table.insert(v330, v389);
                    end;
                end;
            else
                v334 = v389;
            end;
            v122:delete(v387);
            v123:delete(v389);
            v124:delete(v387);
            if v384.treeBaseDuration ~= nil then
                v126:delete(v389);
                v125:delete(v389);
            end;
            return ;
        else
            v124:delete(v387);
            return ;
        end;
    end;
    v205 = function(v390, v391, v392, v393)
        if l___DEBUG___0 then
            v179("mountFiberRecursively()", v390, v391);
        end;
        local v394 = v220(v390);
        local v395 = not v249(v390);
        if v395 then
            v383(v390, v391);
        end;
        if not (not v198 or not v393) and v214(v390) == l_ElementTypeHostComponent_0 then
            v199:add(v390.stateNode);
            v393 = false;
        end;
        if not (v390.tag == l_ReactTypeOfWork_0.SuspenseComponent) then
            if v390.child ~= nil then
                v205(v390.child, if not v395 then v391 else v390, true, v393);
            end;
        elseif not (v390.memoizedState ~= nil) then
            local v396 = nil;
            if not (l_OffscreenComponent_0 == -1) then
                if v390.child ~= nil then
                    v396 = v390.child.child;
                end;
            else
                v396 = v390.child;
            end;
            if v396 ~= nil then
                v205(v396, if not v395 then v391 else v390, true, v393);
            end;
        else
            local l_child_1 = v390.child;
            local v398 = if not l_child_1 then nil else l_child_1.sibling;
            local v399 = if not v398 then nil else v398.child;
            if v399 ~= nil then
                v205(v399, if not v395 then v391 else v390, true, v393);
            end;
        end;
        v221(v394);
        if v392 and v390.sibling ~= nil then
            v205(v390.sibling, v391, true, v393);
        end;
    end;
    v209 = function(v400)
        if v121.__DEBUG__ then
            v179("unmountFiberChildrenRecursively()", v400);
        end;
        local v401 = false;
        if v400.tag == l_ReactTypeOfWork_0.SuspenseComponent then
            v401 = v400.memoizedState ~= nil;
        end;
        local l_child_2 = v400.child;
        if v401 then
            local l_child_3 = v400.child;
            local v404 = if not l_child_3 then nil else l_child_3.sibling;
            l_child_2 = if not v404 then nil else v404.child;
        end;
        while l_child_2 ~= nil do
            if l_child_2.return_ ~= nil then
                v209(l_child_2);
                v210(l_child_2, true);
            end;
            l_child_2 = l_child_2.sibling;
        end;
    end;
    v219 = function(v405)
        local v406 = v208(v405);
        if not v122:has(v406) then
            local v407 = l_getUID_0();
            v122:set(v406, v407);
            v123:set(v407, v406);
        end;
        local v408 = v122:get(v406);
        v406 = v405.actualDuration;
        local l_treeBaseDuration_0 = v405.treeBaseDuration;
        v125:set(v408, l_treeBaseDuration_0 or 0);
        if v190 then
            local l_alternate_1 = v405.alternate;
            if not (l_alternate_1 ~= nil) or l_treeBaseDuration_0 ~= l_alternate_1.treeBaseDuration then
                local v411 = math.floor((l_treeBaseDuration_0 or 0) * 1000);
                local l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0 = l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0;
                if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0)) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0);
                end;
                table.insert(v328, l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0);
                if not (not v121.__DEV__ or l_Number_0.isInteger(v408)) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", v408);
                end;
                table.insert(v328, v408);
                if not (not v121.__DEV__ or l_Number_0.isInteger(v411)) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", v411);
                end;
                table.insert(v328, v411);
            end;
            if not (l_alternate_1 ~= nil and not v327(l_alternate_1, v405)) and v406 ~= nil then
                local l_v406_0 = v406;
                local l_child_4 = v405.child;
                while l_child_4 ~= nil do
                    l_v406_0 = l_v406_0 - (l_child_4.actualDuration or 0);
                    l_child_4 = l_child_4.sibling;
                end;
                local l_v185_0 = v185;
                table.insert(l_v185_0.durations, v408);
                table.insert(l_v185_0.durations, v406);
                table.insert(l_v185_0.durations, l_v406_0);
                l_v185_0.maxActualDuration = math.max(l_v185_0.maxActualDuration, v406);
                if v192 then
                    local v416 = v259(l_alternate_1, v405);
                    if v416 ~= nil and l_v185_0.changeDescriptions ~= nil then
                        l_v185_0.changeDescriptions:set(v408, v416);
                    end;
                    if v214(v405) == l_ElementTypeClass_0 and v187 ~= nil then
                        local v417 = v208(v405);
                        if not v122:has(v417) then
                            local v418 = l_getUID_0();
                            v122:set(v417, v418);
                            v123:set(v418, v417);
                        end;
                        local v419 = v122:get(v417);
                        v417 = v217(v405);
                        if v417 ~= nil then
                            v187:set(v419, v417);
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v430(v420, v421)
        local v422 = {};
        local l_v421_0 = v421;
        while l_v421_0 ~= nil do
            v222(l_v421_0, v422);
            l_v421_0 = l_v421_0.sibling;
        end;
        local v424 = #v422;
        if v424 < 2 then
            return ;
        else
            local l_l_TREE_OPERATION_REORDER_CHILDREN_0_0 = l_TREE_OPERATION_REORDER_CHILDREN_0;
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_REORDER_CHILDREN_0_0)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            end;
            table.insert(v328, l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            local v426 = v208(v420);
            if not v122:has(v426) then
                local v427 = l_getUID_0();
                v122:set(v426, v427);
                v123:set(v427, v426);
            end;
            l_l_TREE_OPERATION_REORDER_CHILDREN_0_0 = v122:get(v426);
            if not (not v121.__DEV__ or l_Number_0.isInteger(l_l_TREE_OPERATION_REORDER_CHILDREN_0_0)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            end;
            table.insert(v328, l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            if not (not v121.__DEV__ or l_Number_0.isInteger(v424)) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v424);
            end;
            table.insert(v328, v424);
            for v428 = 1, #v422 do
                local v429 = v422[v428];
                if not (not v121.__DEV__ or l_Number_0.isInteger(v429)) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", v429);
                end;
                table.insert(v328, v429);
            end;
            return ;
        end;
    end;
    v222 = function(v431, v432)
        if v249(v431) then
            local l_child_5 = v431.child;
            while l_child_5 ~= nil do
                v222(l_child_5, v432);
                l_child_5 = l_child_5.sibling;
            end;
            return ;
        else
            local v434 = v208(v431);
            if not v122:has(v434) then
                local v435 = l_getUID_0();
                v122:set(v434, v435);
                v123:set(v435, v434);
            end;
            table.insert(v432, (v122:get(v434)));
            return ;
        end;
    end;
    local function v436(v437, v438, v439, v440)
        if v121.__DEBUG__ then
            v179("updateFiberRecursively()", v437, v439);
        end;
        if v198 then
            local v441 = v214(v437);
            if not v440 then
                if not (v441 ~= l_ElementTypeFunction_0 and v441 ~= l_ElementTypeClass_0) or v441 == l_ElementTypeContext_0 then
                    v440 = v327(v438, v437);
                end;
            elseif v441 == l_ElementTypeHostComponent_0 then
                v199:add(v437.stateNode);
                v440 = false;
            end;
        end;
        if v194 ~= nil then
            local l_id_0 = v194.id;
            local v443 = v208(v437);
            if not v122:has(v443) then
                local v444 = l_getUID_0();
                v122:set(v443, v444);
                v123:set(v444, v443);
            end;
            if not (not (l_id_0 == v122:get(v443)) or not v327(v438, v437)) then
                v195 = true;
            end;
        end;
        local v445 = not v249(v437);
        local v446 = v437.tag == l_SuspenseComponent_1;
        local v447 = false;
        local v448 = v446 and v438.memoizedState ~= nil;
        local v449 = v446 and v437.memoizedState ~= nil;
        if not v448 or not v449 then
            if not v448 or v449 then
                if v448 or not v449 then
                    if v437.child ~= v438.child then
                        local l_child_6 = v437.child;
                        local l_child_7 = v438.child;
                        while l_child_6 do
                            if not l_child_6.alternate then
                                v205(l_child_6, if not v445 then v439 else v437, false, v440);
                                v447 = true;
                            else
                                local l_alternate_2 = l_child_6.alternate;
                                if v436(l_child_6, l_alternate_2, if not v445 then v439 else v437, v440) then
                                    v447 = true;
                                end;
                                if l_alternate_2 ~= l_child_7 then
                                    v447 = true;
                                end;
                            end;
                            l_child_6 = l_child_6.sibling;
                            if not v447 and l_child_7 ~= nil then
                                l_child_7 = l_child_7.sibling;
                            end;
                        end;
                        if l_child_7 ~= nil then
                            v447 = true;
                        end;
                    elseif not (not v198 or not v440) then
                        local l_v206_0 = v206;
                        local v454 = v208(v437);
                        if not v122:has(v454) then
                            local v455 = l_getUID_0();
                            v122:set(v454, v455);
                            v123:set(v455, v454);
                        end;
                        for _, v457 in (l_v206_0((v122:get(v454)))), nil, nil do
                            v199:add(v457.stateNode);
                        end;
                    end;
                else
                    v209(v438);
                    local l_child_8 = v437.child;
                    local v459 = if not l_child_8 then nil else l_child_8.sibling;
                    if v459 ~= nil then
                        v205(v459, v437, true, v440);
                        v447 = true;
                    end;
                end;
            else
                local l_child_9 = v437.child;
                if l_child_9 ~= nil then
                    v205(l_child_9, v437, true, v440);
                end;
                v447 = true;
            end;
        else
            local l_child_10 = v437.child;
            local v462 = if not l_child_10 then nil else l_child_10.sibling;
            local l_child_11 = v438.child;
            local v464 = if not l_child_11 then nil else l_child_11.sibling;
            if not (not (v462 ~= nil and v464 ~= nil) or not v436(v462, v464, v437, v440)) then
                v447 = true;
            end;
        end;
        if not (not v445 or not (v437.treeBaseDuration ~= nil)) then
            v219(v437);
        end;
        if not v447 then
            return false;
        elseif not v445 then
            return true;
        else
            local l_child_12 = v437.child;
            if v449 then
                local l_child_13 = v437.child;
                l_child_12 = if not l_child_13 then nil else l_child_13.sibling;
            end;
            if l_child_12 ~= nil then
                v430(v437, l_child_12);
            end;
            return false;
        end;
    end;
    local function v467()
    end;
    local function v476()
        local l_v331_0 = v331;
        v331 = nil;
        if l_v331_0 ~= nil and #l_v331_0 > 0 then
            for _, v470 in l_v331_0, nil, nil do
                v118.emit("operations", v470);
            end;
            return ;
        else
            if v200 ~= nil then
                v203 = true;
            end;
            v118.getFiberRoots(v119):forEach(function(v471)
                local v472 = v208(v471.current);
                if not v122:has(v472) then
                    local v473 = l_getUID_0();
                    v122:set(v472, v473);
                    v123:set(v473, v472);
                end;
                v127 = v122:get(v472);
                v211(v127, v471.current);
                if v190 and v471.memoizedInteractions ~= nil then
                    local _ = l_Array_0.from(v471.memoizedInteractions);
                    v185 = {
                        changeDescriptions = if not v192 then nil else l_Map_0.new(), 
                        durations = {}, 
                        commitTime = os.clock() - v191, 
                        interactions = l_Array_0.map(l_Array_0.from(v471.memoizedInteractions), function(v475)
                            return (l_Object_0.assign({}, v475, {
                                timestamp = v475.timestamp - v191
                            }));
                        end), 
                        maxActualDuration = 0, 
                        priorityLevel = nil
                    };
                end;
                v205(v471.current, nil, false, false);
                v213(v471);
                v127 = -1;
            end);
            return ;
        end;
    end;
    local function v478(v477)
        v210(v477, false);
    end;
    local function _(v479)
        if v479 == nil then
            return "Unknown";
        elseif v479 == l_ImmediatePriority_0 then
            return "Immediate";
        elseif v479 == l_UserBlockingPriority_0 then
            return "User-Blocking";
        elseif v479 == l_NormalPriority_0 then
            return "Normal";
        elseif v479 == l_LowPriority_0 then
            return "Low";
        elseif v479 == l_IdlePriority_0 then
            return "Idle";
        else
            return "Unknown";
        end;
    end;
    local function v490(v481, v482)
        local l_current_0 = v481.current;
        local l_alternate_3 = l_current_0.alternate;
        local v485 = v208(l_current_0);
        if not v122:has(v485) then
            local v486 = l_getUID_0();
            v122:set(v485, v486);
            v123:set(v486, v485);
        end;
        v127 = v122:get(v485);
        if v200 ~= nil then
            v203 = true;
        end;
        if v198 then
            v199:clear();
        end;
        local v487 = v481.memoizedInteractions ~= nil;
        if not (not v190 or not v487) then
            v485 = l_Array_0.from(v481.memoizedInteractions);
            v185 = {
                changeDescriptions = if not v192 then nil else l_Map_0.new(), 
                durations = {}, 
                commitTime = os.clock() - v191, 
                interactions = l_Array_0.map(l_Array_0.from(v481.memoizedInteractions), function(v488)
                    return (l_Object_0.assign({}, v488, {
                        timestamp = v488.timestamp - v191
                    }));
                end), 
                maxActualDuration = 0, 
                priorityLevel = if v482 == nil then nil else v482 == nil and "Unknown" or (v482 == l_ImmediatePriority_0 and "Immediate" or (v482 == l_UserBlockingPriority_0 and "User-Blocking" or (v482 == l_NormalPriority_0 and "Normal" or (v482 == l_LowPriority_0 and "Low" or (v482 == l_IdlePriority_0 and "Idle" or "Unknown")))))
            };
        end;
        if not l_alternate_3 then
            v211(v127, l_current_0);
            v205(l_current_0, nil, false, false);
        else
            v485 = false;
            if l_alternate_3.memoizedState ~= nil then
                v485 = l_alternate_3.memoizedState.element ~= nil;
            end;
            local v489 = false;
            if l_current_0.memoizedState ~= nil then
                v489 = l_current_0.memoizedState.element ~= nil;
            end;
            if v485 or not v489 then
                if not v485 or not v489 then
                    if not (not v485 or v489) then
                        v212(v127);
                        v210(l_current_0, false);
                    end;
                else
                    v436(l_current_0, l_alternate_3, nil, false);
                end;
            else
                v211(v127, l_current_0);
                v205(l_current_0, nil, false, false);
            end;
        end;
        if not (not v190 or not v487) then
            v485 = v193:get(v127);
            if v485 ~= nil then
                table.insert(v485, v185);
            else
                v193:set(v127, {
                    v185
                });
            end;
        end;
        v213(v481);
        if v198 then
            v118.emit("traceUpdates", v199);
        end;
        v127 = -1;
    end;
    v206 = function(v491)
        local v492 = {};
        local v493 = v223(v491);
        if v493 then
            local l_v493_0 = v493;
            while true do
                if not (l_v493_0.tag ~= l_HostComponent_1) or l_v493_0.tag == l_HostText_1 then
                    table.insert(v492, l_v493_0);
                elseif l_v493_0.child then
                    l_v493_0.child.return_ = l_v493_0;
                    l_v493_0 = l_v493_0.child;
                end;
                if l_v493_0 == v493 then
                    return v492;
                else
                    while true do
                        if l_v493_0.sibling then
                            l_v493_0.sibling.return_ = l_v493_0.return_;
                            l_v493_0 = l_v493_0.sibling;
                            break;
                        elseif not l_v493_0.return_ or l_v493_0.return_ == v493 then
                            return v492;
                        else
                            l_v493_0 = l_v493_0.return_;
                        end;
                    end;
                end;
            end;
        else
            return v492;
        end;
    end;
    local function v502(v495)
        local l_status_0, l_result_0 = pcall(function()
            local v496 = v223(v495);
            if v496 == nil then
                return nil;
            else
                local v497 = false;
                if v496.tag == l_SuspenseComponent_1 then
                    v497 = v496.memoizedState ~= nil;
                end;
                if v497 then
                    local v498 = v496.child and v496.child.sibling;
                    if v498 ~= nil then
                        v496 = v498;
                    end;
                end;
                return (l_Array_0.map(v206(v495), function(v499)
                    return v499.stateNode;
                end));
            end;
        end);
        if l_status_0 then
            return l_result_0;
        else
            return nil;
        end;
    end;
    local function v505(v503)
        local v504 = v123:get(v503);
        if v504 ~= nil then
            return (l_getDisplayNameForFiber_0(v504));
        else
            return nil;
        end;
    end;
    local function v511(v506, v507)
        v507 = v507 or false;
        local v508 = v120.findFiberByHostInstance(v506);
        if v508 ~= nil then
            if v507 then
                while not (not (v508 ~= nil) or not v249(v508)) do
                    v508 = v508.return_;
                end;
            end;
            local v509 = v208(v508);
            if not v122:has(v509) then
                local v510 = l_getUID_0();
                v122:set(v509, v510);
                v123:set(v510, v509);
            end;
            return (v122:get(v509));
        else
            return nil;
        end;
    end;
    local function _(v512)
        l_invariant_0(l_getNearestMountedFiber_0(v512) == v512, "Unable to find node on an unmounted component.");
    end;
    v223 = function(v514)
        local v515 = v123:get(v514);
        if v515 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(v514))));
            return nil;
        else
            local l_alternate_4 = v515.alternate;
            if l_alternate_4 then
                local l_v515_0 = v515;
                local l_l_alternate_4_0 = l_alternate_4;
                while true do
                    local l_return__0 = l_v515_0.return_;
                    if l_return__0 ~= nil then
                        local l_alternate_5 = l_return__0.alternate;
                        if l_alternate_5 == nil then
                            local l_return__1 = l_return__0.return_;
                            if l_return__1 ~= nil then
                                l_v515_0 = l_return__1;
                                l_l_alternate_4_0 = l_return__1;
                            else
                                break;
                            end;
                        else
                            if l_return__0.child == l_alternate_5.child then
                                local l_child_14 = l_return__0.child;
                                while true do
                                    if not l_child_14 then
                                        l_invariant_0(false, "Unable to find node on an unmounted component.");
                                        break;
                                    elseif l_child_14 == l_v515_0 then
                                        l_invariant_0(l_getNearestMountedFiber_0(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                        return v515;
                                    elseif l_child_14 == l_l_alternate_4_0 then
                                        l_invariant_0(l_getNearestMountedFiber_0(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                        return l_alternate_4;
                                    else
                                        l_child_14 = l_child_14.sibling;
                                    end;
                                end;
                            end;
                            if l_v515_0.return_ ~= l_l_alternate_4_0.return_ then
                                l_v515_0 = l_return__0;
                                l_l_alternate_4_0 = l_alternate_5;
                            else
                                local v523 = false;
                                local l_child_15 = l_return__0.child;
                                while l_child_15 do
                                    if l_child_15 == l_v515_0 then
                                        v523 = true;
                                        l_v515_0 = l_return__0;
                                        l_l_alternate_4_0 = l_alternate_5;
                                        break;
                                    elseif l_child_15 == l_l_alternate_4_0 then
                                        v523 = true;
                                        l_l_alternate_4_0 = l_return__0;
                                        l_v515_0 = l_alternate_5;
                                        break;
                                    else
                                        l_child_15 = l_child_15.sibling;
                                    end;
                                end;
                                if not v523 then
                                    l_child_15 = l_alternate_5.child;
                                    while l_child_15 do
                                        if l_child_15 == l_v515_0 then
                                            v523 = true;
                                            l_v515_0 = l_alternate_5;
                                            l_l_alternate_4_0 = l_return__0;
                                            break;
                                        elseif l_child_15 == l_l_alternate_4_0 then
                                            v523 = true;
                                            l_l_alternate_4_0 = l_alternate_5;
                                            l_v515_0 = l_return__0;
                                            break;
                                        else
                                            l_child_15 = l_child_15.sibling;
                                        end;
                                    end;
                                    l_invariant_0(v523, "Child was not found in either parent set. This indicates a bug " .. "in React related to the return pointer. Please file an issue.");
                                end;
                            end;
                            l_invariant_0(l_v515_0.alternate == l_l_alternate_4_0, "Return fibers should always be each others' alternates. " .. "This error is likely caused by a bug in React. Please file an issue.");
                        end;
                    else
                        break;
                    end;
                end;
                l_invariant_0(l_v515_0.tag == l_HostRoot_1, "Unable to find node on an unmounted component.");
                if l_v515_0.stateNode.current == l_v515_0 then
                    return v515;
                else
                    return l_alternate_4;
                end;
            else
                local v525 = l_getNearestMountedFiber_0(v515);
                l_invariant_0(v525 ~= nil, "Unable to find node on an unmounted component.");
                if v525 ~= v515 then
                    return nil;
                else
                    return v515;
                end;
            end;
        end;
    end;
    local function v528(v526, v527)
        if v224(v526) then
            l__G_0["$attribute"] = l_getInObject_0(v194, v527);
        end;
    end;
    local function v534(v529)
        local v530 = v123:get(v529);
        if v530 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(v529))));
            return ;
        else
            local l_elementType_0 = v530.elementType;
            local l_tag_4 = v530.tag;
            local l_type_3 = v530.type;
            if not ((l_tag_4 ~= l_ClassComponent_1 and l_tag_4 ~= l_FunctionComponent_1) and l_tag_4 ~= l_IncompleteClassComponent_1) or l_tag_4 == l_IndeterminateComponent_1 then
                v121["$type"] = l_type_3;
                return ;
            elseif l_tag_4 == l_ForwardRef_1 then
                v121["$type"] = l_type_3.render;
                return ;
            elseif not (l_tag_4 ~= l_MemoComponent_1) or l_tag_4 == l_SimpleMemoComponent_1 then
                v121["$type"] = (l_elementType_0 ~= nil and l_elementType_0.type ~= nil) and l_elementType_0.type or l_type_3;
                return ;
            else
                v121["$type"] = nil;
                return ;
            end;
        end;
    end;
    local function v545(v535)
        local v536 = v223(v535);
        if v536 == nil then
            return nil;
        else
            local l__debugOwner_1 = v536._debugOwner;
            local v538 = {
                {
                    displayName = l_getDisplayNameForFiber_0(v536) or "Anonymous", 
                    id = v535, 
                    type = v214(v536)
                }
            };
            if l__debugOwner_1 then
                local l_l__debugOwner_1_0 = l__debugOwner_1;
                while l_l__debugOwner_1_0 ~= nil do
                    local l_unshift_0 = l_Array_0.unshift;
                    local l_v538_0 = v538;
                    local v542 = {
                        displayName = l_getDisplayNameForFiber_0(l_l__debugOwner_1_0) or "Anonymous"
                    };
                    local v543 = v208(l_l__debugOwner_1_0);
                    if not v122:has(v543) then
                        local v544 = l_getUID_0();
                        v122:set(v543, v544);
                        v123:set(v544, v543);
                    end;
                    v542.id = v122:get(v543);
                    v542.type = v214(l_l__debugOwner_1_0);
                    l_unshift_0(l_v538_0, v542);
                    l_l__debugOwner_1_0 = l_l__debugOwner_1_0._debugOwner or nil;
                end;
            end;
            return v538;
        end;
    end;
    local function v550(v546)
        local v547 = nil;
        local v548 = nil;
        local v549 = v223(v546);
        if v549 ~= nil then
            v547 = v549.stateNode;
            if v549.memoizedProps ~= nil then
                v548 = v549.memoizedProps.style;
            end;
        end;
        return {
            instance = v547, 
            style = v548
        };
    end;
    local function v588(v551)
        local v552 = v223(v551);
        if v552 == nil then
            return nil;
        else
            local l__debugOwner_2 = v552._debugOwner;
            local l__debugSource_1 = v552._debugSource;
            local l_stateNode_1 = v552.stateNode;
            local l_key_1 = v552.key;
            local l_memoizedProps_0 = v552.memoizedProps;
            local l_memoizedState_4 = v552.memoizedState;
            local l_dependencies_0 = v552.dependencies;
            local l_tag_5 = v552.tag;
            local l_type_4 = v552.type;
            local v562 = v214(v552);
            local v563;
            if l_tag_5 ~= l_FunctionComponent_1 and l_tag_5 ~= l_SimpleMemoComponent_1 then
                v563 = false;
                if not (l_tag_5 == l_ForwardRef_1) then
                    goto label0;
                end;
            end;
            v563 = not not l_memoizedState_4 or not not l_dependencies_0;
            ::label0::;
            local v564 = l_getTypeSymbol_0(l_type_4);
            local v565 = false;
            local v566 = nil;
            if not (((((l_tag_5 ~= l_ClassComponent_1 and l_tag_5 ~= l_FunctionComponent_1) and l_tag_5 ~= l_IncompleteClassComponent_1) and l_tag_5 ~= l_IndeterminateComponent_1) and l_tag_5 ~= l_MemoComponent_1) and l_tag_5 ~= l_ForwardRef_1) or l_tag_5 == l_SimpleMemoComponent_1 then
                v565 = true;
                if l_stateNode_1 and l_stateNode_1.context ~= nil then
                    local v567 = false;
                    if v562 == l_ElementTypeClass_0 then
                        v567 = not (l_type_4.contextTypes or l_type_4.contextType);
                    end;
                    if not v567 then
                        v566 = l_stateNode_1.context;
                    end;
                end;
            elseif not (v564 ~= l_CONTEXT_NUMBER_0) or v564 == l_CONTEXT_SYMBOL_STRING_0 then
                local v568 = l_type_4._context or l_type_4;
                v566 = v568._currentValue or nil;
                local l_return__2 = v552.return_;
                while l_return__2 ~= nil do
                    local l_type_5 = l_return__2.type;
                    local v571 = l_getTypeSymbol_0(l_type_5);
                    if (not (v571 ~= l_PROVIDER_NUMBER_0) or v571 == l_PROVIDER_SYMBOL_STRING_0) and (l_type_5._context or l_type_5.context) == v568 then
                        v566 = l_return__2.memoizedProps.value;
                        break;
                    else
                        l_return__2 = l_return__2.return_;
                    end;
                end;
            end;
            local v572 = false;
            if v566 ~= nil then
                v572 = not not l_type_4.contextTypes;
                v566 = {
                    value = v566
                };
            end;
            local v573 = nil;
            if l__debugOwner_2 then
                v573 = {};
                local l_l__debugOwner_2_0 = l__debugOwner_2;
                while l_l__debugOwner_2_0 ~= nil do
                    local v575 = {
                        displayName = l_getDisplayNameForFiber_0(l_l__debugOwner_2_0) or "Anonymous"
                    };
                    local v576 = v208(l_l__debugOwner_2_0);
                    if not v122:has(v576) then
                        local v577 = l_getUID_0();
                        v122:set(v576, v577);
                        v123:set(v577, v576);
                    end;
                    v575.id = v122:get(v576);
                    v575.type = v214(l_l__debugOwner_2_0);
                    table.insert(v573, v575);
                    l_l__debugOwner_2_0 = l_l__debugOwner_2_0._debugOwner or nil;
                end;
            end;
            local v578 = false;
            if l_tag_5 == l_SuspenseComponent_1 then
                v578 = l_memoizedState_4 ~= nil;
            end;
            local v579 = nil;
            if v563 then
                local v580 = {};
                for v581, _ in l_console_0, nil, nil do
                    pcall(function()
                        v580[v581] = l_console_0[v581];
                        l_console_0[v581] = function()
                        end;
                    end);
                end;
                pcall(function()
                    v579 = l_inspectHooksOfFiber_0(v552, v120.currentDispatcherRef);
                end);
                for v583, _ in l_console_0, nil, nil do
                    pcall(function()
                        l_console_0[v583] = v580[v583];
                    end);
                end;
            end;
            local v585 = nil;
            local l_v552_0 = v552;
            while l_v552_0.return_ ~= nil do
                l_v552_0 = l_v552_0.return_;
            end;
            local l_stateNode_2 = l_v552_0.stateNode;
            if l_stateNode_2 ~= nil and l_stateNode_2._debugRootType ~= nil then
                v585 = l_stateNode_2._debugRootType;
            end;
            return {
                id = v551, 
                canEditHooks = typeof(v159) == "function", 
                canEditFunctionProps = typeof(v162) == "function", 
                canEditHooksAndDeletePaths = typeof(v160) == "function", 
                canEditHooksAndRenamePaths = typeof(v161) == "function", 
                canEditFunctionPropsDeletePaths = typeof(v163) == "function", 
                canEditFunctionPropsRenamePaths = typeof(v164) == "function", 
                canToggleSuspense = v167 and (not v578 or v197[v551]), 
                canViewSource = v565, 
                hasLegacyContext = v572, 
                key = l_key_1, 
                displayName = l_getDisplayNameForFiber_0(v552), 
                type_ = v562, 
                context = v566, 
                hooks = v579, 
                props = l_memoizedProps_0, 
                state = if not v563 then l_memoizedState_4 else nil, 
                owners = v573, 
                source = l__debugSource_1 or nil, 
                rootType = v585, 
                rendererPackageName = v120.rendererPackageName, 
                rendererVersion = v120.version
            };
        end;
    end;
    v224 = function(v589)
        local v590 = false;
        if v194 ~= nil then
            v590 = false;
            if v194.id == v589 then
                v590 = not v195;
            end;
        end;
        return v590;
    end;
    local function v595(v591)
        local l_v196_0 = v196;
        for _, v594 in v591, nil, nil do
            if not l_Boolean_0.toJSBoolean(l_v196_0[v594]) then
                l_v196_0[v594] = {};
            end;
            l_v196_0 = l_v196_0[v594];
        end;
    end;
    local function _(v596, v597)
        return function(v598)
            if v597 == "hooks" then
                if #v598 == 1 then
                    return true;
                elseif not (v598[#v598] ~= "subHooks") or v598[#v598 - 1] == "subHooks" then
                    return true;
                end;
            end;
            local v599 = if v596 == nil then v196 else v196[v596];
            if l_Boolean_0.toJSBoolean(v599) then
                for v600 = 1, #v598 do
                    v599 = v599[v598[v600]];
                    if not l_Boolean_0.toJSBoolean(v599) then
                        return false;
                    end;
                end;
                return true;
            else
                return false;
            end;
        end;
    end;
    local function v611(v602)
        local l_hooks_0 = v602.hooks;
        local l_id_1 = v602.id;
        local l_props_0 = v602.props;
        local v606 = v123:get(l_id_1);
        if v606 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(l_id_1))));
            return ;
        else
            local l_elementType_1 = v606.elementType;
            local l_stateNode_3 = v606.stateNode;
            local l_tag_6 = v606.tag;
            local l_type_6 = v606.type;
            if not (l_tag_6 ~= l_ClassComponent_1 and l_tag_6 ~= l_IncompleteClassComponent_1) or l_tag_6 == l_IndeterminateComponent_1 then
                v121["$r"] = l_stateNode_3;
                return ;
            elseif l_tag_6 == l_FunctionComponent_1 then
                v121["$r"] = {
                    hooks = l_hooks_0, 
                    props = l_props_0, 
                    type = l_type_6
                };
                return ;
            elseif l_tag_6 == l_ForwardRef_1 then
                v121["$r"] = {
                    props = l_props_0, 
                    type = l_type_6.render
                };
                return ;
            elseif not (l_tag_6 ~= l_MemoComponent_1) or l_tag_6 == l_SimpleMemoComponent_1 then
                v121["$r"] = {
                    props = l_props_0, 
                    type = (l_elementType_1 ~= nil and l_elementType_1.type ~= nil) and l_elementType_1.type or l_type_6
                };
                return ;
            else
                v121["$r"] = nil;
                return ;
            end;
        end;
    end;
    local function v617(v612, v613, v614)
        if v224(v612) then
            local v615 = l_getInObject_0(v194, v613);
            local v616 = string.format("$reactTemp%s", (tostring(v614)));
            l__G_0[v616] = v615;
            l_console_0.log(v616);
            l_console_0.log(v615);
        end;
    end;
    local function v620(v618, v619)
        if v224(v618) then
            l_copyToClipboard_0(l_getInObject_0(v194, v619));
        end;
    end;
    local function v655(v621, v622)
        if not v224(v621) then
            v195 = false;
            if not (v194 ~= nil) or v194.id ~= v621 then
                v196 = {};
            end;
            v194 = v588(v621);
            if v194 == nil then
                return {
                    id = v621, 
                    type = "not-found"
                };
            else
                if v622 ~= nil then
                    v595(v622);
                end;
                v611(v194);
                local v623 = l_Object_0.assign({}, v194);
                local l_l_cleanForBridge_0_0 = l_cleanForBridge_0;
                local l_context_0 = v623.context;
                local v626 = nil;
                local v627 = "context";
                local l_v626_0 = v626 --[[ copy: 7 -> 10 ]];
                local l_v627_0 = v627 --[[ copy: 8 -> 11 ]];
                v623.context = l_l_cleanForBridge_0_0(l_context_0, function(v630)
                    if l_v626_0 == "hooks" then
                        if #v630 == 1 then
                            return true;
                        elseif not (v630[#v630] ~= "subHooks") or v630[#v630 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v631 = if l_v627_0 == nil then v196 else v196[l_v627_0];
                    if l_Boolean_0.toJSBoolean(v631) then
                        for v632 = 1, #v630 do
                            v631 = v631[v630[v632]];
                            if not l_Boolean_0.toJSBoolean(v631) then
                                return false;
                            end;
                        end;
                        return true;
                    else
                        return false;
                    end;
                end);
                l_l_cleanForBridge_0_0 = l_cleanForBridge_0;
                l_context_0 = v623.hooks;
                v626 = "hooks";
                v627 = "hooks";
                local l_v626_1 = v626 --[[ copy: 7 -> 12 ]];
                local l_v627_1 = v627 --[[ copy: 8 -> 13 ]];
                v623.hooks = l_l_cleanForBridge_0_0(l_context_0, function(v635)
                    if l_v626_1 == "hooks" then
                        if #v635 == 1 then
                            return true;
                        elseif not (v635[#v635] ~= "subHooks") or v635[#v635 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v636 = if l_v627_1 == nil then v196 else v196[l_v627_1];
                    if l_Boolean_0.toJSBoolean(v636) then
                        for v637 = 1, #v635 do
                            v636 = v636[v635[v637]];
                            if not l_Boolean_0.toJSBoolean(v636) then
                                return false;
                            end;
                        end;
                        return true;
                    else
                        return false;
                    end;
                end);
                l_l_cleanForBridge_0_0 = l_cleanForBridge_0;
                l_context_0 = v623.props;
                v626 = nil;
                v627 = "props";
                local l_v626_2 = v626 --[[ copy: 7 -> 14 ]];
                local l_v627_2 = v627 --[[ copy: 8 -> 15 ]];
                v623.props = l_l_cleanForBridge_0_0(l_context_0, function(v640)
                    if l_v626_2 == "hooks" then
                        if #v640 == 1 then
                            return true;
                        elseif not (v640[#v640] ~= "subHooks") or v640[#v640 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v641 = if l_v627_2 == nil then v196 else v196[l_v627_2];
                    if l_Boolean_0.toJSBoolean(v641) then
                        for v642 = 1, #v640 do
                            v641 = v641[v640[v642]];
                            if not l_Boolean_0.toJSBoolean(v641) then
                                return false;
                            end;
                        end;
                        return true;
                    else
                        return false;
                    end;
                end);
                l_l_cleanForBridge_0_0 = l_cleanForBridge_0;
                l_context_0 = v623.state;
                v626 = nil;
                v627 = "state";
                v623.state = l_l_cleanForBridge_0_0(l_context_0, function(v643)
                    if v626 == "hooks" then
                        if #v643 == 1 then
                            return true;
                        elseif not (v643[#v643] ~= "subHooks") or v643[#v643 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v644 = if v627 == nil then v196 else v196[v627];
                    if l_Boolean_0.toJSBoolean(v644) then
                        for v645 = 1, #v643 do
                            v644 = v644[v643[v645]];
                            if not l_Boolean_0.toJSBoolean(v644) then
                                return false;
                            end;
                        end;
                        return true;
                    else
                        return false;
                    end;
                end);
                return {
                    id = v621, 
                    type = "full-data", 
                    value = v623
                };
            end;
        elseif v622 ~= nil then
            v595(v622);
            local v646 = nil;
            if v622[1] == "hooks" then
                v646 = "hooks";
            end;
            local v647 = {
                id = v621, 
                type = "hydrated-path", 
                path = v622
            };
            local l_l_cleanForBridge_0_1 = l_cleanForBridge_0;
            local v649 = l_getInObject_0(v194, v622);
            local l_v646_0 = v646;
            local v651 = nil;
            v647.value = l_l_cleanForBridge_0_1(v649, function(v652)
                if l_v646_0 == "hooks" then
                    if #v652 == 1 then
                        return true;
                    elseif not (v652[#v652] ~= "subHooks") or v652[#v652 - 1] == "subHooks" then
                        return true;
                    end;
                end;
                local v653 = if v651 == nil then v196 else v196[v651];
                if l_Boolean_0.toJSBoolean(v653) then
                    for v654 = 1, #v652 do
                        v653 = v653[v652[v654]];
                        if not l_Boolean_0.toJSBoolean(v653) then
                            return false;
                        end;
                    end;
                    return true;
                else
                    return false;
                end;
            end, v622);
            return v647;
        else
            return {
                id = v621, 
                type = "no-change"
            };
        end;
    end;
    local function v665(v656)
        local v657 = if not v224(v656) then v588(v656) else v194;
        if v657 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(v656))));
            return ;
        else
            if v657.props ~= nil then
                l_console_0.log("Props:", v657.props);
            end;
            if v657.state ~= nil then
                l_console_0.log("State:", v657.state);
            end;
            if v657.hooks ~= nil then
                l_console_0.log("Hooks:", v657.hooks);
            end;
            local l_status_1, l_result_1 = pcall(function()
                local v658 = v223(v656);
                if v658 == nil then
                    return nil;
                else
                    local v659 = false;
                    if v658.tag == l_SuspenseComponent_1 then
                        v659 = v658.memoizedState ~= nil;
                    end;
                    if v659 then
                        local v660 = v658.child and v658.child.sibling;
                        if v660 ~= nil then
                            v658 = v660;
                        end;
                    end;
                    return (l_Array_0.map(v206(v656), function(v661)
                        return v661.stateNode;
                    end));
                end;
            end);
            local v664 = if l_status_1 then l_result_1 else nil;
            if v664 ~= nil then
                l_console_0.log("Nodes:", v664);
            end;
            if v657.source ~= nil then
                l_console_0.log("Location:", v657.source);
            end;
            return ;
        end;
    end;
    local function v672(v666, v667, v668, v669)
        local v670 = v223(v667);
        if v670 ~= nil then
            local l_stateNode_4 = v670.stateNode;
            if v666 == "context" then
                v669 = l_Array_0.slice(v669, 1);
                if v670.tag == l_ClassComponent_1 then
                    if not (#v669 == 0) then
                        l_deletePathInObject_0(l_stateNode_4.context, v669);
                    end;
                    l_stateNode_4:forceUpdate();
                    return ;
                elseif v670.tag == l_FunctionComponent_1 then
                    return ;
                end;
            elseif v666 == "hooks" then
                if type(v160) == "function" then
                    v160(v670, v668, v669);
                    return ;
                end;
            elseif v666 == "props" then
                if l_stateNode_4 == nil then
                    if type(v163) == "function" then
                        v163(v670, v669);
                        return ;
                    end;
                else
                    v670.pendingProps = l_copyWithDelete_0(l_stateNode_4.props, v669);
                    l_stateNode_4:forceUpdate();
                    return ;
                end;
            elseif v666 == "state" then
                l_deletePathInObject_0(l_stateNode_4.state, v669);
                l_stateNode_4:forceUpdate();
            end;
        end;
    end;
    local function v680(v673, v674, v675, v676, v677)
        local v678 = v223(v674);
        if v678 ~= nil then
            local l_stateNode_5 = v678.stateNode;
            if v673 == "context" then
                v676 = l_Array_0.slice(v676, 1);
                v677 = l_Array_0.slice(v677, 1);
                if v678.tag == l_ClassComponent_1 then
                    if not (#v676 == 0) then
                        l_renamePathInObject_0(l_stateNode_5.context, v676, v677);
                    end;
                    l_stateNode_5:forceUpdate();
                    return ;
                elseif v678.tag == l_FunctionComponent_1 then
                    return ;
                end;
            elseif v673 == "hooks" then
                if type(v161) == "function" then
                    v161(v678, v675, v676, v677);
                    return ;
                end;
            elseif v673 == "props" then
                if l_stateNode_5 == nil then
                    if type(v164) == "function" then
                        v164(v678, v676, v677);
                        return ;
                    end;
                else
                    v678.pendingProps = l_copyWithRename_0(l_stateNode_5.props, v676, v677);
                    l_stateNode_5:forceUpdate();
                    return ;
                end;
            elseif v673 == "state" then
                l_renamePathInObject_0(l_stateNode_5.state, v676, v677);
                l_stateNode_5:forceUpdate();
            end;
        end;
    end;
    local function v688(v681, v682, v683, v684, v685)
        local v686 = v223(v682);
        if v686 ~= nil then
            local l_stateNode_6 = v686.stateNode;
            if v681 == "context" then
                v684 = l_Array_0.slice(v684, 1);
                if v686.tag == l_ClassComponent_1 then
                    if #v684 == 0 then
                        l_stateNode_6.context = v685;
                    else
                        l_setInObject_0(l_stateNode_6.context, v684, v685);
                    end;
                    l_stateNode_6:forceUpdate();
                    return ;
                elseif v686.tag == l_FunctionComponent_1 then
                    return ;
                end;
            elseif v681 == "hooks" then
                if type(v159) == "function" then
                    v159(v686, v683, v684, v685);
                    return ;
                end;
            elseif v681 == "props" then
                if l_stateNode_6 == nil then
                    if type(v162) == "function" then
                        v162(v686, v684, v685);
                        return ;
                    end;
                else
                    v686.pendingProps = l_copyWithSet_0(l_stateNode_6.props, v684, v685);
                    l_stateNode_6:forceUpdate();
                    return ;
                end;
            elseif v681 == "state" then
                l_setInObject_0(l_stateNode_6.state, v684, v685);
                l_stateNode_6:forceUpdate();
            end;
        end;
    end;
    local function v717()
        local v689 = {};
        if v193 == nil then
            error("getProfilingData() called before any profiling data was recorded");
        end;
        v193:forEach(function(v690, v691)
            local v692 = {};
            local v693 = {};
            local v694 = l_Map_0.new();
            local v695 = l_Map_0.new();
            local v696 = v186 ~= nil and v186:get(v691) or "Unknown";
            if v188 ~= nil then
                v188:forEach(function(v697, v698)
                    if v189 ~= nil and v189:get(v698) == v691 then
                        table.insert(v693, {
                            v698, 
                            v697
                        });
                    end;
                end);
            end;
            for v699, v700 in v690, nil, nil do
                local l_changeDescriptions_0 = v700.changeDescriptions;
                local l_durations_0 = v700.durations;
                local l_interactions_0 = v700.interactions;
                local l_maxActualDuration_0 = v700.maxActualDuration;
                local l_priorityLevel_0 = v700.priorityLevel;
                local l_commitTime_0 = v700.commitTime;
                local v707 = {};
                for _, v709 in l_interactions_0, nil, nil do
                    if not v694:has(v709.id) then
                        v694:set(v709.id, v709);
                    end;
                    table.insert(v707, v709.id);
                    local v710 = v695:get(v709.id);
                    if v710 ~= nil then
                        table.insert(v710, v699);
                    else
                        v695:set(v709.id, {
                            v699
                        });
                    end;
                end;
                local v711 = {};
                local v712 = {};
                for v713 = 1, #l_durations_0, 3 do
                    local v714 = l_durations_0[v713];
                    table.insert(v711, {
                        v714, 
                        l_durations_0[v713 + 1]
                    });
                    table.insert(v712, {
                        v714, 
                        l_durations_0[v713 + 2]
                    });
                end;
                table.insert(v692, {
                    changeDescriptions = if l_changeDescriptions_0 ~= nil then l_Array_0.from(l_changeDescriptions_0:entries()) else nil, 
                    duration = l_maxActualDuration_0, 
                    fiberActualDurations = v711, 
                    fiberSelfDurations = v712, 
                    interactionIDs = v707, 
                    priorityLevel = l_priorityLevel_0, 
                    timestamp = l_commitTime_0
                });
            end;
            local _ = l_Array_0.from(v695:entries());
            local _ = l_Array_0.from(v694:entries());
            table.insert(v689, {
                commitData = v692, 
                displayName = v696, 
                initialTreeBaseDurations = v693, 
                interactionCommits = l_Array_0.from(v695:entries()), 
                interactions = l_Array_0.from(v694:entries()), 
                rootID = v691
            });
        end);
        return {
            dataForRoots = v689, 
            rendererID = v119
        };
    end;
    local function v726(v718)
        if not v190 then
            v192 = v718;
            v186 = l_Map_0.new();
            v188 = l_Map_0.new(v125);
            v189 = l_Map_0.new(v126);
            v187 = l_Map_0.new();
            v118.getFiberRoots(v119):forEach(function(v719)
                local v720 = v208(v719.current);
                if not v122:has(v720) then
                    local v721 = l_getUID_0();
                    v122:set(v720, v721);
                    v123:set(v721, v720);
                end;
                v186:set(v122:get(v720), v218(v719.current));
                if v718 then
                    v720 = v719.current;
                    if v214(v720) == l_ElementTypeClass_0 and v187 ~= nil then
                        local v722 = v208(v720);
                        if not v122:has(v722) then
                            local v723 = l_getUID_0();
                            v122:set(v722, v723);
                            v123:set(v723, v722);
                        end;
                        local v724 = v122:get(v722);
                        v722 = v217(v720);
                        if v722 ~= nil then
                            v187:set(v724, v722);
                        end;
                    end;
                    local l_child_16 = v720.child;
                    while l_child_16 ~= nil do
                        v270(l_child_16);
                        l_child_16 = l_child_16.sibling;
                    end;
                end;
            end);
            v190 = true;
            v191 = os.clock();
            v193 = l_Map_0.new();
            return ;
        else
            return ;
        end;
    end;
    local function v727()
        v190 = false;
        v192 = false;
    end;
    if l_sessionStorageGetItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0) == "true" then
        v726(l_sessionStorageGetItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0) == "true");
    end;
    local function v728()
        return false;
    end;
    local function v732(v729)
        local v730 = v208(v729);
        if not v122:has(v730) then
            local v731 = l_getUID_0();
            v122:set(v730, v731);
            v123:set(v731, v730);
        end;
        return v197:has((v122:get(v730)));
    end;
    local function v736(v733, v734)
        if not (typeof(v165) == "function") or typeof(v166) ~= "function" then
            error("Expected overrideSuspense() to not get called for earlier React versions.");
        end;
        if not v734 then
            v197:delete(v733);
            if v197.size == 0 then
                v165(v728);
            end;
        else
            v197:add(v733);
            if v197.size == 1 then
                v165(v732);
            end;
        end;
        local v735 = v123:get(v733);
        if v735 ~= nil then
            v166(v735);
        end;
    end;
    v207 = function(v737)
        if v737 == nil then
            v201 = nil;
            v202 = -1;
            v203 = false;
        end;
        v200 = v737;
    end;
    v220 = function(v738)
        if v200 ~= nil and v203 then
            local l_return__3 = v738.return_;
            local v740 = if l_return__3 ~= nil then l_return__3.alternate else nil;
            if not (v201 ~= l_return__3) or v201 == v740 and v740 ~= nil then
                local v741 = v225(v738);
                local v742 = v200[v202 + 1];
                if v742 == nil then
                    error("Expected to see a frame at the next depth.");
                end;
                if (v741.index == v742.index and v741.key == v742.key) and v741.displayName == v742.displayName then
                    v201 = v738;
                    v202 = v202 + 1;
                    if v202 == #v200 - 1 then
                        v203 = false;
                    else
                        v203 = true;
                    end;
                    return false;
                end;
            end;
            v203 = false;
            return true;
        else
            return false;
        end;
    end;
    v221 = function(v743)
        v203 = v743;
    end;
    v211 = function(v744, v745)
        local v746 = v218(v745);
        local v747 = v184:get(v746) or 0;
        v184:set(v746, v747 + 1);
        v183:set(v744, (string.format("%s:%d", v746, v747)));
    end;
    v212 = function(v748)
        local v749 = v183:get(v748);
        if v749 == nil then
            error("Expected root pseudo key to be known.");
        end;
        local v750 = string.sub(v749, 1, l_String_0.lastIndexOf(v749, ":") - 1);
        local v751 = v184:get(v750);
        if v751 == nil then
            error("Expected counter to be known.");
        end;
        if v751 > 1 then
            v184:set(v750, v751 - 1);
        else
            v184:delete(v750);
        end;
        v183:delete(v748);
    end;
    v218 = function(v752)
        local v753 = nil;
        local v754 = nil;
        local l_child_17 = v752.child;
        for _ = 0, 2 do
            if l_child_17 ~= nil then
                local v757 = l_getDisplayNameForFiber_0(l_child_17);
                if v757 ~= nil then
                    if typeof(l_child_17.type) == "function" then
                        v753 = v757;
                    elseif v754 == nil then
                        v754 = v757;
                    end;
                end;
                if v753 == nil then
                    l_child_17 = l_child_17.child;
                else
                    break;
                end;
            else
                break;
            end;
        end;
        return (v753 or v754) or "Anonymous";
    end;
    v225 = function(v758)
        local l_key_2 = v758.key;
        local v760 = l_getDisplayNameForFiber_0(v758);
        local l_index_0 = v758.index;
        if v758.tag == l_HostRoot_1 then
            local v762 = v208(v758);
            if not v122:has(v762) then
                local v763 = l_getUID_0();
                v122:set(v762, v763);
                v123:set(v763, v762);
            end;
            v762 = v183:get((v122:get(v762)));
            if v762 == nil then
                error("Expected mounted root to have known pseudo key.");
            end;
            v760 = v762;
        elseif v758.tag == l_HostComponent_1 then
            v760 = v758.type;
        end;
        return {
            displayName = v760, 
            key = l_key_2, 
            index = l_index_0
        };
    end;
    return {
        cleanup = v467, 
        copyElementPath = v620, 
        deletePath = v672, 
        findNativeNodesForFiberID = v502, 
        flushInitialOperations = v476, 
        getBestMatchForTrackedPath = function()
            if v200 == nil then
                return nil;
            elseif v201 == nil then
                return nil;
            else
                local l_v201_0 = v201;
                while not (not (l_v201_0 ~= nil) or not v249(l_v201_0)) do
                    l_v201_0 = l_v201_0.return_;
                end;
                if l_v201_0 == nil then
                    return nil;
                else
                    local v765 = {};
                    local v766 = v208(l_v201_0);
                    if not v122:has(v766) then
                        local v767 = l_getUID_0();
                        v122:set(v766, v767);
                        v123:set(v767, v766);
                    end;
                    v765.id = v122:get(v766);
                    v765.isFullMatch = v202 == #v200;
                    return v765;
                end;
            end;
        end, 
        getDisplayNameForFiberID = v505, 
        getFiberIDForNative = v511, 
        getInstanceAndStyle = v550, 
        getOwnersList = v545, 
        getPathForElement = function(v768)
            local v769 = v123:get(v768);
            if v769 == nil then
                return nil;
            else
                local v770 = {};
                while v769 ~= nil do
                    table.insert(v770, v225(v769));
                    v769 = v769.return_;
                end;
                l_Array_0.reverse(v770);
                return v770;
            end;
        end, 
        getProfilingData = v717, 
        handleCommitFiberRoot = v490, 
        handleCommitFiberUnmount = v478, 
        inspectElement = v655, 
        logElementToConsole = v665, 
        prepareViewAttributeSource = v528, 
        prepareViewElementSource = v534, 
        overrideSuspense = v736, 
        overrideValueAtPath = v688, 
        renamePath = v680, 
        renderer = v120, 
        setTraceUpdatesEnabled = function(v771)
            v198 = v771;
        end, 
        setTrackedPath = v207, 
        startProfiling = v726, 
        stopProfiling = v727, 
        storeAsGlobal = v617, 
        updateComponentFilters = v237, 
        getDisplayNameForRoot = v218
    };
end;
return v12;
