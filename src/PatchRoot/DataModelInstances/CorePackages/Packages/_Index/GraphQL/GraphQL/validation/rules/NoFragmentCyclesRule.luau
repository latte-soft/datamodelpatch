local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
return {
    NoFragmentCyclesRule = function(v3)
        local v4 = {};
        local v5 = {};
        local v6 = {};
        local function v7(v8)
            if not v4[v8.name.value] then
                local l_value_0 = v8.name.value;
                v4[l_value_0] = true;
                local v10 = v3:getFragmentSpreads(v8.selectionSet);
                if #v10 == 0 then
                    return ;
                else
                    v6[l_value_0] = #v5;
                    for _, v12 in ipairs(v10) do
                        local l_value_1 = v12.name.value;
                        local v14 = v6[l_value_1];
                        table.insert(v5, v12);
                        if v14 == nil then
                            local v15 = v3:getFragment(l_value_1);
                            if v15 then
                                v7(v15);
                            end;
                        else
                            local v16 = l_Array_0.slice(v5, v14 + 1);
                            local v18 = table.concat(l_Array_0.map(l_Array_0.slice(v16, 1, #v16), function(v17)
                                return "\"" .. v17.name.value .. "\"";
                            end), ", ");
                            v3:reportError(l_GraphQLError_0.new(("Cannot spread fragment \"%s\" within itself"):format(l_value_1) .. (v18 ~= "" and (" via %s."):format(v18) or "."), v16));
                        end;
                        table.remove(v5);
                    end;
                    v6[l_value_0] = nil;
                    return ;
                end;
            else
                return ;
            end;
        end;
        return {
            OperationDefinition = function()
                return false;
            end, 
            FragmentDefinition = function(_, v20)
                v7(v20);
                return false;
            end
        };
    end
};
