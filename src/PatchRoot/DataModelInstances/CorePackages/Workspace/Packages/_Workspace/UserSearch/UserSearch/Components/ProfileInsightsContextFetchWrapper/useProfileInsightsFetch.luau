local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_useQuery_0 = require(l_script_FirstAncestor_0.Parent.ApolloClient).useQuery;
local v2 = require(l_script_FirstAncestor_0.Apollo.ProfilesInsightsQuery);
return function(v3, v4)
    return (l_useQuery_0(v2.query, {
        errorPolicy = "all", 
        skip = not v3 or #v3 == 0, 
        variables = {
            userIds = v3, 
            pageId = v2.createPageId(v4)
        }
    }));
end;
