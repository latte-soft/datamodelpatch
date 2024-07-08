local l___DEV___0 = _G.__DEV__;
local l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Error_0 = v3.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent["ReactFiberStack.new"]);
local l_isFiberMounted_0 = require(script.Parent.ReactFiberTreeReflection).isFiberMounted;
local l_disableLegacyContext_0 = require(l_Parent_0.Shared).ReactFeatureFlags.disableLegacyContext;
local v11 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v11.ClassComponent;
local l_HostRoot_0 = v11.HostRoot;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_createCursor_0 = v8.createCursor;
local l_push_0 = v8.push;
local l_pop_0 = v8.pop;
local v19 = nil;
if l___DEV___0 then
    v19 = {};
end;
local v20 = {};
if l___DEV___0 then
    l_Object_0.freeze(v20);
end;
local v21 = l_createCursor_0(v20);
local v22 = l_createCursor_0(false);
local l_v20_0 = v20;
local v24 = nil;
local function v28(_, v26, v27)
    if not v27 or not v24(v26) then
        return v21.current;
    else
        return l_v20_0;
    end;
end;
local function v33(v29, v30, v31)
    local l_stateNode_0 = v29.stateNode;
    l_stateNode_0.__reactInternalMemoizedUnmaskedChildContext = v30;
    l_stateNode_0.__reactInternalMemoizedMaskedChildContext = v31;
end;
local function v43(v34, v35)
    local l_type_0 = v34.type;
    if type(l_type_0) == "function" then
        return v35;
    else
        local l_contextTypes_0 = l_type_0.contextTypes;
        if l_contextTypes_0 then
            local l_stateNode_1 = v34.stateNode;
            if l_stateNode_1 and l_stateNode_1.__reactInternalMemoizedUnmaskedChildContext == v35 then
                return l_stateNode_1.__reactInternalMemoizedMaskedChildContext;
            else
                local v39 = {};
                for v40, _ in l_contextTypes_0, nil, nil do
                    v39[v40] = v35[v40];
                end;
                if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) then
                    l_checkPropTypes_0(l_contextTypes_0, nil, v39, "context", l_getComponentName_0(l_type_0) or "Unknown");
                end;
                if l_stateNode_1 then
                    local l_stateNode_2 = v34.stateNode;
                    l_stateNode_2.__reactInternalMemoizedUnmaskedChildContext = v35;
                    l_stateNode_2.__reactInternalMemoizedMaskedChildContext = v39;
                end;
                return v39;
            end;
        else
            return v20;
        end;
    end;
end;
local function v44()
    if not l_disableLegacyContext_0 then
        return v22.current;
    else
        return false;
    end;
end;
v24 = function(v45)
    if type(v45) == "function" then
        return false;
    else
        return v45.childContextTypes ~= nil;
    end;
end;
local function v47(v46)
    l_pop_0(v22, v46);
    l_pop_0(v21, v46);
end;
local function v49(v48)
    l_pop_0(v22, v48);
    l_pop_0(v21, v48);
end;
local function v53(v50, v51, v52)
    if v21.current ~= v20 then
        error(l_Error_0.new("Unexpected context found on stack. " .. "This error is likely caused by a bug in React. Please file an issue."));
    end;
    l_push_0(v21, v51, v50);
    l_push_0(v22, v52, v50);
end;
local function v63(v54, v55, v56)
    local l_stateNode_3 = v54.stateNode;
    local l_childContextTypes_0 = v55.childContextTypes;
    if not (l_stateNode_3.getChildContext ~= nil) or type(l_stateNode_3.getChildContext) ~= "function" then
        if l___DEV___0 then
            local v59 = l_getComponentName_0(v55) or "Unknown";
            if not v19[v59] then
                v19[v59] = true;
                l_console_0.error("%s.childContextTypes is specified but there is no getChildContext() method " .. "on the instance. You can either define getChildContext() on %s or remove " .. "childContextTypes from it.", v59, v59);
            end;
        end;
        return v56;
    else
        local v60 = l_stateNode_3:getChildContext();
        for v61, _ in v60, nil, nil do
            if l_childContextTypes_0[v61] == nil then
                error(l_Error_0.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", l_getComponentName_0(v55) or "Unknown", v61)));
            end;
        end;
        if not (not l___DEV___0 and not l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) then
            l_checkPropTypes_0(l_childContextTypes_0, nil, v60, "child context", l_getComponentName_0(v55) or "Unknown");
        end;
        return l_Object_0.assign({}, v56, v60);
    end;
end;
return {
    emptyContextObject = v20, 
    getUnmaskedContext = v28, 
    cacheContext = v33, 
    getMaskedContext = v43, 
    hasContextChanged = v44, 
    popContext = v47, 
    popTopLevelContextObject = v49, 
    pushTopLevelContextObject = v53, 
    processChildContext = v63, 
    isContextProvider = v24, 
    pushContextProvider = function(v64)
        local l_stateNode_4 = v64.stateNode;
        local v66 = not not l_stateNode_4 and l_stateNode_4.__reactInternalMemoizedMergedChildContext or v20;
        l_v20_0 = v21.current;
        l_push_0(v21, v66, v64);
        l_push_0(v22, v22.current, v64);
        return true;
    end, 
    invalidateContextProvider = function(v67, v68, v69)
        local l_stateNode_5 = v67.stateNode;
        if not l_stateNode_5 then
            error(l_Error_0.new("Expected to have an instance by this point. " .. "This error is likely caused by a bug in React. Please file an issue."));
        end;
        if not v69 then
            l_pop_0(v22, v67);
            l_push_0(v22, v69, v67);
            return ;
        else
            local v71 = v63(v67, v68, l_v20_0);
            l_stateNode_5.__reactInternalMemoizedMergedChildContext = v71;
            l_pop_0(v22, v67);
            l_pop_0(v21, v67);
            l_push_0(v21, v71, v67);
            l_push_0(v22, v69, v67);
            return ;
        end;
    end, 
    findCurrentUnmaskedContext = function(v72)
        if not (v72.tag == l_ClassComponent_0 and l_isFiberMounted_0(v72)) then
            error(l_Error_0.new("Expected subtree parent to be a mounted class component. " .. "This error is likely caused by a bug in React. Please file an issue."));
        end;
        local l_v72_0 = v72;
        while true do
            if l_v72_0.tag == l_HostRoot_0 then
                return l_v72_0.stateNode.context;
            elseif l_v72_0.tag == l_ClassComponent_0 and l_v72_0.type.childContextTypes ~= nil then
                return l_v72_0.stateNode.__reactInternalMemoizedMergedChildContext;
            else
                l_v72_0 = l_v72_0.return_;
                if not (l_v72_0 ~= nil) then
                    error(l_Error_0.new("Found unexpected detached subtree parent. " .. "This error is likely caused by a bug in React. Please file an issue."));
                    return ;
                end;
            end;
        end;
    end
};
