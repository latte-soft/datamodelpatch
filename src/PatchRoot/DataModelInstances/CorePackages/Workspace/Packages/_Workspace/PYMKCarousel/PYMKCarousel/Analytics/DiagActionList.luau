local v0 = require(script.Parent.Parent.dependencies);
local v1 = require(script.Parent.EventNames);
local l_getFFlagPYMKAddFriendsEntry_0 = v0.getFFlagPYMKAddFriendsEntry;
local v3 = {
    [v1.CarouselLoadedWithUsers] = {
        name = game:DefineFastString("PYMKCarouselLoadedWithUsers", "PYMKCarouselLoadedWithUsers")
    }, 
    [v1.UserPressed] = {
        name = game:DefineFastString("PYMKCarouselUserPressed", "PYMKCarouselUserPressed")
    }, 
    [v1.RequestFriendship] = {
        name = game:DefineFastString("PYMKCarouselRequestFriendship", "PYMKCarouselRequestFriendship")
    }
};
if l_getFFlagPYMKAddFriendsEntry_0() then
    v3[v1.CarouselGenericTileClicked] = {
        name = game:DefineFastString("PYMKCarouselGenericTileClicked", "PYMKCarouselGenericTileClicked")
    };
end;
return v3;
