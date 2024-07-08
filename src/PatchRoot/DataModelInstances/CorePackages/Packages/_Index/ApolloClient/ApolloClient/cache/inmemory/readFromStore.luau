local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local l_WeakMap_0 = v2.WeakMap;
local l_HttpService_0 = game:GetService("HttpService");
local l_NULL_0 = require(l_Parent_0.utilities).NULL;
local v10 = nil;
local v11 = {};
local _ = require(l_Parent_1.GraphQL);
local l_wrap_0 = require(l_Parent_0.optimism).wrap;
local v14 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v14.invariant;
local l_InvariantError_0 = v14.InvariantError;
local v17 = require(script.Parent.Parent.Parent.utilities);
local l_isField_0 = v17.isField;
local l_resultKeyNameFromField_0 = v17.resultKeyNameFromField;
local l_isReference_0 = v17.isReference;
local l_makeReference_0 = v17.makeReference;
local l_createFragmentMap_0 = v17.createFragmentMap;
local l_shouldInclude_0 = v17.shouldInclude;
local l_addTypenameToDocument_0 = v17.addTypenameToDocument;
local l_getDefaultValues_0 = v17.getDefaultValues;
local l_getFragmentDefinitions_0 = v17.getFragmentDefinitions;
local l_getMainDefinition_0 = v17.getMainDefinition;
local l_getQueryDefinition_0 = v17.getQueryDefinition;
local l_mergeDeepArray_0 = v17.mergeDeepArray;
local l_getFragmentFromSelection_0 = v17.getFragmentFromSelection;
local l_maybeDeepFreeze_0 = v17.maybeDeepFreeze;
local l_isNonNullObject_0 = v17.isNonNullObject;
local _ = v17.canUseWeakMap;
local _ = require(script.Parent.Parent.core.types.Cache);
local _ = require(script.Parent.types);
local v36 = require(script.Parent.entityStore);
local l_maybeDependOnExistenceOfEntity_0 = v36.maybeDependOnExistenceOfEntity;
local l_supportsResultCaching_0 = v36.supportsResultCaching;
local l_getTypenameFromStoreObject_0 = require(script.Parent.helpers).getTypenameFromStoreObject;
local _ = require(script.Parent.policies);
local l_MissingFieldError_0 = require(script.Parent.Parent.core.types.common).MissingFieldError;
local v42 = require(script.Parent["object-canon"]);
local l_canonicalStringify_0 = v42.canonicalStringify;
local l_ObjectCanon_0 = v42.ObjectCanon;
local function v47(v45, v46)
    return l_MissingFieldError_0.new(v45.message, l_Array_0.slice(v46.path), v46.query, v46.variables);
end;
local function _(v48)
    return {
        v48.selectionSet, 
        v48.objectOrReference, 
        v48.context, 
        v48.context.canonizeResults
    };
end;
local v50 = {};
v50.__index = v50;
v50.resetCanon = function(v51)
    v51.canon = l_ObjectCanon_0.new();
end;
local function v57(_, v53, v54, v55, v56)
    if not l_supportsResultCaching_0(v55.store) then
        return nil;
    else
        return v55.store:makeCacheKey(v53, not not l_isReference_0(v54) and v54.__ref or v54, v55.varString, v56);
    end;
end;
local function v63(_, v59)
    local l_field_0 = v59.field;
    local l_array_0 = v59.array;
    local l_context_0 = v59.context;
    if not l_supportsResultCaching_0(l_context_0.store) then
        return nil;
    else
        return l_context_0.store:makeCacheKey(l_field_0, l_array_0, l_context_0.varString);
    end;
end;
v50.new = function(v64)
    local v65 = setmetatable({}, v50);
    v65.knownResults = l_WeakMap_0.new();
    v65.config = l_Object_0.assign(table.clone(v64), {
        addTypename = v64.addTypename ~= false
    });
    v65.canon = v64.canon or l_ObjectCanon_0.new();
    v65.executeSelectionSet = l_wrap_0(function(_, v67)
        local l_canonizeResults_0 = v67.context.canonizeResults;
        local v69 = v65.executeSelectionSet:peek(table.unpack({
            v67.selectionSet, 
            v67.objectOrReference, 
            v67.context, 
            v67.context.canonizeResults; 
            [4] = not l_canonizeResults_0
        }));
        if v69 ~= nil then
            if not l_canonizeResults_0 then
                return v69;
            else
                return l_Object_0.assign(table.clone(v69), {
                    result = v65.canon:admit(v69.result)
                });
            end;
        else
            l_maybeDependOnExistenceOfEntity_0(v67.context.store, v67.enclosingRef.__ref);
            return v65:execSelectionSetImpl(v67);
        end;
    end, {
        max = v65.config.resultCacheMaxSize, 
        keyArgs = function(_, ...)
            local v71 = ...;
            return {
                v71.selectionSet, 
                v71.objectOrReference, 
                v71.context, 
                v71.context.canonizeResults
            };
        end, 
        makeCacheKey = v57
    }, v65);
    v65.executeSubSelectedArray = l_wrap_0(function(_, v73)
        l_maybeDependOnExistenceOfEntity_0(v73.context.store, v73.enclosingRef.__ref);
        return v65:execSubSelectedArrayImpl(v73);
    end, {
        max = v65.config.resultCacheMaxSize, 
        makeCacheKey = v63
    }, v65);
    return v65;
end;
v50.diffQueryAgainstStore = function(v74, v75)
    local l_store_0 = v75.store;
    local l_query_0 = v75.query;
    local l_rootId_0 = v75.rootId;
    local l_variables_0 = v75.variables;
    local l_returnPartialData_0 = v75.returnPartialData;
    local l_canonizeResults_1 = v75.canonizeResults;
    if l_rootId_0 == nil then
        l_rootId_0 = "ROOT_QUERY";
    end;
    if l_returnPartialData_0 == nil then
        l_returnPartialData_0 = true;
    end;
    if l_canonizeResults_1 == nil then
        l_canonizeResults_1 = true;
    end;
    local l_policies_0 = v74.config.cache.policies;
    l_variables_0 = l_Object_0.assign({}, l_getDefaultValues_0(l_getQueryDefinition_0(l_query_0)), l_variables_0);
    local v83 = l_makeReference_0(l_rootId_0);
    local v84 = v74:executeSelectionSet({
        selectionSet = l_getMainDefinition_0(l_query_0).selectionSet, 
        objectOrReference = v83, 
        enclosingRef = v83, 
        context = {
            store = l_store_0, 
            query = l_query_0, 
            policies = l_policies_0, 
            variables = l_variables_0, 
            varString = l_canonicalStringify_0(l_variables_0), 
            canonizeResults = l_canonizeResults_1, 
            fragmentMap = l_createFragmentMap_0(l_getFragmentDefinitions_0(l_query_0)), 
            path = {}
        }
    });
    local v85 = v84.missing and #v84.missing > 0;
    if not (not v85 or l_returnPartialData_0) then
        error(v84.missing[1]);
    end;
    return {
        result = v84.result, 
        missing = v84.missing, 
        complete = not v85
    };
end;
v50.isFresh = function(v86, v87, v88, v89, v90)
    if l_supportsResultCaching_0(v90.store) and v86.knownResults:get(v87) == v89 then
        local v91 = v86.executeSelectionSet:peek(v89, v88, v90, v86.canon:isKnown(v87));
        if v91 and v87 == v91.result then
            return true;
        end;
    end;
    return false;
end;
v50.execSelectionSetImpl = function(v92, v93)
    local l_selectionSet_0 = v93.selectionSet;
    local l_objectOrReference_0 = v93.objectOrReference;
    local l_enclosingRef_0 = v93.enclosingRef;
    local l_context_1 = v93.context;
    if (not l_objectOrReference_0.__ref or l_context_1.policies.rootTypenamesById[l_objectOrReference_0.__ref]) or l_context_1.store:has(l_objectOrReference_0.__ref) then
        local l_variables_1 = l_context_1.variables;
        local l_policies_1 = l_context_1.policies;
        local l_store_1 = l_context_1.store;
        local v101 = {};
        local v102 = {
            result = l_NULL_0
        };
        local v103 = l_store_1:getFieldValue(l_objectOrReference_0, "__typename");
        if not (not (v92.config.addTypename and type(v103) == "string") or l_policies_1.rootIdsByTypename[v103]) then
            table.insert(v101, {
                __typename = v103
            });
        end;
        local function _()
            if not v102.missing then
                v102.missing = {};
            end;
            return v102.missing;
        end;
        local _ = function(v105)
            if v105.missing then
                if not v102.missing then
                    v102.missing = {};
                end;
                local l_missing_0 = v102.missing;
                for _, v108 in v105.missing, nil, nil do
                    table.insert(l_missing_0, v108);
                end;
            end;
            return v105.result;
        end;
        local v110 = l_Set_0.new(l_selectionSet_0.selections);
        for _, v112 in v110, nil, nil do
            if l_shouldInclude_0(v112, l_variables_1) then
                if not l_isField_0(v112) then
                    local v113 = l_getFragmentFromSelection_0(v112, l_context_1.fragmentMap);
                    if not (not v113 or not l_policies_1:fragmentMatches(v113, v103)) then
                        l_Array_0.forEach(v113.selectionSet.selections, v110.add, v110);
                    end;
                else
                    local v114 = l_policies_1:readField({
                        fieldName = v112.name.value, 
                        field = v112, 
                        variables = l_context_1.variables, 
                        from = l_objectOrReference_0
                    }, l_context_1);
                    local v115 = l_resultKeyNameFromField_0(v112);
                    table.insert(l_context_1.path, v115);
                    if v114 == nil then
                        if not l_addTypenameToDocument_0:added(v112) then
                            if not v102.missing then
                                v102.missing = {};
                            end;
                            table.insert(v102.missing, v47(l_InvariantError_0.new(("Can't find field '%s' on %s"):format(v112.name.value, not not l_isReference_0(l_objectOrReference_0) and l_objectOrReference_0.__ref .. " object" or "object " .. l_HttpService_0:JSONEncode(l_objectOrReference_0))), l_context_1));
                        end;
                    elseif not l_Array_0.isArray(v114) then
                        if v112.selectionSet then
                            if v114 ~= l_NULL_0 then
                                local v116 = v92:executeSelectionSet({
                                    selectionSet = v112.selectionSet, 
                                    objectOrReference = v114, 
                                    enclosingRef = not not l_isReference_0(v114) and v114 or l_enclosingRef_0, 
                                    context = l_context_1
                                });
                                if v116.missing then
                                    if not v102.missing then
                                        v102.missing = {};
                                    end;
                                    local l_missing_1 = v102.missing;
                                    for _, v119 in v116.missing, nil, nil do
                                        table.insert(l_missing_1, v119);
                                    end;
                                end;
                                v114 = v116.result;
                            end;
                        elseif l_context_1.canonizeResults then
                            v114 = v92.canon:pass(v114);
                        end;
                    else
                        local v120 = v92:executeSubSelectedArray({
                            field = v112, 
                            array = v114, 
                            enclosingRef = l_enclosingRef_0, 
                            context = l_context_1
                        });
                        if v120.missing then
                            if not v102.missing then
                                v102.missing = {};
                            end;
                            local l_missing_2 = v102.missing;
                            for _, v123 in v120.missing, nil, nil do
                                table.insert(l_missing_2, v123);
                            end;
                        end;
                        v114 = v120.result;
                    end;
                    if v114 ~= nil then
                        table.insert(v101, {
                            [v115] = v114
                        });
                    end;
                    local v124 = table.remove(l_context_1.path) == v115;
                    if not v124 then
                        l_invariant_0(v124);
                    end;
                end;
            end;
        end;
        local v125 = l_mergeDeepArray_0(v101);
        if not l_context_1.canonizeResults then
            v102.result = l_maybeDeepFreeze_0(v125);
        else
            v102.result = v92.canon:admit(v125);
        end;
        v92.knownResults:set(v102.result, l_selectionSet_0);
        return v102;
    else
        return {
            result = v92.canon.empty, 
            missing = {
                v47(l_InvariantError_0.new(("Dangling reference to missing %s object"):format(l_objectOrReference_0.__ref)), l_context_1)
            }
        };
    end;
end;
v50.execSubSelectedArrayImpl = function(v126, v127)
    local l_field_1 = v127.field;
    local l_array_1 = v127.array;
    local l_enclosingRef_1 = v127.enclosingRef;
    local l_context_2 = v127.context;
    local v132 = nil;
    local function v137(v133, v134)
        if v133.missing then
            v132 = v132 or {};
            local l_missing_3 = v133.missing;
            for v136 = 1, #l_missing_3 do
                table.insert(v132, l_missing_3[v136]);
            end;
        end;
        l_invariant_0(table.remove(l_context_2.path) == v134);
        return v133.result;
    end;
    if l_field_1.selectionSet then
        l_array_1 = l_Array_0.filter(l_array_1, function(v138)
            return l_context_2.store:canRead(v138);
        end);
    end;
    l_array_1 = l_Array_0.map(l_array_1, function(v139, v140)
        if v139 == l_NULL_0 then
            return l_NULL_0;
        else
            table.insert(l_context_2.path, v140);
            if l_Array_0.isArray(v139) and #v139 > 0 then
                return (v137(v126:executeSubSelectedArray({
                    field = l_field_1, 
                    array = v139, 
                    enclosingRef = l_enclosingRef_1, 
                    context = l_context_2
                }), v140));
            elseif not l_Boolean_0.toJSBoolean(l_field_1.selectionSet) then
                if _G.__DEV__ then
                    v10(l_context_2.store, l_field_1, v139);
                end;
                local v141 = table.remove(l_context_2.path) == v140;
                if not v141 then
                    l_invariant_0(v141);
                end;
                return v139;
            else
                return (v137(v126:executeSelectionSet({
                    selectionSet = l_field_1.selectionSet, 
                    objectOrReference = v139, 
                    enclosingRef = not not l_isReference_0(v139) and v139 or l_enclosingRef_1, 
                    context = l_context_2
                }), v140));
            end;
        end;
    end);
    return {
        result = if not l_context_2.canonizeResults then l_array_1 else v126.canon:admit(l_array_1), 
        missing = v132
    };
end;
v11.StoreReader = v50;
v10 = function(v142, v143, v144)
    if not v143.selectionSet then
        local v145 = l_Set_0.new({
            v144
        });
        for _, v147 in v145, nil, nil do
            if l_isNonNullObject_0(v147) then
                l_invariant_0(not l_isReference_0(v147), ("Missing selection set for object of type %s returned for query field %s"):format(l_getTypenameFromStoreObject_0(v142, v147) or "nil", v143.name.value));
                l_Array_0.forEach(l_Object_0.values(v147), v145.add, v145);
            end;
        end;
    end;
end;
return v11;
