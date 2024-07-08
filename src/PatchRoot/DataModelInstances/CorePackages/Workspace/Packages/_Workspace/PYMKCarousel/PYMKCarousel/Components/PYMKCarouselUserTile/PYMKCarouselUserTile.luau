local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local l_Roact_0 = v1.Roact;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_RoduxFriends_0 = v1.RoduxFriends;
local l_SocialLibraries_0 = v1.SocialLibraries;
local v7 = require(l_Parent_1.SocialCommon);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local v9 = require(script.Parent.PYMKCarouselUserContextualInfo);
local v10 = require(script.Parent.usePYMKCarouselUserButtons);
local v11 = require(l_Parent_0.Analytics);
local v12 = require(l_Parent_0.Analytics.getFriendStatus);
local l_EventNames_0 = v11.EventNames;
local v14 = require(l_Parent_0.Common.Constants);
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local l_getRecommendationContextualInfoType_0 = v7.Utils.getRecommendationContextualInfoType;
local l_CarouselUserTile_0 = v7.Components.CarouselUserTile.CarouselUserTile;
local l_FFlagContactRecs_0 = require(l_Parent_1.SharedFlags).FFlagContactRecs;
local v19 = require(l_Parent_0.Flags.FFlagFixContactRecsCTRAnalytics);
return function(v20)
    local v22 = l_useSelector_0(function(v21)
        return (tostring(v21.LocalUserId));
    end);
    local v23 = tostring(v20.userId);
    local v25 = l_useSelector_0(function(v24)
        return l_getDeepValue_0(v24, string.format("PYMKCarousel.Users.byUserId.%s", v23));
    end);
    local v27 = l_useSelector_0(function(v26)
        return l_RoduxFriends_0.Selectors.selectFriendshipStatusesByUserIds(v26)({
            v23
        })[v23] or nil;
    end);
    local v29 = l_useSelector_0(function(v28)
        return l_getDeepValue_0(v28, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v23));
    end);
    local v31 = l_useSelector_0(function(v30)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v30)(v22)[v23] or {};
    end);
    local v32 = v10({
        userId = v23, 
        showToast = v20.showToast, 
        fireAnalyticsEvent = v20.fireAnalyticsEvent, 
        absolutePosition = v20.absolutePosition, 
        contactId = if not not l_FFlagContactRecs_0 and v31.contextType == l_RecommendationContextType_0.Contacts then v31.entityId else nil
    });
    local function v33()
        return v9({
            lineWidth = v20.tileWidth, 
            userId = v20.userId, 
            contextType = if not l_FFlagContactRecs_0 then nil else v31.contextType
        });
    end;
    local v34 = if not v31.mutualFriendsCount then if v31.mutualFriendsList then #v31.mutualFriendsList else nil else v31.mutualFriendsCount;
    local function v35()
        v20.openProfilePeekView(v23, {
            absolutePosition = v20.absolutePosition, 
            source = v14.HomepagePYMKCarouselSourceName, 
            isRecommendation = true, 
            mutualFriendsCount = v34, 
            recommendationSessionId = v20.recommendationSessionId, 
            recommendationRank = v31.rank, 
            recommendationContextType = v31.contextType.rawValue(), 
            contextualInfoType = l_getRecommendationContextualInfoType_0(v31), 
            contactProps = if (not not l_FFlagContactRecs_0 and v31.contextType == l_RecommendationContextType_0.Contacts) and v31.entityId then {
                contactId = v31.entityId, 
                avatarImageUrl = if not v31.thumbnailEntities then nil else v31.thumbnailEntities.avatarImageUrl, 
                contactName = v31.entityDisplayName
            } else nil, 
            profileType = (not not l_FFlagContactRecs_0 and v31.contextType == l_RecommendationContextType_0.Contacts) and "FromContacts" or nil
        });
    end;
    local function v36()
        v35();
        v20.fireAnalyticsEvent(l_EventNames_0.UserPressed, {
            recommendationId = v23, 
            friendStatus = v12(v27, v29), 
            recommendationContextType = v31.contextType, 
            recommendationRank = v31.rank, 
            absolutePosition = v20.absolutePosition, 
            contactId = if not not v19 and v31.contextType == l_RecommendationContextType_0.Contacts then v31.entityId else nil
        });
    end;
    return l_Roact_0.createFragment({
        PYMKCarouselUserTile = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, v20.tileWidth, 0, v20.tileWidth), 
            BackgroundTransparency = 1
        }, {
            CarouselUserTile = l_Roact_0.createElement(l_CarouselUserTile_0, {
                headshotImageUrl = if not not l_FFlagContactRecs_0 and v31.thumbnailEntities then v31.thumbnailEntities.headshotImageUrl else nil, 
                userId = v23, 
                userName = if not not l_FFlagContactRecs_0 and v31.contextType == l_RecommendationContextType_0.Contacts then v31.entityDisplayName or "" else (v25 or {}).displayName or "", 
                tileSize = v20.tileWidth, 
                renderContextualInfo = v33, 
                renderButtons = v32, 
                onActivatedTile = v36, 
                onActivatedContextual = v36
            })
        })
    });
end;
