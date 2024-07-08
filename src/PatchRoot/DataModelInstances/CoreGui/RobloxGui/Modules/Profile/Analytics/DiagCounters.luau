local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v1 = require(script.Parent.EntryPoints);
local v2 = require(script.Parent.ButtonClickEvents);
local v3 = require(l_script_FirstAncestor_0.Common.ContextualMenuRowsEnums);
local v4 = require(l_script_FirstAncestor_0.Components.ProfilePrimaryContextualButton.ButtonStates);
return {
    UserLoadedPage = game:DefineFastString("LuaProfileUserLoadedPageCounter", "LuaProfile" .. "UserLoadedPage"), 
    UserLoadedPageWithData = game:DefineFastString("LuaProfileUserLoadedPageWithDataCounter", "LuaProfile" .. "UserLoadedPage" .. "WithData"), 
    [v1.HomePageSelf] = game:DefineFastString("LuaProfileEntryHomePageSelfCounter", "LuaProfile" .. "Entry" .. "HomePageSelf"), 
    [v1.MorePageSelf] = game:DefineFastString("LuaProfileEntryMorePageSelfCounter", "LuaProfile" .. "Entry" .. "MorePageSelf"), 
    [v1.HomePageFriendsCarousel] = game:DefineFastString("LuaProfileEntryHomePageFriendsCarouselCounter", "LuaProfile" .. "Entry" .. "HomePageFriendsCarousel"), 
    [v1.GameDetailsDeveloper] = game:DefineFastString("LuaProfileEntryGameDetailsDeveloperCounter", "LuaProfile" .. "Entry" .. "GameDetailsDeveloper"), 
    [v1.PlayerSearch] = game:DefineFastString("LuaProfileEntryPlayerSearchCounter", "LuaProfile" .. "Entry" .. "PlayerSearch"), 
    [v3.CHAT] = game:DefineFastString("LuaProfileNavigationContextualChatCounter", "LuaProfile" .. "Navigation" .. "ContextualChat"), 
    [v3.REPORT] = game:DefineFastString("LuaProfileNavigationContextualReportCounter", "LuaProfile" .. "Navigation" .. "ContextualReport"), 
    [v4.Chat] = game:DefineFastString("LuaProfileNavigationCTAChatCounter", "LuaProfile" .. "Navigation" .. "CTAChat"), 
    [v4.EditProfile] = game:DefineFastString("LuaProfileNavigationCTAEditProfileCounter", "LuaProfile" .. "Navigation" .. "CTAEditProfile"), 
    [v4.JoinExperience] = game:DefineFastString("LuaProfileNavigationCTAJoinExperienceCounter", "LuaProfile" .. "Navigation" .. "CTAJoinExperience"), 
    [v4.ShareProfileQRCode] = game:DefineFastString("LuaProfileNavigationCTAQRCode", "LuaProfile" .. "Navigation" .. "CTAQRCode"), 
    [v2.ViewCatalogItem] = game:DefineFastString("LuaProfileNavigationViewCatalogItemCounter", "LuaProfile" .. "Navigation" .. "ViewCatalogItem"), 
    [v2.Friends] = game:DefineFastString("LuaProfileNavigationViewFriendsCounter", "LuaProfile" .. "Navigation" .. "ViewFriends"), 
    [v2.Followers] = game:DefineFastString("LuaProfileNavigationViewFollowersCounter", "LuaProfile" .. "Navigation" .. "ViewFollowers"), 
    [v2.Following] = game:DefineFastString("LuaProfileNavigationViewFollowingCounter", "LuaProfile" .. "Navigation" .. "ViewFollowing"), 
    [v2.ViewPlayerProfile] = game:DefineFastString("LuaProfileNavigationViewPlayerProfileCounter", "LuaProfile" .. "Navigation" .. "ViewPlayerProfile"), 
    [v2.ContextualMenu] = game:DefineFastString("LuaProfileNavigationContextualMenuCounter", "LuaProfile" .. "Navigation" .. "ContextualMenu"), 
    [v2.PurchaseGame] = game:DefineFastString("LuaProfileNavigationPurchaseCounter", "LuaProfile" .. "Navigation" .. "Purchase"), 
    [v2.GameDetails] = game:DefineFastString("LuaProfileNavigationGameDetailsCounter", "LuaProfile" .. "Navigation" .. "GameDetails")
};
