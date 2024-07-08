local l_Object_0 = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Object;
return function(v1)
    return (l_Object_0.assign({}, v1.Query or {}, v1.Mutation or {}));
end;
