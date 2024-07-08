local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local _ = require(l_Parent_1.GraphQL);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_Map_0 = v3.Map;
local v9 = {
    Query = 0, 
    Mutation = 1, 
    Subscription = 2
};
v0.DocumentType = v9;
local v10 = l_Map_0.new(nil);
v0.operationName = function(v11)
    local v12 = nil;
    if v11 == v9.Query then
        return "Query";
    elseif v11 == v9.Mutation then
        return "Mutation";
    else
        if v11 == v9.Subscription then
            v12 = "Subscription";
        end;
        return v12;
    end;
end;
v0.parser = function(v13)
    local v14 = v10:get(v13);
    if v14 ~= nil then
        return v14;
    else
        local _ = nil;
        local v16 = nil;
        local _ = nil;
        l_invariant_0(l_Boolean_0.toJSBoolean(v13) and l_Boolean_0.toJSBoolean(v13.kind), ("Argument of %s passed to parser was not a valid GraphQL "):format((tostring(v13))) .. "DocumentNode. You may need to use 'graphql-tag' or another method " .. "to convert your operation into a document");
        local v19 = l_Array_0.filter(v13.definitions, function(v18)
            return v18.kind == "FragmentDefinition";
        end);
        local v22 = l_Array_0.filter(v13.definitions, function(v20)
            local v21 = false;
            if v20.kind == "OperationDefinition" then
                v21 = v20.operation == "query";
            end;
            return v21;
        end);
        local v25 = l_Array_0.filter(v13.definitions, function(v23)
            local v24 = false;
            if v23.kind == "OperationDefinition" then
                v24 = v23.operation == "mutation";
            end;
            return v24;
        end);
        local v28 = l_Array_0.filter(v13.definitions, function(v26)
            local v27 = false;
            if v26.kind == "OperationDefinition" then
                v27 = v26.operation == "subscription";
            end;
            return v27;
        end);
        local l_l_invariant_0_0 = l_invariant_0;
        local v30 = true;
        if #v19 ~= 0 then
            v30 = true;
            if #v22 == 0 then
                v30 = true;
                if #v25 == 0 then
                    v30 = #v28 ~= 0;
                end;
            end;
        end;
        l_l_invariant_0_0(v30, "Passing only a fragment to 'graphql' is not yet supported. " .. "You must include a query, subscription or mutation as well");
        l_invariant_0((#v22 + #v25) + #v28 <= 1, "react-apollo only supports a query, subscription, or a mutation per HOC. " .. ("%s had %s queries, %s "):format(tostring(v13), tostring(#v22), (tostring(#v28))) .. ("subscriptions and %s mutations. "):format((tostring(#v25))) .. "You can use 'compose' to join multiple operation types to a component");
        v16 = if #v22 ~= 0 then v9.Query else v9.Mutation;
        if #v22 == 0 and #v25 == 0 then
            v16 = v9.Subscription;
        end;
        l_l_invariant_0_0 = if #v22 > 0 then v22 else if #v25 > 0 then v25 else v28;
        l_invariant_0(#l_l_invariant_0_0 == 1, ("react-apollo only supports one definition per HOC. %s had "):format((tostring(v13))) .. ("%s definitions. "):format((tostring(#l_l_invariant_0_0))) .. "You can use 'compose' to join multiple operation types to a component");
        v30 = l_l_invariant_0_0[1];
        local v31 = {
            name = if not not v30.name and v30.name.kind == "Name" then v30.name.value else "data", 
            type = v16, 
            variables = not not v30.variableDefinitions and v30.variableDefinitions or {}
        };
        v10:set(v13, v31);
        return v31;
    end;
end;
return v0;
