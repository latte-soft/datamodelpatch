local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local v9 = require(l_Parent_0.luaUtils.isCallable);
local v10 = require(l_Parent_1.Promise);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v12 = require(l_Parent_0.jsutils.equal);
local v13 = require(script.Parent.networkStatus);
local l_NetworkStatus_0 = v13.NetworkStatus;
local l_isNetworkRequestInFlight_0 = v13.isNetworkRequestInFlight;
local v16 = require(script.Parent.Parent.utilities);
local l_compact_0 = v16.compact;
local l_cloneDeep_0 = v16.cloneDeep;
local l_getOperationDefinition_0 = v16.getOperationDefinition;
local l_Observable_0 = v16.Observable;
local l_iterateObserversSafely_0 = v16.iterateObserversSafely;
local l_isNonEmptyArray_0 = v16.isNonEmptyArray;
local l_fixObservableSubclass_0 = v16.fixObservableSubclass;
local l_ApolloError_0 = require(script.Parent.Parent.errors).ApolloError;
local _ = require(script.Parent.types);
local _ = require(script.Parent.watchQueryOptions_types);
local _ = require(script.Parent.QueryInfo);
local _ = require(script.Parent.ObservableQuery_types);
local v29 = nil;
local v30 = false;
local v31 = setmetatable({}, {
    __index = l_Observable_0
});
v31.__index = function(v32, v33)
    if v33 == "variables" then
        return v32.options.variables;
    elseif not rawget(v32, v33) then
        if not rawget(v31, v33) then
            return getmetatable(v31).__index[v33];
        else
            return (rawget(v31, v33));
        end;
    else
        return (rawget(v32, v33));
    end;
end;
v31.__newindex = function(v34, v35, v36)
    if v35 == "variables" then
        error("setting getter-only property 'variables'");
    end;
    rawset(v34, v35, v36);
end;
v31.new = function(v37)
    local l_queryManager_0 = v37.queryManager;
    local l_queryInfo_0 = v37.queryInfo;
    local l_options_0 = v37.options;
    local v41 = nil;
    v41 = setmetatable(l_Observable_0.new(function(v42)
        xpcall(function()
            local l__observer_0 = v42._subscription._observer;
            if not (not l_Boolean_0.toJSBoolean(l__observer_0) or l_Boolean_0.toJSBoolean(l__observer_0.error)) then
                l__observer_0.error = v29;
            end;
        end, function()
        end);
        local v44 = not l_Boolean_0.toJSBoolean(v41.observers.size);
        v41.observers:add(v42);
        if not l_Boolean_0.toJSBoolean(v41.lastError) then
            if not (not l_Boolean_0.toJSBoolean(v41.lastResult) or not l_Boolean_0.toJSBoolean(v42.next)) then
                v42:next(v41.lastResult);
            end;
        elseif l_Boolean_0.toJSBoolean(v42.error) then
            v42:error(v41.lastError);
        end;
        if v44 then
            v41:reobserve():catch(function()
            end);
        end;
        return function()
            if not (not v41.observers:delete(v42) or l_Boolean_0.toJSBoolean(v41.observers.size)) then
                v41:tearDownQuery();
            end;
        end;
    end), v31);
    v41.observers = l_Set_0.new();
    v41.subscriptions = l_Set_0.new();
    v41.observer = {
        next = function(_, v46)
            if not (not l_Boolean_0.toJSBoolean(v41.lastError) and not v41:isDifferentFromLastResult(v46)) then
                v41:updateLastResult(v46);
                l_iterateObserversSafely_0(v41.observers, "next", v46);
            end;
        end, 
        error = function(_, v48)
            v41:updateLastResult((l_Object_0.assign({}, v41.lastResult, {
                error = v48, 
                errors = v48.graphQLErrors, 
                networkStatus = l_NetworkStatus_0.error, 
                loading = false
            })));
            v41.lastError = v48;
            l_iterateObserversSafely_0(v41.observers, "error", v41.lastError);
        end
    };
    v41.isTornDown = false;
    v41.options = l_options_0;
    v41.queryId = l_queryManager_0:generateQueryId();
    local v49 = l_getOperationDefinition_0(l_options_0.query);
    if l_Boolean_0.toJSBoolean(v49) then
        if l_Boolean_0.toJSBoolean(v49.name) then
            v41.queryName = v49.name.value;
        else
            v41.queryName = v49.name;
        end;
    else
        v41.queryName = v49;
    end;
    v41.initialFetchPolicy = not not l_Boolean_0.toJSBoolean(l_options_0.fetchPolicy) and l_options_0.fetchPolicy or "cache-first";
    v41.queryManager = l_queryManager_0;
    v41.queryInfo = l_queryInfo_0;
    return v41;
end;
v31.result = function(v50)
    return v10.new(function(v51, v52)
        local v53 = nil;
        local v54 = nil;
        v54 = {
            next = function(_, v56)
                v51(v56);
                v50.observers:delete(v54);
                if not l_Boolean_0.toJSBoolean(v50.observers.size) then
                    v50.queryManager:removeQuery(v50.queryId);
                end;
                l_setTimeout_0(function()
                    v53:unsubscribe();
                end, 0);
            end, 
            error = function(_, v58)
                v52(v58);
            end
        };
        v53 = v50:subscribe(v54);
    end);
end;
v31.getCurrentResult = function(v59, v60)
    if v60 == nil then
        v60 = true;
    end;
    local l_lastResult_0 = v59.lastResult;
    local v62 = nil;
    v62 = v59.options.fetchPolicy == nil and "cache-first" or v59.options.fetchPolicy;
    local v63 = nil;
    v63 = if not l_Boolean_0.toJSBoolean(v59.queryInfo.networkStatus) then if l_Boolean_0.toJSBoolean(l_lastResult_0) and l_Boolean_0.toJSBoolean(l_lastResult_0.networkStatus) then l_lastResult_0.networkStatus else l_NetworkStatus_0.ready else v59.queryInfo.networkStatus;
    local v64 = l_Object_0.assign({}, l_lastResult_0, {
        loading = l_isNetworkRequestInFlight_0(v63), 
        networkStatus = v63
    });
    if not v59.queryManager:transform(v59.options.query).hasForcedResolvers then
        local v65 = v59.queryInfo:getDiff();
        if not l_Boolean_0.toJSBoolean(v65.complete) and not l_Boolean_0.toJSBoolean(v59.options.returnPartialData) then
            v64.data = nil;
        else
            v64.data = v65.result;
        end;
        if not l_Boolean_0.toJSBoolean(v65.complete) then
            if v62 ~= "no-cache" then
                v64.partial = true;
            end;
        else
            if v64.networkStatus == l_NetworkStatus_0.loading and (not (v62 ~= "cache-first") or v62 == "cache-only") then
                v64.networkStatus = l_NetworkStatus_0.ready;
                v64.loading = false;
            end;
            v64.partial = nil;
        end;
        if not ((((l_Boolean_0.toJSBoolean(v65.complete) or l_Boolean_0.toJSBoolean(v59.options.partialRefetch)) or l_Boolean_0.toJSBoolean(v64.loading)) or l_Boolean_0.toJSBoolean(v64.data)) or l_Boolean_0.toJSBoolean(v64.error)) then
            v64.error = l_ApolloError_0.new({
                clientErrors = v65.missing
            });
        end;
    end;
    if v60 then
        v59:updateLastResult(v64);
    end;
    return v64;
end;
v31.isDifferentFromLastResult = function(v66, v67)
    return not v12(v66.lastResultSnapshot, v67);
end;
v31.getLastResult = function(v68)
    return v68.lastResult;
end;
v31.getLastError = function(v69)
    return v69.lastError;
end;
v31.resetLastResults = function(v70)
    v70.lastResult = nil;
    v70.lastResultSnapshot = nil;
    v70.lastError = nil;
    v70.isTornDown = false;
end;
v31.resetQueryStoreErrors = function(v71)
    v71.queryManager:resetErrors(v71.queryId);
end;
v31.refetch = function(v72, v73)
    local v74 = {
        pollInterval = 0
    };
    local l_fetchPolicy_0 = v72.options.fetchPolicy;
    if l_fetchPolicy_0 == "no-cache" then
        v74.fetchPolicy = "no-cache";
    elseif l_fetchPolicy_0 ~= "cache-and-network" then
        v74.fetchPolicy = "network-only";
    end;
    if not (not l_Boolean_0.toJSBoolean(v73) or v12(v72.options.variables, v73)) then
        v72.options.variables = l_Object_0.assign({}, v72.options.variables, v73);
        v74.variables = v72.options.variables;
    end;
    v72.queryInfo:resetLastWrite();
    return v72:reobserve(v74, l_NetworkStatus_0.refetch);
end;
v31.fetchMore = function(v76, v77)
    local v78 = l_Object_0.assign({}, (function()
        if not l_Boolean_0.toJSBoolean(v77.query) then
            return l_Object_0.assign({}, v76.options, v77, {
                variables = l_Object_0.assign({}, v76.options.variables, v77.variables)
            });
        else
            return v77;
        end;
    end)(), {
        fetchPolicy = "no-cache"
    });
    local v79 = v76.queryManager:generateQueryId();
    if l_Boolean_0.toJSBoolean(v78.notifyOnNetworkStatusChange) then
        v76.queryInfo.networkStatus = l_NetworkStatus_0.fetchMore;
        v76:observe();
    end;
    return v76.queryManager:fetchQuery(v79, v78, l_NetworkStatus_0.fetchMore):andThen(function(v80)
        local l_data_0 = v80.data;
        local l_updateQuery_0 = v77.updateQuery;
        if not l_Boolean_0.toJSBoolean(l_updateQuery_0) then
            v76.queryManager.cache:writeQuery({
                query = v78.query, 
                variables = v78.variables, 
                data = l_data_0
            });
            return v80;
        else
            if not (not _G.__DEV__ or v30 and _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__) then
                l_invariant_0.warn("The updateQuery callback for fetchMore is deprecated, and will be removed\nin the next major version of Apollo Client.\n\nPlease convert updateQuery functions to field policies with appropriate\nread and merge functions, or use/adapt a helper function (such as\nconcatPagination, offsetLimitPagination, or relayStylePagination) from\n@apollo/client/utilities.\n\nThe field policy system handles pagination more effectively than a\nhand-written updateQuery function, and you only need to define the policy\nonce, rather than every time you call fetchMore.");
                v30 = true;
                _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__ = v30;
            end;
            v76:updateQuery(function(v83)
                return l_updateQuery_0(v77, v83, {
                    fetchMoreResult = l_data_0, 
                    variables = v78.variables
                });
            end);
            return v80;
        end;
    end):andThen(function(v84)
        v76.queryManager:stopQuery(v79);
        v76:reobserve();
        return v84;
    end):catch(function(v85)
        v76.queryManager:stopQuery(v79);
        v76:reobserve();
        error(v85);
    end);
end;
v31.subscribeToMore = function(v86, v87)
    local v95 = v86.queryManager:startGraphQLSubscription({
        query = v87.document, 
        variables = v87.variables, 
        context = v87.context
    }):subscribe({
        next = function(_, v89)
            local l_updateQuery_1 = v87.updateQuery;
            if l_Boolean_0.toJSBoolean(l_updateQuery_1) then
                v86:updateQuery(function(v91, v92)
                    return l_updateQuery_1(v91, {
                        subscriptionData = v89, 
                        variables = v92.variables
                    });
                end);
            end;
        end, 
        error = function(_, v94)
            if not l_Boolean_0.toJSBoolean(v87.onError) then
                l_invariant_0.error("Unhandled GraphQL subscription error", v94);
                return ;
            else
                v87:onError(v94);
                return ;
            end;
        end
    });
    v86.subscriptions:add(v95);
    return function()
        if l_Boolean_0.toJSBoolean(v86.subscriptions:delete(v95)) then
            v95:unsubscribe();
        end;
    end;
end;
v31.setOptions = function(v96, v97)
    return v96:reobserve(v97);
end;
v31.setVariables = function(v98, v99)
    if not v12(v98.variables, v99) then
        v98.options.variables = v99;
        if l_Boolean_0.toJSBoolean(v98.observers.size) then
            return v98:reobserve({
                fetchPolicy = v98.initialFetchPolicy, 
                variables = v99
            }, l_NetworkStatus_0.setVariables);
        else
            return v10.resolve();
        end;
    elseif not l_Boolean_0.toJSBoolean(v98.observers.size) then
        return v10.resolve();
    else
        return v98:result();
    end;
end;
v31.updateQuery = function(v100, v101)
    local l_queryManager_1 = v100.queryManager;
    local _ = nil;
    local v104 = v101(l_queryManager_1.cache:diff({
        query = v100.options.query, 
        variables = v100.variables, 
        previousResult = not not l_Boolean_0.toJSBoolean(v100.lastResult) and v100.lastResult.data or nil, 
        returnPartialData = true, 
        optimistic = false
    }).result, {
        variables = v100.variables
    });
    if l_Boolean_0.toJSBoolean(v104) then
        l_queryManager_1.cache:writeQuery({
            query = v100.options.query, 
            data = v104, 
            variables = v100.variables
        });
        l_queryManager_1:broadcastQueries();
    end;
end;
v31.startPolling = function(v105, v106)
    v105.options.pollInterval = v106;
    v105:updatePolling();
end;
v31.stopPolling = function(v107)
    v107.options.pollInterval = 0;
    v107:updatePolling();
end;
v31.fetch = function(v108, v109, v110)
    v108.queryManager:setObservableQuery(v108);
    return v108.queryManager:fetchQueryObservable(v108.queryId, v109, v110);
end;
v31.updatePolling = function(v111)
    local v112 = nil;
    if not l_Boolean_0.toJSBoolean(v111.queryManager.ssrMode) then
        local l_pollingInfo_0 = v111.pollingInfo;
        local l_pollInterval_0 = v111.options.pollInterval;
        if l_Boolean_0.toJSBoolean(l_pollInterval_0) then
            if l_Boolean_0.toJSBoolean(l_pollingInfo_0) and l_pollingInfo_0.interval == l_pollInterval_0 then
                return ;
            else
                l_invariant_0(l_pollInterval_0, "Attempted to start a polling query without a polling interval.");
                local v115;
                if l_Boolean_0.toJSBoolean(l_pollingInfo_0) then
                    v115 = l_pollingInfo_0;
                    if v115 then
                        goto label0;
                    end;
                end;
                v111.pollingInfo = {};
                v115 = v111.pollingInfo;
                ::label0::;
                v115.interval = l_pollInterval_0;
                local function v116()
                    if l_Boolean_0.toJSBoolean(v111.pollingInfo) then
                        if l_isNetworkRequestInFlight_0(v111.queryInfo.networkStatus) then
                            v112();
                        else
                            v111:reobserve({
                                fetchPolicy = "network-only"
                            }, l_NetworkStatus_0.poll):andThen(v112, v112);
                            return ;
                        end;
                    end;
                end;
                v112 = function()
                    local l_pollingInfo_1 = v111.pollingInfo;
                    if l_Boolean_0.toJSBoolean(l_pollingInfo_1) then
                        if l_pollingInfo_1.timeout then
                            l_clearTimeout_0(l_pollingInfo_1.timeout);
                        end;
                        l_pollingInfo_1.timeout = l_setTimeout_0(v116, l_pollingInfo_1.interval);
                    end;
                end;
                v112();
                return ;
            end;
        else
            if l_Boolean_0.toJSBoolean(l_pollingInfo_0) then
                l_clearTimeout_0(l_pollingInfo_0.timeout);
                v111.pollingInfo = nil;
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v31.updateLastResult = function(v118, v119)
    local l_lastResult_1 = v118.lastResult;
    v118.lastResult = v119;
    if not l_Boolean_0.toJSBoolean(v118.queryManager.assumeImmutableResults) then
        v118.lastResultSnapshot = l_cloneDeep_0(v119);
    else
        v118.lastResultSnapshot = v119;
    end;
    if not l_isNonEmptyArray_0(v119.errors) then
        v118.lastError = nil;
    end;
    return l_lastResult_1;
end;
v31.reobserve = function(v121, v122, v123)
    v121.isTornDown = false;
    local v124 = true;
    if v123 ~= l_NetworkStatus_0.refetch then
        v124 = true;
        if v123 ~= l_NetworkStatus_0.fetchMore then
            v124 = v123 == l_NetworkStatus_0.poll;
        end;
    end;
    local l_variables_0 = v121.options.variables;
    local v126 = if not v124 then l_Object_0.assign(v121.options, l_compact_0(v122)) else l_compact_0(v121.options, v122);
    if not v124 then
        v121:updatePolling();
        if not (((not (v122 ~= nil) or not l_Boolean_0.toJSBoolean(v122.variables)) or l_Boolean_0.toJSBoolean(v122.fetchPolicy)) or v12(v122.variables, l_variables_0)) then
            v126.fetchPolicy = v121.initialFetchPolicy;
            if v123 == nil then
                v123 = l_NetworkStatus_0.setVariables;
            end;
        end;
    end;
    local v127 = v121:fetch(v126, v123);
    if not v124 then
        if v121.concast then
            v121.concast:removeObserver(v121.observer, true);
        end;
        v121.concast = v127;
    end;
    v127:addObserver(v121.observer);
    return v127.promise;
end;
v31.observe = function(v128)
    v128.observer:next(v128:getCurrentResult(false));
end;
v31.hasObservers = function(v129)
    return v129.observers.size > 0;
end;
v31.tearDownQuery = function(v130)
    if not l_Boolean_0.toJSBoolean(v130.isTornDown) then
        if l_Boolean_0.toJSBoolean(v130.concast) then
            v130.concast:removeObserver(v130.observer);
            v130.concast = nil;
        end;
        v130:stopPolling();
        v130.subscriptions:forEach(function(v131)
            return v131:unsubscribe();
        end);
        v130.subscriptions:clear();
        v130.queryManager:stopQuery(v130.queryId);
        v130.observers:clear();
        v130.isTornDown = true;
        return ;
    else
        return ;
    end;
end;
l_fixObservableSubclass_0(v31);
v2.ObservableQuery = v31;
v29 = function(_, v133)
    l_invariant_0.error("Unhandled error", v133.message, v133.stack);
end;
v2.applyNextFetchPolicy = function(v134)
    local v135 = nil;
    v135 = v134.fetchPolicy == nil and "cache-first" or v134.fetchPolicy;
    local l_nextFetchPolicy_0 = v134.nextFetchPolicy;
    if l_Boolean_0.toJSBoolean(l_nextFetchPolicy_0) then
        if not v9(l_nextFetchPolicy_0) then
            v134.fetchPolicy = l_nextFetchPolicy_0;
        else
            v134.fetchPolicy = l_nextFetchPolicy_0(v134, v135);
            return ;
        end;
    end;
end;
return v2;
