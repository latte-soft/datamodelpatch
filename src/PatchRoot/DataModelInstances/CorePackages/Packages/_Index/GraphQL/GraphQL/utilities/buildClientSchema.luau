local l_Parent_0 = script.Parent.Parent;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local v5 = require(l_luaUtils_0.null);
local v6 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v6.isNillish;
local l_isNotNillish_0 = v6.isNotNillish;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_devAssert_0 = require(l_Parent_0.jsutils.devAssert).devAssert;
local l_keyValMap_0 = require(l_Parent_0.jsutils.keyValMap).keyValMap;
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local l_parseValue_0 = require(l_Parent_0.language.parser).parseValue;
local v14 = require(l_Parent_0.type.schema);
local v15 = require(l_Parent_0.type.definition);
local l_GraphQLSchema_0 = v14.GraphQLSchema;
local l_GraphQLDirective_0 = require(l_Parent_0.type.directives).GraphQLDirective;
local l_specifiedScalarTypes_0 = require(l_Parent_0.type.scalars).specifiedScalarTypes;
local v19 = require(l_Parent_0.type.introspection);
local l_introspectionTypes_0 = v19.introspectionTypes;
local l_TypeKind_0 = v19.TypeKind;
local l_isInputType_0 = v15.isInputType;
local l_isOutputType_0 = v15.isOutputType;
local l_GraphQLList_0 = v15.GraphQLList;
local l_GraphQLNonNull_0 = v15.GraphQLNonNull;
local l_GraphQLScalarType_0 = v15.GraphQLScalarType;
local l_GraphQLObjectType_0 = v15.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v15.GraphQLInterfaceType;
local l_GraphQLUnionType_0 = v15.GraphQLUnionType;
local l_GraphQLEnumType_0 = v15.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v15.GraphQLInputObjectType;
local l_assertNullableType_0 = v15.assertNullableType;
local l_assertObjectType_0 = v15.assertObjectType;
local l_assertInterfaceType_0 = v15.assertInterfaceType;
local _ = require(script.Parent.getIntrospectionQuery);
local l_valueFromAST_0 = require(script.Parent.valueFromAST).valueFromAST;
return {
    buildClientSchema = function(v37, v38)
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        local v48 = nil;
        local v49 = nil;
        local v50 = nil;
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        local v56 = nil;
        local v57 = nil;
        v39 = function(v58)
            if v58.kind == l_TypeKind_0.LIST then
                local l_ofType_0 = v58.ofType;
                if not l_ofType_0 then
                    error(l_Error_0.new("Decorated type deeper than introspection query."));
                end;
                return l_GraphQLList_0.new(v39(l_ofType_0));
            elseif v58.kind == l_TypeKind_0.NON_NULL then
                local l_ofType_1 = v58.ofType;
                if not l_ofType_1 then
                    error(l_Error_0.new("Decorated type deeper than introspection query."));
                end;
                return l_GraphQLNonNull_0.new(l_assertNullableType_0((v39(l_ofType_1))));
            else
                return v40(v58);
            end;
        end;
        v40 = function(v61)
            local l_name_0 = v61.name;
            if l_isNillish_0(l_name_0) then
                error(l_Error_0.new(("Unknown type reference: %s."):format(l_inspect_0(v61))));
            end;
            local v63 = v57:get(l_name_0);
            if l_isNillish_0(v63) then
                error(l_Error_0.new(("Invalid or incomplete schema, unknown type: %s. Ensure that a full introspection query is used in order to build a client schema."):format(l_name_0)));
            end;
            return v63;
        end;
        v41 = function(v64)
            return l_assertObjectType_0(v40(v64));
        end;
        v42 = function(v65)
            return l_assertInterfaceType_0(v40(v65));
        end;
        v43 = function(v66)
            if not ((not l_isNotNillish_0(v66) or not l_isNotNillish_0(v66.name)) or not l_isNotNillish_0(v66.kind)) then
                if v66.kind == l_TypeKind_0.SCALAR then
                    return v44(v66);
                elseif v66.kind == l_TypeKind_0.OBJECT then
                    return v46(v66);
                elseif v66.kind == l_TypeKind_0.INTERFACE then
                    return v47(v66);
                elseif v66.kind == l_TypeKind_0.UNION then
                    return v48(v66);
                elseif v66.kind == l_TypeKind_0.ENUM then
                    return v49(v66);
                elseif v66.kind == l_TypeKind_0.INPUT_OBJECT then
                    return v50(v66);
                end;
            end;
            error(l_Error_0.new(("Invalid or incomplete introspection result. Ensure that a full introspection query is used in order to build a client schema: %s."):format((l_inspect_0(v66)))));
        end;
        v44 = function(v67)
            return l_GraphQLScalarType_0.new({
                name = v67.name, 
                description = v67.description, 
                specifiedByUrl = v67.specifiedByUrl
            });
        end;
        v45 = function(v68)
            if v68.interfaces == nil and v68.kind == l_TypeKind_0.INTERFACE then
                return {};
            else
                if not v68.interfaces then
                    error(l_Error_0.new(("Introspection result missing interfaces: %s."):format((l_inspect_0(v68)))));
                end;
                return l_Array_0.map(v68.interfaces, v42);
            end;
        end;
        v46 = function(v69)
            return l_GraphQLObjectType_0.new({
                name = v69.name, 
                description = v69.description, 
                interfaces = function()
                    return v45(v69);
                end, 
                fields = function()
                    return v51(v69);
                end
            });
        end;
        v47 = function(v70)
            return l_GraphQLInterfaceType_0.new({
                name = v70.name, 
                description = v70.description, 
                interfaces = function()
                    return v45(v70);
                end, 
                fields = function()
                    return v51(v70);
                end
            });
        end;
        v48 = function(v71)
            if not v71.possibleTypes then
                error(l_Error_0.new(("Introspection result missing possibleTypes: %s."):format((l_inspect_0(v71)))));
            end;
            return l_GraphQLUnionType_0.new({
                name = v71.name, 
                description = v71.description, 
                types = function()
                    return l_Array_0.map(v71.possibleTypes, v41);
                end
            });
        end;
        v49 = function(v72)
            if not v72.enumValues then
                error(l_Error_0.new(("Introspection result missing enumValues: %s."):format((l_inspect_0(v72)))));
            end;
            return l_GraphQLEnumType_0.new({
                name = v72.name, 
                description = v72.description, 
                values = l_keyValMap_0(v72.enumValues, function(v73)
                    return v73.name;
                end, function(v74)
                    return {
                        description = v74.description, 
                        deprecationReason = v74.deprecationReason
                    };
                end)
            });
        end;
        v50 = function(v75)
            if not v75.inputFields then
                error(l_Error_0.new(("Introspection result missing inputFields: %s."):format((l_inspect_0(v75)))));
            end;
            return l_GraphQLInputObjectType_0.new({
                name = v75.name, 
                description = v75.description, 
                fields = function()
                    return v53(v75.inputFields);
                end
            });
        end;
        v51 = function(v76)
            if not v76.fields then
                error(l_Error_0.new(("Introspection result missing fields: %s."):format(l_inspect_0(v76))));
            end;
            return l_keyValMap_0(v76.fields, function(v77)
                return v77.name;
            end, v52);
        end;
        v52 = function(v78)
            local v79 = v39(v78.type);
            if not l_isOutputType_0(v79) then
                error(l_Error_0.new(("Introspection must provide output type for fields, but received: %s."):format((l_inspect_0(v79)))));
            end;
            if not v78.args then
                error(l_Error_0.new(("Introspection result missing field args: %s."):format((l_inspect_0(v78)))));
            end;
            return {
                description = v78.description, 
                deprecationReason = v78.deprecationReason, 
                type = v79, 
                args = v53(v78.args)
            };
        end;
        v53 = function(v80)
            return l_keyValMap_0(v80, function(v81)
                return v81.name;
            end, v54);
        end;
        v54 = function(v82)
            local v83 = v39(v82.type);
            if not l_isInputType_0(v83) then
                error(l_Error_0.new(("Introspection must provide input type for arguments, but received: %s."):format((l_inspect_0(v83)))));
            end;
            return {
                description = v82.description, 
                type = v83, 
                defaultValue = if not l_isNotNillish_0(v82.defaultValue) then nil else l_valueFromAST_0(l_parseValue_0(v82.defaultValue), v83), 
                deprecationReason = v82.deprecationReason
            };
        end;
        v55 = function(v84)
            if not v84.args then
                error(l_Error_0.new(("Introspection result missing directive args: %s."):format((l_inspect_0(v84)))));
            end;
            if not v84.locations then
                error(l_Error_0.new(("Introspection result missing directive locations: %s."):format((l_inspect_0(v84)))));
            end;
            return l_GraphQLDirective_0.new({
                name = v84.name, 
                description = v84.description, 
                isRepeatable = v84.isRepeatable, 
                locations = l_Array_0.slice(v84.locations), 
                args = v53(v84.args)
            });
        end;
        l_devAssert_0(l_isObjectLike_0(v37) and l_isObjectLike_0(v37.__schema), ("Invalid or incomplete introspection result. Ensure that you are passing \"data\" property of introspection response and no \"errors\" was returned alongside: %s."):format(l_inspect_0(v37)));
        v56 = v37.__schema;
        v57 = l_keyValMap_0(v56.types, function(v85)
            return v85.name;
        end, function(v86)
            return v43(v86);
        end);
        for _, v88 in ipairs(l_Array_0.concat(l_specifiedScalarTypes_0, l_introspectionTypes_0)) do
            if v57:get(v88.name) then
                v57:set(v88.name, v88);
            end;
        end;
        return l_GraphQLSchema_0.new({
            description = v56.description, 
            query = if not l_isNotNillish_0(v56.queryType) then v5 else v41(v56.queryType), 
            mutation = if not l_isNotNillish_0(v56.mutationType) then v5 else v41(v56.mutationType), 
            subscription = if not l_isNotNillish_0(v56.subscriptionType) then v5 else v41(v56.subscriptionType), 
            types = v57:values(), 
            directives = if not l_isNotNillish_0(v56.directives) then {} else l_Array_0.map(v56.directives, v55), 
            assumeValid = if not v38 then nil else v38.assumeValid
        });
    end
};
