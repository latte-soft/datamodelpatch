local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_Object_0 = v4.Object;
local v7 = require(l_Parent_0.luaUtils.hasOwnProperty);
local v8 = require(l_Parent_0.jsutils.equal);
local l_ApolloError_0 = require(l_Parent_0.errors).ApolloError;
local l_NetworkStatus_0 = require(script.Parent.Parent.Parent.core).NetworkStatus;
local _ = require(l_Parent_0.utilities);
local l_DocumentType_0 = require(script.Parent.Parent.parser).DocumentType;
local _ = require(script.Parent.Parent.types.types);
local l_OperationData_0 = require(script.Parent.OperationData).OperationData;
local v15 = setmetatable({}, {
    __index = l_OperationData_0
});
v15.__index = v15;
v15.new = function(v16)
    local l_options_0 = v16.options;
    local l_context_0 = v16.context;
    local l_onNewData_0 = v16.onNewData;
    local v20 = l_OperationData_0.new(l_options_0, l_context_0);
    v20.runLazy = false;
    v20.previous = {};
    v20.onNewData = l_onNewData_0;
    v20.runLazyQuery = function(v21)
        v20:cleanup();
        v20.runLazy = true;
        v20.lazyOptions = v21;
        v20:onNewData();
    end;
    v20.obsRefetch = function(_, v23)
        if not l_Boolean_0.toJSBoolean(v20.currentObservable) then
            return nil;
        else
            return v20.currentObservable:refetch(v23);
        end;
    end;
    v20.obsFetchMore = function(_, v25)
        if not v20.currentObservable then
            return nil;
        else
            return (v20.currentObservable:fetchMore(v25));
        end;
    end;
    v20.obsUpdateQuery = function(_, v27)
        if not v20.currentObservable then
            return nil;
        else
            return (v20.currentObservable:updateQuery(v27));
        end;
    end;
    v20.obsStartPolling = function(_, v29)
        if not v20.currentObservable then
            return nil;
        else
            return (v20.currentObservable:startPolling(v29));
        end;
    end;
    v20.obsStopPolling = function(_)
        if not v20.currentObservable then
            return nil;
        else
            return (v20.currentObservable:stopPolling());
        end;
    end;
    v20.obsSubscribeToMore = function(v31)
        if not v20.currentObservable then
            return nil;
        else
            return (v20.currentObservable:subscribeToMore(v31));
        end;
    end;
    return (setmetatable(v20, v15));
end;
v15.execute = function(v32)
    v32:refreshClient();
    local v33 = v32:getOptions();
    local l_skip_0 = v33.skip;
    local l_query_0 = v33.query;
    if l_skip_0 or l_query_0 ~= v32.previous.query then
        v32:removeQuerySubscription();
        v32:removeObservable(not l_Boolean_0.toJSBoolean(l_skip_0));
        v32.previous.query = l_query_0;
    end;
    v32:updateObservableQuery();
    return v32:getExecuteSsrResult() or v32:getExecuteResult();
end;
v15.executeLazy = function(v36)
    if l_Boolean_0.toJSBoolean(v36.runLazy) then
        return table.pack(v36.runLazyQuery, v36:execute());
    else
        return table.pack(v36.runLazyQuery, {
            loading = false, 
            networkStatus = l_NetworkStatus_0.ready, 
            called = false, 
            data = nil
        });
    end;
end;
v15.fetchData = function(v37)
    local v38 = v37:getOptions();
    if not l_Boolean_0.toJSBoolean(not not l_Boolean_0.toJSBoolean(v38.skip) and v38.skip or v38.ssr == false) then
        return v3.new(function(v39)
            return v37:startQuerySubscription(v39);
        end);
    else
        return false;
    end;
end;
v15.afterExecute = function(v40, v41)
    local v42 = v41 or {};
    local v43 = not not v42.lazy and v42.lazy;
    v40.isMounted = true;
    local v44 = v40:getOptions();
    local v45 = v44.ssr == false;
    if not ((not l_Boolean_0.toJSBoolean(v40.currentObservable) or l_Boolean_0.toJSBoolean(v45)) or l_Boolean_0.toJSBoolean(v40:ssrInitiated())) then
        v40:startQuerySubscription();
    end;
    if not (l_Boolean_0.toJSBoolean(v43) and not l_Boolean_0.toJSBoolean(v40.runLazy)) then
        v40:handleErrorOrCompleted();
    end;
    v40.previousOptions = v44;
    return function(...)
        return v40:unmount(...);
    end;
end;
v15.cleanup = function(v46)
    v46:removeQuerySubscription();
    v46:removeObservable(true);
    v46.previous.result = nil;
end;
v15.getOptions = function(v47)
    local v48 = getmetatable((getmetatable(v47))).__index.getOptions(v47);
    if l_Boolean_0.toJSBoolean(v47.lazyOptions) then
        v48.variables = l_Object_0.assign({}, v48.variables, v47.lazyOptions.variables);
        v48.context = l_Object_0.assign({}, v48.context, v47.lazyOptions.context);
    end;
    if l_Boolean_0.toJSBoolean(v47.runLazy) then
        v47.options.skip = nil;
    end;
    return v48;
end;
v15.ssrInitiated = function(v49)
    if not l_Boolean_0.toJSBoolean(v49.context) then
        return v49.context;
    else
        return v49.context.renderPromises;
    end;
end;
v15.getExecuteSsrResult = function(v50)
    local v51 = v50:getOptions();
    local l_ssr_0 = v51.ssr;
    local l_skip_1 = v51.skip;
    local v54 = l_ssr_0 == false;
    local l_disableNetworkFetches_0 = v50:refreshClient().client.disableNetworkFetches;
    local v56 = l_Object_0.assign({}, {
        loading = true, 
        networkStatus = l_NetworkStatus_0.loading, 
        called = true, 
        data = nil, 
        stale = false, 
        client = v50.client; 
        v50:observableQueryFields()
    });
    if not l_Boolean_0.toJSBoolean(v54) or not l_Boolean_0.toJSBoolean(v50:ssrInitiated()) and not l_Boolean_0.toJSBoolean(l_disableNetworkFetches_0) then
        if not l_Boolean_0.toJSBoolean(v50:ssrInitiated()) then
            return nil;
        else
            local v57 = not not l_Boolean_0.toJSBoolean(v50:getExecuteResult()) and v50:getExecuteResult() or v56;
            if not (not l_Boolean_0.toJSBoolean(v57.loading) or l_Boolean_0.toJSBoolean(l_skip_1)) then
                v50.context.renderPromises:addQueryPromise(v50, function()
                    return nil;
                end);
            end;
            return v57;
        end;
    else
        v50.previous.result = v56;
        return v56;
    end;
end;
v15.prepareObservableQueryOptions = function(v58)
    local v59 = v58:getOptions();
    v58:verifyDocumentType(v59.query, l_DocumentType_0.Query);
    local v60 = not not l_Boolean_0.toJSBoolean(v59.displayName) and v59.displayName or "Query";
    if l_Boolean_0.toJSBoolean(v58:ssrInitiated()) and (not (v59.fetchPolicy ~= "network-only") or v59.fetchPolicy == "cache-and-network") then
        v59.fetchPolicy = "cache-first";
    end;
    return l_Object_0.assign({}, v59, {
        displayName = v60, 
        context = v59.context
    });
end;
v15.initializeObservableQuery = function(v61)
    if l_Boolean_0.toJSBoolean(v61:ssrInitiated()) then
        v61.currentObservable = v61.context.renderPromises:getSSRObservable(v61:getOptions());
    end;
    if not l_Boolean_0.toJSBoolean(v61.currentObservable) then
        local v62 = v61:prepareObservableQueryOptions();
        v61.previous.observableQueryOptions = l_Object_0.assign({}, v62, {
            children = l_Object_0.None
        });
        v61.currentObservable = v61:refreshClient().client:watchQuery(l_Object_0.assign({}, v62));
        if l_Boolean_0.toJSBoolean(v61:ssrInitiated()) then
            v61.context.renderPromises:registerSSRObservable(v61.currentObservable, v62);
        end;
    end;
end;
v15.updateObservableQuery = function(v63)
    if l_Boolean_0.toJSBoolean(v63.currentObservable) then
        local v64 = l_Object_0.assign({}, v63:prepareObservableQueryOptions(), {
            children = l_Object_0.None
        });
        if not l_Boolean_0.toJSBoolean(v63:getOptions().skip) then
            if not v8(v64, v63.previous.observableQueryOptions) then
                v63.previous.observableQueryOptions = v64;
                v63.currentObservable:setOptions(v64):catch(function()
                end);
            end;
            return ;
        else
            v63.previous.observableQueryOptions = v64;
            return ;
        end;
    else
        v63:initializeObservableQuery();
        return ;
    end;
end;
v15.startQuerySubscription = function(v65, v66)
    if v66 == nil then
        v66 = v65.onNewData;
    end;
    if not l_Boolean_0.toJSBoolean(v65.currentSubscription) and not l_Boolean_0.toJSBoolean(v65:getOptions().skip) then
        v65.currentSubscription = v65.currentObservable:subscribe({
            next = function(_, v68)
                local l_loading_0 = v68.loading;
                local l_networkStatus_0 = v68.networkStatus;
                local l_data_0 = v68.data;
                local l_result_0 = v65.previous.result;
                if not ((l_Boolean_0.toJSBoolean(l_result_0) and l_result_0.loading == l_loading_0) and l_result_0.networkStatus == l_networkStatus_0) or not v8(l_result_0.data, l_data_0) then
                    v66(v65);
                    return ;
                else
                    return ;
                end;
            end, 
            error = function(_, v74)
                v65:resubscribeToQuery();
                if not v7(v74, "graphQLErrors") then
                    error(v74);
                end;
                local l_result_1 = v65.previous.result;
                if not (not (l_Boolean_0.toJSBoolean(l_result_1) and l_Boolean_0.toJSBoolean(l_result_1.loading)) and v8(v74, v65.previous.error)) then
                    v65.previous.error = v74;
                    v66(v65);
                end;
            end
        });
        return ;
    else
        return ;
    end;
end;
v15.resubscribeToQuery = function(v76)
    v76:removeQuerySubscription();
    local l_currentObservable_0 = v76.currentObservable;
    if l_Boolean_0.toJSBoolean(l_currentObservable_0) then
        local v78 = l_currentObservable_0:getLastError();
        local v79 = l_currentObservable_0:getLastResult();
        l_currentObservable_0:resetLastResults();
        v76:startQuerySubscription();
        l_Object_0.assign(l_currentObservable_0, {
            lastError = v78, 
            lastResult = v79
        });
    end;
end;
v15.getExecuteResult = function(v80)
    local v81 = v80:observableQueryFields();
    local v82 = v80:getOptions();
    if not l_Boolean_0.toJSBoolean(v82.skip) then
        if l_Boolean_0.toJSBoolean(v80.currentObservable) then
            local v83 = v80.currentObservable:getCurrentResult();
            local l_data_1 = v83.data;
            local l_loading_1 = v83.loading;
            local l_partial_0 = v83.partial;
            local l_networkStatus_1 = v83.networkStatus;
            local l_errors_0 = v83.errors;
            local l_error_0 = v83.error;
            if l_Boolean_0.toJSBoolean(l_errors_0) and #l_errors_0 > 0 then
                l_error_0 = l_ApolloError_0.new({
                    graphQLErrors = l_errors_0
                });
            end;
            v81 = l_Object_0.assign({}, v81, {
                data = l_data_1, 
                loading = l_loading_1, 
                networkStatus = l_networkStatus_1, 
                error = l_error_0, 
                called = true
            });
            if not l_Boolean_0.toJSBoolean(l_loading_1) then
                if not l_Boolean_0.toJSBoolean(l_error_0) then
                    local l_fetchPolicy_0 = v80.currentObservable.options.fetchPolicy;
                    if (not (not l_Boolean_0.toJSBoolean(v82.partialRefetch) or not l_Boolean_0.toJSBoolean(l_partial_0)) and (not l_Boolean_0.toJSBoolean(l_data_1) or #l_Object_0.keys(l_data_1) == 0)) and l_fetchPolicy_0 ~= "cache-only" then
                        l_Object_0.assign(v81, {
                            loading = true, 
                            networkStatus = l_NetworkStatus_0.loading
                        });
                        v81:refetch();
                        return v81;
                    end;
                else
                    l_Object_0.assign(v81, {
                        data = (v80.currentObservable:getLastResult() or {}).data
                    });
                end;
            end;
        end;
    else
        v81 = l_Object_0.assign({}, v81, {
            data = l_Object_0.None, 
            error = l_Object_0.None, 
            loading = false, 
            networkStatus = l_NetworkStatus_0.ready, 
            called = true
        });
    end;
    v81.client = v80.client;
    v80:setOptions(v82, true);
    local l_result_2 = v80.previous.result;
    if not l_Boolean_0.toJSBoolean(l_result_2) or not l_Boolean_0.toJSBoolean(l_result_2.loading) then
        v80.previous.loading = false;
    else
        v80.previous.loading = l_result_2.loading;
    end;
    if not l_Boolean_0.toJSBoolean(l_result_2) then
        v81.previousData = l_result_2;
    else
        v81.previousData = not not l_Boolean_0.toJSBoolean(l_result_2.data) and l_result_2.data or l_result_2.previousData;
    end;
    v80.previous.result = v81;
    if l_Boolean_0.toJSBoolean(v80.currentObservable) then
        v80.currentObservable:resetQueryStoreErrors();
    end;
    return v81;
end;
v15.handleErrorOrCompleted = function(v92)
    if v92.currentObservable and v92.previous.result then
        local l_result_3 = v92.previous.result;
        local l_data_2 = l_result_3.data;
        local l_loading_2 = l_result_3.loading;
        local l_error_1 = l_result_3.error;
        if not l_Boolean_0.toJSBoolean(l_loading_2) then
            local v97 = v92:getOptions();
            local l_query_1 = v97.query;
            local l_variables_0 = v97.variables;
            local l_onCompleted_0 = v97.onCompleted;
            local l_onError_0 = v97.onError;
            local l_skip_2 = v97.skip;
            if ((not l_Boolean_0.toJSBoolean(v92.previousOptions) or l_Boolean_0.toJSBoolean(v92.previous.loading)) or not v8(v92.previousOptions.query, l_query_1)) or not v8(v92.previousOptions.variables, l_variables_0) then
                if (not l_Boolean_0.toJSBoolean(l_onCompleted_0) or l_Boolean_0.toJSBoolean(l_error_1)) or l_Boolean_0.toJSBoolean(l_skip_2) then
                    if not (not l_Boolean_0.toJSBoolean(l_onError_0) or not l_Boolean_0.toJSBoolean(l_error_1)) then
                        l_onError_0(l_error_1);
                    end;
                else
                    l_onCompleted_0(l_data_2);
                    return ;
                end;
            else
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v15.removeQuerySubscription = function(v103)
    if l_Boolean_0.toJSBoolean(v103.currentSubscription) then
        v103.currentSubscription:unsubscribe();
        v103.currentSubscription = nil;
    end;
end;
v15.removeObservable = function(v104, v105)
    if l_Boolean_0.toJSBoolean(v104.currentObservable) then
        v104.currentObservable.tearDownQuery(v104.currentObservable);
        if l_Boolean_0.toJSBoolean(v105) then
            v104.currentObservable = nil;
        end;
    end;
end;
v15.observableQueryFields = function(v106)
    local _ = nil;
    return {
        variables = if not l_Boolean_0.toJSBoolean(v106.currentObservable) then nil else v106.currentObservable.variables, 
        refetch = v106.obsRefetch, 
        fetchMore = v106.obsFetchMore, 
        updateQuery = v106.obsUpdateQuery, 
        startPolling = v106.obsStartPolling, 
        stopPolling = v106.obsStopPolling, 
        subscribeToMore = v106.obsSubscribeToMore
    };
end;
v0.QueryData = v15;
return v0;
