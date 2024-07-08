local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_llama_0 = v0.llama;
local l_RoduxUsers_0 = v0.RoduxUsers;
local function v4(v3)
    return l_RoduxUsers_0.Actions.UserUpdated({
        id = v3.id, 
        username = v3.name, 
        displayName = v3.displayName, 
        hasVerifiedBadge = v3.hasVerifiedBadge
    });
end;
return {
    AddUser = function(v5)
        return {
            v4(v5.user)
        };
    end, 
    AddUsers = function(v6)
        return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v6.users, v4));
    end
};
