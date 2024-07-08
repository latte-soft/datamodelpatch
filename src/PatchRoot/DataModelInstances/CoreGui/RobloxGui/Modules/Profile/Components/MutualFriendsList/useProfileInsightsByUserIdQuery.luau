local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_useQuery_0 = v0.ApolloClientModule.useQuery;
local l_queries_0 = v0.ApolloLocalState.queries;
local _ = require(game:GetService("CorePackages").Workspace.Packages.GraphQLServer);
return function(v4)
    local v5 = l_useQuery_0(l_queries_0.profilesInsightsByUserIds, {
        errorPolicy = "all", 
        skip = not v4.userId or v4.skip, 
        variables = {
            userIds = {
                v4.userId
            }
        }
    });
    return ((not not v5 and v5.data) and v5.data.profilesInsightsByUserIds) and v5.data.profilesInsightsByUserIds[1] or {}, v5.loading;
end;
