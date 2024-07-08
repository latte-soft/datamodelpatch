local l_Parent_0 = script.Parent.Parent.Parent;
local l_language_0 = l_Parent_0.language;
local l_jsutils_0 = l_Parent_0.jsutils;
local v3 = require(l_jsutils_0.instanceOf);
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_print_0 = require(l_language_0.printer).print;
local v10 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v10.isLeafType;
local l_isInputObjectType_0 = v10.isInputObjectType;
local l_isListType_0 = v10.isListType;
local l_isNonNullType_0 = v10.isNonNullType;
local l_isRequiredInputField_0 = v10.isRequiredInputField;
local l_getNullableType_0 = v10.getNullableType;
local l_getNamedType_0 = v10.getNamedType;
local v18 = {};
local v19 = nil;
v18.ValuesOfCorrectTypeRule = function(v20)
    return {
        ListValue = function(_, v22)
            if l_isListType_0((l_getNullableType_0(v20:getParentInputType()))) then
                return ;
            else
                v19(v20, v22);
                return false;
            end;
        end, 
        ObjectValue = function(_, v24)
            local v25 = l_getNamedType_0(v20:getInputType());
            if l_isInputObjectType_0(v25) then
                local v27 = l_keyMap_0(v24.fields, function(v26)
                    return v26.name.value;
                end);
                for _, v29 in ipairs(v25:getFields():values()) do
                    if not (v27[v29.name] or not l_isRequiredInputField_0(v29)) then
                        v20:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" of required type \"%s\" was not provided."):format(v25.name, v29.name, (l_inspect_0(v29.type))), v24));
                    end;
                end;
                return ;
            else
                v19(v20, v24);
                return false;
            end;
        end, 
        ObjectField = function(_, v31)
            local v32 = l_getNamedType_0(v20:getParentInputType());
            if not (v20:getInputType() or not l_isInputObjectType_0(v32)) then
                v20:reportError(l_GraphQLError_0.new(("Field \"%s\" is not defined by type \"%s\"."):format(v31.name.value, v32.name) .. l_didYouMean_0((l_suggestionList_0(v31.name.value, v32:getFields():keys()))), v31));
            end;
        end, 
        NullValue = function(_, v34)
            local v35 = v20:getInputType();
            if l_isNonNullType_0(v35) then
                v20:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s."):format(l_inspect_0(v35), l_print_0(v34)), v34));
            end;
        end, 
        EnumValue = function(_, v37)
            return v19(v20, v37);
        end, 
        IntValue = function(_, v39)
            return v19(v20, v39);
        end, 
        FloatValue = function(_, v41)
            return v19(v20, v41);
        end, 
        StringValue = function(_, v43)
            return v19(v20, v43);
        end, 
        BooleanValue = function(_, v45)
            return v19(v20, v45);
        end
    };
end;
v19 = function(v46, v47)
    local v48 = v46:getInputType();
    if v48 then
        local v49 = l_getNamedType_0(v48);
        if l_isLeafType_0(v49) then
            xpcall(function()
                if v49:parseLiteral(v47, nil) == nil then
                    v46:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s."):format(l_inspect_0(v48), l_print_0(v47)), v47));
                end;
            end, function(v50)
                local v51 = l_inspect_0(v48);
                if not v3(v50, l_GraphQLError_0) then
                    v46:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s; "):format(v51, l_print_0(v47)) .. v50.message, v47, nil, nil, nil, v50));
                    return ;
                else
                    v46:reportError(v50);
                    return ;
                end;
            end);
            return ;
        else
            v46:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s."):format(l_inspect_0(v48), l_print_0(v47)), v47));
            return ;
        end;
    else
        return ;
    end;
end;
return v18;
