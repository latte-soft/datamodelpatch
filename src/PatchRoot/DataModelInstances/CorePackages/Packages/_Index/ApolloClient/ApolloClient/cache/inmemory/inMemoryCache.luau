local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Map_0 = v2.Map;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local l_instanceof_0 = v2.instanceof;
local l_NULL_0 = require(l_Parent_0.utilities).NULL;
local v8 = require(l_Parent_1.Promise);
local v9 = {};
local _ = require(l_Parent_1.GraphQL);
local l_wrap_0 = require(l_Parent_0.optimism).wrap;
local v12 = require(l_Parent_0.jsutils.equal);
local l_ApolloCache_0 = require(script.Parent.Parent.core.cache).ApolloCache;
local _ = require(script.Parent.Parent.core.types.Cache);
local l_MissingFieldError_0 = require(script.Parent.Parent.core.types.common).MissingFieldError;
local v16 = require(script.Parent.Parent.Parent.utilities);
local l_addTypenameToDocument_0 = v16.addTypenameToDocument;
local l_isReference_0 = v16.isReference;
local _ = require(script.Parent.types);
local l_StoreReader_0 = require(script.Parent.readFromStore).StoreReader;
local l_StoreWriter_0 = require(script.Parent.writeToStore).StoreWriter;
local v22 = require(script.Parent.entityStore);
local l_EntityStore_Root_0 = v22.EntityStore_Root;
local l_supportsResultCaching_0 = v22.supportsResultCaching;
local v25 = require(script.Parent.reactiveVars);
local l_makeVar_0 = v25.makeVar;
local l_forgetCache_0 = v25.forgetCache;
local l_recallCache_0 = v25.recallCache;
local v29 = require(script.Parent.policies);
local l_defaultDataIdFromObject_0 = v29.defaultDataIdFromObject;
local l_Policies_0 = v29.Policies;
local l_hasOwn_0 = require(script.Parent.helpers).hasOwn;
local l_canonicalStringify_0 = require(script.Parent["object-canon"]).canonicalStringify;
local v34 = {
    dataIdFromObject = l_defaultDataIdFromObject_0, 
    addTypename = true, 
    resultCaching = true, 
    typePolicies = {}
};
local v35 = setmetatable({}, {
    __index = l_ApolloCache_0
});
v35.__index = v35;
v35.new = function(v36)
    local v37 = setmetatable(l_ApolloCache_0.new(), v35);
    if v36 == nil then
        v36 = {};
    end;
    v37.watches = l_Set_0.new();
    v37.typenameDocumentCache = l_Map_0.new(nil);
    v37.makeVar = l_makeVar_0;
    v37.txCount = 0;
    v37.config = l_Object_0.assign({}, v34, v36);
    v37.addTypename = v37.config.addTypename;
    v37.policies = l_Policies_0.new({
        cache = v37, 
        dataIdFromObject = v37.config.dataIdFromObject, 
        possibleTypes = v37.config.possibleTypes, 
        typePolicies = v37.config.typePolicies
    });
    v37:init();
    return v37;
end;
v35.init = function(v38)
    v38.data = l_EntityStore_Root_0.new({
        policies = v38.policies, 
        resultCaching = v38.config.resultCaching
    });
    v38.optimisticData = v38.data.stump;
    v38:resetResultCache();
end;
v35.resetResultCache = function(v39, v40)
    local l_storeReader_0 = v39.storeReader;
    v39.storeReader = l_StoreReader_0.new({
        cache = v39, 
        addTypename = v39.addTypename, 
        resultCacheMaxSize = v39.config.resultCacheMaxSize, 
        canon = if not v40 then if l_storeReader_0 then l_storeReader_0.canon else nil else nil
    });
    v39.storeWriter = l_StoreWriter_0.new(v39, v39.storeReader);
    v39.maybeBroadcastWatch = l_wrap_0(function(_, v43, v44)
        return v39:broadcastWatch(v43, v44);
    end, {
        max = v39.config.resultCacheMaxSize, 
        makeCacheKey = function(_, v46)
            local v47 = nil;
            v47 = if not v46.optimistic then v39.data else v39.optimisticData;
            if not l_supportsResultCaching_0(v47) then
                return ;
            else
                return v47:makeCacheKey(v46.query, v46.callback, l_canonicalStringify_0({
                    optimistic = v46.optimistic, 
                    rootId = v46.rootId, 
                    variables = v46.variables
                }));
            end;
        end
    }, v39);
    l_Set_0.new({
        v39.data.group, 
        v39.optimisticData.group
    }):forEach(function(v48)
        return v48:resetCaching();
    end);
end;
v35.restore = function(v49, v50)
    v49:init();
    if v50 then
        v49.data:replace(v50);
    end;
    return v49;
end;
v35.extract = function(v51, v52)
    if v52 == nil then
        v52 = false;
    end;
    if not v52 then
        return v51.data:extract();
    else
        return v51.optimisticData:extract();
    end;
end;
v35.read = function(v53, v54)
    local v55 = nil;
    v55 = not (v54.returnPartialData == nil) and v54.returnPartialData;
    local l_status_0, l_result_0 = pcall(function()
        return v53.storeReader:diffQueryAgainstStore(l_Object_0.assign({}, v54, {
            store = not not v54.optimistic and v53.optimisticData or v53.data, 
            config = v53.config, 
            returnPartialData = v55
        })).result or l_NULL_0;
    end);
    if not l_status_0 then
        if not l_instanceof_0(l_result_0, l_MissingFieldError_0) then
            error(l_result_0);
        else
            return l_NULL_0;
        end;
    end;
    return l_result_0;
end;
v35.write = function(v58, v59)
    local l_status_1, l_result_1 = pcall(function()
        local l_v58_0 = v58;
        l_v58_0.txCount = l_v58_0.txCount + 1;
        return v58.storeWriter:writeToStore(v58.data, v59);
    end);
    v58.txCount = v58.txCount - 1;
    if v58.txCount == 0 and v59.broadcast ~= false then
        v58:broadcastWatches();
    end;
    if not l_status_1 then
        error(l_result_1);
    end;
    return l_result_1;
end;
v35.modify = function(v63, v64)
    if not l_hasOwn_0(v64, "id") or v64.id then
        local v65 = nil;
        v65 = if not v64.optimistic then v63.data else v63.optimisticData;
        local l_status_2, l_result_2 = pcall(function()
            local l_v63_0 = v63;
            l_v63_0.txCount = l_v63_0.txCount + 1;
            return v65:modify(v64.id or "ROOT_QUERY", v64.fields);
        end);
        v63.txCount = v63.txCount - 1;
        if v63.txCount == 0 and v64.broadcast ~= false then
            v63:broadcastWatches();
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
        return l_result_2;
    else
        return false;
    end;
end;
v35.diff = function(v69, v70)
    return v69.storeReader:diffQueryAgainstStore(l_Object_0.assign({}, v70, {
        store = not not v70.optimistic and v69.optimisticData or v69.data, 
        rootId = v70.id or "ROOT_QUERY", 
        config = v69.config
    }));
end;
v35.watch = function(v71, v72)
    if v71.watches.size == 0 then
        l_recallCache_0(v71);
    end;
    v71.watches:add(v72);
    if v72.immediate then
        v71:maybeBroadcastWatch(v72);
    end;
    return function()
        if v71.watches:delete(v72) and v71.watches.size == 0 then
            l_forgetCache_0(v71);
        end;
        v71.maybeBroadcastWatch:forget(v72);
    end;
end;
v35.gc = function(v73, v74)
    l_canonicalStringify_0:reset();
    local v75 = v73.optimisticData:gc();
    if v74 and v73.txCount == 0 then
        if not v74.resetResultCache then
            if v74.resetResultIdentities then
                v73.storeReader:resetCanon();
            end;
        else
            v73:resetResultCache(v74.resetResultIdentities);
            return v75;
        end;
    end;
    return v75;
end;
v35.retain = function(v76, v77, v78)
    if not v78 then
        return v76.data:retain(v77);
    else
        return v76.optimisticData:retain(v77);
    end;
end;
v35.release = function(v79, v80, v81)
    if not v81 then
        return v79.data:release(v80);
    else
        return v79.optimisticData:release(v80);
    end;
end;
v35.identify = function(v82, v83)
    if not l_isReference_0(v83) then
        return v82.policies:identify(v83)[1];
    else
        return v83.__ref;
    end;
end;
v35.evict = function(v84, v85)
    if not v85.id then
        if not l_hasOwn_0(v85, "id") then
            v85 = l_Object_0.assign(table.clone(v85), {
                id = "ROOT_QUERY"
            });
        else
            return false;
        end;
    end;
    local l_status_3, l_result_3 = pcall(function()
        local l_v84_0 = v84;
        l_v84_0.txCount = l_v84_0.txCount + 1;
        return v84.optimisticData:evict(v85);
    end);
    v84.txCount = v84.txCount - 1;
    if v84.txCount == 0 and v85.broadcast ~= false then
        v84:broadcastWatches();
    end;
    if not l_status_3 then
        error(l_result_3);
    end;
    return l_result_3;
end;
v35.reset = function(v89)
    v89:init();
    v89:broadcastWatches();
    l_canonicalStringify_0:reset();
    return v8.delay(0);
end;
v35.removeOptimistic = function(v90, v91)
    local v92 = v90.optimisticData:removeLayer(v91);
    if v92 ~= v90.optimisticData then
        v90.optimisticData = v92;
        v90:broadcastWatches();
    end;
end;
v35.batch = function(v93, v94)
    local v95 = v94.optimistic == nil and true or v94.optimistic;
    local l_removeOptimistic_0 = v94.removeOptimistic;
    local l_onWatchUpdated_0 = v94.onWatchUpdated;
    local function v104(v98)
        local l_data_0 = v93.data;
        local l_optimisticData_0 = v93.optimisticData;
        local l_v93_0 = v93;
        l_v93_0.txCount = l_v93_0.txCount + 1;
        if v98 then
            v93.optimisticData = v98;
            v93.data = v93.optimisticData;
        end;
        local v102;
        l_v93_0, v102 = pcall(v94.update, v94, v93);
        local l_v93_1 = v93;
        l_v93_1.txCount = l_v93_1.txCount - 1;
        v93.data = l_data_0;
        v93.optimisticData = l_optimisticData_0;
        if not l_v93_0 then
            error(v102);
        end;
    end;
    local v105 = l_Set_0.new();
    if l_onWatchUpdated_0 and v93.txCount == 0 then
        v93:broadcastWatches(l_Object_0.assign(table.clone(v94), {
            onWatchUpdated = function(_, v107)
                v105:add(v107);
                return false;
            end
        }));
    end;
    if typeof(v95) == "string" then
        v93.optimisticData = v93.optimisticData:addLayer(v95, v104);
    elseif v95 == false then
        v104(v93.data);
    else
        v104();
    end;
    if typeof(l_removeOptimistic_0) == "string" then
        v93.optimisticData = v93.optimisticData:removeLayer(l_removeOptimistic_0);
    end;
    if l_onWatchUpdated_0 and v105.size > 0 then
        v93:broadcastWatches(l_Object_0.assign(table.clone(v94), {
            onWatchUpdated = function(v108, v109, v110)
                local v111 = l_onWatchUpdated_0(v108, v109, v110);
                if v111 ~= false then
                    v105:delete(v109);
                end;
                return v111;
            end
        }));
        if v105.size > 0 then
            v105:forEach(function(v112)
                return v93.maybeBroadcastWatch:dirty(v112);
            end);
        end;
    else
        v93:broadcastWatches(v94);
    end;
end;
v35.performTransaction = function(v113, v114, v115)
    return v113:batch({
        update = function(_, ...)
            return v114(...);
        end, 
        optimistic = v115 or v115 ~= l_NULL_0
    });
end;
v35.transformDocument = function(v117, v118)
    if not v117.addTypename then
        return v118;
    else
        local v119 = v117.typenameDocumentCache:get(v118);
        if not v119 then
            v119 = l_addTypenameToDocument_0(v118);
            v117.typenameDocumentCache:set(v118, v119);
            v117.typenameDocumentCache:set(v119, v119);
        end;
        return v119;
    end;
end;
v35.broadcastWatches = function(v120, v121)
    if v120.txCount == 0 then
        v120.watches:forEach(function(v122)
            return v120:maybeBroadcastWatch(v122, v121);
        end);
    end;
end;
v35.broadcastWatch = function(v123, v124, v125)
    local l_lastDiff_0 = v124.lastDiff;
    local v127 = v123:diff({
        query = v124.query, 
        variables = v124.variables, 
        optimistic = v124.optimistic
    });
    if v125 then
        if v124.optimistic and typeof(v125.optimistic) == "string" then
            v127.fromOptimisticTransaction = true;
        end;
        local l_onWatchUpdated_1 = v125.onWatchUpdated;
        if l_onWatchUpdated_1 and l_onWatchUpdated_1(v123, v124, v127, l_lastDiff_0) == false then
            return ;
        end;
    end;
    if not (l_lastDiff_0 and v12(l_lastDiff_0.result, v127.result)) then
        v124.lastDiff = v127;
        v124:callback(v124.lastDiff, l_lastDiff_0);
    end;
end;
v9.InMemoryCache = v35;
return v9;
