local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.GraphQL);
local _ = require(l_Parent_0.LuauPolyfill);
local function v5(v3, v4)
    if not ((not ((not v3 or not v3.parentType) or not v3.fieldName) and type(v3.parentType.name) == "string") and type(v4[v3.parentType.name]) == "table") or type(v4[v3.parentType.name][v3.fieldName]) ~= "function" then
        return v1.defaultFieldResolver;
    else
        return v4[v3.parentType.name][v3.fieldName];
    end;
end;
return function(v6)
    return function(v7, v8, v9, v10)
        return v5(v10, v6)(v7, v8, v9, v10);
    end;
end;
