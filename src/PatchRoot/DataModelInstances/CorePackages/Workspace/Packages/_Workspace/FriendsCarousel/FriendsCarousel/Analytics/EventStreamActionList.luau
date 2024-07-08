local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(script.Parent.EventNames);
local v3 = require(l_Parent_1.SocialLuaAnalytics);
local l_Enums_0 = v3.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v7 = require(script.Parent.BtnValues);
local v8 = require(l_Parent_0.Common.Constants);
local v9 = require(script.Parent.formatFriendStatus);
local v10 = require(script.Parent.getUniverseIdFromUser);
local l_formatRecommendationContextType_0 = v3.Analytics.Formatters.formatRecommendationContextType;
local l_formatPresence_0 = v3.Analytics.Formatters.formatPresence;
local v13 = require(l_Parent_0.Flags.getFIntShowFriendRecommendationsLimit);
local v14 = require(l_Parent_0.Flags.FFlagFriendsCarouselOldFriendEndpointLoadingTime);
local v15 = require(l_Parent_0.Flags.FFlagFriendsCarouselUILoadingTime);
local function v17(v16)
    return v16;
end;
return {
    [v2.CarouselLoadedWithUsers] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.FriendsCarouselLoaded, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v17, 
            recommendationCount = v17, 
            recommendationLimit = v13, 
            refreshCount = v17, 
            experimentLayerStatus = v17, 
            fetchedRecommendations = v17, 
            recommendationSessionId = v17
        }
    }, 
    [v2.UserSeen] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.UserSeen, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v17, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendStatus = v9, 
            isRecommendation = v17, 
            presence = l_formatPresence_0, 
            recommendationRank = v17, 
            userId = v17, 
            universeId = v10
        }
    }, 
    [v2.UserPressed] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.OpenPeopleList, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v17, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            friendId = v17, 
            friendStatus = v9, 
            isRecommendation = v17, 
            recommendationRank = v17, 
            universeId = v10, 
            presence = l_formatPresence_0
        }
    }, 
    [v2.RequestFriendship] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.RequestFriendship, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v17, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v17, 
            requestedId = v17
        }
    }, 
    [v2.RevokeFriendRequest] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.RevokeFriendRequest, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            absolutePosition = v17, 
            recommendationContextType = l_formatRecommendationContextType_0, 
            recommendationRank = v17, 
            requestedId = v17
        }
    }, 
    [v2.ViewAllFriends] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.FriendsLanding, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v17, 
            recommendationLimit = v13, 
            recommendationCount = v17
        }
    }, 
    [v2.ViewAddFriends] = {
        context = l_Contexts_0.AddFriends, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.AddFriendsButton, 
            absolutePosition = 1, 
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            friendCount = v17, 
            recommendationLimit = v13, 
            recommendationCount = v17, 
            requestCount = v17, 
            showContactImporterModal = v17
        }
    }, 
    [v2.CarouselLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.CarouselLoadingTime, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }, 
        formatRulesForAdditionalInfo = {
            carouselFetchingStatus = v17, 
            friendsFetchingStatus = v17, 
            recommendationFetchingStatus = v17, 
            loadingTime = v17, 
            reachedThreshold = v17, 
            loadingThreshold = v17, 
            experimentLayerStatus = v17, 
            isLegacyCarousel = v17
        }
    }, 
    [v2.ContactImporterOnAddFriends] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ContactImporterOnAddFriends, 
        additionalInfo = {
            isLegacyAddFriends = false
        }
    }, 
    [v2.PaginatedFriendsCarouselLoadingTime] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v17, 
            loadingTime = v17, 
            loadingThreshold = v17, 
            nextPage = v17, 
            fetch = v17
        }, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }
    }, 
    [v2.FriendsEndpointLoadingTime] = if not v14 then nil else {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v17, 
            loadingTime = v17, 
            loadingThreshold = v17, 
            nextPage = v17, 
            fetch = v17
        }, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }
    }, 
    [v2.FriendsCarouselUILoadingTime] = if not v15 then nil else {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v17, 
            fetch = v17, 
            loadingTime = v17, 
            loadingThreshold = v17, 
            nextPage = v17
        }, 
        additionalInfo = {
            source = v8.HomepageFriendsCarouselSourceName
        }
    }
};
