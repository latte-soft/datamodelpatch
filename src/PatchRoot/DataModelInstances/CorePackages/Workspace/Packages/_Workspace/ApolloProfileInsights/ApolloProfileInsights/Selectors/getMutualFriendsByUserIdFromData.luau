local l_Parent_0 = script:FindFirstAncestor("ApolloProfileInsights").Parent;
local v1 = require(script.Parent.getProfileInsightsByUserIdFromData);
local _ = require(l_Parent_0.GraphQLServer);
return function(v3, v4)
    local v5 = v1(v3, v4);
    local v6;
    if not v5 then
        v6 = {};
    else
        v6 = v5.mutualFriends;
        if not v6 then
            return {};
        end;
    end;
    return v6;
end;
