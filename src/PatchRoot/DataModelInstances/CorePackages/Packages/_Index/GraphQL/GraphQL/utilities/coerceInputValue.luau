local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_printPathArray_0 = require(l_jsutils_0.printPathArray).printPathArray;
local l_addPath_0 = require(l_jsutils_0.Path).addPath;
local v14 = require(l_jsutils_0.instanceOf);
local v15 = require(l_luaUtils_0.null);
local v16 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v16.isNillish;
local l_isNotNillish_0 = v16.isNotNillish;
local l_pathToArray_0 = require(l_jsutils_0.Path).pathToArray;
local l_isIteratableObject_0 = require(l_jsutils_0.isIteratableObject).isIteratableObject;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v22 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v22.isLeafType;
local l_isInputObjectType_0 = v22.isInputObjectType;
local l_isListType_0 = v22.isListType;
local l_isNonNullType_0 = v22.isNonNullType;
local v27 = nil;
local v28 = nil;
local function v32(v29, v30, v31)
    return v27(v29, v30, v31 or v28);
end;
v28 = function(v33, v34, v35)
    local v36 = "Invalid value " .. l_inspect_0(v34);
    if #v33 > 0 then
        v36 = v36 .. " at \"value" .. l_printPathArray_0(v33) .. "\"";
    end;
    v35.message = v36 .. ": " .. v35.message;
    error(v35);
end;
v27 = function(v37, v38, v39, v40)
    if not l_isNonNullType_0(v38) then
        if not l_isNillish_0(v37) then
            if not l_isListType_0(v38) then
                if not l_isInputObjectType_0(v38) then
                    if not l_isLeafType_0(v38) then
                        l_invariant_0(false, "Unexpected input type: " .. l_inspect_0(v38));
                        return ;
                    else
                        local v41 = nil;
                        local l_status_0, l_result_0 = pcall(v38.parseValue, v38, v37);
                        if l_status_0 then
                            v41 = l_result_0;
                            if v41 == nil then
                                v39(l_pathToArray_0(v40), v37, l_GraphQLError_0.new(("Expected type \"%s\"."):format(v38.name)));
                            end;
                            return v41;
                        elseif not v14(l_result_0, l_GraphQLError_0) then
                            v39(l_pathToArray_0(v40), v37, l_GraphQLError_0.new("Expected type \"" .. v38.name .. "\". " .. l_result_0.message, nil, nil, nil, nil, l_result_0));
                            return ;
                        else
                            v39(l_pathToArray_0(v40), v37, l_result_0);
                            return ;
                        end;
                    end;
                elseif l_isObjectLike_0(v37) then
                    local v44 = {};
                    local v45 = v38:getFields();
                    for _, v47 in ipairs(v45:values()) do
                        local v48 = v37[v47.name];
                        if v48 == nil then
                            if v47.defaultValue ~= nil then
                                v44[v47.name] = v47.defaultValue;
                            elseif l_isNonNullType_0(v47.type) then
                                v39(l_pathToArray_0(v40), v37, l_GraphQLError_0.new("Field \"" .. v47.name .. "\" of required type \"" .. l_inspect_0(v47.type) .. "\" was not provided."));
                            end;
                        else
                            v44[v47.name] = v27(v48, v47.type, v39, l_addPath_0(v40, v47.name, v38.name));
                        end;
                    end;
                    for _, v50 in ipairs(l_Object_0.keys(v37)) do
                        if not v45:get(v50) then
                            v39(l_pathToArray_0(v40), v37, l_GraphQLError_0.new(("Field \"%s\" is not defined by type \"%s\".%s"):format(v50, v38.name, l_didYouMean_0((l_suggestionList_0(v50, v38:getFields():keys()))))));
                        end;
                    end;
                    return v44;
                else
                    v39(l_pathToArray_0(v40), v37, l_GraphQLError_0.new("Expected type \"" .. v38.name .. "\" to be an object."));
                    return ;
                end;
            else
                local l_ofType_0 = v38.ofType;
                if not l_isIteratableObject_0(v37) then
                    return {
                        v27(v37, l_ofType_0, v39, v40)
                    };
                else
                    return l_Array_0.from(v37, function(v52, v53)
                        return v27(v52, l_ofType_0, v39, (l_addPath_0(v40, v53, nil)));
                    end);
                end;
            end;
        else
            return v15;
        end;
    elseif not l_isNotNillish_0(v37) then
        v39(l_pathToArray_0(v40), v37, l_GraphQLError_0.new("Expected non-nullable type \"" .. l_inspect_0(v38) .. "\" not to be null."));
        return ;
    else
        return v27(v37, v38.ofType, v39, v40);
    end;
end;
return {
    coerceInputValue = v32
};
