local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_coerceToMap_0 = v1.coerceToMap;
local _ = require(l_Parent_0.jsutils.ObjMap);
local _ = require(script.Parent.Parent.jsutils.ObjMap);
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_toObjMap_0 = require(script.Parent.Parent.jsutils.toObjMap).toObjMap;
local l_devAssert_0 = require(script.Parent.Parent.jsutils.devAssert).devAssert;
local v12 = require(script.Parent.Parent.jsutils.instanceOf);
local l_isObjectLike_0 = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike;
local _ = require(script.Parent.Parent.language.ast);
local l_DirectiveLocation_0 = require(script.Parent.Parent.language.directiveLocation).DirectiveLocation;
local v16 = require(script.Parent.definition);
local v17 = require(script.Parent.scalars);
local l_GraphQLString_0 = v17.GraphQLString;
local l_GraphQLBoolean_0 = v17.GraphQLBoolean;
local l_argsToArgsConfig_0 = v16.argsToArgsConfig;
local l_GraphQLNonNull_0 = v16.GraphQLNonNull;
local v22 = nil;
isDirective = function(v23)
    return v12(v23, v22);
end;
assertDirective = function(v24)
    if not isDirective(v24) then
        error(l_Error_0.new(("Expected %s to be a GraphQL directive."):format(l_inspect_0(v24))));
    end;
    return v24;
end;
v22 = {};
v22.__index = v22;
v22.new = function(v25)
    local v26 = {
        name = v25.name, 
        description = v25.description, 
        locations = v25.locations, 
        isRepeatable = not not v25.isRepeatable or false, 
        extensions = v25.extensions and l_toObjMap_0(v25.extensions), 
        astNode = v25.astNode
    };
    l_devAssert_0(v25.name, "Directive must be named.");
    l_devAssert_0(l_Array_0.isArray(v25.locations), ("@%s locations must be an Array."):format(v25.name));
    local v27 = if not v25.args then {} else v25.args;
    l_devAssert_0(not not l_isObjectLike_0(v27) and not (l_Array_0.isArray(v27) and next(v27) ~= nil) or v12(v27, l_Map_0), ("@%s args must be an object with argument names as keys."):format(v25.name));
    v26.args = l_Array_0.map(l_coerceToMap_0(v27):entries(), function(v28)
        local v29 = v28[1];
        local v30 = v28[2];
        return {
            name = v29, 
            description = v30.description, 
            type = v30.type, 
            defaultValue = v30.defaultValue, 
            deprecationReason = v30.deprecationReason, 
            extensions = v30.extensions and l_toObjMap_0(v30.extensions), 
            astNode = v30.astNode
        };
    end);
    return (setmetatable(v26, v22));
end;
v22.toConfig = function(v31)
    return {
        name = v31.name, 
        description = v31.description, 
        locations = v31.locations, 
        args = l_argsToArgsConfig_0(v31.args), 
        isRepeatable = v31.isRepeatable, 
        extensions = v31.extensions, 
        astNode = v31.astNode
    };
end;
v22.__tostring = function(v32)
    return v32:toString();
end;
v22.toString = function(v33)
    return "@" .. v33.name;
end;
v22.toJSON = function(v34)
    return v34:toString();
end;
local v35 = v22.new({
    name = "include", 
    description = "Directs the executor to include this field or fragment only when the `if` argument is true.", 
    locations = {
        l_DirectiveLocation_0.FIELD, 
        l_DirectiveLocation_0.FRAGMENT_SPREAD, 
        l_DirectiveLocation_0.INLINE_FRAGMENT
    }, 
    args = l_Map_0.new({
        {
            "if", 
            {
                type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                description = "Included when true."
            }
        }
    })
});
local v36 = v22.new({
    name = "skip", 
    description = "Directs the executor to skip this field or fragment when the `if` argument is true.", 
    locations = {
        l_DirectiveLocation_0.FIELD, 
        l_DirectiveLocation_0.FRAGMENT_SPREAD, 
        l_DirectiveLocation_0.INLINE_FRAGMENT
    }, 
    args = l_Map_0.new({
        {
            "if", 
            {
                type = l_GraphQLNonNull_0.new(l_GraphQLBoolean_0), 
                description = "Skipped when true."
            }
        }
    })
});
local v37 = v22.new({
    name = "deprecated", 
    description = "Marks an element of a GraphQL schema as no longer supported.", 
    locations = {
        l_DirectiveLocation_0.FIELD_DEFINITION, 
        l_DirectiveLocation_0.ARGUMENT_DEFINITION, 
        l_DirectiveLocation_0.INPUT_FIELD_DEFINITION, 
        l_DirectiveLocation_0.ENUM_VALUE
    }, 
    args = l_Map_0.new({
        {
            "reason", 
            {
                type = l_GraphQLString_0, 
                description = "Explains why this element was deprecated, usually also including a suggestion for how to access supported similar data. Formatted using the Markdown syntax, as specified by [CommonMark](https://commonmark.org/).", 
                defaultValue = "No longer supported"
            }
        }
    })
});
local v38 = v22.new({
    name = "specifiedBy", 
    description = "Exposes a URL that specifies the behaviour of this scalar.", 
    locations = {
        l_DirectiveLocation_0.SCALAR
    }, 
    args = l_Map_0.new({
        {
            "url", 
            {
                type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                description = "The URL that specifies the behaviour of this scalar."
            }
        }
    })
});
local v39 = l_Object_0.freeze({
    v35, 
    v36, 
    v37, 
    v38
});
return {
    isDirective = isDirective, 
    assertDirective = assertDirective, 
    GraphQLDirective = v22, 
    GraphQLIncludeDirective = v35, 
    GraphQLSkipDirective = v36, 
    DEFAULT_DEPRECATION_REASON = "No longer supported", 
    GraphQLDeprecatedDirective = v37, 
    GraphQLSpecifiedByDirective = v38, 
    specifiedDirectives = v39, 
    isSpecifiedDirective = function(v40)
        return l_Array_0.some(v39, function(v41)
            return v41.name == v40.name;
        end);
    end
};
