local v0 = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState);
local v1 = require(script.Parent.isUserInConversation);
return function(v2, v3)
    local l_Users_0 = v2.Users;
    local v5 = {};
    for _, v7 in pairs(l_Users_0) do
        if not ((not (v7.id ~= tostring(v2.LocalUserId)) or not v7.isFriend) or v1(v7.id, v3)) then
            v5[v7.id] = v0(v2, v7);
        end;
    end;
    return v5;
end;
