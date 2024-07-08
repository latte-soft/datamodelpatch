local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
return (v1.createContext({
    friends = {}, 
    hasFriends = false, 
    isFetchingFriends = false, 
    isFriendsListFetchFailed = false, 
    searchFriends = function()
        return {};
    end, 
    searchFriendsString = "", 
    friendsNames = {
        loading = true
    }
}));
