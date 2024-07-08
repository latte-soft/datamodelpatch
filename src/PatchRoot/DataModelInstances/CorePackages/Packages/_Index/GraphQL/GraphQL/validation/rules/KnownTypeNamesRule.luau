local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Map_0 = v3.Map;
local l_Object_0 = v3.Object;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v10 = require(l_Parent_0.language.predicates);
local l_isTypeDefinitionNode_0 = v10.isTypeDefinitionNode;
local l_isTypeSystemDefinitionNode_0 = v10.isTypeSystemDefinitionNode;
local l_isTypeSystemExtensionNode_0 = v10.isTypeSystemExtensionNode;
local l_type_0 = l_Parent_0.type;
local l_specifiedScalarTypes_0 = require(l_type_0.scalars).specifiedScalarTypes;
local l_introspectionTypes_0 = require(l_type_0.introspection).introspectionTypes;
local v17 = {};
local v18 = nil;
local v19 = nil;
local v20 = nil;
v17.KnownTypeNamesRule = function(v21)
    local v22 = v21:getSchema();
    local v23 = l_Map_0.new();
    if v22 then
        v23 = v22:getTypeMap();
    end;
    local v24 = {};
    for _, v26 in ipairs(v21:getDocument().definitions) do
        if l_isTypeDefinitionNode_0(v26) then
            v24[v26.name.value] = true;
        end;
    end;
    local v27 = l_Array_0.concat(v23:keys(), l_Object_0.keys(v24));
    return {
        NamedType = function(_, v29, _, v31, _, v33)
            local l_value_0 = v29.name.value;
            if not (v23:get(l_value_0) or v24[l_value_0]) then
                local v35 = v33[3] or v31;
                local v36 = false;
                if v35 ~= nil then
                    v36 = v20(v35);
                end;
                if not v36 or not v19(l_value_0) then
                    v21:reportError(l_GraphQLError_0.new(("Unknown type \"%s\"."):format(l_value_0) .. l_didYouMean_0((l_suggestionList_0(l_value_0, not not v36 and l_Array_0.concat(v18, v27) or v27))), v29));
                else
                    return ;
                end;
            end;
        end
    };
end;
v18 = l_Array_0.map(l_Array_0.concat(l_specifiedScalarTypes_0, l_introspectionTypes_0), function(v37)
    return v37.name;
end);
v19 = function(v38)
    return l_Array_0.indexOf(v18, v38) ~= -1;
end;
v20 = function(v39)
    return not l_Array_0.isArray(v39) and (l_isTypeSystemDefinitionNode_0(v39) or l_isTypeSystemExtensionNode_0(v39));
end;
return v17;
