return require(script:FindFirstAncestor("FriendsLanding").dependencies).enumerate(script.Name, {
    ContactWarningSeen = "contactWarningSeen", 
    ContactImporterBannerSeen = "contactImporterBannerSeen", 
    ContactImporterOnAddFriends = "contactImporterOnAddFriends", 
    FriendPruningTooltipSeen = "friendPruningTooltipSeen", 
    FriendPruningNewBadgeSeen = "friendPruningNewBadgeSeen", 
    ProfileQRCodeBannerSeen = "profileQRCodeBannerSeen"
});
