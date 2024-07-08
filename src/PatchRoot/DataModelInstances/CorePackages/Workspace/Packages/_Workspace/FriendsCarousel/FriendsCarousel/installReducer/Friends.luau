local v0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies);
local l_RoduxFriends_0 = v0.RoduxFriends;
return v0.convertActions(l_RoduxFriends_0.installReducer(), v0.friendsActionAdaptor(l_RoduxFriends_0), {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0
    }, 
    recommendations = {}, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}
});
