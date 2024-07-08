local l_Parent_0 = script.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_language_0 = l_Parent_0.language;
local v3 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Map_0 = v3.Map;
local l_Object_0 = v3.Object;
local l_isNotNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNotNillish;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_print_0 = require(l_language_0.printer).print;
local l_DirectiveLocation_0 = require(l_language_0.directiveLocation).DirectiveLocation;
local l_astFromValue_0 = require(l_Parent_0.utilities.astFromValue).astFromValue;
local _ = require(l_Parent_0.language.ast);
local v14 = require(script.Parent.scalars);
local l_GraphQLString_0 = v14.GraphQLString;
local l_GraphQLBoolean_0 = v14.GraphQLBoolean;
local v17 = require(script.Parent.definition);
local l_GraphQLList_0 = v17.GraphQLList;
local l_GraphQLNonNull_0 = v17.GraphQLNonNull;
local l_GraphQLObjectType_0 = v17.GraphQLObjectType;
local l_GraphQLEnumType_0 = v17.GraphQLEnumType;
local l_isScalarType_0 = v17.isScalarType;
local l_isObjectType_0 = v17.isObjectType;
local l_isInterfaceType_0 = v17.isInterfaceType;
local l_isUnionType_0 = v17.isUnionType;
local l_isEnumType_0 = v17.isEnumType;
local l_isInputObjectType_0 = v17.isInputObjectType;
local l_isListType_0 = v17.isListType;
local l_isNonNullType_0 = v17.isNonNullType;
local l_isAbstractType_0 = v17.isAbstractType;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v45 = l_GraphQLObjectType_0.new({
    name = "__Schema", 
    description = "A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and directives on the server, as well as the entry points for query, mutation, and subscription operations.", 
    fields = function()
        return l_Map_0.new({
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v39)
                        return v39.description;
                    end
                }
            }, 
            {
                "types", 
                {
                    description = "A list of all types supported by this server.", 
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v35))), 
                    resolve = function(v40)
                        return v40:getTypeMap():values();
                    end
                }
            }, 
            {
                "queryType", 
                {
                    description = "The type that query operations will be rooted at.", 
                    type = l_GraphQLNonNull_0.new(v35), 
                    resolve = function(v41)
                        return v41:getQueryType();
                    end
                }
            }, 
            {
                "mutationType", 
                {
                    description = "If this server supports mutation, the type that mutation operations will be rooted at.", 
                    type = v35, 
                    resolve = function(v42)
                        return v42:getMutationType();
                    end
                }
            }, 
            {
                "subscriptionType", 
                {
                    description = "If this server support subscription, the type that subscription operations will be rooted at.", 
                    type = v35, 
                    resolve = function(v43)
                        return v43:getSubscriptionType();
                    end
                }
            }, 
            {
                "directives", 
                {
                    description = "A list of all directives supported by this server.", 
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v33))), 
                    resolve = function(v44)
                        return v44:getDirectives();
                    end
                }
            }
        });
    end
});
v33 = l_GraphQLObjectType_0.new({
    name = "__Directive", 
    description = "A Directive provides a way to describe alternate runtime execution and type validation behavior in a GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL's execution behavior in ways field arguments will not suffice, such as conditionally including or skipping a field. Directives provide this by describing additional information to the executor.", 
    fields = function()
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v46)
                        return v46.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v47)
                        return v47.description;
                    end
                }
            }, 
            {
                "isRepeatable", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v48)
                        return v48.isRepeatable;
                    end
                }
            }, 
            {
                "locations", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v34))), 
                    resolve = function(v49)
                        return v49.locations;
                    end
                }
            }, 
            {
                "args", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v37))), 
                    resolve = function(v50)
                        return v50.args;
                    end
                }
            }
        });
    end
});
v34 = l_GraphQLEnumType_0.new({
    name = "__DirectiveLocation", 
    description = "A Directive can be adjacent to many parts of the GraphQL language, a __DirectiveLocation describes one such possible adjacencies.", 
    values = l_Map_0.new({
        {
            "QUERY", 
            {
                value = l_DirectiveLocation_0.QUERY, 
                description = "Location adjacent to a query operation."
            }
        }, 
        {
            "MUTATION", 
            {
                value = l_DirectiveLocation_0.MUTATION, 
                description = "Location adjacent to a mutation operation."
            }
        }, 
        {
            "SUBSCRIPTION", 
            {
                value = l_DirectiveLocation_0.SUBSCRIPTION, 
                description = "Location adjacent to a subscription operation."
            }
        }, 
        {
            "FIELD", 
            {
                value = l_DirectiveLocation_0.FIELD, 
                description = "Location adjacent to a field."
            }
        }, 
        {
            "FRAGMENT_DEFINITION", 
            {
                value = l_DirectiveLocation_0.FRAGMENT_DEFINITION, 
                description = "Location adjacent to a fragment definition."
            }
        }, 
        {
            "FRAGMENT_SPREAD", 
            {
                value = l_DirectiveLocation_0.FRAGMENT_SPREAD, 
                description = "Location adjacent to a fragment spread."
            }
        }, 
        {
            "INLINE_FRAGMENT", 
            {
                value = l_DirectiveLocation_0.INLINE_FRAGMENT, 
                description = "Location adjacent to an inline fragment."
            }
        }, 
        {
            "VARIABLE_DEFINITION", 
            {
                value = l_DirectiveLocation_0.VARIABLE_DEFINITION, 
                description = "Location adjacent to a variable definition."
            }
        }, 
        {
            "SCHEMA", 
            {
                value = l_DirectiveLocation_0.SCHEMA, 
                description = "Location adjacent to a schema definition."
            }
        }, 
        {
            "SCALAR", 
            {
                value = l_DirectiveLocation_0.SCALAR, 
                description = "Location adjacent to a scalar definition."
            }
        }, 
        {
            "OBJECT", 
            {
                value = l_DirectiveLocation_0.OBJECT, 
                description = "Location adjacent to an object type definition."
            }
        }, 
        {
            "FIELD_DEFINITION", 
            {
                value = l_DirectiveLocation_0.FIELD_DEFINITION, 
                description = "Location adjacent to a field definition."
            }
        }, 
        {
            "ARGUMENT_DEFINITION", 
            {
                value = l_DirectiveLocation_0.ARGUMENT_DEFINITION, 
                description = "Location adjacent to an argument definition."
            }
        }, 
        {
            "INTERFACE", 
            {
                value = l_DirectiveLocation_0.INTERFACE, 
                description = "Location adjacent to an interface definition."
            }
        }, 
        {
            "UNION", 
            {
                value = l_DirectiveLocation_0.UNION, 
                description = "Location adjacent to a union definition."
            }
        }, 
        {
            "ENUM", 
            {
                value = l_DirectiveLocation_0.ENUM, 
                description = "Location adjacent to an enum definition."
            }
        }, 
        {
            "ENUM_VALUE", 
            {
                value = l_DirectiveLocation_0.ENUM_VALUE, 
                description = "Location adjacent to an enum value definition."
            }
        }, 
        {
            "INPUT_OBJECT", 
            {
                value = l_DirectiveLocation_0.INPUT_OBJECT, 
                description = "Location adjacent to an input object type definition."
            }
        }, 
        {
            "INPUT_FIELD_DEFINITION", 
            {
                value = l_DirectiveLocation_0.INPUT_FIELD_DEFINITION, 
                description = "Location adjacent to an input object field definition."
            }
        }
    })
});
v35 = l_GraphQLObjectType_0.new({
    name = "__Type", 
    description = "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as represented by the `__TypeKind` enum.\n\nDepending on the kind of a type, certain fields describe information about that type. Scalar types provide no information beyond a name, description and optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types provide the fields they describe. Abstract types, Union and Interface, provide the Object types possible at runtime. List and NonNull types compose other types.", 
    fields = function()
        return l_Map_0.new({
            {
                "kind", 
                {
                    type = l_GraphQLNonNull_0.new(v32), 
                    resolve = function(v51)
                        if not l_isScalarType_0(v51) then
                            if not l_isObjectType_0(v51) then
                                if not l_isInterfaceType_0(v51) then
                                    if not l_isUnionType_0(v51) then
                                        if not l_isEnumType_0(v51) then
                                            if not l_isInputObjectType_0(v51) then
                                                if not l_isListType_0(v51) then
                                                    if not l_isNonNullType_0(v51) then
                                                        l_invariant_0(false, ("Unexpected type: \"%s\"."):format(l_inspect_0(v51)));
                                                        assert(false);
                                                        return ;
                                                    else
                                                        return v31.NON_NULL;
                                                    end;
                                                else
                                                    return v31.LIST;
                                                end;
                                            else
                                                return v31.INPUT_OBJECT;
                                            end;
                                        else
                                            return v31.ENUM;
                                        end;
                                    else
                                        return v31.UNION;
                                    end;
                                else
                                    return v31.INTERFACE;
                                end;
                            else
                                return v31.OBJECT;
                            end;
                        else
                            return v31.SCALAR;
                        end;
                    end
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v52)
                        if v52.name ~= nil then
                            return v52.name;
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v53)
                        if v53.description ~= nil then
                            return v53.description;
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "specifiedByUrl", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v54)
                        if v54.specifiedByUrl ~= nil then
                            return v54.specifiedByUrl;
                        else
                            return nil;
                        end;
                    end
                }
            }, 
            {
                "fields", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v36)), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v55, v56)
                        local l_includeDeprecated_0 = v56.includeDeprecated;
                        if not l_isObjectType_0(v55) and not l_isInterfaceType_0(v55) then
                            return ;
                        else
                            local v58 = v55:getFields():values();
                            return not not l_includeDeprecated_0 and v58 or l_Array_0.filter(v58, function(v59)
                                return v59.deprecationReason == nil;
                            end);
                        end;
                    end
                }
            }, 
            {
                "interfaces", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v35)), 
                    resolve = function(v60)
                        if not l_isObjectType_0(v60) and not l_isInterfaceType_0(v60) then
                            return ;
                        else
                            return v60:getInterfaces();
                        end;
                    end
                }
            }, 
            {
                "possibleTypes", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v35)), 
                    resolve = function(v61, _, _, v64)
                        local l_schema_0 = v64.schema;
                        if not l_isAbstractType_0(v61) then
                            return nil;
                        else
                            return l_schema_0:getPossibleTypes(v61);
                        end;
                    end
                }
            }, 
            {
                "enumValues", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v38)), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v66, v67)
                        local l_includeDeprecated_1 = v67.includeDeprecated;
                        if not l_isEnumType_0(v66) then
                            return ;
                        else
                            local v69 = v66:getValues();
                            return not not l_includeDeprecated_1 and v69 or l_Array_0.filter(v69, function(v70)
                                return v70.deprecationReason == nil;
                            end);
                        end;
                    end
                }
            }, 
            {
                "inputFields", 
                {
                    type = l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v37)), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v71, v72)
                        local l_includeDeprecated_2 = v72.includeDeprecated;
                        if not l_isInputObjectType_0(v71) then
                            return ;
                        else
                            local v74 = v71:getFields():values();
                            return not not l_includeDeprecated_2 and v74 or l_Array_0.filter(v74, function(v75)
                                return v75.deprecationReason == nil;
                            end);
                        end;
                    end
                }
            }, 
            {
                "ofType", 
                {
                    type = v35, 
                    resolve = function(v76)
                        if v76.ofType ~= nil then
                            return v76.ofType;
                        else
                            return nil;
                        end;
                    end
                }
            }
        });
    end
});
v36 = l_GraphQLObjectType_0.new({
    name = "__Field", 
    description = "Object and Interface types are described by a list of Fields, each of which has a name, potentially a list of arguments, and a return type.", 
    fields = function()
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v77)
                        return v77.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v78)
                        return v78.description;
                    end
                }
            }, 
            {
                "args", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLList_0.new(l_GraphQLNonNull_0.new(v37))), 
                    args = {
                        includeDeprecated = {
                            type = l_GraphQLBoolean_0, 
                            defaultValue = false
                        }
                    }, 
                    resolve = function(v79, v80)
                        if not v80.includeDeprecated then
                            return (l_Array_0.filter(v79.args, function(v81)
                                return v81.deprecationReason == nil;
                            end));
                        else
                            return v79.args;
                        end;
                    end
                }
            }, 
            {
                "type", 
                {
                    type = l_GraphQLNonNull_0.new(v35), 
                    resolve = function(v82)
                        return v82.type;
                    end
                }
            }, 
            {
                "isDeprecated", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v83)
                        return l_isNotNillish_0(v83.deprecationReason);
                    end
                }
            }, 
            {
                "deprecationReason", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v84)
                        return v84.deprecationReason;
                    end
                }
            }
        });
    end
});
v37 = l_GraphQLObjectType_0.new({
    name = "__InputValue", 
    description = "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as Input Values which describe their type and optionally a default value.", 
    fields = function()
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v85)
                        return v85.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v86)
                        return v86.description;
                    end
                }
            }, 
            {
                "type", 
                {
                    type = l_GraphQLNonNull_0.new(v35), 
                    resolve = function(v87)
                        return v87.type;
                    end
                }
            }, 
            {
                "defaultValue", 
                {
                    type = l_GraphQLString_0, 
                    description = "A GraphQL-formatted string representing the default value for this input value.", 
                    resolve = function(v88)
                        local v89 = l_astFromValue_0(v88.defaultValue, v88.type);
                        if not v89 then
                            return nil;
                        else
                            return (l_print_0(v89));
                        end;
                    end
                }
            }, 
            {
                "isDeprecated", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v90)
                        return l_isNotNillish_0(v90.deprecationReason);
                    end
                }
            }, 
            {
                "deprecationReason", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v91)
                        return v91.deprecationReason;
                    end
                }
            }
        });
    end
});
v38 = l_GraphQLObjectType_0.new({
    name = "__EnumValue", 
    description = "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or numeric value. However an Enum value is returned in a JSON response as a string.", 
    fields = function()
        return l_Map_0.new({
            {
                "name", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    resolve = function(v92)
                        return v92.name;
                    end
                }
            }, 
            {
                "description", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v93)
                        return v93.description;
                    end
                }
            }, 
            {
                "isDeprecated", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                    resolve = function(v94)
                        return l_isNotNillish_0(v94.deprecationReason);
                    end
                }
            }, 
            {
                "deprecationReason", 
                {
                    type = l_GraphQLString_0, 
                    resolve = function(v95)
                        return v95.deprecationReason;
                    end
                }
            }
        });
    end
});
v31 = l_Object_0.freeze({
    SCALAR = "SCALAR", 
    OBJECT = "OBJECT", 
    INTERFACE = "INTERFACE", 
    UNION = "UNION", 
    ENUM = "ENUM", 
    INPUT_OBJECT = "INPUT_OBJECT", 
    LIST = "LIST", 
    NON_NULL = "NON_NULL"
});
v32 = l_GraphQLEnumType_0.new({
    name = "__TypeKind", 
    description = "An enum describing what kind of type a given `__Type` is.", 
    values = l_Map_0.new({
        {
            "SCALAR", 
            {
                value = v31.SCALAR, 
                description = "Indicates this type is a scalar."
            }
        }, 
        {
            "OBJECT", 
            {
                value = v31.OBJECT, 
                description = "Indicates this type is an object. `fields` and `interfaces` are valid fields."
            }
        }, 
        {
            "INTERFACE", 
            {
                value = v31.INTERFACE, 
                description = "Indicates this type is an interface. `fields`, `interfaces`, and `possibleTypes` are valid fields."
            }
        }, 
        {
            "UNION", 
            {
                value = v31.UNION, 
                description = "Indicates this type is a union. `possibleTypes` is a valid field."
            }
        }, 
        {
            "ENUM", 
            {
                value = v31.ENUM, 
                description = "Indicates this type is an enum. `enumValues` is a valid field."
            }
        }, 
        {
            "INPUT_OBJECT", 
            {
                value = v31.INPUT_OBJECT, 
                description = "Indicates this type is an input object. `inputFields` is a valid field."
            }
        }, 
        {
            "LIST", 
            {
                value = v31.LIST, 
                description = "Indicates this type is a list. `ofType` is a valid field."
            }
        }, 
        {
            "NON_NULL", 
            {
                value = v31.NON_NULL, 
                description = "Indicates this type is a non-null. `ofType` is a valid field."
            }
        }
    })
});
local v100 = {
    name = "__schema", 
    type = l_GraphQLNonNull_0.new(v45), 
    description = "Access the current type schema of this server.", 
    args = {}, 
    resolve = function(_, _, _, v99)
        return v99.schema;
    end, 
    deprecationReason = nil, 
    extensions = nil, 
    astNode = nil
};
local v105 = {
    name = "__type", 
    type = v35, 
    description = "Request the type information of a single type.", 
    args = {
        {
            name = "name", 
            description = nil, 
            type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
            defaultValue = nil, 
            deprecationReason = nil, 
            extensions = nil, 
            astNode = nil
        }
    }, 
    resolve = function(_, v102, _, v104)
        return v104.schema:getType(v102.name);
    end, 
    deprecationReason = nil, 
    extensions = nil, 
    astNode = nil
};
local v110 = {
    name = "__typename", 
    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
    description = "The name of the current Object type at runtime.", 
    args = {}, 
    resolve = function(_, _, _, v109)
        return v109.parentType.name;
    end, 
    deprecationReason = nil, 
    extensions = nil, 
    astNode = nil
};
local v111 = l_Object_0.freeze({
    v45, 
    v33, 
    v34, 
    v35, 
    v36, 
    v37, 
    v38, 
    v32
});
return {
    introspectionTypes = v111, 
    isIntrospectionType = function(v112)
        return l_Array_0.some(v111, function(v113)
            return v112.name == v113.name;
        end);
    end, 
    TypeNameMetaFieldDef = v110, 
    TypeMetaFieldDef = v105, 
    SchemaMetaFieldDef = v100, 
    TypeKind = v31, 
    __TypeKind = v32, 
    __Schema = v45, 
    __Directive = v33, 
    __DirectiveLocation = v34, 
    __Type = v35, 
    __Field = v36, 
    __InputValue = v37, 
    __EnumValue = v38
};
