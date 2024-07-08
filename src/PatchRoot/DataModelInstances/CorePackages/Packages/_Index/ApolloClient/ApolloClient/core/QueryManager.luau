local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_instanceof_0 = v3.instanceof;
local l_Map_0 = v3.Map;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_WeakMap_0 = v3.WeakMap;
local v11 = require(l_Parent_1.Promise);
local l_HttpService_0 = game:GetService("HttpService");
local v13 = require(l_Parent_0.luaUtils.isCallable);
local l_toJSBoolean_0 = require(l_Parent_0.utilities.globals.null).toJSBoolean;
local _ = require(l_Parent_1.GraphQL);
local v16 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v16.invariant;
local l_InvariantError_0 = v16.InvariantError;
local v19 = require(l_Parent_0.jsutils.equal);
local l_execute_0 = require(script.Parent.Parent.link.core).execute;
local l_canonicalStringify_0 = require(script.Parent.Parent.cache).canonicalStringify;
local v22 = require(script.Parent.Parent.utilities);
local l_getDefaultValues_0 = v22.getDefaultValues;
local l_getOperationDefinition_0 = v22.getOperationDefinition;
local l_getOperationName_0 = v22.getOperationName;
local l_hasClientExports_0 = v22.hasClientExports;
local l_graphQLResultHasError_0 = v22.graphQLResultHasError;
local l_removeConnectionDirectiveFromDocument_0 = v22.removeConnectionDirectiveFromDocument;
local _ = v22.canUseWeakMap;
local l_Observable_0 = v22.Observable;
local l_asyncMap_0 = v22.asyncMap;
local l_isNonEmptyArray_0 = v22.isNonEmptyArray;
local l_Concast_0 = v22.Concast;
local l_makeUniqueId_0 = v22.makeUniqueId;
local l_isDocumentNode_0 = v22.isDocumentNode;
local l_isNonNullObject_0 = v22.isNonNullObject;
local v37 = require(script.Parent.Parent.errors);
local l_ApolloError_0 = v37.ApolloError;
local l_isApolloError_0 = v37.isApolloError;
local _ = require(script.Parent.watchQueryOptions_types);
local v41 = require(script.Parent.ObservableQuery);
local _ = require(script.Parent.ObservableQuery_types);
local l_ObservableQuery_0 = v41.ObservableQuery;
local l_applyNextFetchPolicy_0 = v41.applyNextFetchPolicy;
local v45 = require(script.Parent.networkStatus);
local l_NetworkStatus_0 = v45.NetworkStatus;
local l_isNetworkRequestInFlight_0 = v45.isNetworkRequestInFlight;
local _ = require(script.Parent.types);
local l_LocalState_0 = require(script.Parent.LocalState).LocalState;
local v50 = require(script.Parent.QueryInfo);
local l_QueryInfo_0 = v50.QueryInfo;
local l_shouldWriteResult_0 = v50.shouldWriteResult;
local l_CacheWriteBehavior_0 = v50.CacheWriteBehavior;
local v54 = require(l_Parent_0.luaUtils.hasOwnProperty);
local v55 = {};
v55.__index = v55;
v55.new = function(v56)
    local l_cache_0 = v56.cache;
    local l_link_0 = v56.link;
    local l_queryDeduplication_0 = v56.queryDeduplication;
    local l_onBroadcast_0 = v56.onBroadcast;
    local l_ssrMode_0 = v56.ssrMode;
    local l_clientAwareness_0 = v56.clientAwareness;
    local l_localState_0 = v56.localState;
    local l_assumeImmutableResults_0 = v56.assumeImmutableResults;
    if l_queryDeduplication_0 == nil then
        l_queryDeduplication_0 = false;
    end;
    if l_ssrMode_0 == nil then
        l_ssrMode_0 = false;
    end;
    if l_clientAwareness_0 == nil then
        l_clientAwareness_0 = {};
    end;
    local v65 = setmetatable({}, v55);
    v65.clientAwareness = {};
    v65.queries = l_Map_0.new();
    v65.fetchCancelFns = l_Map_0.new();
    v65.transformCache = l_WeakMap_0.new();
    v65.queryIdCounter = 1;
    v65.requestIdCounter = 1;
    v65.mutationIdCounter = 1;
    v65.inFlightLinkObservables = l_Map_0.new();
    v65.cache = l_cache_0;
    v65.link = l_link_0;
    v65.queryDeduplication = l_queryDeduplication_0;
    v65.clientAwareness = l_clientAwareness_0;
    v65.localState = l_localState_0 or l_LocalState_0.new({
        cache = l_cache_0
    });
    v65.ssrMode = l_ssrMode_0;
    v65.assumeImmutableResults = l_Boolean_0.toJSBoolean(l_assumeImmutableResults_0);
    v65.onBroadcast = l_onBroadcast_0;
    if l_Boolean_0.toJSBoolean(v65.onBroadcast) then
        v65.mutationStore = {};
    end;
    return v65;
end;
v55.stop = function(v66)
    v66.queries:forEach(function(_, v68)
        v66:stopQueryNoBroadcast(v68);
    end);
    v66:cancelPendingFetches(l_InvariantError_0.new("QueryManager stopped while query was in flight"));
end;
v55.cancelPendingFetches = function(v69, v70)
    v69.fetchCancelFns:forEach(function(v71)
        return v71(v70);
    end);
    v69.fetchCancelFns:clear();
end;
v55.mutate = function(v72, v73)
    return v11.resolve():andThen(function()
        local l_mutation_0 = v73.mutation;
        local l_variables_0 = v73.variables;
        local l_optimisticResponse_0 = v73.optimisticResponse;
        local l_updateQueries_0 = v73.updateQueries;
        local l_refetchQueries_0 = v73.refetchQueries;
        local l_awaitRefetchQueries_0 = v73.awaitRefetchQueries;
        local l_update_0 = v73.update;
        local l_onQueryUpdated_0 = v73.onQueryUpdated;
        local l_errorPolicy_0 = v73.errorPolicy;
        local l_fetchPolicy_0 = v73.fetchPolicy;
        local l_keepRootFields_0 = v73.keepRootFields;
        local l_context_0 = v73.context;
        local v86 = if l_refetchQueries_0 == nil then {} else l_refetchQueries_0;
        if l_awaitRefetchQueries_0 == nil then
            l_awaitRefetchQueries_0 = false;
        end;
        if l_errorPolicy_0 == nil then
            l_errorPolicy_0 = "none";
        end;
        l_invariant_0(l_mutation_0, "mutation option is required. You must specify your GraphQL document in the mutation option.");
        l_invariant_0(not l_Boolean_0.toJSBoolean(l_fetchPolicy_0) or l_fetchPolicy_0 == "no-cache", "Mutations only support a 'no-cache' fetchPolicy. If you don't want to disable the cache, remove your fetchPolicy setting to proceed with the default mutation behavior.");
        local v87 = v72:generateMutationId();
        l_mutation_0 = v72:transform(l_mutation_0).document;
        l_variables_0 = v72:getVariables(l_mutation_0, l_variables_0);
        if v72:transform(l_mutation_0).hasClientExports then
            l_variables_0 = v72.localState:addExportedVariables(l_mutation_0, l_variables_0, l_context_0):expect();
        end;
        local v88 = nil;
        if not l_Boolean_0.toJSBoolean(v72.mutationStore) then
            v88 = v72.mutationStore;
        else
            v72.mutationStore[v87] = {
                mutation = l_mutation_0, 
                variables = l_variables_0, 
                loading = true, 
                error = nil
            };
            v88 = v72.mutationStore[v87];
        end;
        if l_Boolean_0.toJSBoolean(l_optimisticResponse_0) then
            v72:markMutationOptimistic(l_optimisticResponse_0, {
                mutationId = v87, 
                document = l_mutation_0, 
                variables = l_variables_0, 
                fetchPolicy = l_fetchPolicy_0, 
                errorPolicy = l_errorPolicy_0, 
                context = l_context_0, 
                updateQueries = l_updateQueries_0, 
                update = l_update_0, 
                keepRootFields = l_keepRootFields_0
            });
        end;
        v72:broadcastQueries();
        local l_v72_0 = v72;
        return v11.new(function(v90, v91)
            return l_asyncMap_0(v72:getObservableFromLink(l_mutation_0, l_Object_0.assign({}, l_context_0, {
                optimisticResponse = l_optimisticResponse_0
            }), l_variables_0, false), function(v92)
                if l_graphQLResultHasError_0(v92) and l_errorPolicy_0 == "none" then
                    error(l_ApolloError_0.new({
                        graphQLErrors = v92.errors
                    }));
                end;
                if l_Boolean_0.toJSBoolean(v88) then
                    v88.loading = false;
                    v88.error = nil;
                end;
                local v93 = l_Object_0.assign({}, v92);
                if v13(v86) then
                    v86 = v86(v93);
                end;
                if not (not (l_errorPolicy_0 == "ignore") or not l_graphQLResultHasError_0(v93)) then
                    v93.errors = nil;
                end;
                return v72:markMutationResult({
                    mutationId = v87, 
                    result = v93, 
                    document = l_mutation_0, 
                    variables = l_variables_0, 
                    fetchPolicy = l_fetchPolicy_0, 
                    errorPolicy = l_errorPolicy_0, 
                    context = l_context_0, 
                    update = l_update_0, 
                    updateQueries = l_updateQueries_0, 
                    awaitRefetchQueries = l_awaitRefetchQueries_0, 
                    refetchQueries = v86, 
                    removeOptimistic = not not l_Boolean_0.toJSBoolean(l_optimisticResponse_0) and v87 or nil, 
                    onQueryUpdated = l_onQueryUpdated_0, 
                    keepRootFields = l_keepRootFields_0
                });
            end):subscribe({
                next = function(_, v95)
                    l_v72_0:broadcastQueries();
                    v90(v95);
                end, 
                error = function(_, v97)
                    if l_Boolean_0.toJSBoolean(v88) then
                        v88.loading = false;
                        v88.error = v97;
                    end;
                    if l_Boolean_0.toJSBoolean(l_optimisticResponse_0) then
                        l_v72_0.cache:removeOptimistic(v87);
                    end;
                    l_v72_0:broadcastQueries();
                    v91(not not l_instanceof_0(v97, l_ApolloError_0) and v97 or l_ApolloError_0.new({
                        networkError = v97
                    }));
                end
            });
        end);
    end);
end;
v55.markMutationResult = function(v98, v99, v100)
    if v100 == nil then
        v100 = v98.cache;
    end;
    local l_result_0 = v99.result;
    local v102 = {};
    local v103 = v99.fetchPolicy == "no-cache";
    if not (v103 or not l_shouldWriteResult_0(l_result_0, v99.errorPolicy)) then
        table.insert(v102, {
            result = l_result_0.data, 
            dataId = "ROOT_MUTATION", 
            query = v99.document, 
            variables = v99.variables
        });
        local l_updateQueries_1 = v99.updateQueries;
        if l_updateQueries_1 ~= nil then
            local l_l_updateQueries_1_0 = l_updateQueries_1 --[[ copy: 6 -> 7 ]];
            v98.queries:forEach(function(v106, v107)
                local l_observableQuery_0 = v106.observableQuery;
                local v109 = nil;
                v109 = if not l_Boolean_0.toJSBoolean(l_observableQuery_0) then l_observableQuery_0 else l_observableQuery_0.queryName;
                if l_Boolean_0.toJSBoolean(v109) and v54(l_l_updateQueries_1_0, v109) then
                    local v110 = l_l_updateQueries_1_0[v109];
                    local v111 = v98.queries:get(v107);
                    local l_document_0 = v111.document;
                    local l_variables_1 = v111.variables;
                    local v114 = v100:diff({
                        query = l_document_0, 
                        variables = l_variables_1, 
                        returnPartialData = true, 
                        optimistic = false
                    });
                    local l_result_1 = v114.result;
                    if not (not v114.complete or not l_Boolean_0.toJSBoolean(l_result_1)) then
                        local l_v110_0 = v110;
                        local l_l_l_updateQueries_1_0_0 = l_l_updateQueries_1_0;
                        local l_l_result_1_0 = l_result_1;
                        local v119 = {
                            mutationResult = l_result_0
                        };
                        local v120;
                        if not l_Boolean_0.toJSBoolean(l_document_0) then
                            v120 = nil;
                        else
                            local v121 = l_getOperationName_0(l_document_0);
                            v120 = if not l_Boolean_0.toJSBoolean(v121) then nil else v121;
                        end;
                        v119.queryName = v120;
                        v119.queryVariables = l_variables_1;
                        l_v110_0 = l_v110_0(l_l_l_updateQueries_1_0_0, l_l_result_1_0, v119);
                        if l_Boolean_0.toJSBoolean(l_v110_0) then
                            table.insert(v102, {
                                result = l_v110_0, 
                                dataId = "ROOT_QUERY", 
                                query = l_document_0, 
                                variables = l_variables_1
                            });
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end);
        end;
    end;
    if not (not (((not (#v102 <= 0) or l_Boolean_0.toJSBoolean(v99.refetchQueries)) or l_Boolean_0.toJSBoolean(v99.update)) or l_Boolean_0.toJSBoolean(v99.onQueryUpdated)) and not l_Boolean_0.toJSBoolean(v99.removeOptimistic)) then
        local v122 = {};
        v98:refetchQueries({
            updateCache = function(_, v124)
                if not v103 then
                    l_Array_0.forEach(v102, function(v125)
                        return v124:write(v125);
                    end);
                end;
                local l_update_1 = v99.update;
                if not (not (l_update_1 ~= nil) or not l_Boolean_0.toJSBoolean(l_update_1)) then
                    if not v103 then
                        local v127 = v124:diff({
                            id = "ROOT_MUTATION", 
                            query = v98:transform(v99.document).asQuery, 
                            variables = v99.variables, 
                            optimistic = false, 
                            returnPartialData = true
                        });
                        if v127.complete then
                            l_result_0 = l_Object_0.assign({}, l_result_0, {
                                data = v127.result
                            });
                        end;
                    end;
                    l_update_1(v99, v124, l_result_0, {
                        context = v99.context, 
                        variables = v99.variables
                    });
                end;
                if not (v103 or v99.keepRootFields) then
                    v124:modify({
                        id = "ROOT_MUTATION", 
                        fields = function(_, v129, v130)
                            local l_fieldName_0 = v130.fieldName;
                            local l_DELETE_0 = v130.DELETE;
                            if l_fieldName_0 == "__typename" then
                                return v129;
                            else
                                return l_DELETE_0;
                            end;
                        end
                    });
                end;
            end, 
            include = v99.refetchQueries, 
            optimistic = false, 
            removeOptimistic = v99.removeOptimistic, 
            onQueryUpdated = not not l_Boolean_0.toJSBoolean(v99.onQueryUpdated) and v99.onQueryUpdated or nil
        }):forEach(function(v133)
            return table.insert(v122, v133);
        end);
        if not (not v99.awaitRefetchQueries and not l_Boolean_0.toJSBoolean(v99.onQueryUpdated)) then
            return v11.all(l_Array_0.filter(v122, l_toJSBoolean_0)):andThen(function()
                return l_result_0;
            end);
        end;
    end;
    return v11.resolve(l_result_0);
end;
v55.markMutationOptimistic = function(v134, v135, v136)
    local v137 = nil;
    v137 = if not v13(v135) then v135 else v135(v136.variables);
    return v134.cache:recordOptimisticTransaction(function(v138)
        local l_status_0, l_result_2 = pcall(function()
            v134:markMutationResult(l_Object_0.assign({}, v136, {
                result = {
                    data = v137
                }
            }), v138);
        end);
        if not l_status_0 then
            l_invariant_0.error(l_result_2);
        end;
    end, v136.mutationId);
end;
v55.fetchQuery = function(v141, v142, v143, v144)
    return v141:fetchQueryObservable(v142, v143, v144).promise;
end;
v55.getQueryStore = function(v145)
    local v146 = {};
    v145.queries:forEach(function(v147, v148)
        v146[v148] = {
            variables = v147.variables, 
            networkStatus = v147.networkStatus, 
            networkError = v147.networkError, 
            graphQLErrors = v147.graphQLErrors
        };
    end);
    return v146;
end;
v55.resetErrors = function(v149, v150)
    local v151 = v149.queries:get(v150);
    if l_Boolean_0.toJSBoolean(v151) then
        v151.networkError = nil;
        v151.graphQLErrors = {};
    end;
end;
v55.transform = function(v152, v153)
    local l_transformCache_0 = v152.transformCache;
    if not l_transformCache_0:has(v153) then
        local v155 = v152.cache:transformDocument(v153);
        local v156 = l_removeConnectionDirectiveFromDocument_0(v152.cache:transformForLink(v155));
        local v157 = v152.localState:clientQuery(v155);
        local v158 = nil;
        v158 = if not l_Boolean_0.toJSBoolean(v156) then v156 else v152.localState:serverQuery(v156);
        local v160 = {
            document = v155, 
            hasClientExports = l_hasClientExports_0(v155), 
            hasForcedResolvers = v152.localState:shouldForceResolvers(v155), 
            clientQuery = v157, 
            serverQuery = v158, 
            defaultVars = l_getDefaultValues_0(l_getOperationDefinition_0(v155)), 
            asQuery = l_Object_0.assign({}, v155, {
                definitions = l_Array_0.map(v155.definitions, function(v159)
                    if v159.kind == "OperationDefinition" and v159.operation ~= "query" then
                        return (l_Object_0.assign({}, v159, {
                            operation = "query"
                        }));
                    else
                        return v159;
                    end;
                end)
            })
        };
        local function _(v161)
            if not (not (v161 ~= nil) or l_transformCache_0:has(v161)) then
                l_transformCache_0:set(v161, v160);
            end;
        end;
        if not (not (v153 ~= nil) or l_transformCache_0:has(v153)) then
            l_transformCache_0:set(v153, v160);
        end;
        if not (not (v155 ~= nil) or l_transformCache_0:has(v155)) then
            l_transformCache_0:set(v155, v160);
        end;
        if not (not (v157 ~= nil) or l_transformCache_0:has(v157)) then
            l_transformCache_0:set(v157, v160);
        end;
        local l_v158_0 = v158;
        if not (not (l_v158_0 ~= nil) or l_transformCache_0:has(l_v158_0)) then
            l_transformCache_0:set(l_v158_0, v160);
        end;
    end;
    return l_transformCache_0:get(v153);
end;
v55.getVariables = function(v164, v165, v166)
    return l_Object_0.assign({}, v164:transform(v165).defaultVars, v166);
end;
v55.watchQuery = function(v167, v168)
    v168 = l_Object_0.assign({}, v168, {
        variables = v167:getVariables(v168.query, v168.variables)
    });
    if typeof(v168.notifyOnNetworkStatusChange) == "nil" then
        v168.notifyOnNetworkStatusChange = false;
    end;
    local v169 = l_QueryInfo_0.new(v167.cache);
    local v170 = l_ObservableQuery_0.new({
        queryManager = v167, 
        queryInfo = v169, 
        options = v168
    });
    v167.queries:set(v170.queryId, v169);
    v169:init({
        document = v168.query, 
        observableQuery = v170, 
        variables = v168.variables
    });
    return v170;
end;
v55.query = function(v171, v172, v173)
    if v173 == nil then
        v173 = v171:generateQueryId();
    end;
    l_invariant_0(v172.query, "query option is required. You must specify your GraphQL document " .. "in the query option.");
    l_invariant_0(v172.query.kind == "Document", "You must wrap the query string in a \"gql\" tag.");
    l_invariant_0(not l_Boolean_0.toJSBoolean(v172.returnPartialData), "returnPartialData option only supported on watchQuery.");
    l_invariant_0(not l_Boolean_0.toJSBoolean(v172.pollInterval), "pollInterval option only supported on watchQuery.");
    return v171:fetchQuery(v173, v172):andThen(function(v174)
        v171:stopQuery(v173);
        return v174;
    end):catch(function(v175)
        v171:stopQuery(v173);
        error(v175);
    end);
end;
v55.generateQueryId = function(v176)
    local l_queryIdCounter_0 = v176.queryIdCounter;
    v176.queryIdCounter = v176.queryIdCounter + 1;
    return (tostring(l_queryIdCounter_0));
end;
v55.generateRequestId = function(v178)
    local l_requestIdCounter_0 = v178.requestIdCounter;
    v178.requestIdCounter = v178.requestIdCounter + 1;
    return l_requestIdCounter_0;
end;
v55.generateMutationId = function(v180)
    local l_mutationIdCounter_0 = v180.mutationIdCounter;
    v180.mutationIdCounter = v180.mutationIdCounter + 1;
    return (tostring(l_mutationIdCounter_0));
end;
v55.stopQueryInStore = function(v182, v183)
    v182:stopQueryInStoreNoBroadcast(v183);
    v182:broadcastQueries();
end;
v55.stopQueryInStoreNoBroadcast = function(v184, v185)
    local v186 = v184.queries:get(v185);
    if l_Boolean_0.toJSBoolean(v186) then
        v186:stop();
    end;
end;
v55.clearStore = function(v187)
    v187:cancelPendingFetches(l_InvariantError_0.new("Store reset while query was in flight (not completed in link chain)"));
    v187.queries:forEach(function(v188, _)
        if not l_Boolean_0.toJSBoolean(v188.observableQuery) then
            v188:stop();
            return ;
        else
            v188.networkStatus = l_NetworkStatus_0.loading;
            return ;
        end;
    end);
    if l_Boolean_0.toJSBoolean(v187.mutationStore) then
        v187.mutationStore = {};
    end;
    return v187.cache:reset();
end;
v55.resetStore = function(v190)
    return v190:clearStore():andThen(function()
        return v190:reFetchObservableQueries();
    end);
end;
v55.getObservableQueries = function(v191, v192)
    if v192 == nil then
        v192 = "active";
    end;
    local v193 = l_Map_0.new(nil);
    local v194 = l_Map_0.new(nil);
    local v195 = l_Set_0.new();
    if l_Array_0.isArray(v192) then
        l_Array_0.forEach(v192, function(v196)
            if typeof(v196) == "string" then
                v194:set(v196, false);
                return ;
            elseif not l_isDocumentNode_0(v196) then
                if not (not l_isNonNullObject_0(v196) or not l_Boolean_0.toJSBoolean(v196.query)) then
                    v195:add(v196);
                end;
                return ;
            else
                v194:set(v191:transform(v196).document, false);
                return ;
            end;
        end);
    end;
    v191.queries:forEach(function(v197, v198)
        local l_observableQuery_1 = v197.observableQuery;
        local l_document_1 = v197.document;
        if l_Boolean_0.toJSBoolean(l_observableQuery_1) then
            if v192 == "all" then
                v193:set(v198, l_observableQuery_1);
                return ;
            else
                local l_queryName_0 = l_observableQuery_1.queryName;
                if l_observableQuery_1.options.fetchPolicy ~= "standby" and l_observableQuery_1:hasObservers() then
                    if not (not (not (v192 ~= "active") or l_Boolean_0.toJSBoolean(l_queryName_0) and v194:has(l_queryName_0)) and (not l_Boolean_0.toJSBoolean(l_document_1) or not v194:has(l_document_1))) then
                        v193:set(v198, l_observableQuery_1);
                        if l_Boolean_0.toJSBoolean(l_queryName_0) then
                            v194:set(l_queryName_0, true);
                        end;
                        if l_Boolean_0.toJSBoolean(l_document_1) then
                            v194:set(l_document_1, true);
                        end;
                    end;
                else
                    return ;
                end;
            end;
        end;
    end);
    if l_Boolean_0.toJSBoolean(v195.size) then
        for _, v203 in v195, nil, nil do
            local v204 = l_makeUniqueId_0("legacyOneTimeQuery");
            local v205 = v191:getQuery(v204):init({
                document = v203.query, 
                variables = v203.variables
            });
            local v206 = l_ObservableQuery_0.new({
                queryManager = v191, 
                queryInfo = v205, 
                options = l_Object_0.assign({}, v203, {
                    fetchPolicy = "network-only"
                })
            });
            v205:setObservableQuery(v206);
            v193:set(v204, v206);
        end;
    end;
    if not (not _G.__DEV__ or not l_Boolean_0.toJSBoolean(v194.size)) then
        v194:forEach(function(v207, v208)
            if not v207 then
                l_invariant_0.warn(("Unknown query %s%s requested in refetchQueries options.include array"):format(typeof(v208) == "string" and "named " or "", l_HttpService_0:JSONEncode(v208)));
            end;
        end);
    end;
    return v193;
end;
v55.reFetchObservableQueries = function(v209, v210)
    if v210 == nil then
        v210 = false;
    end;
    local v211 = {};
    v209:getObservableQueries(not l_Boolean_0.toJSBoolean(v210) and "active" or "all"):forEach(function(v212, v213)
        local l_fetchPolicy_1 = v212.options.fetchPolicy;
        v212:resetLastResults();
        if l_Boolean_0.toJSBoolean(v210) or l_fetchPolicy_1 ~= "standby" and l_fetchPolicy_1 ~= "cache-only" then
            table.insert(v211, v212:refetch());
        end;
        v209:getQuery(v213):setDiff(nil);
    end);
    v209:broadcastQueries();
    return v11.all(l_Array_0.filter(v211, l_toJSBoolean_0));
end;
v55.setObservableQuery = function(v215, v216)
    v215:getQuery(v216.queryId):setObservableQuery(v216);
end;
v55.startGraphQLSubscription = function(v217, v218)
    local l_query_0 = v218.query;
    local l_fetchPolicy_2 = v218.fetchPolicy;
    local l_errorPolicy_1 = v218.errorPolicy;
    local l_variables_2 = v218.variables;
    local l_context_1 = v218.context;
    if v218.context == nil then
        l_context_1 = {};
    end;
    l_query_0 = v217:transform(l_query_0).document;
    l_variables_2 = v217:getVariables(l_query_0, l_variables_2);
    local function v226(v224)
        return v217:getObservableFromLink(l_query_0, l_context_1, v224):map(function(v225)
            if l_fetchPolicy_2 ~= "no-cache" then
                if l_shouldWriteResult_0(v225, l_errorPolicy_1) then
                    v217.cache:write({
                        query = l_query_0, 
                        result = v225.data, 
                        dataId = "ROOT_SUBSCRIPTION", 
                        variables = v224
                    });
                end;
                v217:broadcastQueries();
            end;
            if l_graphQLResultHasError_0(v225) then
                error(l_ApolloError_0.new({
                    graphQLErrors = v225.errors
                }));
            end;
            return v225;
        end);
    end;
    if not v217:transform(l_query_0).hasClientExports then
        return v226(l_variables_2);
    else
        local v227 = v217.localState:addExportedVariables(l_query_0, l_variables_2, l_context_1):andThen(v226);
        return l_Observable_0.new(function(v228)
            local v229 = nil;
            v227:andThen(function(v230)
                v229 = v230:subscribe(v228);
                return v229;
            end, v228.error);
            return function()
                if v229 ~= nil then
                    return v229:unsubscribe();
                else
                    return v229;
                end;
            end;
        end);
    end;
end;
v55.stopQuery = function(v231, v232)
    v231:stopQueryNoBroadcast(v232);
    v231:broadcastQueries();
end;
v55.stopQueryNoBroadcast = function(v233, v234)
    v233:stopQueryInStoreNoBroadcast(v234);
    v233:removeQuery(v234);
end;
v55.removeQuery = function(v235, v236)
    v235.fetchCancelFns:delete(v236);
    v235:getQuery(v236):stop();
    v235.queries:delete(v236);
end;
v55.broadcastQueries = function(v237)
    if l_Boolean_0.toJSBoolean(v237.onBroadcast) then
        v237:onBroadcast();
    end;
    v237.queries:forEach(function(v238, _)
        return v238:notify();
    end);
end;
v55.getLocalState = function(v240)
    return v240.localState;
end;
v55.getObservableFromLink = function(v241, v242, v243, v244, v245)
    if v245 == nil then
        v245 = if not l_Boolean_0.toJSBoolean(v243) then v241.queryDeduplication else if v243.queryDeduplication ~= nil then v243.queryDeduplication else v241.queryDeduplication;
    end;
    local v246 = nil;
    local l_serverQuery_0 = v241:transform(v242).serverQuery;
    if not l_Boolean_0.toJSBoolean(l_serverQuery_0) then
        v246 = l_Concast_0.new({
            l_Observable_0.of({
                data = {}
            })
        });
        v243 = v241:prepareContext(v243);
    else
        local l_inFlightLinkObservables_0 = v241.inFlightLinkObservables;
        local l_link_1 = v241.link;
        local v250 = {
            query = l_serverQuery_0, 
            variables = v244, 
            operationName = not not l_Boolean_0.toJSBoolean(l_getOperationName_0(l_serverQuery_0)) and l_getOperationName_0(l_serverQuery_0) or nil, 
            context = v241:prepareContext(l_Object_0.assign({}, v243, {
                forceFetch = not v245
            }))
        };
        v243 = v250.context;
        if not v245 then
            v246 = l_Concast_0.new({
                (l_execute_0(l_link_1, v250))
            });
        else
            local v251 = l_inFlightLinkObservables_0:get(l_serverQuery_0);
            local v252 = not not l_Boolean_0.toJSBoolean(v251) and v251 or l_Map_0.new(nil);
            l_inFlightLinkObservables_0:set(l_serverQuery_0, v252);
            local v253 = l_canonicalStringify_0(v244);
            v246 = v252:get(v253);
            if not l_Boolean_0.toJSBoolean(v246) then
                local v254 = l_Concast_0.new({
                    (l_execute_0(l_link_1, v250))
                });
                v246 = v254;
                v252:set(v253, v246);
                local l_l_inFlightLinkObservables_0_0 = l_inFlightLinkObservables_0 --[[ copy: 7 -> 14 ]];
                v254:cleanup(function()
                    if l_Boolean_0.toJSBoolean(v252:delete(v253)) and v252.size < 1 then
                        l_l_inFlightLinkObservables_0_0:delete(l_serverQuery_0);
                    end;
                end);
            end;
        end;
    end;
    local l_clientQuery_0 = v241:transform(v242).clientQuery;
    if l_toJSBoolean_0(l_clientQuery_0) then
        v246 = l_asyncMap_0(v246, function(v257)
            return v241.localState:runResolvers({
                document = l_clientQuery_0, 
                remoteResult = v257, 
                context = v243, 
                variables = v244
            });
        end);
    end;
    return v246;
end;
v55.getResultsFromLink = function(v258, v259, v260, v261)
    v259.lastRequestId = v258:generateRequestId();
    local l_lastRequestId_0 = v259.lastRequestId;
    return l_asyncMap_0(v258:getObservableFromLink(v259.document, v261.context, v261.variables), function(v263)
        local v264 = l_isNonEmptyArray_0(v263.errors);
        if v259.lastRequestId <= l_lastRequestId_0 then
            if v264 and v261.errorPolicy == "none" then
                error(v259:markError(l_ApolloError_0.new({
                    graphQLErrors = v263.errors
                })));
            end;
            v259:markResult(v263, v261, v260);
            v259:markReady();
        end;
        local v265 = {
            data = v263.data, 
            loading = false, 
            networkStatus = not not l_Boolean_0.toJSBoolean(v259.networkStatus) and v259.networkStatus or l_NetworkStatus_0.ready
        };
        if v264 and v261.errorPolicy ~= "ignore" then
            v265.errors = v263.errors;
        end;
        return v265;
    end, function(v266)
        local v267 = nil;
        v267 = if not l_isApolloError_0(v266) then l_ApolloError_0.new({
            networkError = v266
        }) else v266;
        if v259.lastRequestId <= l_lastRequestId_0 then
            v259:markError(v267);
        end;
        error(v267);
    end);
end;
v55.fetchQueryObservable = function(v268, v269, v270, v271)
    if v271 == nil then
        v271 = l_NetworkStatus_0.loading;
    end;
    local l_document_2 = v268:transform(v270.query).document;
    local v273 = v268:getVariables(l_document_2, v270.variables);
    local v274 = v268:getQuery(v269);
    local l_fetchPolicy_3 = v270.fetchPolicy;
    local l_errorPolicy_2 = v270.errorPolicy;
    local l_returnPartialData_0 = v270.returnPartialData;
    local l_notifyOnNetworkStatusChange_0 = v270.notifyOnNetworkStatusChange;
    local l_context_2 = v270.context;
    if l_fetchPolicy_3 == nil then
        l_fetchPolicy_3 = "cache-first";
    end;
    if l_errorPolicy_2 == nil then
        l_errorPolicy_2 = "none";
    end;
    if l_returnPartialData_0 == nil then
        l_returnPartialData_0 = false;
    end;
    if l_notifyOnNetworkStatusChange_0 == nil then
        l_notifyOnNetworkStatusChange_0 = false;
    end;
    if l_context_2 == nil then
        l_context_2 = {};
    end;
    local v280 = l_Object_0.assign({}, v270, {
        query = l_document_2, 
        variables = v273, 
        fetchPolicy = l_fetchPolicy_3, 
        errorPolicy = l_errorPolicy_2, 
        returnPartialData = l_returnPartialData_0, 
        notifyOnNetworkStatusChange = l_notifyOnNetworkStatusChange_0, 
        context = l_context_2
    });
    local function v282(v281)
        v280.variables = v281;
        return v268:fetchQueryByPolicy(v274, v280, v271);
    end;
    local v283 = nil;
    v268.fetchCancelFns:set(v269, function(v284)
        v11.delay(0):andThen(function()
            return v283:cancel(v284);
        end);
    end);
    v283 = l_Concast_0.new((function()
        if not v268:transform(v280.query).hasClientExports then
            return v282(v280.variables);
        else
            return v268.localState:addExportedVariables(v280.query, v280.variables, v280.context):andThen(v282);
        end;
    end)());
    v283:cleanup(function()
        v268.fetchCancelFns:delete(v269);
        l_applyNextFetchPolicy_0(v270);
    end);
    return v283;
end;
v55.refetchQueries = function(v285, v286)
    local l_updateCache_0 = v286.updateCache;
    local l_include_0 = v286.include;
    local l_optimistic_0 = v286.optimistic;
    local l_removeOptimistic_0 = v286.removeOptimistic;
    local l_onQueryUpdated_1 = v286.onQueryUpdated;
    if l_optimistic_0 == nil then
        l_optimistic_0 = false;
    end;
    if l_removeOptimistic_0 == nil then
        l_removeOptimistic_0 = if not l_Boolean_0.toJSBoolean(l_optimistic_0) then nil else l_makeUniqueId_0("refetchQueries");
    end;
    local v292 = l_Map_0.new(nil);
    if l_Boolean_0.toJSBoolean(l_include_0) then
        v285:getObservableQueries(l_include_0):forEach(function(v293, v294)
            v292:set(v294, {
                oq = v293, 
                lastDiff = v285:getQuery(v294):getDiff()
            });
        end);
    end;
    local v295 = l_Map_0.new(nil);
    if l_Boolean_0.toJSBoolean(l_updateCache_0) then
        v285.cache:batch({
            update = l_updateCache_0, 
            optimistic = not not l_optimistic_0 and if l_Boolean_0.toJSBoolean(l_removeOptimistic_0) then l_removeOptimistic_0 else false, 
            removeOptimistic = l_removeOptimistic_0, 
            onWatchUpdated = function(_, v297, v298, v299)
                local v300 = nil;
                v300 = if not l_instanceof_0(v297.watcher, l_QueryInfo_0) then l_instanceof_0(v297.watcher, l_QueryInfo_0) else v297.watcher.observableQuery;
                if l_Boolean_0.toJSBoolean(v300) then
                    if not l_onQueryUpdated_1 then
                        if l_onQueryUpdated_1 then
                            v292:set(v300.queryId, {
                                oq = v300, 
                                lastDiff = v299, 
                                diff = v298
                            });
                        end;
                    else
                        v292:delete(v300.queryId);
                        local v301 = l_onQueryUpdated_1(v286, v300, v298, v299);
                        if v301 == true then
                            v301 = v300:refetch();
                        end;
                        if v301 ~= false then
                            v295:set(v300, v301);
                        end;
                        return false;
                    end;
                end;
                return nil;
            end
        });
    end;
    if l_Boolean_0.toJSBoolean(v292.size) then
        v292:forEach(function(v302, v303)
            local l_oq_0 = v302.oq;
            local l_lastDiff_0 = v302.lastDiff;
            local l_diff_0 = v302.diff;
            local v307 = nil;
            if l_onQueryUpdated_1 ~= nil then
                if l_diff_0 == nil then
                    local l_queryInfo_0 = l_oq_0.queryInfo;
                    l_queryInfo_0:reset();
                    l_diff_0 = l_queryInfo_0:getDiff();
                end;
                v307 = l_onQueryUpdated_1(v286, l_oq_0, l_diff_0, l_lastDiff_0);
            end;
            if not (l_onQueryUpdated_1 ~= nil) or v307 == true then
                v307 = l_oq_0:refetch();
            end;
            if v307 ~= false then
                v295:set(l_oq_0, v307);
            end;
            local v309 = string.find(v303, "legacyOneTimeQuery");
            if v309 ~= nil and v309 >= 1 then
                v285:stopQueryNoBroadcast(v303);
            end;
        end);
    end;
    if l_Boolean_0.toJSBoolean(l_removeOptimistic_0) then
        v285.cache:removeOptimistic(l_removeOptimistic_0);
    end;
    return v295;
end;
v55.fetchQueryByPolicy = function(v310, v311, v312, v313)
    local l_query_1 = v312.query;
    local l_variables_3 = v312.variables;
    local l_fetchPolicy_4 = v312.fetchPolicy;
    local l_refetchWritePolicy_0 = v312.refetchWritePolicy;
    local l_errorPolicy_3 = v312.errorPolicy;
    local l_returnPartialData_1 = v312.returnPartialData;
    local l_context_3 = v312.context;
    local l_notifyOnNetworkStatusChange_1 = v312.notifyOnNetworkStatusChange;
    local l_networkStatus_0 = v311.networkStatus;
    v311:init({
        document = l_query_1, 
        variables = l_variables_3, 
        networkStatus = v313
    });
    local function v323()
        return v311:getDiff(l_variables_3);
    end;
    local function v331(v324, v325)
        if v325 == nil then
            v325 = not not l_Boolean_0.toJSBoolean(v311.networkStatus) and v311.networkStatus or l_NetworkStatus_0.loading;
        end;
        local l_result_3 = v324.result;
        if not (((not (_G.__DEV__ and v324.missing ~= nil) or not l_isNonEmptyArray_0(v324.missing)) or v19(l_result_3, {})) or l_Boolean_0.toJSBoolean(l_returnPartialData_1)) then
            l_invariant_0.debug(("Missing cache result fields: %s"):format(l_Array_0.join(l_Array_0.map(v324.missing, function(v327)
                return l_Array_0.join(v327.path, ".");
            end), ", ")), v324.missing);
        end;
        local function v329(v328)
            return l_Observable_0.of((l_Object_0.assign({}, {
                data = v328, 
                loading = l_isNetworkRequestInFlight_0(v325), 
                networkStatus = v325
            }, if not l_Boolean_0.toJSBoolean(v324.complete) then {
                partial = true
            } else nil)));
        end;
        if not l_Boolean_0.toJSBoolean(l_result_3) or not v310:transform(l_query_1).hasForcedResolvers then
            return v329(l_result_3);
        else
            return v310.localState:runResolvers({
                document = l_query_1, 
                remoteResult = {
                    data = l_result_3
                }, 
                context = l_context_3, 
                variables = l_variables_3, 
                onlyRunForcedResolvers = true
            }):andThen(function(v330)
                return v329(not not l_Boolean_0.toJSBoolean(v330.data) and v330.data or nil);
            end);
        end;
    end;
    local v332 = nil;
    v332 = if l_fetchPolicy_4 == "no-cache" then l_CacheWriteBehavior_0.FORBID else if v313 == l_NetworkStatus_0.refetch and l_refetchWritePolicy_0 ~= "merge" then l_CacheWriteBehavior_0.OVERWRITE else l_CacheWriteBehavior_0.MERGE;
    local function v333()
        return v310:getResultsFromLink(v311, v332, {
            variables = l_variables_3, 
            context = l_context_3, 
            fetchPolicy = l_fetchPolicy_4, 
            errorPolicy = l_errorPolicy_3
        });
    end;
    local l_l_notifyOnNetworkStatusChange_1_0 = l_notifyOnNetworkStatusChange_1;
    if l_l_notifyOnNetworkStatusChange_1_0 then
        l_l_notifyOnNetworkStatusChange_1_0 = false;
        if typeof(l_networkStatus_0) == "number" then
            l_l_notifyOnNetworkStatusChange_1_0 = false;
            if l_networkStatus_0 ~= v313 then
                l_l_notifyOnNetworkStatusChange_1_0 = l_isNetworkRequestInFlight_0(v313);
            end;
        end;
    end;
    if l_fetchPolicy_4 == "cache-first" then
        local v335 = v311:getDiff(l_variables_3);
        if not l_Boolean_0.toJSBoolean(v335.complete) then
            if not l_Boolean_0.toJSBoolean(l_returnPartialData_1) and not l_Boolean_0.toJSBoolean(l_l_notifyOnNetworkStatusChange_1_0) then
                return {
                    v333()
                };
            else
                return {
                    v331(v335), 
                    v333()
                };
            end;
        else
            return {
                v331(v335, v311:markReady())
            };
        end;
    elseif l_fetchPolicy_4 == "cache-and-network" then
        local v336 = v311:getDiff(l_variables_3);
        if not (l_Boolean_0.toJSBoolean(v336.complete) or l_Boolean_0.toJSBoolean(l_returnPartialData_1)) and not l_Boolean_0.toJSBoolean(l_l_notifyOnNetworkStatusChange_1_0) then
            return {
                v333()
            };
        else
            return {
                v331(v336), 
                v333()
            };
        end;
    elseif l_fetchPolicy_4 == "cache-only" then
        return {
            v331(v311:getDiff(l_variables_3), v311:markReady())
        };
    elseif l_fetchPolicy_4 == "network-only" then
        if not l_Boolean_0.toJSBoolean(l_l_notifyOnNetworkStatusChange_1_0) then
            return {
                v333()
            };
        else
            return {
                v331(v323()), 
                v333()
            };
        end;
    elseif l_fetchPolicy_4 == "no-cache" then
        if not l_Boolean_0.toJSBoolean(l_l_notifyOnNetworkStatusChange_1_0) then
            return {
                v333()
            };
        else
            return {
                v331(v311:getDiff()), 
                v333()
            };
        end;
    elseif l_fetchPolicy_4 == "standby" then
        return {};
    else
        local v337 = v311:getDiff(l_variables_3);
        if not l_Boolean_0.toJSBoolean(v337.complete) then
            if not l_Boolean_0.toJSBoolean(l_returnPartialData_1) and not l_Boolean_0.toJSBoolean(l_l_notifyOnNetworkStatusChange_1_0) then
                return {
                    v333()
                };
            else
                return {
                    v331(v337), 
                    v333()
                };
            end;
        else
            return {
                v331(v337, v311:markReady())
            };
        end;
    end;
end;
v55.getQuery = function(v338, v339)
    if not (not l_Boolean_0.toJSBoolean(v339) or v338.queries:has(v339)) then
        v338.queries:set(v339, l_QueryInfo_0.new(v338.cache));
    end;
    return v338.queries:get(v339);
end;
v55.prepareContext = function(v340, v341)
    if v341 == nil then
        v341 = {};
    end;
    return l_Object_0.assign({}, v340.localState:prepareContext(v341), {
        clientAwareness = v340.clientAwareness
    });
end;
v0.QueryManager = v55;
return v0;
