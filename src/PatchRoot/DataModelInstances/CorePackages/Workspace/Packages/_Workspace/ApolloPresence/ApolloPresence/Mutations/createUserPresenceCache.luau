local l_script_FirstAncestor_0 = script:FindFirstAncestor("ApolloPresence");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_fragments_0 = require(l_Parent_0.ApolloLocalState).fragments;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Formatters);
return function(v5, v6)
    return (v5.cache:writeFragment({
        data = v3.Dictionary.join({
            __typename = "UserPresence"
        }, v4.formatUserPresence(v6)), 
        fragment = l_fragments_0.userPresenceAllFields
    }));
end;
