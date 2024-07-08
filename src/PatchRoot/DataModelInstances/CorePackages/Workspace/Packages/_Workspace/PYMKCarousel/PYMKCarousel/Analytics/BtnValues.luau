local v0 = require(script.Parent.Parent.dependencies);
local l_enumerate_0 = v0.enumerate;
local l_getFFlagPYMKAddFriendsEntry_0 = v0.getFFlagPYMKAddFriendsEntry;
return l_enumerate_0(script.Name, {
    RequestFriendship = "requestFriendship", 
    OpenPeopleList = "openPeopleList", 
    AcceptFriendship = "acceptFriendship", 
    FindFriends = not l_getFFlagPYMKAddFriendsEntry_0() and "" or "findFriends", 
    SeeAll = not l_getFFlagPYMKAddFriendsEntry_0() and "" or "seeAll"
});
