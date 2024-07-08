local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v7 = require(l_Parent_1.Promise);
local l_NULL_0 = require(l_Parent_0.utilities.globals.null).NULL;
local v9 = {};
local v10 = require(l_Parent_1.GraphQL);
local l_visit_0 = v10.visit;
local l_BREAK_0 = v10.BREAK;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(script.Parent.Parent.cache);
local v15 = require(script.Parent.Parent.utilities);
local l_argumentsObjectFromField_0 = v15.argumentsObjectFromField;
local l_buildQueryFromSelectionSet_0 = v15.buildQueryFromSelectionSet;
local l_createFragmentMap_0 = v15.createFragmentMap;
local l_getFragmentDefinitions_0 = v15.getFragmentDefinitions;
local l_getMainDefinition_0 = v15.getMainDefinition;
local l_hasDirectives_0 = v15.hasDirectives;
local l_isField_0 = v15.isField;
local l_isInlineFragment_0 = v15.isInlineFragment;
local l_mergeDeep_0 = v15.mergeDeep;
local l_mergeDeepArray_0 = v15.mergeDeepArray;
local l_removeClientSetsFromDocument_0 = v15.removeClientSetsFromDocument;
local l_resultKeyNameFromField_0 = v15.resultKeyNameFromField;
local l_shouldInclude_0 = v15.shouldInclude;
local _ = require(script.Parent.ApolloClient_types);
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.link.core);
local l_cacheSlot_0 = require(script.Parent.Parent.cache).cacheSlot;
local v33 = {};
v33.__index = v33;
v33.new = function(v34)
    local v35 = setmetatable({}, v33);
    local l_cache_0 = v34.cache;
    local l_client_0 = v34.client;
    local l_resolvers_0 = v34.resolvers;
    local l_fragmentMatcher_0 = v34.fragmentMatcher;
    v35.cache = l_cache_0;
    if l_client_0 ~= nil then
        v35.client = l_client_0;
    end;
    if l_resolvers_0 ~= nil then
        v35:addResolvers(l_resolvers_0);
    end;
    if l_fragmentMatcher_0 ~= nil then
        v35:setFragmentMatcher(l_fragmentMatcher_0);
    end;
    return v35;
end;
v33.addResolvers = function(v40, v41)
    v40.resolvers = not not l_Boolean_0.toJSBoolean(v40.resolvers) and v40.resolvers or {};
    if not l_Array_0.isArray(v41) then
        v40.resolvers = l_mergeDeep_0(v40.resolvers, v41);
        return ;
    else
        l_Array_0.forEach(v41, function(v42)
            v40.resolvers = l_mergeDeep_0(v40.resolvers, v42);
        end);
        return ;
    end;
end;
v33.setResolvers = function(v43, v44)
    v43.resolvers = {};
    v43:addResolvers(v44);
end;
v33.getResolvers = function(v45)
    return not not l_Boolean_0.toJSBoolean(v45.resolvers) and v45.resolvers or {};
end;
v33.runResolvers = function(v46, v47)
    local l_document_0 = v47.document;
    local l_remoteResult_0 = v47.remoteResult;
    local l_context_0 = v47.context;
    local l_variables_0 = v47.variables;
    local l_onlyRunForcedResolvers_0 = v47.onlyRunForcedResolvers;
    if v47.onlyRunForcedResolvers == nil then
        l_onlyRunForcedResolvers_0 = false;
    end;
    if not l_Boolean_0.toJSBoolean(l_document_0) then
        return v7.resolve(l_remoteResult_0);
    else
        return v46:resolveDocument(l_document_0, l_remoteResult_0.data, l_context_0, l_variables_0, v46.fragmentMatcher, l_onlyRunForcedResolvers_0):andThen(function(v53)
            return l_Object_0.assign({}, l_remoteResult_0, {
                data = v53.result
            });
        end);
    end;
end;
v33.setFragmentMatcher = function(v54, v55)
    v54.fragmentMatcher = v55;
end;
v33.getFragmentMatcher = function(v56)
    return v56.fragmentMatcher;
end;
v33.clientQuery = function(v57, v58)
    if not l_hasDirectives_0({
        "client"
    }, v58) or not l_Boolean_0.toJSBoolean(v57.resolvers) then
        return l_NULL_0;
    else
        return v58;
    end;
end;
v33.serverQuery = function(_, v60)
    return l_removeClientSetsFromDocument_0(v60);
end;
v33.prepareContext = function(v61, v62)
    local l_cache_1 = v61.cache;
    return l_Object_0.assign({}, v62, {
        cache = l_cache_1, 
        getCacheKey = function(_, v65)
            return l_cache_1:identify(v65);
        end
    });
end;
v33.addExportedVariables = function(v66, v67, v68, v69)
    if v68 == nil then
        v68 = {};
    end;
    if v69 == nil then
        v69 = {};
    end;
    if not l_Boolean_0.toJSBoolean(v67) then
        return v7.resolve(l_Object_0.assign({}, v68));
    else
        local v70 = v66:buildRootValueFromCache(v67, v68);
        return v66:resolveDocument(v67, not not l_Boolean_0.toJSBoolean(v70) and v70 or {}, v66:prepareContext(v69), v68):andThen(function(v71)
            return l_Object_0.assign({}, v68, v71.exportedVariables);
        end);
    end;
end;
v33.shouldForceResolvers = function(_, v73)
    local v74 = false;
    l_visit_0(v73, {
        Directive = {
            enter = function(_, v76)
                if not (not (v76.name.value == "client") or not l_Boolean_0.toJSBoolean(v76.arguments)) then
                    v74 = l_Array_0.some(v76.arguments, function(v77)
                        local v78 = false;
                        if v77.name.value == "always" then
                            v78 = false;
                            if v77.value.kind == "BooleanValue" then
                                v78 = v77.value.value == true;
                            end;
                        end;
                        return v78;
                    end);
                    if v74 then
                        return l_BREAK_0;
                    end;
                end;
                return nil;
            end
        }
    });
    return v74;
end;
v33.buildRootValueFromCache = function(v79, v80, v81)
    return v79.cache:diff({
        query = l_buildQueryFromSelectionSet_0(v80), 
        variables = v81, 
        returnPartialData = true, 
        optimistic = false
    }).result;
end;
v33.resolveDocument = function(v82, v83, v84, v85, v86, v87, v88)
    if v85 == nil then
        v85 = {};
    end;
    if v86 == nil then
        v86 = {};
    end;
    if v87 == nil then
        v87 = function()
            return true;
        end;
    end;
    if v88 == nil then
        v88 = false;
    end;
    local v89 = l_getMainDefinition_0(v83);
    local v90 = l_createFragmentMap_0((l_getFragmentDefinitions_0(v83)));
    local l_operation_0 = v89.operation;
    local _ = nil;
    local v93 = {
        fragmentMap = v90, 
        context = l_Object_0.assign({}, v85, {
            cache = v82.cache, 
            client = v82.client
        }), 
        variables = v86, 
        fragmentMatcher = v87, 
        defaultOperationType = not l_Boolean_0.toJSBoolean(l_operation_0) and "Query" or string.upper((string.sub(l_operation_0, 1, 1))) .. l_String_0.slice(l_operation_0, 2), 
        exportedVariables = {}, 
        onlyRunForcedResolvers = v88
    };
    return v82:resolveSelectionSet(v89.selectionSet, v84, v93):andThen(function(v94)
        return {
            result = v94, 
            exportedVariables = v93.exportedVariables
        };
    end);
end;
v33.resolveSelectionSet = function(v95, v96, v97, v98)
    local l_fragmentMap_0 = v98.fragmentMap;
    local l_context_1 = v98.context;
    local l_variables_1 = v98.variables;
    local v102 = {
        v97
    };
    return v7.all(l_Array_0.map(v96.selections, function(v103)
        if l_Boolean_0.toJSBoolean(l_shouldInclude_0(v103, l_variables_1)) then
            if not l_isField_0(v103) then
                local v104 = nil;
                if not l_isInlineFragment_0(v103) then
                    v104 = l_fragmentMap_0[v103.name.value];
                    l_invariant_0(v104, ("No fragment named %s"):format(v103.name.value));
                else
                    v104 = v103;
                end;
                if not (v104 and v104.typeCondition ~= nil) or not l_Boolean_0.toJSBoolean(v98:fragmentMatcher(v97, v104.typeCondition.name.value, l_context_1)) then
                    return v7.resolve(nil);
                else
                    return v95:resolveSelectionSet(v104.selectionSet, v97, v98):andThen(function(v105)
                        table.insert(v102, v105);
                    end);
                end;
            else
                return v95:resolveField(v103, v97, v98):andThen(function(v106)
                    if typeof(v106) ~= "nil" then
                        table.insert(v102, {
                            [l_resultKeyNameFromField_0(v103)] = v106
                        });
                    end;
                end);
            end;
        else
            return v7.resolve(nil);
        end;
    end)):andThen(function()
        return l_mergeDeepArray_0(v102);
    end);
end;
v33.resolveField = function(v107, v108, v109, v110)
    local l_variables_2 = v110.variables;
    local l_value_0 = v108.name.value;
    local v113 = l_resultKeyNameFromField_0(v108);
    local v114 = l_value_0 ~= v113;
    local v115 = not not l_Boolean_0.toJSBoolean(v109[v113]) and v109[v113] or v109[l_value_0];
    local v116 = v7.resolve(v115);
    if not (v110.onlyRunForcedResolvers and not v107:shouldForceResolvers(v108)) then
        local v117 = not not l_Boolean_0.toJSBoolean(v109.__typename) and v109.__typename or v110.defaultOperationType;
        local v118 = nil;
        v118 = if not l_Boolean_0.toJSBoolean(v107.resolvers) then v107.resolvers else v107.resolvers[tostring(v117)];
        if l_Boolean_0.toJSBoolean(v118) then
            local v119 = v118[if not v114 then v113 else l_value_0];
            if l_Boolean_0.toJSBoolean(v119) then
                v116 = v7.resolve(l_cacheSlot_0:withValue(v107.cache, v119, {
                    v109, 
                    l_argumentsObjectFromField_0(v108, l_variables_2), 
                    v110.context, 
                    {
                        field = v108, 
                        fragmentMap = v110.fragmentMap
                    }
                }));
            end;
        end;
    end;
    return v116:andThen(function(v120)
        if v120 == nil then
            v120 = v115;
        end;
        if v108.directives ~= nil then
            l_Array_0.forEach(v108.directives, function(v121)
                if not (not (v121.name.value == "export") or not l_Boolean_0.toJSBoolean(v121.arguments)) then
                    l_Array_0.forEach(v121.arguments, function(v122)
                        if v122.name.value == "as" and v122.value.kind == "StringValue" then
                            v110.exportedVariables[v122.value.value] = v120;
                        end;
                    end);
                end;
            end);
        end;
        if l_Boolean_0.toJSBoolean(v108.selectionSet) then
            if not (v120 ~= nil) or v120 == l_NULL_0 then
                return v120;
            elseif not l_Array_0.isArray(v120) then
                if not l_Boolean_0.toJSBoolean(v108.selectionSet) then
                    return nil;
                else
                    return v107:resolveSelectionSet(v108.selectionSet, v120, v110);
                end;
            else
                return v107:resolveSubSelectedArray(v108, v120, v110);
            end;
        else
            return v120;
        end;
    end);
end;
v33.resolveSubSelectedArray = function(v123, v124, v125, v126)
    return v7.all(l_Array_0.map(v125, function(v127)
        if v127 == l_NULL_0 then
            return l_NULL_0;
        elseif not l_Array_0.isArray(v127) then
            if not l_Boolean_0.toJSBoolean(v124.selectionSet) then
                return nil;
            else
                return v123:resolveSelectionSet(v124.selectionSet, v127, v126);
            end;
        else
            return v123:resolveSubSelectedArray(v124, v127, v126);
        end;
    end));
end;
v9.LocalState = v33;
return v9;
