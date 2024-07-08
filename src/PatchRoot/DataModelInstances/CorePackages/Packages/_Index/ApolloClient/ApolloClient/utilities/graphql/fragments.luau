local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v6 = {};
local _ = require(l_Parent_1.GraphQL);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_Error_0 = v2.Error;
v6.getFragmentQueryDocument = function(v10, v11)
    local l_v11_0 = v11;
    local v13 = {};
    l_Array_0.forEach(v10.definitions, function(v14)
        if v14.kind == "OperationDefinition" then
            error(l_Error_0.new(("Found a %s operation%s. "):format(tostring(v14.operation), not l_Boolean_0.toJSBoolean(v14.name) and "" or (" named '%s'"):format((tostring(v14.name.value)))) .. "No operations are allowed when using a fragment as a query. Only fragments are allowed."));
        end;
        if v14.kind == "FragmentDefinition" then
            table.insert(v13, v14);
        end;
    end);
    if typeof(l_v11_0) == "nil" then
        l_invariant_0(#v13 == 1, string.format("Found %s fragments. `fragmentName` must be provided when there is not exactly 1 fragment.", (tostring(#v13))));
        l_v11_0 = v13[1].name.value;
    end;
    return (l_Object_0.assign({}, v10, {
        definitions = l_Array_0.concat({}, {
            {
                kind = "OperationDefinition", 
                operation = "query", 
                selectionSet = {
                    kind = "SelectionSet", 
                    selections = {
                        {
                            kind = "FragmentSpread", 
                            name = {
                                kind = "Name", 
                                value = l_v11_0
                            }
                        }
                    }
                }
            }
        }, v10.definitions)
    }));
end;
v6.createFragmentMap = function(v15)
    local v16 = if v15 ~= nil then v15 else {};
    local v17 = {};
    l_Array_0.forEach(v16, function(v18)
        v17[v18.name.value] = v18;
    end);
    return v17;
end;
v6.getFragmentFromSelection = function(v19, v20)
    local l_kind_0 = v19.kind;
    if l_kind_0 == "InlineFragment" then
        return v19;
    elseif l_kind_0 == "FragmentSpread" then
        local v22 = v20 and v20[v19.name.value];
        l_invariant_0(v22, ("No fragment named %s."):format(v19.name.value));
        return v22;
    else
        return nil;
    end;
end;
return v6;
