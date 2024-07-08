local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_isTypeDefinitionNode_0 = require(l_language_0.predicates).isTypeDefinitionNode;
local v13 = require(l_Parent_0.type.definition);
local l_isScalarType_0 = v13.isScalarType;
local l_isObjectType_0 = v13.isObjectType;
local l_isInterfaceType_0 = v13.isInterfaceType;
local l_isUnionType_0 = v13.isUnionType;
local l_isEnumType_0 = v13.isEnumType;
local l_isInputObjectType_0 = v13.isInputObjectType;
local v20 = {};
local v21 = nil;
local v22 = nil;
local v23 = nil;
v20.PossibleTypeExtensionsRule = function(v24)
    local v25 = v24:getSchema();
    local v26 = {};
    for _, v28 in ipairs(v24:getDocument().definitions) do
        if l_isTypeDefinitionNode_0(v28) then
            v26[v28.name.value] = v28;
        end;
    end;
    local function v35(v29)
        local l_value_0 = v29.name.value;
        local v31 = v26[l_value_0];
        local v32 = nil;
        if v25 then
            v32 = v25:getType(l_value_0);
        end;
        local v33 = nil;
        if not v31 then
            if v32 then
                v33 = v22(v32);
            end;
        else
            v33 = v21[v31.kind];
        end;
        if not v33 then
            local v34 = l_Object_0.keys(v26);
            if v25 then
                v34 = l_Array_0.concat(v34, v25:getTypeMap():keys());
            end;
            v24:reportError(l_GraphQLError_0.new(("Cannot extend type \"%s\" because it is not defined."):format(l_value_0) .. l_didYouMean_0((l_suggestionList_0(l_value_0, v34))), v29.name));
        elseif v33 ~= v29.kind then
            v24:reportError(l_GraphQLError_0.new(("Cannot extend non-%s type \"%s\"."):format(v23(v29.kind), l_value_0), not not v31 and {
                v31, 
                v29
            } or v29));
            return ;
        end;
    end;
    local function v37(_, ...)
        return v35(...);
    end;
    return {
        ScalarTypeExtension = v37, 
        ObjectTypeExtension = v37, 
        InterfaceTypeExtension = v37, 
        UnionTypeExtension = v37, 
        EnumTypeExtension = v37, 
        InputObjectTypeExtension = v37
    };
end;
v21 = {
    [l_Kind_0.SCALAR_TYPE_DEFINITION] = l_Kind_0.SCALAR_TYPE_EXTENSION, 
    [l_Kind_0.OBJECT_TYPE_DEFINITION] = l_Kind_0.OBJECT_TYPE_EXTENSION, 
    [l_Kind_0.INTERFACE_TYPE_DEFINITION] = l_Kind_0.INTERFACE_TYPE_EXTENSION, 
    [l_Kind_0.UNION_TYPE_DEFINITION] = l_Kind_0.UNION_TYPE_EXTENSION, 
    [l_Kind_0.ENUM_TYPE_DEFINITION] = l_Kind_0.ENUM_TYPE_EXTENSION, 
    [l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION] = l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION
};
v22 = function(v38)
    if not l_isScalarType_0(v38) then
        if not l_isObjectType_0(v38) then
            if not l_isInterfaceType_0(v38) then
                if not l_isUnionType_0(v38) then
                    if not l_isEnumType_0(v38) then
                        if not l_isInputObjectType_0(v38) then
                            l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v38));
                            return nil;
                        else
                            return l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION;
                        end;
                    else
                        return l_Kind_0.ENUM_TYPE_EXTENSION;
                    end;
                else
                    return l_Kind_0.UNION_TYPE_EXTENSION;
                end;
            else
                return l_Kind_0.INTERFACE_TYPE_EXTENSION;
            end;
        else
            return l_Kind_0.OBJECT_TYPE_EXTENSION;
        end;
    else
        return l_Kind_0.SCALAR_TYPE_EXTENSION;
    end;
end;
v23 = function(v39)
    if v39 == l_Kind_0.SCALAR_TYPE_EXTENSION then
        return "scalar";
    elseif v39 == l_Kind_0.OBJECT_TYPE_EXTENSION then
        return "object";
    elseif v39 == l_Kind_0.INTERFACE_TYPE_EXTENSION then
        return "interface";
    elseif v39 == l_Kind_0.UNION_TYPE_EXTENSION then
        return "union";
    elseif v39 == l_Kind_0.ENUM_TYPE_EXTENSION then
        return "enum";
    elseif v39 == l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION then
        return "input object";
    else
        l_invariant_0(false, "Unexpected kind: " .. l_inspect_0(v39));
        return "";
    end;
end;
return v20;
