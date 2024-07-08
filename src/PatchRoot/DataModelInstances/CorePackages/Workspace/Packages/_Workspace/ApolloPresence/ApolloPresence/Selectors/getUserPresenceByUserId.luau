local l_fragments_0 = require(script:FindFirstAncestor("ApolloPresence").Parent.ApolloLocalState).fragments;
return function(v1, v2)
    return (v1.cache:readFragment({
        id = v1.cache:identify({
            __typename = "UserPresence", 
            id = v2.userId
        }), 
        fragment = l_fragments_0.userPresenceAllFields
    }));
end;
