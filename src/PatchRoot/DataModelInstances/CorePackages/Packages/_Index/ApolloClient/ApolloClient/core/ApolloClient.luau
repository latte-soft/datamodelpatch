local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local l_setTimeout_0 = v3.setTimeout;
local v8 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.GraphQL);
local v10 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v10.invariant;
local l_InvariantError_0 = v10.InvariantError;
local v13 = require(script.Parent.Parent.link.core);
local l_ApolloLink_0 = v13.ApolloLink;
local l_execute_0 = v13.execute;
local _ = require(script.Parent.Parent.cache);
local l_compact_0 = require(script.Parent.Parent.utilities).compact;
local l_version_0 = require(script.Parent.Parent.version).version;
local l_HttpLink_0 = require(script.Parent.Parent.link.http).HttpLink;
local l_QueryManager_0 = require(script.Parent.QueryManager).QueryManager;
local _ = require(script.Parent.ObservableQuery_types);
local _ = require(l_Parent_0.core.types);
local _ = require(script.Parent.watchQueryOptions_types);
local _ = require(script.Parent.watchQueryOptions);
local l_LocalState_0 = require(script.Parent.LocalState).LocalState;
local _ = require(script.Parent.ApolloClient_types);
local function v29(v27, v28)
    return l_compact_0(v27, v28, not not l_Boolean_0.toJSBoolean(v28.variables) and {
        variables = l_Object_0.assign({}, v27.variables, v28.variables)
    } or v28.variables);
end;
v0.mergeOptions = v29;
local v30 = {};
v30.__index = v30;
v30.new = function(v31)
    local v32 = setmetatable({}, v30);
    v32.defaultOptions = {};
    v32.resetStoreCallbacks = {};
    v32.clearStoreCallbacks = {};
    local l_uri_0 = v31.uri;
    local l_credentials_0 = v31.credentials;
    local l_headers_0 = v31.headers;
    local l_cache_0 = v31.cache;
    local l_defaultOptions_0 = v31.defaultOptions;
    local l_resolvers_0 = v31.resolvers;
    local l_typeDefs_0 = v31.typeDefs;
    local l_fragmentMatcher_0 = v31.fragmentMatcher;
    local l_name_0 = v31.name;
    local l_version_1 = v31.version;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    v43 = not (v31.ssrMode == nil) and v31.ssrMode;
    v44 = v31.ssrForceFetchDelay == nil and 0 or v31.ssrForceFetchDelay;
    if v31.connectToDevTools == nil then
        local v48 = false;
        if typeof(_G) == "table" then
            v48 = not l_Boolean_0.toJSBoolean(_G.__APOLLO_CLIENT__) and _G.__DEV__;
        end;
        v45 = v48;
    else
        v45 = v31.connectToDevTools;
    end;
    v46 = v31.queryDeduplication == nil and true or v31.queryDeduplication;
    v47 = not (v31.assumeImmutableResults == nil) and v31.assumeImmutableResults;
    local l_link_0 = v31.link;
    if not l_Boolean_0.toJSBoolean(l_link_0) then
        l_link_0 = if not l_Boolean_0.toJSBoolean(l_uri_0) then l_ApolloLink_0.empty() else l_HttpLink_0.new({
            uri = l_uri_0, 
            credentials = l_credentials_0, 
            headers = l_headers_0
        });
    end;
    if not l_Boolean_0.toJSBoolean(l_cache_0) then
        error(l_InvariantError_0.new("To initialize Apollo Client, you must specify a 'cache' property " .. "in the options object. \n" .. "For more information, please visit: https://go.apollo.dev/c/docs"));
    end;
    v32.link = l_link_0;
    v32.cache = l_cache_0;
    v32.disableNetworkFetches = not not l_Boolean_0.toJSBoolean(v43) and v43 or v44 > 0;
    v32.queryDeduplication = v46;
    v32.defaultOptions = not not l_Boolean_0.toJSBoolean(l_defaultOptions_0) and l_defaultOptions_0 or {};
    v32.typeDefs = l_typeDefs_0;
    if l_Boolean_0.toJSBoolean(v44) then
        l_setTimeout_0(function()
            v32.disableNetworkFetches = false;
            return v32.disableNetworkFetches;
        end, v44);
    end;
    v32.version = l_version_0;
    v32.localState = l_LocalState_0.new({
        cache = l_cache_0, 
        client = v32, 
        resolvers = l_resolvers_0, 
        fragmentMatcher = l_fragmentMatcher_0
    });
    v32.queryManager = l_QueryManager_0.new({
        cache = v32.cache, 
        link = v32.link, 
        queryDeduplication = v46, 
        ssrMode = v43, 
        clientAwareness = {
            name = l_name_0, 
            version = l_version_1
        }, 
        localState = v32.localState, 
        assumeImmutableResults = v47, 
        onBroadcast = if not v45 then nil else function()
        end
    });
    return v32;
end;
v30.stop = function(v50)
    v50.queryManager:stop();
end;
v30.watchQuery = function(v51, v52)
    if l_Boolean_0.toJSBoolean(v51.defaultOptions.watchQuery) then
        v52 = v29(v51.defaultOptions.watchQuery, v52);
    end;
    if v51.disableNetworkFetches and (not (v52.fetchPolicy ~= "network-only") or v52.fetchPolicy == "cache-and-network") then
        v52 = l_Object_0.assign({}, v52, {
            fetchPolicy = "cache-first"
        });
    end;
    return v51.queryManager:watchQuery(v52);
end;
v30.query = function(v53, v54)
    if l_Boolean_0.toJSBoolean(v53.defaultOptions.query) then
        v54 = v29(v53.defaultOptions.query, v54);
    end;
    l_invariant_0(v54.fetchPolicy ~= "cache-and-network", "The cache-and-network fetchPolicy does not work with client.query, because " .. "client.query can only return a single result. Please use client.watchQuery " .. "to receive multiple results from the cache and the network, or consider " .. "using a different fetchPolicy, such as cache-first or network-only.");
    if v53.disableNetworkFetches and v54.fetchPolicy == "network-only" then
        v54 = l_Object_0.assign({}, v54, {
            fetchPolicy = "cache-first"
        });
    end;
    return v53.queryManager:query(v54);
end;
v30.mutate = function(v55, v56)
    if l_Boolean_0.toJSBoolean(v55.defaultOptions.mutate) then
        v56 = v29(v55.defaultOptions.mutate, v56);
    end;
    return v55.queryManager:mutate(v56);
end;
v30.subscribe = function(v57, v58)
    return v57.queryManager:startGraphQLSubscription(v58);
end;
v30.readQuery = function(v59, v60, v61)
    if v61 == nil then
        v61 = false;
    end;
    return v59.cache:readQuery(v60, v61);
end;
v30.readFragment = function(v62, v63, v64)
    if v64 == nil then
        v64 = false;
    end;
    return v62.cache:readFragment(v63, v64);
end;
v30.writeQuery = function(v65, v66)
    v65.cache:writeQuery(v66);
    v65.queryManager:broadcastQueries();
end;
v30.writeFragment = function(v67, v68)
    v67.cache:writeFragment(v68);
    v67.queryManager:broadcastQueries();
end;
v30.__actionHookForDevTools = function(v69, v70)
    v69.devToolsHookCb = v70;
end;
v30.__requestRaw = function(v71, v72)
    return l_execute_0(v71.link, v72);
end;
v30.resetStore = function(v73)
    return v8.delay(0):andThen(function()
        return v73.queryManager:clearStore();
    end):andThen(function()
        return v8.all(l_Array_0.map(v73.resetStoreCallbacks, function(v74)
            return v74();
        end));
    end):andThen(function()
        return v73:reFetchObservableQueries();
    end);
end;
v30.clearStore = function(v75)
    return v8.delay(0):andThen(function()
        return v75.queryManager:clearStore();
    end):andThen(function()
        return v8.all(l_Array_0.map(v75.clearStoreCallbacks, function(v76)
            return v76();
        end));
    end);
end;
v30.onResetStore = function(v77, v78)
    table.insert(v77.resetStoreCallbacks, v78);
    return function()
        v77.resetStoreCallbacks = l_Array_0.filter(v77.resetStoreCallbacks, function(v79)
            return v79 ~= v78;
        end);
    end;
end;
v30.onClearStore = function(v80, v81)
    table.insert(v80.clearStoreCallbacks, v81);
    return function()
        v80.clearStoreCallbacks = l_Array_0.filter(v80.clearStoreCallbacks, function(v82)
            return v82 ~= v81;
        end);
    end;
end;
v30.reFetchObservableQueries = function(v83, v84)
    return v83.queryManager:reFetchObservableQueries(v84);
end;
v30.refetchQueries = function(v85, v86)
    local v87 = v85.queryManager:refetchQueries(v86);
    local v88 = {};
    local v89 = {};
    v87:forEach(function(v90, v91)
        table.insert(v88, v91);
        table.insert(v89, v90);
    end);
    local v92 = v8.all(v89);
    v92.queries = v88;
    v92.results = v89;
    v92:catch(function(v93)
        l_invariant_0.debug(("In client.refetchQueries, Promise.all promise rejected with error %s"):format(v93.message));
    end);
    return v92;
end;
v30.getObservableQueries = function(v94, v95)
    if v95 == nil then
        v95 = "active";
    end;
    return v94.queryManager:getObservableQueries(v95);
end;
v30.extract = function(v96, v97)
    return v96.cache:extract(v97);
end;
v30.restore = function(v98, v99)
    return v98.cache:restore(v99);
end;
v30.addResolvers = function(v100, v101)
    v100.localState:addResolvers(v101);
end;
v30.setResolvers = function(v102, v103)
    v102.localState:setResolvers(v103);
end;
v30.getResolvers = function(v104)
    return v104.localState:getResolvers();
end;
v30.setLocalStateFragmentMatcher = function(v105, v106)
    v105.localState:setFragmentMatcher(v106);
end;
v30.setLink = function(v107, v108)
    v107.queryManager.link = v108;
    v107.link = v107.queryManager.link;
end;
v0.ApolloClient = v30;
return v0;
