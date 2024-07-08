local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v3 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.GameCarouselFeedItem);
local v4 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.UserInfoFeedItem);
local v5 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.FriendCarouselFeedItem.FriendCarouselFeedItem);
local v6 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.JoinYourFriendsFeedItem);
local v7 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.FriendRecommendationCarouselFeedItem);
local v8 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.HomeGameGridFlexFeedItem);
local v9 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.SearchGameGridFeedItem);
local v10 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v11 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.SearchTextFeedItem);
local v12 = require(l_Modules_0.Personalization.OmniFeed.FeedItems.UpsellCardFeedItem);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v14 = require(l_Modules_0.Personalization.Flags.GetFFlagUseUpsellCardOmniFeedItem);
local function v16(v15)
    if v15 == v10.Carousel then
        return v3;
    elseif v15 == v10.UserInfo then
        if not l_isSubjectToDesktopPolicies_0() and not l_IsVRAppBuild_0() or _G.__TESTEZ_RUNNING_TEST__ then
            return v4;
        else
            return nil;
        end;
    elseif v15 == v10.JoinYourFriendsCarousel then
        return v6;
    elseif v15 == v10.FriendCarousel then
        return v5;
    elseif v15 == v10.AvatarCarousel then
        warn("AvatarCarousel is not currently supported on the client");
        return nil;
    elseif v15 == v10.FriendRecommendationCarousel then
        if l_isSubjectToDesktopPolicies_0() then
            return nil;
        else
            return v7;
        end;
    elseif v15 == v10.HomeGameGrid then
        return v8;
    elseif v15 == v10.GenreExplorer then
        warn("GenreExplorer is not currently supported on the client");
        return nil;
    elseif v15 == v10.SearchGameGrid then
        return v9;
    elseif v15 == v10.SearchText then
        return v11;
    elseif v14() and v15 == v10.UpsellCard then
        return v12;
    else
        warn("Unmapped omni feed item type: " .. tostring(v15));
        return nil;
    end;
end;
return {
    getComponent = v16, 
    hasComponent = function(v17)
        return v16(v17) ~= nil;
    end
};
