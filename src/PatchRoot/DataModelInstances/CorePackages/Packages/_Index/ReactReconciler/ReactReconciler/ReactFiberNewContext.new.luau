local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Number_0 = v1.Number;
local l_Error_0 = v1.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v7 = require(script.Parent["ReactFiberStack.new"]);
local v8 = require(script.Parent.ReactFiberLane);
local v9 = require(script.Parent["ReactUpdateQueue.new"]);
local l_isPrimaryRenderer_0 = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer;
local l_createCursor_0 = v7.createCursor;
local l_push_0 = v7.push;
local l_pop_0 = v7.pop;
local l_MAX_SIGNED_31_BIT_INT_0 = require(script.Parent.MaxInts).MAX_SIGNED_31_BIT_INT;
local v15 = require(script.Parent.ReactWorkTags);
local l_ContextProvider_0 = v15.ContextProvider;
local l_ClassComponent_0 = v15.ClassComponent;
local l_NoLanes_0 = v8.NoLanes;
local l_NoTimestamp_0 = v8.NoTimestamp;
local l_isSubsetOfLanes_0 = v8.isSubsetOfLanes;
local l_includesSomeLane_0 = v8.includesSomeLane;
local l_mergeLanes_0 = v8.mergeLanes;
local l_pickArbitraryLane_0 = v8.pickArbitraryLane;
local l_objectIs_0 = require(l_Parent_0.Shared).objectIs;
local l_createUpdate_0 = v9.createUpdate;
local l_ForceUpdate_0 = v9.ForceUpdate;
local v27 = {};
local v28 = l_createCursor_0(nil);
local v29 = nil;
if _G.__DEV__ then
    v29 = {};
end;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = false;
v27.resetContextDependencies = function()
    v30 = nil;
    v31 = nil;
    v32 = nil;
    if _G.__DEV__ then
        v33 = false;
    end;
end;
v27.enterDisallowedContextReadInDEV = function()
    if _G.__DEV__ then
        v33 = true;
    end;
end;
v27.exitDisallowedContextReadInDEV = function()
    if _G.__DEV__ then
        v33 = false;
    end;
end;
v27.pushProvider = function(v34, v35)
    local l__context_0 = v34.type._context;
    if not l_isPrimaryRenderer_0 then
        l_push_0(v28, l__context_0._currentValue2, v34);
        l__context_0._currentValue2 = v35;
        if _G.__DEV__ then
            if l__context_0._currentRenderer2 ~= nil and l__context_0._currentRenderer2 ~= v29 then
                l_console_0.error("Detected multiple renderers concurrently rendering the " .. "same context provider. This is currently unsupported.");
            end;
            l__context_0._currentRenderer2 = v29;
        end;
    else
        l_push_0(v28, l__context_0._currentValue, v34);
        l__context_0._currentValue = v35;
        if _G.__DEV__ then
            if l__context_0._currentRenderer ~= nil and l__context_0._currentRenderer ~= v29 then
                l_console_0.error("Detected multiple renderers concurrently rendering the " .. "same context provider. This is currently unsupported.");
            end;
            l__context_0._currentRenderer = v29;
            return ;
        end;
    end;
end;
v27.popProvider = function(v37)
    local l_current_0 = v28.current;
    l_pop_0(v28, v37);
    local l__context_1 = v37.type._context;
    if not l_isPrimaryRenderer_0 then
        l__context_1._currentValue2 = l_current_0;
        return ;
    else
        l__context_1._currentValue = l_current_0;
        return ;
    end;
end;
v27.calculateChangedBits = function(v40, v41, v42)
    if not l_objectIs_0(v42, v41) then
        local l_l_MAX_SIGNED_31_BIT_INT_0_0 = l_MAX_SIGNED_31_BIT_INT_0;
        if typeof(v40._calculateChangedBits) == "function" then
            l_l_MAX_SIGNED_31_BIT_INT_0_0 = v40._calculateChangedBits(v42, v41);
        end;
        return (math.floor(l_l_MAX_SIGNED_31_BIT_INT_0_0));
    else
        return 0;
    end;
end;
v27.scheduleWorkOnParentPath = function(v44, v45)
    local l_v44_0 = v44;
    while l_v44_0 ~= nil do
        local l_alternate_0 = l_v44_0.alternate;
        if l_isSubsetOfLanes_0(l_v44_0.childLanes, v45) then
            if not (not (l_alternate_0 ~= nil) or l_isSubsetOfLanes_0(l_alternate_0.childLanes, v45)) then
                l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v45);
            else
                break;
            end;
        else
            l_v44_0.childLanes = l_mergeLanes_0(l_v44_0.childLanes, v45);
            if l_alternate_0 ~= nil then
                l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v45);
            end;
        end;
        l_v44_0 = l_v44_0.return_;
    end;
end;
v27.propagateContextChange = function(v48, v49, v50, v51)
    local l_child_0 = v48.child;
    if l_child_0 ~= nil then
        l_child_0.return_ = v48;
    end;
    while l_child_0 ~= nil do
        local v53 = nil;
        local l_dependencies_0 = l_child_0.dependencies;
        if l_dependencies_0 ~= nil then
            v53 = l_child_0.child;
            local l_firstContext_0 = l_dependencies_0.firstContext;
            while l_firstContext_0 ~= nil do
                if l_firstContext_0.context == v49 and bit32.band(l_firstContext_0.observedBits, v50) ~= 0 then
                    if l_child_0.tag == l_ClassComponent_0 then
                        local v56 = l_createUpdate_0(l_NoTimestamp_0, l_pickArbitraryLane_0(v51));
                        v56.tag = l_ForceUpdate_0;
                        local l_updateQueue_0 = l_child_0.updateQueue;
                        if not (l_updateQueue_0 == nil) then
                            local l_shared_0 = l_updateQueue_0.shared;
                            local l_pending_0 = l_shared_0.pending;
                            if l_pending_0 == nil then
                                v56.next = v56;
                            else
                                v56.next = l_pending_0.next;
                                l_pending_0.next = v56;
                            end;
                            l_shared_0.pending = v56;
                        end;
                    end;
                    l_child_0.lanes = bit32.bor(l_child_0.lanes, v51);
                    local l_alternate_1 = l_child_0.alternate;
                    if l_alternate_1 ~= nil then
                        l_alternate_1.lanes = bit32.bor(l_alternate_1.lanes, v51);
                    end;
                    v27.scheduleWorkOnParentPath(l_child_0.return_, v51);
                    l_dependencies_0.lanes = bit32.bor(l_dependencies_0.lanes, v51);
                    break;
                else
                    l_firstContext_0 = l_firstContext_0.next;
                end;
            end;
        else
            v53 = if l_child_0.tag == l_ContextProvider_0 then if l_child_0.type == v48.type then nil else l_child_0.child else l_child_0.child;
        end;
        if v53 ~= nil then
            v53.return_ = l_child_0;
        else
            v53 = l_child_0;
            while v53 ~= nil do
                if v53 == v48 then
                    v53 = nil;
                    break;
                else
                    local l_sibling_0 = v53.sibling;
                    if l_sibling_0 ~= nil then
                        l_sibling_0.return_ = v53.return_;
                        v53 = l_sibling_0;
                        break;
                    else
                        v53 = v53.return_;
                    end;
                end;
            end;
        end;
        l_child_0 = v53;
    end;
end;
v27.prepareToReadContext = function(v62, v63, v64)
    v30 = v62;
    v31 = nil;
    v32 = nil;
    local l_dependencies_1 = v62.dependencies;
    if l_dependencies_1 ~= nil and l_dependencies_1.firstContext ~= nil then
        if l_includesSomeLane_0(l_dependencies_1.lanes, v63) then
            v64();
        end;
        l_dependencies_1.firstContext = nil;
    end;
end;
v27.readContext = function(v66, v67)
    if not (not _G.__DEV__ or not v33) then
        l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
    end;
    if not (not (not (v32 == v66) and v67 ~= false) or v67 == 0) then
        local v68 = nil;
        if not (typeof(v67) == "number") or v67 == l_Number_0.MAX_SAFE_INTEGER then
            v32 = v66;
            v68 = l_Number_0.MAX_SAFE_INTEGER;
        else
            v68 = v67;
        end;
        local v69 = {
            context = v66, 
            observedBits = v68, 
            next = nil
        };
        if v31 == nil then
            if v30 == nil then
                error(l_Error_0.new("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo()."));
            end;
            v31 = v69;
            v30.dependencies = {
                lanes = l_NoLanes_0, 
                firstContext = v69, 
                responders = nil
            };
        else
            v31.next = v69;
            v31 = v69;
        end;
    end;
    if not l_isPrimaryRenderer_0 then
        return v66._currentValue2;
    else
        return v66._currentValue;
    end;
end;
return v27;
