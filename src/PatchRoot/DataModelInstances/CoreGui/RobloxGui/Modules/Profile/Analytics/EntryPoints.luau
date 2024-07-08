return require(script:FindFirstAncestor("Profile").dependencies).enumerate(script.Name, {
    HomePageSelf = "homePageSelf", 
    MorePageSelf = "morePageSelf", 
    HomePageFriendsCarousel = "homePageFriendsCarousel", 
    GameDetailsDeveloper = "gameDetailsDeveloper", 
    PlayerSearch = "playerSearch"
});
