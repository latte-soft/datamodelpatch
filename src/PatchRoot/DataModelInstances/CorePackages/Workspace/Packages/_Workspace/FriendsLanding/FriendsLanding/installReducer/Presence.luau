return require(script.Parent.convertActions)(require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.installReducer(), require(script.Parent.presenceActionAdaptor), {
    byUserId = {}, 
    byGameId = {}, 
    byGameInstanceId = {}, 
    byPlaceId = {}
});
