return {
    GenreExplorer = "GenreExplorerLabel", 
    Carousel = "Carousel", 
    AvatarCarousel = "AvatarCarousel", 
    UserInfo = "UserInfo", 
    FriendCarousel = "FriendCarousel", 
    FriendRecommendationCarousel = "FriendRecommendationCarousel", 
    HomeGameGrid = "SortlessGrid", 
    JoinYourFriendsCarousel = "JoinYourFriendsCarousel", 
    SearchGameGrid = "SearchGameGrid", 
    SearchText = "SearchText", 
    UpsellCard = if not require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.Flags.GetFFlagUseUpsellCardOmniFeedItem)() then nil else "UpsellCard"
};
