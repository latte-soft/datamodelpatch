local v0 = require(script:FindFirstAncestor("PYMKCarousel").dependencies);
local l_RoduxFriends_0 = v0.RoduxFriends;
local l_convertActions_0 = v0.convertActions;
local l_friendsActionAdaptor_0 = v0.friendsActionAdaptor;
local l_llama_0 = v0.llama;
local v5 = require(script.Parent.friendsOmniActionAdaptor);
local v6 = {
    countsByUserId = {}, 
    byUserId = {}, 
    requests = {
        receivedCount = 0, 
        byUserId = {}, 
        mutualFriends = {}, 
        sentAt = {}, 
        sourceUniverseIds = {}
    }, 
    recommendations = {
        byUserId = {}, 
        bySource = {}
    }, 
    friendshipStatus = {}, 
    friendsRankByUserId = {}
};
local v7 = l_RoduxFriends_0.installReducer();
local function _(v8)
    return l_llama_0.Dictionary.join(l_friendsActionAdaptor_0(l_RoduxFriends_0), v5(v8));
end;
return function(v10)
    return l_convertActions_0(v7, l_llama_0.Dictionary.join(l_friendsActionAdaptor_0(l_RoduxFriends_0), v5(v10)), v6);
end;
