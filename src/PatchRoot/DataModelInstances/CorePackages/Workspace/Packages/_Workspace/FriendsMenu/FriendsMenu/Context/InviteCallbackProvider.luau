local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.React);
local v2 = require(l_Parent_0.InviteCallbackContext);
return function(v3)
    return v1.createElement(v2.Provider, {
        value = {
            inviteSingleFriend = v3.inviteSingleFriend, 
            inviteMultiFriends = v3.inviteMultiFriends
        }
    }, v3.children);
end;
