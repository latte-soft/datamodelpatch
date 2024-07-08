local l_Object_0 = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object;
return function(v1, v2)
    local v3 = l_Object_0.assign({}, v1, v2);
    l_Object_0.assign(v3, {
        Query = l_Object_0.assign({}, v1.Query or {}, v2.Query or {}), 
        Mutation = l_Object_0.assign({}, v1.Mutation or {}, v2.Mutation or {})
    });
    return v3;
end;
