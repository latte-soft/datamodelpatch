local l___DEV___0 = _G.__DEV__;
local v1 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_Object_0 = v4.Object;
local l_Map_0 = v4.Map;
local l_Set_0 = v4.Set;
local l_Array_0 = v4.Array;
local l_NULL_0 = require(l_Parent_0.utilities).NULL;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Parent_1.GraphQL);
local v13 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v13.invariant;
local l_InvariantError_0 = v13.InvariantError;
local v16 = require(l_Parent_0.jsutils.equal);
local v17 = require(l_Parent_0.luaUtils.objectKeysForEach);
local v18 = require(l_Parent_0.utilities);
local l_createFragmentMap_0 = v18.createFragmentMap;
local l_getFragmentFromSelection_0 = v18.getFragmentFromSelection;
local l_getDefaultValues_0 = v18.getDefaultValues;
local l_getFragmentDefinitions_0 = v18.getFragmentDefinitions;
local l_getOperationDefinition_0 = v18.getOperationDefinition;
local l_getTypenameFromResult_0 = v18.getTypenameFromResult;
local l_makeReference_0 = v18.makeReference;
local l_isField_0 = v18.isField;
local l_resultKeyNameFromField_0 = v18.resultKeyNameFromField;
local l_isReference_0 = v18.isReference;
local l_shouldInclude_0 = v18.shouldInclude;
local l_cloneDeep_0 = v18.cloneDeep;
local l_addTypenameToDocument_0 = v18.addTypenameToDocument;
local _ = require(script.Parent.types);
local v33 = require(script.Parent.helpers);
local l_makeProcessedFieldsMerger_0 = v33.makeProcessedFieldsMerger;
local l_fieldNameFromStoreName_0 = v33.fieldNameFromStoreName;
local l_storeValueIsStoreObject_0 = v33.storeValueIsStoreObject;
local _ = require(script.Parent.entityStore);
local _ = require(script.Parent.Parent.core.types.Cache);
local l_canonicalStringify_0 = require(script.Parent["object-canon"]).canonicalStringify;
local _ = require(script.Parent.writeToStore_types);
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = {};
v46.__index = v46;
v46.new = function(v47, v48)
    local v49 = setmetatable({}, v46);
    v49.cache = v47;
    v49.reader = v48;
    return v49;
end;
v46.writeToStore = function(v50, v51, v52)
    local l_query_0 = v52.query;
    local l_result_0 = v52.result;
    local l_dataId_0 = v52.dataId;
    local l_variables_0 = v52.variables;
    local l_overwrite_0 = v52.overwrite;
    local v58 = l_getOperationDefinition_0(l_query_0);
    local v59 = l_makeProcessedFieldsMerger_0();
    l_variables_0 = l_Object_0.assign(l_getDefaultValues_0(v58), l_variables_0);
    local v62 = {
        store = v51, 
        written = {}, 
        merge = function(v60, v61)
            return v59:merge(v60, v61);
        end, 
        variables = l_variables_0, 
        varString = l_canonicalStringify_0(l_variables_0), 
        fragmentMap = l_createFragmentMap_0(l_getFragmentDefinitions_0(l_query_0)), 
        overwrite = l_overwrite_0 or false, 
        incomingById = l_Map_0.new(nil), 
        clientOnly = false
    };
    local v63 = v50:processSelectionSet({
        result = l_result_0 or {}, 
        dataId = l_dataId_0, 
        selectionSet = v58.selectionSet, 
        mergeTree = {
            map = l_Map_0.new(nil)
        }, 
        context = v62
    });
    if not l_isReference_0(v63) then
        error(l_InvariantError_0.new(("Could not identify object %s"):format(l_HttpService_0:JSONEncode(l_result_0))));
    end;
    v62.incomingById:forEach(function(v64, v65)
        local l_fields_0 = v64.fields;
        local l_mergeTree_0 = v64.mergeTree;
        local l_selections_0 = v64.selections;
        local v69 = l_makeReference_0(v65);
        if l_mergeTree_0.map.size > 0 then
            local v70 = v50:applyMerges(l_mergeTree_0, v69, l_fields_0, v62);
            if not l_isReference_0(v70) then
                l_fields_0 = v70;
            else
                return ;
            end;
        end;
        if not (not l___DEV___0 or v62.overwrite) then
            local v71 = nil;
            do
                local l_v71_0 = v71;
                local function _(v73)
                    return l_v71_0:has(l_fieldNameFromStoreName_0(v73));
                end;
                l_v71_0 = l_Set_0.new();
                l_selections_0:forEach(function(v75)
                    if not (not l_isField_0(v75) or not v75.selectionSet) then
                        l_v71_0:add(v75.name.value);
                    end;
                end);
                local function _(v76)
                    local v77 = l_mergeTree_0.map:get(v76);
                    local v78 = false;
                    if v77 ~= nil then
                        v78 = false;
                        if v77.info ~= nil then
                            v78 = v77.info.merge ~= nil;
                        end;
                    end;
                    return v78;
                end;
                v17(l_fields_0, function(v80)
                    if l_v71_0:has(l_fieldNameFromStoreName_0(v80)) then
                        local v81 = l_mergeTree_0.map:get(v80);
                        local v82 = false;
                        if v81 ~= nil then
                            v82 = false;
                            if v81.info ~= nil then
                                v82 = v81.info.merge ~= nil;
                            end;
                        end;
                        if not v82 then
                            v41(v69, l_fields_0, v80, v62.store);
                        end;
                    end;
                end);
            end;
        end;
        v51:merge(v65, l_fields_0);
    end);
    v51:retain(v63.__ref);
    return v63;
end;
v46.processSelectionSet = function(v83, v84)
    local l_dataId_1 = v84.dataId;
    local l_result_1 = v84.result;
    local l_selectionSet_0 = v84.selectionSet;
    local l_context_0 = v84.context;
    local l_mergeTree_1 = v84.mergeTree;
    local l_policies_0 = v83.cache.policies;
    local v91, v92 = table.unpack(l_policies_0:identify(l_result_1, l_selectionSet_0, l_context_0.fragmentMap), 1, 2);
    l_dataId_1 = l_dataId_1 or v91;
    if type(l_dataId_1) == "string" then
        local v93 = nil;
        if l_context_0.written[l_dataId_1] ~= nil then
            v93 = l_context_0.written[l_dataId_1];
        else
            v93 = {};
            l_context_0.written[l_dataId_1] = v93;
        end;
        local v94 = l_makeReference_0(l_dataId_1);
        if l_Array_0.indexOf(v93, l_selectionSet_0) >= 1 then
            return v94;
        else
            table.insert(v93, l_selectionSet_0);
            if not (not (v83.reader ~= nil) or not v83.reader:isFresh(l_result_1, v94, l_selectionSet_0, l_context_0)) then
                return v94;
            end;
        end;
    end;
    local v95 = {};
    if v92 ~= nil then
        v95 = l_context_0.merge(v95, v92);
    end;
    local v96 = (l_dataId_1 and l_policies_0.rootTypenamesById[l_dataId_1] or l_getTypenameFromResult_0(l_result_1, l_selectionSet_0, l_context_0.fragmentMap)) or l_dataId_1 and l_context_0.store:get(l_dataId_1, "__typename");
    if type(v96) == "string" then
        v95.__typename = v96;
    end;
    local v97 = l_Set_0.new(l_selectionSet_0.selections);
    for _, v99 in v97, nil, nil do
        if l_shouldInclude_0(v99, l_context_0.variables) then
            if not l_isField_0(v99) then
                local v100 = l_getFragmentFromSelection_0(v99, l_context_0.fragmentMap);
                if not (not v100 or not l_policies_0:fragmentMatches(v100, v96, l_result_1, l_context_0.variables)) then
                    l_Array_0.forEach(v100.selectionSet.selections, v97.add, v97);
                end;
            else
                local v101 = l_result_1[l_resultKeyNameFromField_0(v99)];
                local l_clientOnly_0 = l_context_0.clientOnly;
                l_context_0.clientOnly = l_clientOnly_0 or v99.directives and l_Array_0.some(v99.directives, function(v103)
                    return v103.name.value == "client";
                end);
                if v101 ~= nil then
                    local v104 = l_policies_0:getStoreFieldName({
                        typename = v96, 
                        fieldName = v99.name.value, 
                        field = v99, 
                        variables = l_context_0.variables
                    });
                    local v105 = v42(l_mergeTree_1, v104);
                    local v106 = v83:processFieldValue(v101, v99, l_context_0, v105);
                    local v107 = nil;
                    if v99.selectionSet ~= nil then
                        v107 = l_context_0.store:getFieldValue(v106, "__typename");
                        if not (v107 or not l_isReference_0(v106)) then
                            local v108 = l_context_0.incomingById:get(v106.__ref);
                            v107 = if v108 ~= nil then v108.fields.__typename else nil;
                        end;
                    end;
                    local v109 = l_policies_0:getMergeFunction(v96, v99.name.value, v107);
                    if v109 ~= nil then
                        v105.info = {
                            field = v99, 
                            typename = v96, 
                            merge = v109
                        };
                    else
                        v43(l_mergeTree_1, v104);
                    end;
                    v95 = l_context_0.merge(v95, {
                        [v104] = v106
                    });
                elseif not (l_context_0.clientOnly or l_addTypenameToDocument_0:added(v99)) then
                    l_invariant_0.error((string.sub(("Missing field '%s' while writing result %s"):format(l_resultKeyNameFromField_0(v99), l_HttpService_0:JSONEncode(l_result_1)), 1, 1000)));
                end;
                l_context_0.clientOnly = l_clientOnly_0;
            end;
        end;
    end;
    if type(l_dataId_1) == "string" then
        local v110 = l_context_0.incomingById:get(l_dataId_1);
        if not v110 then
            l_context_0.incomingById:set(l_dataId_1, {
                fields = v95, 
                mergeTree = l_mergeTree_1, 
                selections = v97
            });
        else
            v110.fields = l_context_0.merge(v110.fields, v95);
            v110.mergeTree = v44(v110.mergeTree, l_mergeTree_1);
            v110.selections:forEach(v97.add, v97);
            v110.selections = v97;
        end;
        return l_makeReference_0(l_dataId_1);
    else
        return v95;
    end;
end;
v46.processFieldValue = function(v111, v112, v113, v114, v115)
    if not v113.selectionSet or v112 == l_NULL_0 then
        if not l___DEV___0 then
            return v112;
        else
            return l_cloneDeep_0(v112);
        end;
    elseif not l_Array_0.isArray(v112) then
        return v111:processSelectionSet({
            result = v112, 
            selectionSet = v113.selectionSet, 
            context = v114, 
            mergeTree = v115
        });
    else
        return l_Array_0.map(v112, function(v116, v117)
            local v118 = v111:processFieldValue(v116, v113, v114, v42(v115, v117));
            v43(v115, v117);
            return v118;
        end);
    end;
end;
v46.applyMerges = function(v119, v120, v121, v122, v123, v124)
    if not (not (v120.map.size > 0) or l_isReference_0(v122)) then
        local v125 = if not (not l_Array_0.isArray(v122) and (l_isReference_0(v121) or l_storeValueIsStoreObject_0(v121))) then nil else v121;
        local l_v122_0 = v122;
        if not (not (v125 ~= nil) or v124) then
            v124 = if not l_isReference_0(v125) then {
                v125
            } else {
                v125.__ref
            };
        end;
        local v127 = nil;
        local function _(v128, v129)
            if not l_Array_0.isArray(v128) then
                return v123.store:getFieldValue(v128, (tostring(v129)));
            elseif typeof(v129) == "number" then
                return v128[v129];
            else
                return nil;
            end;
        end;
        do
            local l_v127_0 = v127;
            v120.map:forEach(function(v132, v133)
                local l_v125_0 = v125;
                local v135 = if not l_Array_0.isArray(l_v125_0) then v123.store:getFieldValue(l_v125_0, (tostring(v133))) else if typeof(v133) == "number" then l_v125_0[v133] else nil;
                local l_l_v122_0_0 = l_v122_0;
                l_v125_0 = if not l_Array_0.isArray(l_l_v122_0_0) then v123.store:getFieldValue(l_l_v122_0_0, (tostring(v133))) else if typeof(v133) == "number" then l_l_v122_0_0[v133] else nil;
                if l_v125_0 == nil then
                    return ;
                else
                    if v124 ~= nil then
                        table.insert(v124, v133);
                    end;
                    l_l_v122_0_0 = v119:applyMerges(v132, v135, l_v125_0, v123, v124);
                    if l_l_v122_0_0 ~= l_v125_0 then
                        l_v127_0 = l_v127_0 or l_Map_0.new(nil);
                        l_v127_0:set(v133, l_l_v122_0_0);
                    end;
                    if v124 ~= nil then
                        l_invariant_0(table.remove(v124, #v124) == v133);
                    end;
                    return ;
                end;
            end);
            if l_v127_0 ~= nil then
                v122 = table.clone(l_v122_0);
                l_v127_0:forEach(function(v137, v138)
                    v122[v138] = v137;
                end);
            end;
        end;
    end;
    if not v120.info then
        return v122;
    else
        return v119.cache.policies:runMergeFunction(v121, v122, v120.info, v123, not not l_Boolean_0.toJSBoolean(v124) and v123.store:getStorage(table.unpack(v124)) or nil);
    end;
end;
v1.StoreWriter = v46;
local v139 = {};
v42 = function(v140, v141)
    local l_map_0 = v140.map;
    if not l_map_0:has(v141) then
        l_map_0:set(v141, table.remove(v139, #v139) or {
            map = l_Map_0.new(nil)
        });
    end;
    return (l_map_0:get(v141));
end;
v44 = function(v143, v144)
    if (v143 ~= v144 and v144 ~= nil) and not v45(v144) then
        if v143 ~= nil and not v45(v143) then
            local v145 = if not not v143.info and v144.info then l_Object_0.assign(table.clone(v143.info), v144.info) else v143.info or v144.info;
            local v146 = if v143.map.size > 0 then v144.map.size else v143.map.size;
            local v147 = {
                info = v145, 
                map = if v146 > 0 then l_Map_0.new() else if v143.map.size > 0 then v143.map else v144.map
            };
            if v146 > 0 then
                local v148 = l_Set_0.new(v144.map:keys());
                v143.map:forEach(function(v149, v150)
                    v147.map:set(v150, v44(v149, v144.map:get(v150)));
                    v148:delete(v150);
                end);
                v148:forEach(function(v151)
                    v147.map:set(v151, v44(v144.map:get(v151), v143.map:get(v151)));
                end);
            end;
            return v147;
        else
            return v144;
        end;
    else
        return v143;
    end;
end;
v45 = function(v152)
    return not v152 or not (v152.info or v152.map.size > 0);
end;
v43 = function(v153, v154)
    local l_map_1 = v153.map;
    local v156 = l_map_1:get(v154);
    if not (not (v156 ~= nil) or not v45(v156)) then
        table.insert(v139, v156);
        l_map_1:delete(v154);
    end;
end;
local v157 = l_Set_0.new();
v41 = function(v158, v159, v160, v161)
    local function _(v162)
        local v163 = v161:getFieldValue(v162, v160);
        local v164 = false;
        if typeof(v163) == "table" then
            v164 = v163;
        end;
        return v164;
    end;
    local v166 = v161:getFieldValue(v158, v160);
    local v167 = false;
    if typeof(v166) == "table" then
        v167 = v166;
    end;
    if v167 then
        local v168 = v161:getFieldValue(v159, v160);
        v166 = false;
        if typeof(v168) == "table" then
            v166 = v168;
        end;
        if v166 then
            if not l_isReference_0(v167) then
                if not v16(v167, v166) then
                    if not l_Array_0.every(l_Object_0.keys(v167), function(v169)
                        return v161:getFieldValue(v166, v169) ~= nil;
                    end) then
                        v168 = v161:getFieldValue(v158, "__typename");
                        local v170 = not not l_Boolean_0.toJSBoolean(v168) and v168 or v161:getFieldValue(v159, "__typename");
                        local v171 = l_fieldNameFromStoreName_0(v160);
                        local v172 = ("%s.%s"):format(v170, v171);
                        if not v157:has(v172) then
                            v157:add(v172);
                            local v173 = {};
                            if not (l_Array_0.isArray(v167) or l_Array_0.isArray(v166)) then
                                l_Array_0.forEach({
                                    v167, 
                                    v166
                                }, function(v174)
                                    local v175 = v161:getFieldValue(v174, "__typename");
                                    if not (not (typeof(v175) == "string") or l_Array_0.includes(v173, v175)) then
                                        table.insert(v173, v175);
                                    end;
                                end);
                            end;
                            l_invariant_0.warn(("Cache data may be lost when replacing the %s field of a %s object.\n\n\tTo address this problem (which is not a bug in Apollo Client), %sdefine a custom merge function for the %s field, so InMemoryCache can safely merge these objects:\n\n\t  existing: %s\n\t  incoming: %s\n\n\tFor more information about these options, please refer to the documentation:\n\n\t  * Ensuring entity objects have IDs: https://go.apollo.dev/c/generating-unique-identifiers\n\t  * Defining custom merge functions: https://go.apollo.dev/c/merging-non-normalized-objects\n\t"):format(v171, v170, not l_Boolean_0.toJSBoolean(#v173) and "" or "either ensure all objects of type " .. l_Array_0.join(v173, " and ") .. " have an ID or a custom merge function, or ", v172, string.sub(l_HttpService_0:JSONEncode(v167), 1, 1000), (string.sub(l_HttpService_0:JSONEncode(v166), 1, 1000))));
                            return ;
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
return v1;
