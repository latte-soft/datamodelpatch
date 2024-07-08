local l_Parent_0 = script:FindFirstAncestor("GameLaunch").Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local v3 = {};
local v4 = {
    [l_RetrievalStatus_0.Failed] = "Feature.GamePage.QuickLaunch.LaunchError.RequestFailed", 
    [l_PlayabilityStatusEnum_0.GuestProhibited] = "Feature.GamePage.QuickLaunch.LaunchError.GuestProhibited", 
    [l_PlayabilityStatusEnum_0.GameUnapproved] = "Feature.GamePage.QuickLaunch.LaunchError.GameUnapproved", 
    [l_PlayabilityStatusEnum_0.UniverseRootPlaceIsPrivate] = "Feature.GamePage.QuickLaunch.LaunchError.UniverseRootPlaceIsPrivate", 
    [l_PlayabilityStatusEnum_0.InsufficientPermissionFriendsOnly] = "Feature.GamePage.QuickLaunch.LaunchError.InsufficientPermissionFriendsOnly", 
    [l_PlayabilityStatusEnum_0.InsufficientPermissionGroupOnly] = "Feature.GamePage.QuickLaunch.LaunchError.InsufficientPermissionGroupOnly", 
    [l_PlayabilityStatusEnum_0.DeviceRestricted] = "Feature.GamePage.QuickLaunch.LaunchError.DeviceRestricted", 
    [l_PlayabilityStatusEnum_0.UnderReview] = "Feature.GamePage.QuickLaunch.LaunchError.UnderReview", 
    [l_PlayabilityStatusEnum_0.PurchaseRequired] = "Feature.GamePage.QuickLaunch.LaunchError.PurchaseRequired", 
    [l_PlayabilityStatusEnum_0.AccountRestricted] = "Feature.GamePage.QuickLaunch.LaunchError.AccountRestricted", 
    [l_PlayabilityStatusEnum_0.TemporarilyUnavailable] = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable", 
    [l_PlayabilityStatusEnum_0.ComplianceBlocked] = "Feature.GamePage.QuickLaunch.LaunchError.ComplianceBlocked", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityAgeRecommendationParentalControls", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityRegionalAvailability] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityRegionalAvailability", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityRegionalCompliance] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityRegionalCompliance", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityUnverifiedSeventeenPlusUser", 
    Default = "Feature.GamePage.QuickLaunch.LaunchError.UnplayableOtherReason"
};
setmetatable(v3, {
    __newindex = function(_, _, _)
    end, 
    __index = function(_, v9)
        assert(v9 ~= nil, "LaunchErrorLocalizationKeys needs a key");
        return v4[v9] or v4.Default;
    end
});
return v3;
