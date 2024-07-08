local v0 = require(script:FindFirstAncestor("FriendsCarousel").dependencies);
local l_RoduxUsers_0 = v0.RoduxUsers;
return v0.convertActions(l_RoduxUsers_0.installReducer(), v0.usersActionAdaptor(l_RoduxUsers_0), {
    byUserId = {}, 
    byUsername = {}
});
