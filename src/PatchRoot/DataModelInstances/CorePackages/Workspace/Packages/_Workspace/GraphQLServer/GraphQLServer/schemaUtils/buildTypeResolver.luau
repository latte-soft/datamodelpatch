local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.GraphQL);
local _ = require(l_Parent_0.LuauPolyfill);
return function(v3)
    return function(v4, v5, v6, v7)
        local v8 = v3[v7.name];
        if type(v8) == "table" and type(v8.__resolveType) == "function" then
            return v8.__resolveType(v4, v5, v6, v7);
        else
            return v7.name;
        end;
    end;
end;
