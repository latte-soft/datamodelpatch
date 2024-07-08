local l_Parent_0 = script.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_error_0 = l_Parent_0.error;
local l_language_0 = l_Parent_0.language;
local l_type_0 = l_Parent_0.type;
local l_utilities_0 = l_Parent_0.utilities;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v7 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v7.Array;
local l_Error_0 = v7.Error;
local l_Map_0 = v7.Map;
local l_Set_0 = v7.Set;
local l_instanceof_0 = v7.instanceof;
local _ = require(l_jsutils_0.ObjMap);
local _ = require(l_jsutils_0.PromiseOrValue);
local v15 = require(l_Parent_0.Parent.Promise);
local v16 = require(l_luaUtils_0.null);
local l_isNillish_0 = require(l_luaUtils_0.isNillish).isNillish;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_memoize3_0 = require(l_jsutils_0.memoize3).memoize3;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local l_isPromise_0 = require(l_jsutils_0.isPromise).isPromise;
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l_promiseReduce_0 = require(l_jsutils_0.promiseReduce).promiseReduce;
local l_promiseForObject_0 = require(l_jsutils_0.promiseForObject).promiseForObject;
local v26 = require(l_jsutils_0.Path);
local l_addPath_0 = v26.addPath;
local l_pathToArray_0 = v26.pathToArray;
local l_isIteratableObject_0 = require(l_jsutils_0.isIteratableObject).isIteratableObject;
local _ = require(l_error_0.formatError);
local l_GraphQLError_0 = require(l_error_0.GraphQLError).GraphQLError;
local l_locatedError_0 = require(l_error_0.locatedError).locatedError;
local _ = require(l_language_0.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local _ = require(l_type_0.schema);
local v36 = require(l_type_0.definition);
local l_assertValidSchema_0 = require(l_type_0.validate).assertValidSchema;
local v38 = require(l_type_0.introspection);
local l_SchemaMetaFieldDef_0 = v38.SchemaMetaFieldDef;
local l_TypeMetaFieldDef_0 = v38.TypeMetaFieldDef;
local l_TypeNameMetaFieldDef_0 = v38.TypeNameMetaFieldDef;
local v42 = require(l_type_0.directives);
local l_GraphQLIncludeDirective_0 = v42.GraphQLIncludeDirective;
local l_GraphQLSkipDirective_0 = v42.GraphQLSkipDirective;
local l_isObjectType_0 = v36.isObjectType;
local l_isAbstractType_0 = v36.isAbstractType;
local l_isLeafType_0 = v36.isLeafType;
local l_isListType_0 = v36.isListType;
local l_isNonNullType_0 = v36.isNonNullType;
local l_typeFromAST_0 = require(l_utilities_0.typeFromAST).typeFromAST;
local l_getOperationRootType_0 = require(l_utilities_0.getOperationRootType).getOperationRootType;
local v52 = require(script.Parent.values);
local l_getVariableValues_0 = v52.getVariableValues;
local l_getArgumentValues_0 = v52.getArgumentValues;
local l_getDirectiveValues_0 = v52.getDirectiveValues;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local _ = nil;
local v83 = nil;
v56 = function(v84)
    local l_schema_0 = v84.schema;
    local l_document_0 = v84.document;
    local l_rootValue_0 = v84.rootValue;
    local l_contextValue_0 = v84.contextValue;
    local l_variableValues_0 = v84.variableValues;
    local l_operationName_0 = v84.operationName;
    local l_fieldResolver_0 = v84.fieldResolver;
    local l_typeResolver_0 = v84.typeResolver;
    v58(l_schema_0, l_document_0, l_variableValues_0);
    local v93 = v59(l_schema_0, l_document_0, l_rootValue_0, l_contextValue_0, l_variableValues_0, l_operationName_0, l_fieldResolver_0, l_typeResolver_0);
    if not l_Array_0.isArray(v93) and v93.schema then
        return v65(v93, (v66(v93, v93.operation, l_rootValue_0)));
    else
        return {
            errors = v93
        };
    end;
end;
v57 = function(v94)
    local v95 = v56(v94);
    if l_isPromise_0(v95) then
        error(l_Error_0.new("GraphQL execution failed to complete synchronously."));
    end;
    return v95;
end;
v65 = function(v96, v97)
    if not l_isPromise_0(v97) then
        if #v96.errors == 0 then
            return {
                data = v97
            };
        else
            return {
                errors = v96.errors, 
                data = v97
            };
        end;
    else
        return v97:andThen(function(v98)
            return v65(v96, v98);
        end);
    end;
end;
v58 = function(v99, v100, v101)
    l_devAssert_0(v100, "Must provide document.");
    l_assertValidSchema_0(v99);
    local l_l_devAssert_0_0 = l_devAssert_0;
    local v103 = true;
    if v101 ~= nil then
        v103 = l_isObjectLike_0(v101);
    end;
    l_l_devAssert_0_0(v103, "Variables must be provided as an Object where each property is a variable value. Perhaps look to see if an unparsed JSON string was provided.");
end;
v59 = function(v104, v105, v106, v107, v108, v109, v110, v111)
    local v112 = nil;
    local v113 = {};
    for _, v115 in ipairs(v105.definitions) do
        if v115.kind == l_Kind_0.OPERATION_DEFINITION then
            if v109 == nil then
                if v112 ~= nil then
                    return {
                        l_GraphQLError_0.new("Must provide operation name if query contains multiple operations.")
                    };
                else
                    v112 = v115;
                end;
            elseif (v115.name and v115.name.value) == v109 then
                v112 = v115;
            end;
        elseif v115.kind == l_Kind_0.FRAGMENT_DEFINITION then
            v113[v115.name.value] = v115;
        end;
    end;
    if v112 then
        local v116 = l_getVariableValues_0(v104, v112.variableDefinitions or {}, v108 or {}, {
            maxErrors = 50
        });
        if not v116.errors then
            return {
                schema = v104, 
                fragments = v113, 
                rootValue = v106, 
                contextValue = v107, 
                operation = v112, 
                variableValues = v116.coerced, 
                fieldResolver = v110 or v63, 
                typeResolver = v111 or v62, 
                errors = {}
            };
        else
            return v116.errors;
        end;
    elseif v109 ~= nil then
        return {
            l_GraphQLError_0.new(("Unknown operation named \"%s\"."):format(v109))
        };
    else
        return {
            l_GraphQLError_0.new("Must provide an operation.")
        };
    end;
end;
v66 = function(v117, v118, v119)
    local v120 = l_getOperationRootType_0(v117.schema, v118);
    local v121 = v60(v117, v120, v118.selectionSet, l_Map_0.new(), {});
    local v122 = nil;
    local v123 = nil;
    if v118.operation == "mutation" then
        local l_status_0, l_result_0 = pcall(v67, v117, v120, v119, nil, v121);
        v122 = l_status_0;
        v123 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(v68, v117, v120, v119, nil, v121);
        v122 = l_status_1;
        v123 = l_result_1;
    end;
    if not l_isPromise_0(v123) then
        if v122 then
            return v123;
        else
            table.insert(v117.errors, v123);
            return v16;
        end;
    else
        return v123:andThen(nil, function(v128)
            table.insert(v117.errors, v128);
            return v15.resolve(v16);
        end);
    end;
end;
v67 = function(v129, v130, v131, v132, v133)
    return l_promiseReduce_0(v133:keys(), function(v134, v135)
        local v136 = v72(v129, v130, v131, v133[v135], (l_addPath_0(v132, v135, v130.name)));
        if v136 == nil then
            return v134;
        elseif not l_isPromise_0(v136) then
            v134[v135] = v136;
            return v134;
        else
            return v136:andThen(function(v137)
                v134[v135] = v137;
                return v134;
            end);
        end;
    end, {});
end;
v68 = function(v138, v139, v140, v141, v142)
    local v143 = {};
    local v144 = false;
    for _, v146 in ipairs(v142:keys()) do
        local v147 = v72(v138, v139, v140, v142[v146], (l_addPath_0(v141, v146, v139.name)));
        if v147 ~= nil then
            v143[v146] = v147;
            if l_isPromise_0(v147) then
                v144 = true;
            end;
        end;
    end;
    if v144 then
        return l_promiseForObject_0(v143);
    else
        return v143;
    end;
end;
v60 = function(v148, v149, v150, v151, v152)
    for _, v154 in ipairs(v150.selections) do
        if v154.kind == l_Kind_0.FIELD then
            if v69(v148, v154) then
                local v155 = v71(v154);
                if not v151[v155] then
                    v151[v155] = {};
                end;
                table.insert(v151[v155], v154);
            end;
        elseif v154.kind == l_Kind_0.INLINE_FRAGMENT then
            if not (not v69(v148, v154) or not v70(v148, v154, v149)) then
                v60(v148, v149, v154.selectionSet, v151, v152);
            end;
        elseif v154.kind == l_Kind_0.FRAGMENT_SPREAD then
            local l_value_0 = v154.name.value;
            if not (v152[l_value_0] or not v69(v148, v154)) then
                v152[l_value_0] = true;
                local v157 = v148.fragments[l_value_0];
                if not (not v157 or not v70(v148, v157, v149)) then
                    v60(v148, v149, v157.selectionSet, v151, v152);
                end;
            end;
        end;
    end;
    return v151;
end;
v69 = function(v158, v159)
    local v160 = l_getDirectiveValues_0(l_GraphQLSkipDirective_0, v159, v158.variableValues);
    if (v160 and v160["if"]) == true then
        return false;
    else
        local v161 = l_getDirectiveValues_0(l_GraphQLIncludeDirective_0, v159, v158.variableValues);
        if (v161 and v161["if"]) == false then
            return false;
        else
            return true;
        end;
    end;
end;
v70 = function(v162, v163, v164)
    local l_typeCondition_0 = v163.typeCondition;
    if l_typeCondition_0 then
        local v166 = l_typeFromAST_0(v162.schema, l_typeCondition_0);
        if v166 == v164 then
            return true;
        elseif not l_isAbstractType_0(v166) then
            return false;
        else
            return v162.schema:isSubType(v166, v164);
        end;
    else
        return true;
    end;
end;
v71 = function(v167)
    if not v167.alias then
        return v167.name.value;
    else
        return v167.alias.value;
    end;
end;
v72 = function(v168, v169, v170, v171, v172)
    local v173 = v64(v168.schema, v169, v171[1].name.value);
    if v173 then
        local l_type_1 = v173.type;
        local v175 = if not v173.resolve then v168.fieldResolver else v173.resolve;
        local v176 = v61(v168, v173, v171, v169, v172);
        local l_status_2, l_result_2 = pcall(function()
            local v177 = v175(v170, l_getArgumentValues_0(v173, v171[1], v168.variableValues), v168.contextValue, v176);
            local v178 = nil;
            v178 = if not l_isPromise_0(v177) then v74(v168, l_type_1, v171, v176, v172, v177) else v177:andThen(function(v179)
                return v74(v168, l_type_1, v171, v176, v172, v179);
            end);
            if not l_isPromise_0(v178) then
                return v178;
            else
                return v178:andThen(nil, function(v180)
                    return v73(l_locatedError_0(v180, v171, l_pathToArray_0(v172)), l_type_1, v168);
                end);
            end;
        end);
        if l_status_2 then
            return l_result_2;
        else
            return v73(l_locatedError_0(l_result_2, v171, l_pathToArray_0(v172)), l_type_1, v168);
        end;
    else
        return ;
    end;
end;
v61 = function(v183, v184, v185, v186, v187)
    return {
        fieldName = v184.name, 
        fieldNodes = v185, 
        returnType = v184.type, 
        parentType = v186, 
        path = v187, 
        schema = v183.schema, 
        fragments = v183.fragments, 
        rootValue = v183.rootValue, 
        operation = v183.operation, 
        variableValues = v183.variableValues
    };
end;
v73 = function(v188, v189, v190)
    if l_isNonNullType_0(v189) then
        error(v188);
    end;
    table.insert(v190.errors, v188);
    return v16;
end;
v74 = function(v191, v192, v193, v194, v195, v196)
    if l_instanceof_0(v196, l_Error_0) then
        error(v196);
    end;
    if not l_isNonNullType_0(v192) then
        if not l_isNillish_0(v196) then
            if not l_isListType_0(v192) then
                if not l_isLeafType_0(v192) then
                    if not l_isAbstractType_0(v192) then
                        if not l_isObjectType_0(v192) then
                            l_invariant_0(false, "Cannot complete value of unexpected output type: " .. l_inspect_0(v192));
                            assert(false, "Cannot complete value of unexpected output type: " .. l_inspect_0(v192));
                            return ;
                        else
                            return v79(v191, v192, v193, v194, v195, v196);
                        end;
                    else
                        return v77(v191, v192, v193, v194, v195, v196);
                    end;
                else
                    return v76(v192, v196);
                end;
            else
                return v75(v191, v192, v193, v194, v195, v196);
            end;
        else
            return v16;
        end;
    else
        local v197 = v74(v191, v192.ofType, v193, v194, v195, v196);
        if l_isNillish_0(v197) then
            error(l_Error_0.new(("Cannot return null for non-nullable field %s.%s."):format(v194.parentType.name, v194.fieldName)));
        end;
        return v197;
    end;
end;
v75 = function(v198, v199, v200, v201, v202, v203)
    if l_instanceof_0(v203, l_Set_0) then
        local v204 = {};
        for _, v206 in v203, nil, nil do
            table.insert(v204, v206);
        end;
        v203 = v204;
    end;
    if not l_isIteratableObject_0(v203) then
        error(l_GraphQLError_0.new(("Expected Iterable, but did not find one for field \"%s.%s\"."):format(v201.parentType.name, v201.fieldName)));
    end;
    local l_ofType_0 = v199.ofType;
    local v208 = false;
    local v209 = false;
    local v218 = l_Array_0.from(v203, function(v210, v211)
        local v212 = l_addPath_0(v202, v211, nil);
        local l_status_3, l_result_3 = pcall(function()
            local v213 = nil;
            v213 = if not l_isPromise_0(v210) then v74(v198, l_ofType_0, v200, v201, v212, v210) else v210:andThen(function(v214)
                return v74(v198, l_ofType_0, v200, v201, v212, v214);
            end);
            if not l_isPromise_0(v213) then
                v209 = true;
                return v213;
            else
                v208 = true;
                return v213:andThen(nil, function(v215)
                    return v73(l_locatedError_0(v215, v200, l_pathToArray_0(v212)), l_ofType_0, v198);
                end);
            end;
        end);
        if l_status_3 then
            return l_result_3;
        else
            return v73(l_locatedError_0(l_result_3, v200, l_pathToArray_0(v212)), l_ofType_0, v198);
        end;
    end);
    if not (not v209 or not v208) then
        v218 = l_Array_0.map(v218, function(v219)
            if not l_isPromise_0(v219) then
                return (v15.resolve(v219));
            else
                return v219;
            end;
        end);
    end;
    return if not v208 then v218 else v15.all(v218);
end;
v76 = function(v220, v221)
    local v222 = v220:serialize(v221);
    if v222 == nil then
        error(l_Error_0.new(("Expected a value of type \"%s\" but "):format(l_inspect_0(v220)) .. ("received: %s"):format(l_inspect_0(v221))));
    end;
    return v222;
end;
v77 = function(v223, v224, v225, v226, v227, v228)
    local v229 = (if not v224.resolveType then v223.typeResolver else v224.resolveType)(v228, v223.contextValue, v226, v224);
    if not l_isPromise_0(v229) then
        return v79(v223, v78(v229, v223, v224, v225, v226, v228), v225, v226, v227, v228);
    else
        return v229:andThen(function(v230)
            return v79(v223, v78(v230, v223, v224, v225, v226, v228), v225, v226, v227, v228);
        end);
    end;
end;
v78 = function(v231, v232, v233, v234, v235, v236)
    if v231 == nil then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\". Either the \"%s\" type should provide a \"resolveType\" function or each possible type should provide an \"isTypeOf\" function."):format(v233.name, v235.parentType.name, v235.fieldName, v233.name), v234));
    end;
    if l_isObjectType_0(v231) then
        error(l_GraphQLError_0.new("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead."));
    end;
    if typeof(v231) ~= "string" then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" must resolve to an Object type at runtime for field \"%s.%s\" with "):format(v233.name, v235.parentType.name, v235.fieldName) .. ("value %s, received \"%s\"."):format(l_inspect_0(v236), l_inspect_0(v231))));
    end;
    local v237 = v232.schema:getType(v231);
    if v237 == nil then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" was resolve to a type \"%s\" that does not exist inside schema."):format(v233.name, v231), v234));
    end;
    if not l_isObjectType_0(v237) then
        error(l_GraphQLError_0.new(("Abstract type \"%s\" was resolve to a non-object type \"%s\"."):format(v233.name, v231), v234));
    end;
    if not v232.schema:isSubType(v233, v237) then
        error(l_GraphQLError_0.new(("Runtime Object type \"%s\" is not a possible type for \"%s\"."):format(v237.name, v233.name), v234));
    end;
    return v237;
end;
v79 = function(v238, v239, v240, v241, v242, v243)
    if v239.isTypeOf ~= nil then
        local v244 = v239:isTypeOf(v243, v238.contextValue, v241);
        if not l_isPromise_0(v244) then
            if not v244 then
                error(v80(v239, v243, v240));
            end;
        else
            return v244:andThen(function(v245)
                if not v245 then
                    error(v80(v239, v243, v240));
                end;
                return v81(v238, v239, v240, v242, v243);
            end);
        end;
    end;
    return v81(v238, v239, v240, v242, v243);
end;
v80 = function(v246, v247, v248)
    return l_GraphQLError_0.new(("Expected value of type \"%s\" but got: %s."):format(v246.name, l_inspect_0(v247)), v248);
end;
v81 = function(v249, v250, v251, v252, v253)
    return v68(v249, v250, v253, v252, (v83(v249, v250, v251)));
end;
v83 = l_memoize3_0(function(v254, v255, v256)
    local v257 = l_Map_0.new();
    local v258 = {};
    for _, v260 in ipairs(v256) do
        if v260.selectionSet then
            v257 = v60(v254, v255, v260.selectionSet, v257, v258);
        end;
    end;
    return v257;
end);
v62 = function(v261, v262, v263, v264)
    if l_isObjectLike_0(v261) and typeof(v261.__typename) == "string" then
        return v261.__typename;
    else
        local v265 = v263.schema:getPossibleTypes(v264);
        local v266 = {};
        for v267 = 1, #v265 do
            local v268 = v265[v267];
            if v268.isTypeOf then
                local v269 = v268:isTypeOf(v261, v262, v263);
                if not l_isPromise_0(v269) then
                    if v269 then
                        return v268.name;
                    end;
                else
                    v266[v267] = v269;
                end;
            end;
        end;
        if #v266 > 0 then
            return v15.all(v266):andThen(function(v270)
                for v271 = 1, #v270 do
                    if v270[v271] then
                        return v265[v271].name;
                    end;
                end;
                return nil;
            end);
        else
            return nil;
        end;
    end;
end;
v63 = function(v272, v273, v274, v275)
    if l_isObjectLike_0(v272) or typeof(v272) == "function" then
        local v276 = v272[v275.fieldName];
        if typeof(v276) == "function" then
            return v272[v275.fieldName](v272, v273, v274, v275);
        else
            return v276;
        end;
    else
        return nil;
    end;
end;
v64 = function(v277, v278, v279)
    if v279 == l_SchemaMetaFieldDef_0.name and v277:getQueryType() == v278 then
        return l_SchemaMetaFieldDef_0;
    elseif v279 == l_TypeMetaFieldDef_0.name and v277:getQueryType() == v278 then
        return l_TypeMetaFieldDef_0;
    elseif v279 == l_TypeNameMetaFieldDef_0.name then
        return l_TypeNameMetaFieldDef_0;
    else
        return v278:getFields():get(v279);
    end;
end;
return {
    execute = v56, 
    executeSync = v57, 
    assertValidExecutionArguments = v58, 
    buildExecutionContext = v59, 
    collectFields = v60, 
    buildResolveInfo = v61, 
    getFieldDef = v64, 
    defaultFieldResolver = v63, 
    defaultTypeResolver = v62
};
