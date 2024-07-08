local v0 = require(script.Parent.Parent.dependencies);
return v0.enumerate(script.Name, {
    CarouselLoadedWithUsers = "CarouselLoadedWithUsers", 
    UserSeen = "UserSeen", 
    UserPressed = "UserPressed", 
    RequestFriendship = "RequestFriendship", 
    AcceptFriendship = "AcceptFriendship", 
    CarouselGenericTileClicked = if not v0.getFFlagPYMKAddFriendsEntry() then nil else "CarouselGenericTileClicked"
});
