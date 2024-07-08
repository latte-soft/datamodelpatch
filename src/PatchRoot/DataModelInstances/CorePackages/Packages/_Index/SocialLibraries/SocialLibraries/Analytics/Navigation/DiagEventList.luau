local v0 = require(script.Parent.EventNames);
local _ = require(script.Parent.Parent.FireEvent.Types);
return {
    [v0.HomePage_AddFriends] = {
        name = game:DefineFastString("SocialNavigationHomePageAddFriends", "HomePageAddFriends")
    }, 
    [v0.HomePage_Carousel_LuaProfile] = {
        name = game:DefineFastString("SocialNavigationHomePageCarouselLuaProfile", "LuaProfileEntryHomePageFriendsCarousel")
    }, 
    [v0.HomePage_Carousel_FriendsLanding] = {
        name = game:DefineFastString("SocialNavigationHomePageFriendsLanding", "HomePageNavigationFriendsLanding")
    }, 
    [v0.MorePage_FriendsLanding] = {
        name = game:DefineFastString("SocialNavigationMorePageFriendsLanding", "MorePageNavigationFriendsLanding")
    }
};
