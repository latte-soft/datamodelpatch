local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_clearTimeout_0 = v3.clearTimeout;
local l_Map_0 = v3.Map;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_setTimeout_0 = v3.setTimeout;
local l_WeakMap_0 = v3.WeakMap;
local _ = require(l_Parent_1.GraphQL);
local v12 = require(l_Parent_0.jsutils.equal);
local _ = require(l_Parent_0.cache);
local _ = require(script.Parent.watchQueryOptions_types);
local _ = require(script.Parent.ObservableQuery_types);
local _ = require(script.Parent.Parent.link.core);
local v17 = require(script.Parent.Parent.utilities);
local l_isNonEmptyArray_0 = v17.isNonEmptyArray;
local l_graphQLResultHasError_0 = v17.graphQLResultHasError;
local l_canUseWeakMap_0 = v17.canUseWeakMap;
local v21 = require(script.Parent.networkStatus);
local l_NetworkStatus_0 = v21.NetworkStatus;
local l_isNetworkRequestInFlight_0 = v21.isNetworkRequestInFlight;
local _ = require(script.Parent.Parent.errors);
local v25 = {
    FORBID = 0, 
    OVERWRITE = 1, 
    MERGE = 2
};
v0.CacheWriteBehavior = v25;
local v26 = if not l_canUseWeakMap_0 then l_Map_0.new(nil) else l_WeakMap_0.new();
local function _(v27, v28)
    local v29 = v27[v28];
    if typeof(v29) == "function" then
        v27[v28] = function(...)
            v26:set(v27, (v26:get(v27) + 1) % 1000000000000000);
            return v29(...);
        end;
    end;
end;
local function _(v31)
    if l_Boolean_0.toJSBoolean(v31.notifyTimeout) then
        l_clearTimeout_0(v31.notifyTimeout);
        v31.notifyTimeout = nil;
    end;
end;
local v33 = {};
v33.__index = v33;
v33.new = function(v34)
    local v35 = {
        listeners = l_Set_0.new(), 
        document = nil, 
        lastRequestId = 1, 
        subscriptions = l_Set_0.new(), 
        stopped = false, 
        cache = v34, 
        dirty = false, 
        observableQuery = nil
    };
    if not v26:has(v34) then
        v26:set(v34, 0);
        local l_evict_0 = v34.evict;
        if typeof(l_evict_0) == "function" then
            local l_l_evict_0_0 = l_evict_0 --[[ copy: 2 -> 4 ]];
            v34.evict = function(...)
                v26:set(v34, (v26:get(v34) + 1) % 1000000000000000);
                return l_l_evict_0_0(...);
            end;
        end;
        l_evict_0 = v34.modify;
        if typeof(l_evict_0) == "function" then
            local l_l_evict_0_1 = l_evict_0 --[[ copy: 2 -> 3 ]];
            v34.modify = function(...)
                v26:set(v34, (v26:get(v34) + 1) % 1000000000000000);
                return l_l_evict_0_1(...);
            end;
        end;
        l_evict_0 = v34.reset;
        if typeof(l_evict_0) == "function" then
            v34.reset = function(...)
                v26:set(v34, (v26:get(v34) + 1) % 1000000000000000);
                return l_evict_0(...);
            end;
        end;
    end;
    return (setmetatable(v35, v33));
end;
v33.init = function(v39, v40)
    local v41 = not not l_Boolean_0.toJSBoolean(v40.networkStatus) and v40.networkStatus or l_NetworkStatus_0.loading;
    if not (not (l_Boolean_0.toJSBoolean(v39.variables) and v39.networkStatus ~= l_NetworkStatus_0.loading) or v12(v39.variables, v40.variables)) then
        v41 = l_NetworkStatus_0.setVariables;
    end;
    if not v12(v40.variables, v39.variables) then
        v39.lastDiff = nil;
    end;
    l_Object_0.assign(v39, {
        document = v40.document, 
        variables = v40.variables, 
        networkError = l_Object_0.None, 
        graphQLErrors = not not l_Boolean_0.toJSBoolean(v39.graphQLErrors) and v39.graphQLErrors or {}, 
        networkStatus = v41
    });
    if l_Boolean_0.toJSBoolean(v40.observableQuery) then
        v39:setObservableQuery(v40.observableQuery);
    end;
    if l_Boolean_0.toJSBoolean(v40.lastRequestId) then
        v39.lastRequestId = v40.lastRequestId;
    end;
    return v39;
end;
v33.reset = function(v42)
    if l_Boolean_0.toJSBoolean(v42.notifyTimeout) then
        l_clearTimeout_0(v42.notifyTimeout);
        v42.notifyTimeout = nil;
    end;
    v42.lastDiff = nil;
    v42.dirty = false;
end;
v33.getDiff = function(v43, v44)
    if v44 == nil then
        v44 = v43.variables;
    end;
    local v45 = v43:getDiffOptions(v44);
    if not l_Boolean_0.toJSBoolean(v43.lastDiff) or not v12(v45, v43.lastDiff.options) then
        v43.variables = v44;
        v43:updateWatch(v43.variables);
        local l_observableQuery_0 = v43.observableQuery;
        if l_Boolean_0.toJSBoolean(l_observableQuery_0) and l_observableQuery_0.options.fetchPolicy == "no-cache" then
            return {
                complete = false
            };
        else
            local v47 = v43.cache:diff(v45);
            v43:updateLastDiff(v47, v45);
            return v47;
        end;
    else
        return v43.lastDiff.diff;
    end;
end;
v33.updateLastDiff = function(v48, v49, v50)
    v48.lastDiff = not not l_Boolean_0.toJSBoolean(v49) and {
        diff = v49, 
        options = not not l_Boolean_0.toJSBoolean(v50) and v50 or v48:getDiffOptions()
    } or nil;
end;
v33.getDiffOptions = function(v51, v52)
    if v52 == nil then
        v52 = v51.variables;
    end;
    local l_observableQuery_1 = v51.observableQuery;
    return {
        query = v51.document, 
        variables = v52, 
        returnPartialData = true, 
        optimistic = true, 
        canonizeResults = not l_Boolean_0.toJSBoolean(l_observableQuery_1) or l_observableQuery_1.options.canonizeResults ~= false
    };
end;
v33.setDiff = function(v54, v55)
    local v56 = nil;
    v56 = if not l_Boolean_0.toJSBoolean(v54.lastDiff) then v54.lastDiff else v54.lastDiff.diff;
    v54:updateLastDiff(v55);
    local v57 = nil;
    local v58 = nil;
    v57 = if not l_Boolean_0.toJSBoolean(v56) then v56 else v56.result;
    v58 = if not l_Boolean_0.toJSBoolean(v55) then v55 else v55.result;
    if not (v54.dirty or v12(v57, v58)) then
        v54.dirty = true;
        if not l_Boolean_0.toJSBoolean(v54.notifyTimeout) then
            v54.notifyTimeout = l_setTimeout_0(function()
                return v54:notify();
            end, 0);
        end;
    end;
end;
v33.setObservableQuery = function(v59, v60)
    if v60 == v59.observableQuery then
        return ;
    else
        if l_Boolean_0.toJSBoolean(v59.oqListener) then
            v59.listeners:delete(v59.oqListener);
        end;
        v59.observableQuery = v60;
        if l_Boolean_0.toJSBoolean(v60) and v60 ~= nil then
            v60.queryInfo = v59;
            v59.oqListener = function()
                if not l_Boolean_0.toJSBoolean(v59:getDiff().fromOptimisticTransaction) then
                    v60:reobserve();
                    return ;
                else
                    v60.observe(v60);
                    return ;
                end;
            end;
            v59.listeners:add(v59.oqListener);
            return ;
        else
            v59.oqListener = nil;
            return ;
        end;
    end;
end;
v33.notify = function(v61)
    if l_Boolean_0.toJSBoolean(v61.notifyTimeout) then
        l_clearTimeout_0(v61.notifyTimeout);
        v61.notifyTimeout = nil;
    end;
    if v61:shouldNotify() then
        v61.listeners:forEach(function(v62)
            return v62(v61);
        end);
    end;
    v61.dirty = false;
end;
v33.shouldNotify = function(v63)
    if v63.dirty and l_Boolean_0.toJSBoolean(v63.listeners.size) then
        if not (not l_isNetworkRequestInFlight_0(v63.networkStatus) or not l_Boolean_0.toJSBoolean(v63.observableQuery)) then
            local l_fetchPolicy_0 = v63.observableQuery.options.fetchPolicy;
            if l_fetchPolicy_0 ~= "cache-only" and l_fetchPolicy_0 ~= "cache-and-network" then
                return false;
            end;
        end;
        return true;
    else
        return false;
    end;
end;
v33.stop = function(v65)
    if not v65.stopped then
        v65.stopped = true;
        v65:reset();
        v65:cancel();
        v65.cancel = v33.cancel;
        v65.subscriptions:forEach(function(v66)
            return v66:unsubscribe();
        end);
        local l_observableQuery_2 = v65.observableQuery;
        if l_Boolean_0.toJSBoolean(l_observableQuery_2) then
            l_observableQuery_2:stopPolling();
        end;
    end;
end;
v33.cancel = function(_)
end;
v33.updateWatch = function(v69, v70)
    if v70 == nil then
        v70 = v69.variables;
    end;
    local l_observableQuery_3 = v69.observableQuery;
    if l_Boolean_0.toJSBoolean(l_observableQuery_3) and l_observableQuery_3.options.fetchPolicy == "no-cache" then
        return ;
    else
        local v74 = l_Object_0.assign({}, v69:getDiffOptions(v70), {
            watcher = v69, 
            callback = function(_, v73)
                return v69:setDiff(v73);
            end
        });
        local v75 = l_Object_0.assign({}, v74, {
            callback = l_Object_0.None
        });
        local v76 = l_Object_0.assign({}, v69.lastWatch, {
            callback = l_Object_0.None
        });
        if not (l_Boolean_0.toJSBoolean(v69.lastWatch) and v12(v75, v76)) then
            v69:cancel();
            v69.lastWatch = v74;
            v69.cancel = v69.cache:watch(v69.lastWatch);
        end;
        return ;
    end;
end;
v33.resetLastWrite = function(v77)
    v77.lastWrite = nil;
end;
v33.shouldWrite = function(v78, v79, v80)
    local l_lastWrite_0 = v78.lastWrite;
    local v82 = l_Boolean_0.toJSBoolean(l_lastWrite_0);
    if v82 then
        v82 = false;
        if l_lastWrite_0.dmCount == v26:get(v78.cache) then
            v82 = v12(v80, l_lastWrite_0.variables) and v12(v79.data, l_lastWrite_0.result.data);
        end;
    end;
    return not v82;
end;
local v83 = nil;
v33.markResult = function(v84, v85, v86, v87)
    if not l_isNonEmptyArray_0(v85.errors) then
        v84.graphQLErrors = {};
    else
        v84.graphQLErrors = v85.errors;
    end;
    v84:reset();
    if v86.fetchPolicy == "no-cache" then
        v84:updateLastDiff({
            result = v85.data, 
            complete = true
        }, v84:getDiffOptions(v86.variables));
        return ;
    else
        if v87 ~= v25.FORBID then
            if not v83(v85, v86.errorPolicy) then
                v84.lastWrite = nil;
            else
                v84.cache:performTransaction(function(v88)
                    if not v84:shouldWrite(v85, v86.variables) then
                        if not (not l_Boolean_0.toJSBoolean(v84.lastDiff) or not l_Boolean_0.toJSBoolean(v84.lastDiff.diff.complete)) then
                            v85.data = v84.lastDiff.diff.result;
                            return ;
                        end;
                    else
                        v88:writeQuery({
                            query = v84.document, 
                            data = v85.data, 
                            variables = v86.variables, 
                            overwrite = v87 == v25.OVERWRITE
                        });
                        v84.lastWrite = {
                            result = v85, 
                            variables = v86.variables, 
                            dmCount = v26:get(v84.cache)
                        };
                    end;
                    local v89 = v84:getDiffOptions(v86.variables);
                    local v90 = v88:diff(v89);
                    if not v84.stopped then
                        v84:updateWatch(v86.variables);
                    end;
                    v84:updateLastDiff(v90, v89);
                    if l_Boolean_0.toJSBoolean(v90.complete) then
                        v85.data = v90.result;
                    end;
                end);
                return ;
            end;
        end;
        return ;
    end;
end;
v33.markReady = function(v91)
    v91.networkError = nil;
    v91.networkStatus = l_NetworkStatus_0.ready;
    return v91.networkStatus;
end;
v33.markError = function(v92, v93)
    v92.networkStatus = l_NetworkStatus_0.error;
    v92.lastWrite = nil;
    v92:reset();
    if l_Boolean_0.toJSBoolean(v93.graphQLErrors) then
        v92.graphQLErrors = v93.graphQLErrors;
    end;
    if l_Boolean_0.toJSBoolean(v93.networkError) then
        v92.networkError = v93.networkError;
    end;
    return v93;
end;
v0.QueryInfo = v33;
v83 = function(v94, v95)
    if v95 == nil then
        v95 = "none";
    end;
    local v96 = true;
    if v95 ~= "ignore" then
        v96 = v95 == "all";
    end;
    return not l_graphQLResultHasError_0(v94) or (v96 and l_Boolean_0.toJSBoolean(v94.data)) and true;
end;
v0.shouldWriteResult = v83;
return v0;
