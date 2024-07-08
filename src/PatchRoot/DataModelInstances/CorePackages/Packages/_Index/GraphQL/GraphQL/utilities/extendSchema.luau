local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_coerceToMap_0 = v1.coerceToMap;
local l_mapValueOrdered_0 = require(l_Parent_0.luaUtils.mapValueOrdered).mapValueOrdered;
local _ = require(l_Parent_0.luaUtils.null);
local l_jsutils_0 = l_Parent_0.jsutils;
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local _ = require(l_jsutils_0.ObjMap);
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local v16 = require(l_Parent_0.language.predicates);
local l_isTypeDefinitionNode_0 = v16.isTypeDefinitionNode;
local l_isTypeExtensionNode_0 = v16.isTypeExtensionNode;
local l_assertValidSDLExtension_0 = require(l_Parent_0.validation.validate).assertValidSDLExtension;
local l_getDirectiveValues_0 = require(l_Parent_0.execution.values).getDirectiveValues;
local l_type_0 = l_Parent_0.type;
local v22 = require(l_type_0.schema);
local l_assertSchema_0 = v22.assertSchema;
local l_GraphQLSchema_0 = v22.GraphQLSchema;
local v25 = require(l_type_0.scalars);
local l_specifiedScalarTypes_0 = v25.specifiedScalarTypes;
local l_isSpecifiedScalarType_0 = v25.isSpecifiedScalarType;
local v28 = require(l_type_0.introspection);
local l_introspectionTypes_0 = v28.introspectionTypes;
local l_isIntrospectionType_0 = v28.isIntrospectionType;
local v31 = require(l_type_0.directives);
local l_GraphQLDirective_0 = v31.GraphQLDirective;
local l_GraphQLDeprecatedDirective_0 = v31.GraphQLDeprecatedDirective;
local l_GraphQLSpecifiedByDirective_0 = v31.GraphQLSpecifiedByDirective;
local v35 = require(l_type_0.definition);
local l_isScalarType_0 = v35.isScalarType;
local l_isObjectType_0 = v35.isObjectType;
local l_isInterfaceType_0 = v35.isInterfaceType;
local l_isUnionType_0 = v35.isUnionType;
local l_isListType_0 = v35.isListType;
local l_isNonNullType_0 = v35.isNonNullType;
local l_isEnumType_0 = v35.isEnumType;
local l_isInputObjectType_0 = v35.isInputObjectType;
local l_GraphQLList_0 = v35.GraphQLList;
local l_GraphQLNonNull_0 = v35.GraphQLNonNull;
local l_GraphQLScalarType_0 = v35.GraphQLScalarType;
local l_GraphQLObjectType_0 = v35.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v35.GraphQLInterfaceType;
local l_GraphQLUnionType_0 = v35.GraphQLUnionType;
local l_GraphQLEnumType_0 = v35.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v35.GraphQLInputObjectType;
local l_valueFromAST_0 = require(script.Parent.valueFromAST).valueFromAST;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local function v61(v56, v57, v58)
    l_assertSchema_0(v56);
    local l_l_devAssert_0_0 = l_devAssert_0;
    local v60 = false;
    if v57 ~= nil then
        v60 = v57.kind == l_Kind_0.DOCUMENT;
    end;
    l_l_devAssert_0_0(v60, "Must provide valid Document AST.");
    if (v58 and v58.assumeValid) ~= true and (v58 and v58.assumeValidSDL) ~= true then
        l_assertValidSDLExtension_0(v57, v56);
    end;
    l_l_devAssert_0_0 = v56:toConfig();
    v60 = extendSchemaImpl(l_l_devAssert_0_0, v57, v58);
    if l_l_devAssert_0_0 == v60 then
        return v56;
    else
        return (l_GraphQLSchema_0.new(v60));
    end;
end;
extendSchemaImpl = function(v62, v63, v64)
    local v65 = {};
    local v66 = l_Map_0.new();
    local v67 = {};
    local v68 = nil;
    local v69 = {};
    for _, v71 in ipairs(v63.definitions) do
        if v71.kind == l_Kind_0.SCHEMA_DEFINITION then
            v68 = v71;
        elseif v71.kind == l_Kind_0.SCHEMA_EXTENSION then
            table.insert(v69, v71);
        elseif not l_isTypeDefinitionNode_0(v71) then
            if not l_isTypeExtensionNode_0(v71) then
                if v71.kind == l_Kind_0.DIRECTIVE_DEFINITION then
                    table.insert(v67, v71);
                end;
            else
                local l_value_0 = v71.name.value;
                local v73 = v66:get(l_value_0);
                v66:set(l_value_0, if not v73 then {
                    v71
                } else l_Array_0.concat(v73, {
                    v71
                }));
            end;
        else
            table.insert(v65, v71);
        end;
    end;
    if (((#v66:keys() == 0 and #v65 == 0) and #v67 == 0) and #v69 == 0) and v68 == nil then
        return v62;
    else
        local v74 = l_Map_0.new();
        local v75 = nil;
        local v76 = nil;
        local v77 = nil;
        local v78 = nil;
        local v79 = nil;
        local v80 = nil;
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        local v85 = nil;
        local v86 = nil;
        local v87 = nil;
        local v88 = nil;
        local v89 = nil;
        local v90 = nil;
        local function v91(v92)
            if not l_isListType_0(v92) then
                if not l_isNonNullType_0(v92) then
                    return v75(v92);
                else
                    return l_GraphQLNonNull_0.new(v91(v92.ofType));
                end;
            else
                return l_GraphQLList_0.new(v91(v92.ofType));
            end;
        end;
        v75 = function(v93)
            return v74:get(v93.name);
        end;
        local function v96(v94)
            local v95 = v94:toConfig();
            return l_GraphQLDirective_0.new(l_Object_0.assign({}, v95, {
                args = l_mapValueOrdered_0(l_coerceToMap_0(v95.args), v76)
            }));
        end;
        local function v98(v97)
            if not l_isIntrospectionType_0(v97) and not l_isSpecifiedScalarType_0(v97) then
                if not l_isScalarType_0(v97) then
                    if not l_isObjectType_0(v97) then
                        if not l_isInterfaceType_0(v97) then
                            if not l_isUnionType_0(v97) then
                                if not l_isEnumType_0(v97) then
                                    if not l_isInputObjectType_0(v97) then
                                        assert(false, "Unexpected type: " .. l_inspect_0(v97));
                                        return ;
                                    else
                                        return v83(v97);
                                    end;
                                else
                                    return v82(v97);
                                end;
                            else
                                return v81(v97);
                            end;
                        else
                            return v80(v97);
                        end;
                    else
                        return v79(v97);
                    end;
                else
                    return v78(v97);
                end;
            else
                return v97;
            end;
        end;
        v83 = function(v99)
            local v100 = v99:toConfig();
            local v101 = v66[v100.name] or {};
            return l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v100, {
                fields = function()
                    return l_Map_0.new(l_Array_0.concat(l_mapValueOrdered_0(l_coerceToMap_0(v100.fields), function(v102)
                        return l_Object_0.assign({}, v102, {
                            type = v91(v102.type)
                        });
                    end):entries(), v84(v101):entries()));
                end, 
                extensionASTNodes = l_Array_0.concat(v100.extensionASTNodes, v101)
            }));
        end;
        v82 = function(v103)
            local v104 = v103:toConfig();
            local v105 = v66:get(v103.name) or {};
            return l_GraphQLEnumType_0.new(l_Object_0.assign({}, v104, {
                values = l_Map_0.new(l_Array_0.concat(v104.values:entries(), v85(v105):entries())), 
                extensionASTNodes = l_Array_0.concat(v104.extensionASTNodes, v105)
            }));
        end;
        v78 = function(v106)
            local v107 = v106:toConfig();
            local v108 = v66:get(v107.name) or {};
            local l_specifiedByUrl_0 = v107.specifiedByUrl;
            for _, v111 in ipairs(v108) do
                l_specifiedByUrl_0 = v55(v111) or l_specifiedByUrl_0;
            end;
            return l_GraphQLScalarType_0.new(l_Object_0.assign({}, v107, {
                specifiedByUrl = l_specifiedByUrl_0, 
                extensionASTNodes = l_Array_0.concat(v107.extensionASTNodes, v108)
            }));
        end;
        v79 = function(v112)
            local v113 = v112:toConfig();
            local v114 = v66:get(v113.name) or {};
            return l_GraphQLObjectType_0.new(l_Object_0.assign({}, v113, {
                interfaces = function()
                    return l_Array_0.concat(l_Array_0.map(v112:getInterfaces(), v75), v86(v114));
                end, 
                fields = function()
                    return l_Map_0.new(l_Array_0.concat(l_mapValueOrdered_0(l_coerceToMap_0(v113.fields), v77):entries(), v90(v114):entries()));
                end, 
                extensionASTNodes = l_Array_0.concat(v113.extensionASTNodes, v114)
            }));
        end;
        v80 = function(v115)
            local v116 = v115:toConfig();
            local v117 = v66:get(v116.name) or {};
            return l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v116, {
                interfaces = function()
                    return l_Array_0.concat(l_Array_0.map(v115:getInterfaces(), v75), v86(v117));
                end, 
                fields = function()
                    return l_Map_0.new(l_Array_0.concat(l_mapValueOrdered_0(l_coerceToMap_0(v116.fields), v77):entries(), v90(v117):entries()));
                end, 
                extensionASTNodes = l_Array_0.concat(v116.extensionASTNodes, v117)
            }));
        end;
        v81 = function(v118)
            local v119 = v118:toConfig();
            local v120 = v66:get(v119.name) or {};
            return l_GraphQLUnionType_0.new(l_Object_0.assign({}, v119, {
                types = function()
                    return l_Array_0.concat(l_Array_0.map(v118:getTypes(), v75), v87(v120));
                end, 
                extensionASTNodes = l_Array_0.concat(v119.extensionASTNodes, v120)
            }));
        end;
        v77 = function(v121)
            return l_Object_0.assign({}, v121, {
                type = v91(v121.type), 
                args = if not v121.args then nil else l_mapValueOrdered_0(v121.args, v76)
            });
        end;
        v76 = function(v122)
            return l_Object_0.assign({}, v122, {
                type = v91(v122.type)
            });
        end;
        local function v130(v123)
            local v124 = {};
            for _, v126 in ipairs(v123) do
                local v127 = v126.operationTypes or {};
                for _, v129 in ipairs(v127) do
                    v124[v129.operation] = v88(v129.type);
                end;
            end;
            return v124;
        end;
        v88 = function(v131)
            local l_value_1 = v131.name.value;
            local v133 = v53[l_value_1] or v74[l_value_1];
            if v133 == nil then
                error(l_Error_0.new(("Unknown type: \"%s\"."):format(l_value_1)));
            end;
            return v133;
        end;
        local function v134(v135)
            if v135.kind == l_Kind_0.LIST_TYPE then
                return l_GraphQLList_0.new(v134(v135.type));
            elseif v135.kind == l_Kind_0.NON_NULL_TYPE then
                return l_GraphQLNonNull_0.new(v134(v135.type));
            else
                return v88(v135);
            end;
        end;
        local function v138(v136)
            return l_GraphQLDirective_0.new({
                name = v136.name.value, 
                description = if not v136.description then nil else v136.description.value, 
                locations = l_Array_0.map(v136.locations, function(v137)
                    return v137.value;
                end), 
                isRepeatable = v136.repeatable, 
                args = v89(v136.arguments), 
                astNode = v136
            });
        end;
        v90 = function(v139)
            local v140 = l_Map_0.new();
            for _, v142 in ipairs(v139) do
                local v143 = if not v142.fields then {} else v142.fields;
                for _, v145 in ipairs(v143) do
                    v140:set(v145.name.value, {
                        type = v134(v145.type), 
                        description = if not v145.description then nil else v145.description.value, 
                        args = v89(v145.arguments), 
                        deprecationReason = v54(v145), 
                        astNode = v145
                    });
                end;
            end;
            return v140;
        end;
        v89 = function(v146)
            local v147 = v146 or {};
            local v148 = l_Map_0.new();
            for _, v150 in ipairs(v147) do
                local v151 = v134(v150.type);
                v148:set(v150.name.value, {
                    type = v151, 
                    description = if not v150.description then nil else v150.description.value, 
                    defaultValue = l_valueFromAST_0(v150.defaultValue, v151), 
                    deprecationReason = v54(v150), 
                    astNode = v150
                });
            end;
            return v148;
        end;
        v84 = function(v152)
            local v153 = l_Map_0.new();
            for _, v155 in ipairs(v152) do
                local v156 = if not v155.fields then {} else v155.fields;
                for _, v158 in ipairs(v156) do
                    local v159 = v134(v158.type);
                    v153:set(v158.name.value, {
                        type = v159, 
                        description = if not v158.description then nil else v158.description.value, 
                        defaultValue = l_valueFromAST_0(v158.defaultValue, v159), 
                        deprecationReason = v54(v158), 
                        astNode = v158
                    });
                end;
            end;
            return v153;
        end;
        v85 = function(v160)
            local v161 = l_Map_0.new();
            for _, v163 in ipairs(v160) do
                local v164 = if not v163.values then {} else v163.values;
                for _, v166 in ipairs(v164) do
                    v161:set(v166.name.value, {
                        description = if not v166.description then nil else v166.description.value, 
                        deprecationReason = v54(v166), 
                        astNode = v166
                    });
                end;
            end;
            return v161;
        end;
        v86 = function(v167)
            local v168 = {};
            for _, v170 in ipairs(v167) do
                if v170.interfaces then
                    for _, v172 in ipairs(v170.interfaces) do
                        table.insert(v168, (v88(v172)));
                    end;
                end;
            end;
            return v168;
        end;
        v87 = function(v173)
            local v174 = {};
            for _, v176 in ipairs(v173) do
                if v176.types then
                    for _, v178 in ipairs(v176.types) do
                        table.insert(v174, (v88(v178)));
                    end;
                end;
            end;
            return v174;
        end;
        local function v187(v179)
            local l_value_2 = v179.name.value;
            local v181 = v66[l_value_2] or {};
            local l_kind_0 = v179.kind;
            if l_kind_0 == l_Kind_0.OBJECT_TYPE_DEFINITION then
                local v183 = l_Array_0.concat(v179, v181);
                return l_GraphQLObjectType_0.new({
                    name = l_value_2, 
                    description = if not v179.description then nil else v179.description.value, 
                    interfaces = function()
                        return v86(v183);
                    end, 
                    fields = function()
                        return v90(v183);
                    end, 
                    astNode = v179, 
                    extensionASTNodes = v181
                });
            elseif l_kind_0 == l_Kind_0.INTERFACE_TYPE_DEFINITION then
                local v184 = l_Array_0.concat(v179, v181);
                return l_GraphQLInterfaceType_0.new({
                    name = l_value_2, 
                    description = if not v179.description then nil else v179.description.value, 
                    interfaces = function()
                        return v86(v184);
                    end, 
                    fields = function()
                        return v90(v184);
                    end, 
                    astNode = v179, 
                    extensionASTNodes = v181
                });
            elseif l_kind_0 == l_Kind_0.ENUM_TYPE_DEFINITION then
                return l_GraphQLEnumType_0.new({
                    name = l_value_2, 
                    description = if not v179.description then nil else v179.description.value, 
                    values = v85((l_Array_0.concat(v179, v181))), 
                    astNode = v179, 
                    extensionASTNodes = v181
                });
            elseif l_kind_0 == l_Kind_0.UNION_TYPE_DEFINITION then
                local v185 = l_Array_0.concat(v179, v181);
                return l_GraphQLUnionType_0.new({
                    name = l_value_2, 
                    description = if not v179.description then nil else v179.description.value, 
                    types = function()
                        return v87(v185);
                    end, 
                    astNode = v179, 
                    extensionASTNodes = v181
                });
            elseif l_kind_0 == l_Kind_0.SCALAR_TYPE_DEFINITION then
                return l_GraphQLScalarType_0.new({
                    name = l_value_2, 
                    description = if not v179.description then nil else v179.description.value, 
                    specifiedByUrl = v55(v179), 
                    astNode = v179, 
                    extensionASTNodes = v181
                });
            elseif l_kind_0 == l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION then
                local v186 = l_Array_0.concat(v179, v181);
                return l_GraphQLInputObjectType_0.new({
                    name = l_value_2, 
                    description = if not v179.description then nil else v179.description.value, 
                    fields = function()
                        return v84(v186);
                    end, 
                    astNode = v179, 
                    extensionASTNodes = v181
                });
            else
                assert(false, "Unexpected type definition node: " .. l_inspect_0(v179));
                return ;
            end;
        end;
        for _, v189 in ipairs(v62.types) do
            v74:set(v189.name, v98(v189));
        end;
        for _, v191 in ipairs(v65) do
            local l_value_3 = v191.name.value;
            v74:set(l_value_3, v53[l_value_3] or v187(v191));
        end;
        local v193 = l_Object_0.assign({}, {
            query = v62.query and v75(v62.query), 
            mutation = v62.mutation and v75(v62.mutation), 
            subscription = v62.subscription and v75(v62.subscription)
        }, not not v68 and v130({
            v68
        }) or {}, (v130(v69)));
        local v194 = nil;
        if v68 ~= nil and v68.description ~= nil then
            v194 = v68.description.value;
        end;
        local v195 = false;
        if v64 ~= nil and v64.assumeValid ~= nil then
            v195 = v64.assumeValid;
        end;
        local v196 = l_Object_0.assign({}, {
            description = v194
        }, v193, {
            types = v74:values(), 
            directives = l_Array_0.concat(l_Array_0.map(v62.directives, v96), l_Array_0.map(v67, v138)), 
            astNode = v68 or v62.astNode, 
            extensionASTNodes = l_Array_0.concat(v62.extensionASTNodes, v69), 
            assumeValid = v195
        });
        v196.extensions = nil;
        return v196;
    end;
end;
v53 = l_keyMap_0(l_Array_0.concat(l_specifiedScalarTypes_0, l_introspectionTypes_0), function(v197)
    return v197.name;
end);
v54 = function(v198)
    local v199 = l_getDirectiveValues_0(l_GraphQLDeprecatedDirective_0, v198);
    return v199 and v199.reason;
end;
v55 = function(v200)
    local v201 = l_getDirectiveValues_0(l_GraphQLSpecifiedByDirective_0, v200);
    return v201 and v201.url;
end;
return {
    extendSchema = v61, 
    extendSchemaImpl = extendSchemaImpl
};
