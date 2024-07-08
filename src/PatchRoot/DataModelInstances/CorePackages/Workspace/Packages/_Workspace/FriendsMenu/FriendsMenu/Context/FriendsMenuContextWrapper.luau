local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.FriendsListContextProvider);
local v3 = require(l_Parent_0.InviteCallbackProvider);
local v4 = require(l_Parent_0.SelectedUsersContextProvider);
local v5 = require(l_Parent_1.React);
local l_GetFFlagEnableFriendMenuMultiSelect_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableFriendMenuMultiSelect;
return function(v7)
    return v5.createElement(v2, {
        isLoadingCustomParams = v7.isLoadingCustomParams
    }, v5.createElement(v3, {
        inviteSingleFriend = v7.inviteSingleFriend, 
        inviteMultiFriends = v7.inviteMultiFriends
    }, if not l_GetFFlagEnableFriendMenuMultiSelect_0() then v7.children else v5.createElement(v4, {}, v7.children)));
end;
