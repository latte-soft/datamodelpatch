local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local _ = require(l_Parent_0.ApolloClient);
local _ = require(l_Parent_0.React);
local l_useUserProfilesFetch_0 = require(script.Parent.Hooks).useUserProfilesFetch;
return function(v4)
    return v4.renderComponent((l_useUserProfilesFetch_0({
        userIds = v4.userIds, 
        query = v4.query
    })));
end;
