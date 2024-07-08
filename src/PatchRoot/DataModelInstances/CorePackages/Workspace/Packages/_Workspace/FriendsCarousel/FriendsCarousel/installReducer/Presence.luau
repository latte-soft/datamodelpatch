local v0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies);
local l_RoduxPresence_0 = v0.RoduxPresence;
return v0.convertActions(l_RoduxPresence_0.installReducer(), v0.presenceActionAdaptor(l_RoduxPresence_0), {
    byUserId = {}, 
    byGameId = {}, 
    byGameInstanceId = {}, 
    byPlaceId = {}
});
