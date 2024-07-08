local l_Parent_0 = script:FindFirstAncestor("ApolloProfileInsights").Parent;
local v1 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.GraphQLServer);
return function(v3, v4)
    if v3 and v3.profilesInsightsByUserIds then
        local l_profilesInsightsByUserIds_0 = v3.profilesInsightsByUserIds;
        return l_profilesInsightsByUserIds_0[v1.List.findWhere(l_profilesInsightsByUserIds_0, function(v6, _)
            return v6.targetUserId == tostring(v4);
        end)];
    else
        return nil;
    end;
end;
