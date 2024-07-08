return require(script:FindFirstAncestor("Profile").dependencies).enumerate(script.Name, {
    Friends = "friends", 
    Followers = "followers", 
    ViewPlayerProfile = "viewPlayerProfile", 
    ContextualMenu = "contextualMenu", 
    Following = "following", 
    ViewCatalogItem = "viewCatalogItem", 
    GameDetails = "gameDetails", 
    PurchaseGame = "purchaseGame"
});
