local _ = require(game:GetService("CorePackages").Workspace.Packages.SocialCommon);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Common.ProfileTypes);
local v3 = require(l_Parent_0.dependencies);
local l_t_0 = v3.t;
local l_isCallable_0 = v3.Dash.isCallable;
local v6 = l_t_0.strictInterface({
    showBackButton = l_t_0.optional(l_t_0.boolean), 
    mountAsFullView = l_t_0.optional(l_t_0.boolean), 
    mountAnimation = l_t_0.optional(l_t_0.boolean), 
    onPeekViewClosed = l_t_0.optional(l_isCallable_0), 
    onPeekViewGoBack = l_t_0.optional(l_isCallable_0)
});
local v7 = l_t_0.strictInterface({
    ProfilePeekView = l_isCallable_0, 
    ViewUserProfile = l_isCallable_0, 
    GameDetailsPeekView = l_isCallable_0, 
    Chat = l_isCallable_0, 
    JoinGame = l_isCallable_0, 
    ViewUserFriends = l_isCallable_0, 
    ViewUserFollowing = l_isCallable_0, 
    ViewUserFollowers = l_isCallable_0, 
    ItemDetails = l_isCallable_0, 
    ReportUser = l_isCallable_0, 
    PurchaseErrorToast = l_isCallable_0, 
    NetworkingErrorToast = l_isCallable_0, 
    ProfileQRCodePage = l_isCallable_0, 
    EditProfilePage = l_t_0.optional(l_isCallable_0)
});
return {
    validatePeekViewProps = v6, 
    validateNavigateToLuaAppPages = v7, 
    validateContext = l_t_0.strictInterface({
        profileUserId = l_t_0.string, 
        localUserId = l_t_0.string, 
        peekViewProps = v6, 
        navigateToLuaAppPages = v7, 
        abbreviateCount = l_isCallable_0
    }), 
    validateNavigationParams = l_t_0.strictInterface({
        absolutePosition = l_t_0.optional(l_t_0.number), 
        isHomePageCarousel = l_t_0.optional(l_t_0.boolean), 
        isRecommendation = l_t_0.optional(l_t_0.boolean), 
        recommendationContextType = l_t_0.optional(l_t_0.string), 
        mutualFriendsCount = l_t_0.optional(l_t_0.number), 
        recommendationSessionId = l_t_0.optional(l_t_0.string), 
        recommendationRank = l_t_0.optional(l_t_0.number), 
        source = l_t_0.optional(l_t_0.string), 
        offNetworkFriendRequestToken = l_t_0.optional(l_t_0.string), 
        offNetworkFriendRequestLinkId = l_t_0.optional(l_t_0.string), 
        shareLinkId = l_t_0.optional(l_t_0.string), 
        contextualInfoType = l_t_0.optional(l_t_0.string), 
        contextualInfoDisplay = l_t_0.optional(l_t_0.table)
    })
};
