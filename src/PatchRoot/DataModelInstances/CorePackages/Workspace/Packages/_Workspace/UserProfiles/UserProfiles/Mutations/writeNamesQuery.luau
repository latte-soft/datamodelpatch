local _ = require(script:FindFirstAncestor("UserProfiles").Parent.ApolloClient);
return function(v1)
    local l_client_0 = v1.client;
    local l_query_0 = v1.query;
    local l_userId_0 = v1.userId;
    local l_names_0 = v1.names;
    local _ = "";
    l_client_0:writeQuery({
        variables = {
            userIds = {
                l_userId_0
            }
        }, 
        query = l_query_0, 
        data = {
            userProfiles = {
                {
                    __typename = "UserProfile", 
                    id = l_userId_0, 
                    names = {
                        __typename = "Names", 
                        combinedName = if l_names_0.alias ~= "" then l_names_0.alias else if l_names_0.contactName ~= "" then l_names_0.contactName else if l_names_0.displayName ~= "" then l_names_0.displayName else l_names_0.username, 
                        alias = l_names_0.alias, 
                        contactName = l_names_0.contactName, 
                        displayName = l_names_0.displayName, 
                        username = l_names_0.username
                    }
                }
            }
        }
    });
end;
