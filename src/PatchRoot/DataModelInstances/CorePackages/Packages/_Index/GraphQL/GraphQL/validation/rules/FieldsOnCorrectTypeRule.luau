local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_naturalCompare_0 = require(l_jsutils_0.naturalCompare).naturalCompare;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v7 = require(l_Parent_0.type.definition);
local l_isObjectType_0 = v7.isObjectType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isAbstractType_0 = v7.isAbstractType;
local v11 = nil;
local v12 = nil;
local v20 = {
    FieldsOnCorrectTypeRule = function(v13)
        return {
            Field = function(_, v15)
                local v16 = v13:getParentType();
                if not (not v16 or v13:getFieldDef()) then
                    local v17 = v13:getSchema();
                    local l_value_0 = v15.name.value;
                    local v19 = l_didYouMean_0("to use an inline fragment on", v12(v17, v16, l_value_0));
                    if v19 == "" then
                        v19 = l_didYouMean_0(v11(v16, l_value_0));
                    end;
                    v13:reportError(l_GraphQLError_0.new(("Cannot query field \"%s\" on type \"%s\"."):format(l_value_0, v16.name) .. v19, v15));
                end;
            end
        };
    end
};
v12 = function(v21, v22, v23)
    if l_isAbstractType_0(v22) then
        local v24 = {};
        local v25 = {};
        for _, v27 in ipairs(v21:getPossibleTypes(v22)) do
            if v27:getFields():get(v23) then
                v24[v27] = true;
                v25[v27.name] = 1;
                for _, v29 in ipairs(v27:getInterfaces()) do
                    if v29:getFields():get(v23) then
                        v24[v29] = true;
                        v25[v29.name] = (v25[v29.name] or 0) + 1;
                    end;
                end;
            end;
        end;
        local v30 = {};
        for v31, _ in pairs(v24) do
            table.insert(v30, v31);
        end;
        l_Array_0.sort(v30, function(v33, v34)
            local v35 = v25[v34.name] - v25[v33.name];
            if v35 ~= 0 then
                return v35;
            elseif not l_isInterfaceType_0(v33) or not v21:isSubType(v33, v34) then
                if not l_isInterfaceType_0(v34) or not v21:isSubType(v34, v33) then
                    return l_naturalCompare_0(v33.name, v34.name);
                else
                    return 1;
                end;
            else
                return -1;
            end;
        end);
        return l_Array_0.map(v30, function(v36)
            return v36.name;
        end);
    else
        return {};
    end;
end;
v11 = function(v37, v38)
    if not l_isObjectType_0(v37) and not l_isInterfaceType_0(v37) then
        return {};
    else
        return l_suggestionList_0(v38, (v37:getFields():keys()));
    end;
end;
return v20;
