local l_script_FirstAncestor_0 = script:FindFirstAncestor("ApolloPresence");
local l_fragments_0 = require(l_script_FirstAncestor_0.Parent.ApolloLocalState).fragments;
local v2 = require(l_script_FirstAncestor_0.Formatters);
return function(v3, v4)
    return (v3.cache:writeFragment({
        id = v3.cache:identify({
            __typename = "UserPresence", 
            id = v4.id
        }), 
        fragment = l_fragments_0.userPresenceAllFields, 
        data = v2.formatUserPresence(v4)
    }));
end;
