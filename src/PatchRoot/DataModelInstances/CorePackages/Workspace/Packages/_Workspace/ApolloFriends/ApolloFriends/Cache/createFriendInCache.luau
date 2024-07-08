local l_gql_0 = require(script:FindFirstAncestor("ApolloFriends").Parent.ApolloClient).gql;
return function(v1, v2)
    return (v1.cache:writeFragment({
        data = {
            __typename = "Friend", 
            id = v2.userId, 
            targetUserId = v2.targetUserId, 
            hasVerifiedBadge = v2.hasVerifiedBadge or false, 
            displayName = ""
        }, 
        fragment = l_gql_0("\t\t\tfragment NewFriend on Friend {\n\t\t\t\tid\n\t\t\t\ttargetUserId\n\t\t\t\thasVerifiedBadge\n\t\t\t\tdisplayName\n\t\t\t}\n\t\t")
    }));
end;
