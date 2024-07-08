local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_Map_0 = v3.Map;
local v8 = require(l_Parent_0.luaUtils.isCallable);
local v9 = require(l_Parent_0.luaUtils.objectKeysForEach);
local v10 = require(l_Parent_1.LuauRegExp);
local v11 = {};
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local _ = require(l_Parent_1.GraphQL);
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local v20 = require(l_Parent_0.jsutils.invariant);
local l_invariant_0 = v20.invariant;
local l_InvariantError_0 = v20.InvariantError;
local v23 = require(script.Parent.Parent.Parent.utilities);
local l_getFragmentFromSelection_0 = v23.getFragmentFromSelection;
local l_isField_0 = v23.isField;
local l_getTypenameFromResult_0 = v23.getTypenameFromResult;
local l_storeKeyNameFromField_0 = v23.storeKeyNameFromField;
local l_argumentsObjectFromField_0 = v23.argumentsObjectFromField;
local l_isReference_0 = v23.isReference;
local l_getStoreKeyName_0 = v23.getStoreKeyName;
local l_canUseWeakMap_0 = v23.canUseWeakMap;
local l_isNonNullObject_0 = v23.isNonNullObject;
local l_stringifyForDisplay_0 = v23.stringifyForDisplay;
local v34 = require(script.Parent.helpers);
local v35 = require(l_Parent_0.luaUtils.hasOwnProperty);
local l_fieldNameFromStoreName_0 = v34.fieldNameFromStoreName;
local l_storeValueIsStoreObject_0 = v34.storeValueIsStoreObject;
local l_selectionSetMatchesResult_0 = v34.selectionSetMatchesResult;
local l_TypeOrFieldNameRegExp_0 = v34.TypeOrFieldNameRegExp;
local l_cacheSlot_0 = require(script.Parent.reactiveVars).cacheSlot;
local _ = require(script.Parent.Parent.core.types.common);
local _ = require(script.Parent.writeToStore_types);
l_getStoreKeyName_0:setStringify(require(script.Parent["object-canon"]).canonicalStringify);
local _ = require(script.Parent.policies_types);
local function _(v44)
    if v44.args ~= nil then
        return v44.args;
    elseif not v44.field then
        return nil;
    else
        return (l_argumentsObjectFromField_0(v44.field, v44.variables));
    end;
end;
local function v53(_, v47, v48)
    local l___typename_0 = v47.__typename;
    local l_id_0 = v47.id;
    local l__id_0 = v47._id;
    if type(l___typename_0) == "string" then
        if v48 then
            if l_id_0 ~= nil then
                v48.keyObject = {
                    id = l_id_0
                };
            elseif l__id_0 ~= nil then
                v48.keyObject = {
                    _id = l__id_0
                };
            else
                v48.keyObject = nil;
            end;
        end;
        if l_id_0 == nil then
            l_id_0 = l__id_0;
        end;
        if l_id_0 ~= nil then
            local v52 = type(l_id_0);
            return string.format("%s:%s", l___typename_0, if not (v52 ~= "number") or v52 == "string" then l_id_0 else l_HttpService_0:JSONEncode(l_id_0));
        end;
    end;
    return nil;
end;
v11.defaultDataIdFromObject = v53;
local function v55(_)
    return nil;
end;
local function v58(_, v57)
    return v57.fieldName;
end;
local v59 = nil;
v59 = function(_, v61, v62, v63)
    return v63:mergeObjects(v61, v62);
end;
local v64 = nil;
v64 = function(_, _, v67)
    return v67;
end;
local v68 = {};
v68.__index = v68;
v68.new = function(v69)
    local v70 = setmetatable({}, v68);
    v70.typePolicies = {};
    v70.toBeAdded = {};
    v70.supertypeMap = l_Map_0.new(nil);
    v70.fuzzySubtypes = l_Map_0.new(nil);
    v70.cache = nil;
    v70.rootIdsByTypename = {};
    v70.rootTypenamesById = {};
    v70.usingPossibleTypes = false;
    v70.config = v69;
    v70.config = l_Object_0.assign({
        dataIdFromObject = v53
    }, v69);
    v70.cache = v70.config.cache;
    v70:setRootTypename("Query");
    v70:setRootTypename("Mutation");
    v70:setRootTypename("Subscription");
    if v69.possibleTypes then
        v70:addPossibleTypes(v69.possibleTypes);
    end;
    if v69.typePolicies then
        v70:addTypePolicies(v69.typePolicies);
    end;
    return v70;
end;
v68.identify = function(v71, v72, v73, v74)
    local v75 = nil;
    v75 = if not not v73 and v74 then l_getTypenameFromResult_0(v72, v73, v74) else v72.__typename;
    if v75 == v71.rootTypenamesById.ROOT_QUERY then
        return {
            "ROOT_QUERY"
        };
    else
        local v76 = {
            typename = v75, 
            selectionSet = v73, 
            fragmentMap = v74
        };
        local v77 = nil;
        local v78 = nil;
        v78 = v75 and v71:getTypePolicy(v75);
        local v79 = nil;
        v79 = if not not v78 and v78.keyFn then v78.keyFn else v71.config.dataIdFromObject;
        while v79 do
            local v80 = v79(v78, v72, v76);
            if type(v80) == "table" then
                v79 = v15(v80);
            else
                v77 = v80;
                break;
            end;
        end;
        v77 = if not v77 then nil else tostring(v77);
        if not v76.keyObject then
            return {
                v77
            };
        else
            return {
                v77, 
                v76.keyObject
            };
        end;
    end;
end;
v68.addTypePolicies = function(v81, v82)
    v9(v82, function(v83)
        local v84 = v82[v83];
        local l_queryType_0 = v84.queryType;
        local l_mutationType_0 = v84.mutationType;
        local l_subscriptionType_0 = v84.subscriptionType;
        local v88 = l_Object_0.assign({}, v84, {
            queryType = l_Object_0.None, 
            mutationType = l_Object_0.None, 
            subscriptionType = l_Object_0.None
        });
        if l_queryType_0 then
            v81:setRootTypename("Query", v83);
        end;
        if l_mutationType_0 then
            v81:setRootTypename("Mutation", v83);
        end;
        if l_subscriptionType_0 then
            v81:setRootTypename("Subscription", v83);
        end;
        if not v35(v81.toBeAdded, v83) then
            v81.toBeAdded[v83] = {
                v88
            };
            return ;
        else
            table.insert(v81.toBeAdded[v83], v88);
            return ;
        end;
    end);
end;
v68.updateTypePolicy = function(v89, v90, v91)
    local v92 = v89:getTypePolicy(v90);
    local l_keyFields_0 = v91.keyFields;
    local l_fields_0 = v91.fields;
    local function _(v95, v96)
        if not v8(v96) then
            if v96 == true then
                v95.merge = v59;
                return ;
            elseif v96 == false then
                v95.merge = v64;
                return ;
            else
                v95.merge = v95.merge;
                return ;
            end;
        else
            v95.merge = v96;
            return ;
        end;
    end;
    local l_merge_0 = v91.merge;
    if not v8(l_merge_0) then
        if l_merge_0 == true then
            v92.merge = v59;
        elseif l_merge_0 == false then
            v92.merge = v64;
        else
            v92.merge = v92.merge;
        end;
    else
        v92.merge = l_merge_0;
    end;
    if l_keyFields_0 == false then
        v92.keyFn = v55;
    else
        l_merge_0 = type(l_keyFields_0);
        if l_merge_0 == "table" then
            v92.keyFn = v15(l_keyFields_0);
        elseif l_merge_0 == "function" then
            v92.keyFn = l_keyFields_0;
        else
            v92.keyFn = v92.keyFn;
        end;
    end;
    if l_fields_0 then
        v9(l_fields_0, function(v99)
            local v100 = v89:getFieldPolicy(v90, v99, true);
            local v101 = l_fields_0[v99];
            if type(v101) == "function" then
                v100.read = v101;
            else
                local l_keyArgs_0 = v101.keyArgs;
                local l_read_0 = v101.read;
                local l_merge_1 = v101.merge;
                if l_keyArgs_0 == false then
                    v100.keyFn = v58;
                else
                    local v105 = type(l_keyArgs_0);
                    if v105 == "table" then
                        v100.keyFn = v14(l_keyArgs_0);
                    elseif v105 == "function" then
                        v100.keyFn = l_keyArgs_0;
                    else
                        v100.keyFn = v100.keyFn;
                    end;
                end;
                if type(l_read_0) == "function" then
                    v100.read = l_read_0;
                end;
                if not v8(l_merge_1) then
                    if l_merge_1 == true then
                        v100.merge = v59;
                    elseif l_merge_1 == false then
                        v100.merge = v64;
                    else
                        v100.merge = v100.merge;
                    end;
                else
                    v100.merge = l_merge_1;
                end;
            end;
            if not (not v100.read or not v100.merge) then
                v100.keyFn = v100.keyFn or v58;
            end;
        end);
    end;
end;
v68.setRootTypename = function(v106, v107, v108)
    local l_v108_0 = v108;
    if l_v108_0 == nil then
        l_v108_0 = v107;
    end;
    local v110 = "ROOT_" .. string.upper(v107);
    local v111 = v106.rootTypenamesById[v110];
    if l_v108_0 ~= v111 then
        local v112 = not v111 or v111 == v107;
        if not v112 then
            l_invariant_0(v112, ("Cannot change root %s __typename more than once"):format(v107));
        end;
        if v111 then
            v106.rootIdsByTypename[v111] = nil;
        end;
        v106.rootIdsByTypename[l_v108_0] = v110;
        v106.rootTypenamesById[v110] = l_v108_0;
    end;
end;
v68.addPossibleTypes = function(v113, v114)
    v113.usingPossibleTypes = true;
    v9(v114, function(v115)
        v113:getSupertypeSet(v115, true);
        l_Array_0.forEach(v114[v115], function(v116)
            v113:getSupertypeSet(v116, true):add(v115);
            local v117 = l_TypeOrFieldNameRegExp_0:exec(v116);
            if not v117 or v117[1] ~= v116 then
                v113.fuzzySubtypes:set(v116, v10.new(v116));
            end;
        end);
    end);
end;
v68.getTypePolicy = function(v118, v119)
    if not v35(v118.typePolicies, v119) then
        v118.typePolicies[v119] = {};
        local v120 = v118.typePolicies[v119];
        v120.fields = {};
        local v121 = v118.supertypeMap:get(v119);
        if v121 and v121.size > 0 then
            local l_v120_0 = v120 --[[ copy: 2 -> 4 ]];
            v121:forEach(function(v123)
                local v124 = v118:getTypePolicy(v123);
                local l_fields_1 = v124.fields;
                l_Object_0.assign(l_v120_0, (l_Object_0.assign(table.clone(v124), {
                    fields = l_Object_0.None
                })));
                l_Object_0.assign(l_v120_0.fields, l_fields_1);
            end);
        end;
    end;
    local v126 = v118.toBeAdded[v119];
    if v126 and #v126 > 0 then
        l_Array_0.forEach(l_Array_0.splice(v126, 1), function(v127)
            v118:updateTypePolicy(v119, v127);
        end);
    end;
    return v118.typePolicies[v119];
end;
v68.getFieldPolicy = function(v128, v129, v130, v131)
    if not v129 then
        return nil;
    else
        local l_fields_2 = v128:getTypePolicy(v129).fields;
        if not l_fields_2[v130] then
            if not v131 then
                return nil;
            else
                l_fields_2[v130] = {};
                return l_fields_2[v130];
            end;
        else
            return l_fields_2[v130];
        end;
    end;
end;
v68.getSupertypeSet = function(v133, v134, v135)
    local v136 = v133.supertypeMap:get(v134);
    if not (v136 or not v135) then
        v136 = l_Set_0.new();
        v133.supertypeMap:set(v134, v136);
    end;
    return v136;
end;
v68.fragmentMatches = function(v137, v138, v139, v140, v141)
    if v138.typeCondition then
        if v139 then
            local l_value_0 = v138.typeCondition.name.value;
            if v139 == l_value_0 then
                return true;
            else
                if not (not v137.usingPossibleTypes or not v137.supertypeMap:has(l_value_0)) then
                    local v143 = v137:getSupertypeSet(v139, true);
                    local v144 = {
                        v143
                    };
                    local function v147(v145)
                        local v146 = v137:getSupertypeSet(v145, false);
                        if (v146 and v146.size > 0) and l_Array_0.indexOf(v144, v146) < 1 then
                            table.insert(v144, v146);
                        end;
                    end;
                    local v148 = false;
                    if v140 ~= nil then
                        v148 = v137.fuzzySubtypes.size > 0;
                    end;
                    local v149 = false;
                    for v150, _ in v144, nil, nil do
                        local v152 = v144[v150];
                        if not v152:has(l_value_0) then
                            v152:forEach(v147);
                            if not (not (v148 and v150 == #v144) or not l_selectionSetMatchesResult_0(v138.selectionSet, v140, v141)) then
                                v148 = false;
                                v149 = true;
                                l_Array_0.forEach(v137.fuzzySubtypes:entries(), function(v153)
                                    local v154 = v153[2];
                                    local v155 = v153[1];
                                    local v156 = v154:exec(v139);
                                    if v156 and v156[1] == v139 then
                                        local v157 = v137:getSupertypeSet(v155, false);
                                        if (v157 and v157.size > 0) and l_Array_0.indexOf(v144, v157) < 1 then
                                            table.insert(v144, v157);
                                        end;
                                    end;
                                    return 1;
                                end);
                            end;
                        else
                            if not v143:has(l_value_0) then
                                if v149 then
                                    l_invariant_0.warn(("Inferring subtype %s of supertype %s"):format(v139, l_value_0));
                                end;
                                v143:add(l_value_0);
                            end;
                            return true;
                        end;
                    end;
                end;
                return false;
            end;
        else
            return false;
        end;
    else
        return true;
    end;
end;
v68.hasKeyArgs = function(v158, v159, v160)
    local v161 = v158:getFieldPolicy(v159, v160, false);
    local v162 = false;
    if v161 ~= nil then
        v162 = v161.keyFn ~= nil;
    end;
    return v162;
end;
v68.getStoreFieldName = function(v163, v164)
    local l_typename_0 = v164.typename;
    local l_fieldName_0 = v164.fieldName;
    local v167 = v163:getFieldPolicy(l_typename_0, l_fieldName_0, false);
    local v168 = nil;
    local v169 = nil;
    v169 = if not v167 then nil else v167.keyFn;
    if not (not v169 or not l_typename_0) then
        local v170 = {
            typename = l_typename_0, 
            fieldName = l_fieldName_0, 
            field = v164.field or nil, 
            variables = v164.variables
        };
        local v171 = if v164.args ~= nil then v164.args else if v164.field then l_argumentsObjectFromField_0(v164.field, v164.variables) else nil;
        while v169 do
            local v172 = v169(v171, v170);
            if type(v172) == "table" then
                v169 = v14(v172);
            else
                v168 = v172 or l_fieldName_0;
                break;
            end;
        end;
    end;
    if v168 == nil then
        v168 = if not v164.field then l_getStoreKeyName_0(l_fieldName_0, if v164.args ~= nil then v164.args else if v164.field then l_argumentsObjectFromField_0(v164.field, v164.variables) else nil) else l_storeKeyNameFromField_0(v164.field, v164.variables);
    end;
    if v168 == false then
        return l_fieldName_0;
    elseif l_fieldName_0 == l_fieldNameFromStoreName_0(v168) then
        return v168;
    else
        return l_fieldName_0 .. ":" .. v168;
    end;
end;
v68.readField = function(v173, v174, v175)
    local l_from_0 = v174.from;
    if l_from_0 then
        if v174.field or v174.fieldName then
            if v174.typename == nil then
                local v177 = v175.store:getFieldValue(l_from_0, "__typename");
                if v177 then
                    v174.typename = v177;
                end;
            end;
            local v178 = v173:getStoreFieldName(v174);
            local v179 = l_fieldNameFromStoreName_0(v178);
            local v180 = v175.store:getFieldValue(l_from_0, v178);
            local v181 = v173:getFieldPolicy(v174.typename, v179, false);
            local v182 = nil;
            v182 = if not v181 then nil else v181.read;
            if not v182 then
                return v180;
            else
                return (l_cacheSlot_0:withValue(v173.cache, v182, {
                    v180, 
                    (v12(v173, l_from_0, v174, v175, v175.store:getStorage(if not l_from_0.__ref then l_from_0 else l_from_0.__ref, v178)))
                }));
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v68.getMergeFunction = function(v183, v184, v185, v186)
    local v187 = v183:getFieldPolicy(v184, v185, false);
    local v188 = nil;
    v188 = v187 and v187.merge;
    if not (v188 or not v186) then
        v187 = v183:getTypePolicy(v186);
        if not v187 then
            v188 = v187;
        else
            return v187.merge;
        end;
    end;
    return v188;
end;
v68.runMergeFunction = function(v189, v190, v191, v192, v193, v194)
    local l_field_0 = v192.field;
    local l_typename_1 = v192.typename;
    local l_merge_2 = v192.merge;
    if l_merge_2 == v59 then
        return v13(v193.store)(v192, v190, v191);
    elseif l_merge_2 == v64 then
        return v191;
    else
        if v193.overwrite then
            v190 = nil;
        end;
        return l_merge_2(v192, v190, v191, v12(v189, nil, {
            typename = l_typename_1, 
            fieldName = l_field_0.name.value, 
            field = l_field_0, 
            variables = v193.variables
        }, v193, v194 or {}));
    end;
end;
v11.Policies = v68;
v12 = function(v198, v199, v200, v201, v202)
    local v203 = v198:getStoreFieldName(v200);
    local v204 = l_fieldNameFromStoreName_0(v203);
    local v205 = v200.variables or v201.variables;
    return {
        args = if v200.args ~= nil then v200.args else if v200.field then l_argumentsObjectFromField_0(v200.field, v200.variables) else nil, 
        field = v200.field or nil, 
        fieldName = v204, 
        storeFieldName = v203, 
        variables = v205, 
        isReference = function(_, ...)
            return l_isReference_0(...);
        end, 
        toReference = v201.store.toReference, 
        storage = v202, 
        cache = v198.cache, 
        canRead = v201.store.canRead, 
        readField = function(_, v208, ...)
            local v209 = type(v208);
            local v210 = {
                if v209 == "table" then l_Object_0.assign(table.clone(v208), if v208.from == l_Object_0.None then {
                    from = "<Object.None>"
                } else nil) else v208, 
                select("#", ...) >= 1 and "<nil>" or nil
            };
            local v211 = nil;
            if v209 == "string" then
                v211 = {
                    fieldName = v208, 
                    from = if select("#", ...) >= 1 then ... else v199
                };
            elseif v209 == "table" then
                v211 = l_Object_0.assign({}, v208);
                if not v35(v208, "from") then
                    v211.from = v199;
                end;
            else
                l_invariant_0.warn(("Unexpected readField arguments: %s"):format(l_stringifyForDisplay_0(l_Array_0.from(v210))));
                return ;
            end;
            if _G.__DEV__ and v211.from == nil then
                l_invariant_0.warn(("Undefined 'from' passed to readField with arguments %s"):format(l_stringifyForDisplay_0(l_Array_0.from(v210))));
            end;
            if v211.variables == nil then
                v211.variables = v205;
            end;
            return v198:readField(v211, v201);
        end, 
        mergeObjects = v13(v201.store)
    };
end;
v13 = function(v212)
    return function(_, v214, v215)
        if not (not l_Array_0.isArray(v214) and not l_Array_0.isArray(v215)) then
            error(l_InvariantError_0.new("Cannot automatically merge arrays"));
        end;
        if not (not l_isNonNullObject_0(v214) or not l_isNonNullObject_0(v215)) then
            local v216 = v212:getFieldValue(v214, "__typename");
            local v217 = v212:getFieldValue(v215, "__typename");
            local v218 = false;
            if v216 ~= nil then
                v218 = false;
                if v217 ~= nil then
                    v218 = v216 ~= v217;
                end;
            end;
            if not v218 then
                if not l_isReference_0(v214) or not l_storeValueIsStoreObject_0(v215) then
                    if not l_storeValueIsStoreObject_0(v214) or not l_isReference_0(v215) then
                        if not (not l_storeValueIsStoreObject_0(v214) or not l_storeValueIsStoreObject_0(v215)) then
                            return l_Object_0.assign({}, v214, v215);
                        end;
                    else
                        v212:merge(v214, v215.__ref);
                        return v215;
                    end;
                else
                    v212:merge(v214.__ref, v215);
                    return v214;
                end;
            else
                return v215;
            end;
        end;
        return v215;
    end;
end;
local function v219(v220, v221)
    assert(typeof(v221) == "table", "specifier must be an array");
    if next(v221) then
        return "{" .. l_Array_0.join(l_Array_0.filter(l_Array_0.map(v221, function(v222, v223)
            if not l_Array_0.isArray(v222) then
                local _ = nil;
                if v220[v222] then
                    if v223 < #v221 then
                        return l_HttpService_0:JSONEncode(v222) .. ":" .. if not l_Array_0.isArray(v221[v223 + 1]) then l_HttpService_0:JSONEncode(v220[v222]) else v219(v220[v222], v221[v223 + 1]);
                    else
                        return l_HttpService_0:JSONEncode(v222) .. ":" .. l_HttpService_0:JSONEncode(v220[v222]);
                    end;
                else
                    return "";
                end;
            else
                return "";
            end;
        end), function(v225)
            return v225 ~= "";
        end), ",") .. "}";
    else
        return "[]";
    end;
end;
v14 = function(v226)
    return function(v227, v228)
        if not v227 then
            return v228.fieldName;
        else
            return ("%s:%s"):format(v228.fieldName, (v219(v17(v227, v226, false), v226)));
        end;
    end;
end;
v15 = function(v229)
    local v230 = l_Trie_0.new(l_canUseWeakMap_0);
    return function(_, v232, v233)
        local v234 = nil;
        if not (not v233.selectionSet or not v233.fragmentMap) then
            local v235 = v230:lookupArray({
                v233.selectionSet, 
                v233.fragmentMap
            });
            if not v235.aliasMap then
                v235.aliasMap = v16(v233.selectionSet, v233.fragmentMap);
                v234 = v235.aliasMap;
            else
                v234 = v235.aliasMap;
            end;
        end;
        v233.keyObject = v17(v232, v229, true, v234);
        return ("%s:%s"):format(v233.typename or "null", (v219(v233.keyObject, v229)));
    end;
end;
v16 = function(v236, v237)
    local v238 = {};
    local v239 = l_Set_0.new({
        v236
    });
    for _, v241 in v239, nil, nil do
        l_Array_0.forEach(v241.selections, function(v242)
            if not l_isField_0(v242) then
                local v243 = l_getFragmentFromSelection_0(v242, v237);
                if v243 then
                    v239:add(v243.selectionSet);
                end;
            else
                if v242.alias then
                    local l_value_1 = v242.alias.value;
                    local l_value_2 = v242.name.value;
                    if l_value_2 ~= l_value_1 then
                        local v246 = nil;
                        if not v238.aliases then
                            v238.aliases = {};
                            v246 = v238.aliases;
                        else
                            v246 = v238.aliases;
                        end;
                        v246[l_value_2] = l_value_1;
                    end;
                end;
                if v242.selectionSet then
                    local v247 = nil;
                    if not v238.subsets then
                        v238.subsets = {};
                        v247 = v238.subsets;
                    else
                        v247 = v238.subsets;
                    end;
                    v247[v242.name.value] = v16(v242.selectionSet, v237);
                    return ;
                end;
            end;
        end);
    end;
    return v238;
end;
v17 = function(v248, v249, v250, v251)
    local v252 = {};
    local v253 = nil;
    for _, v255 in v249, nil, nil do
        if type(v255) == "table" then
            if type(v253) == "string" then
                local v256 = nil;
                v256 = v251 and v251.subsets;
                local _ = nil;
                v252[v253] = v17(v248[v253], v255, v250, v256 and v256[v253]);
            end;
        else
            local v258 = nil;
            v258 = v251 and v251.aliases;
            local v259 = nil;
            v259 = if not not v258 and v258[v255] then v258[v255] else v255;
            if not v35(v248, v259) then
                l_invariant_0(not v250, ("Missing field '%s' while computing key fields"):format(v259));
                v253 = nil;
            else
                v253 = v255;
                v252[v253] = v248[v259];
            end;
        end;
    end;
    return v252;
end;
v11.None = l_Object_0.None;
return v11;
