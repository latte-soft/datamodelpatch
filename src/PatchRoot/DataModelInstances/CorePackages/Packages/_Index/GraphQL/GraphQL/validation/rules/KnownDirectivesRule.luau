local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_DirectiveLocation_0 = require(l_language_0.directiveLocation).DirectiveLocation;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
local v10 = {};
local v11 = nil;
local v12 = nil;
v10.KnownDirectivesRule = function(v13)
    local v14 = {};
    local v15 = v13:getSchema();
    local l_l_specifiedDirectives_0_0 = l_specifiedDirectives_0;
    if v15 then
        l_l_specifiedDirectives_0_0 = v15:getDirectives();
    end;
    for _, v18 in ipairs(l_l_specifiedDirectives_0_0) do
        v14[v18.name] = v18.locations;
    end;
    for _, v20 in ipairs(v13:getDocument().definitions) do
        if v20.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            v14[v20.name.value] = l_Array_0.map(v20.locations, function(v21)
                return v21.value;
            end);
        end;
    end;
    return {
        Directive = function(_, v23, _, _, _, v27)
            local l_value_0 = v23.name.value;
            local v29 = v14[l_value_0];
            if v29 then
                local v30 = v11(v27);
                if v30 and l_Array_0.indexOf(v29, v30) == -1 then
                    v13:reportError(l_GraphQLError_0.new(("Directive \"@%s\" may not be used on %s."):format(l_value_0, v30), v23));
                end;
                return ;
            else
                v13:reportError(l_GraphQLError_0.new(("Unknown directive \"@%s\"."):format(l_value_0), v23));
                return ;
            end;
        end
    };
end;
v11 = function(v31)
    local v32 = v31[#v31];
    l_invariant_0(not l_Array_0.isArray(v32));
    local l_kind_0 = v32.kind;
    if l_kind_0 == l_Kind_0.OPERATION_DEFINITION then
        return v12(v32.operation);
    elseif l_kind_0 == l_Kind_0.FIELD then
        return l_DirectiveLocation_0.FIELD;
    elseif l_kind_0 == l_Kind_0.FRAGMENT_SPREAD then
        return l_DirectiveLocation_0.FRAGMENT_SPREAD;
    elseif l_kind_0 == l_Kind_0.INLINE_FRAGMENT then
        return l_DirectiveLocation_0.INLINE_FRAGMENT;
    elseif l_kind_0 == l_Kind_0.FRAGMENT_DEFINITION then
        return l_DirectiveLocation_0.FRAGMENT_DEFINITION;
    elseif l_kind_0 == l_Kind_0.VARIABLE_DEFINITION then
        return l_DirectiveLocation_0.VARIABLE_DEFINITION;
    elseif not (l_kind_0 ~= l_Kind_0.SCHEMA_DEFINITION) or l_kind_0 == l_Kind_0.SCHEMA_EXTENSION then
        return l_DirectiveLocation_0.SCHEMA;
    elseif not (l_kind_0 ~= l_Kind_0.SCALAR_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.SCALAR_TYPE_EXTENSION then
        return l_DirectiveLocation_0.SCALAR;
    elseif not (l_kind_0 ~= l_Kind_0.OBJECT_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.OBJECT_TYPE_EXTENSION then
        return l_DirectiveLocation_0.OBJECT;
    elseif l_kind_0 == l_Kind_0.FIELD_DEFINITION then
        return l_DirectiveLocation_0.FIELD_DEFINITION;
    elseif not (l_kind_0 ~= l_Kind_0.INTERFACE_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.INTERFACE_TYPE_EXTENSION then
        return l_DirectiveLocation_0.INTERFACE;
    elseif not (l_kind_0 ~= l_Kind_0.UNION_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.UNION_TYPE_EXTENSION then
        return l_DirectiveLocation_0.UNION;
    elseif not (l_kind_0 ~= l_Kind_0.ENUM_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.ENUM_TYPE_EXTENSION then
        return l_DirectiveLocation_0.ENUM;
    elseif l_kind_0 == l_Kind_0.ENUM_VALUE_DEFINITION then
        return l_DirectiveLocation_0.ENUM_VALUE;
    elseif not (l_kind_0 ~= l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION) or l_kind_0 == l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION then
        return l_DirectiveLocation_0.INPUT_OBJECT;
    elseif l_kind_0 == l_Kind_0.INPUT_VALUE_DEFINITION then
        return v31[#v31 - 2].kind == l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION and l_DirectiveLocation_0.INPUT_FIELD_DEFINITION or l_DirectiveLocation_0.ARGUMENT_DEFINITION;
    else
        return nil;
    end;
end;
v12 = function(v34)
    if v34 == "query" then
        return l_DirectiveLocation_0.QUERY;
    elseif v34 == "mutation" then
        return l_DirectiveLocation_0.MUTATION;
    elseif v34 == "subscription" then
        return l_DirectiveLocation_0.SUBSCRIPTION;
    else
        l_invariant_0(false, "Unexpected operation: " .. l_inspect_0(v34));
        return nil;
    end;
end;
return v10;
