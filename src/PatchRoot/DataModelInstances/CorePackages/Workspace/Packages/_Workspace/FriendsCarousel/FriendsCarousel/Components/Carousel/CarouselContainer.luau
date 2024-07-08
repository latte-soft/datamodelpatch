local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.PlayerContextualMenu);
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactRodux_0 = v4.RoactRodux;
local v6 = require(script.Parent.Carousel);
local v7 = require(script.Parent.carouselMapStateToProps);
local v8 = require(script.Parent.carouselMapDispatchToProps);
local v9 = require(l_script_FirstAncestor_0.Components.PaginatedCarousel.PaginatedCarouselWrapper);
local _ = require(l_script_FirstAncestor_0.Components.PaginatedCarousel.useCarouselList);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
local l_Dictionary_0 = v4.llama.Dictionary;
local l_useUiModeInfo_0 = v4.Hooks.useUiModeInfo;
local l_UiMode_0 = v4.RobloxAppEnums.UiMode;
local l_AnalyticsService_0 = v4.AnalyticsService;
local v17 = require(l_script_FirstAncestor_0.Analytics);
local l_setupFireEvent_0 = v17.setupFireEvent;
local l_EventNames_0 = v17.EventNames;
local v20 = require(l_Parent_0.SocialCommon);
local l_getRecommendationContextualInfoType_0 = v20.Utils.getRecommendationContextualInfoType;
local l_convertUserPresenceTypeToString_0 = v20.Utils.convertUserPresenceTypeToString;
local v23 = require(l_script_FirstAncestor_0.Utils.friendshipStatusToEnum);
local l_Enums_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingFriends.Enums;
local l_RecommendationContextType_0 = v4.RoduxFriends.Enums.RecommendationContextType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_getFFlagUpdateFriendCarousel10ft_0 = v4.getFFlagUpdateFriendCarousel10ft;
local l_FFlagFriendsCarouselPagination_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselPagination;
local v30 = game:DefineFastFlag("FriendsCarouselPlayerContextualMenuEntrypoint", false);
local l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselPaginatedFriendsEnabled;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselUILoadingTime);
local l_FFlagFriendsCarouselInjectSocialBtn_0 = require(l_Parent_0.SharedFlags).FFlagFriendsCarouselInjectSocialBtn;
local l_FFlagMoveCarouselHeader_0 = require(l_Parent_0.SharedFlags).FFlagMoveCarouselHeader;
local v36 = {
    analyticsService = l_AnalyticsService_0
};
local function v56(v37)
    local v38 = l_Dictionary_0.join(v36, v37);
    local v39, v40 = v2.useState({});
    local l_eventIngestService_0 = v38.eventIngestService;
    local v42 = v2.useMemo(function()
        return {
            Diag = v38.diagService, 
            EventStream = l_eventIngestService_0
        };
    end, {
        v38.diagService, 
        l_eventIngestService_0
    });
    local v43 = v2.useMemo(function()
        return l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v38.localUserId, 
                recommendationSessionId = v38.recommendationSessionId
            }, 
            analytics = v42
        });
    end, {
        v38.localUserId, 
        v38.recommendationSessionId
    });
    local v47 = v2.useCallback(function(v44, v45)
        if not v39[v44.id] then
            v43(l_EventNames_0.UserSeen, {
                presence = v44.userPresenceType or v44.presence and v44.presence.userPresenceType, 
                absolutePosition = v45.absolutePosition, 
                friendId = v44.id, 
                friendStatus = v44, 
                recommendationContextType = v44.contextType, 
                recommendationRank = v44.rank, 
                isRecommendation = not not v44.contextType or false, 
                userId = v44.id, 
                universeId = v44
            });
            v40(function(v46)
                return {
                    seenUsers = l_Dictionary_0.join(v46, {
                        [v44.id] = true
                    })
                };
            end);
        end;
    end, {
        v39, 
        v43
    });
    local v48 = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_useUiModeInfo_0();
    local v49 = v4.Hooks.useDispatch();
    local v51 = v2.useCallback(function(v50)
        v49(v3.openPlayerContextualMenu(v50));
    end, {
        v38.openPlayerContextualMenu, 
        v49
    });
    return v2.createElement(v17.Context.Provider, {
        value = {
            fireEvent = v43
        }
    }, {
        carousel = v2.createElement(v6, {
            carousel = v38.carousel, 
            carouselProps = v38.carouselProps, 
            showToast = v38.showToast, 
            onSuccessfulRender = v38.onSuccessfulRender, 
            onSeeAllFriends = if not l_FFlagMoveCarouselHeader_0 then nil else if not l_FFlagMoveCarouselHeader_0 then nil else v2.useCallback(function()
                v43(l_EventNames_0.ViewAllFriends, {
                    friendCount = v38.friendCount
                });
                v49(l_NavigateDown_0({
                    name = l_AppPage_0.ViewFriends, 
                    extraProps = {
                        navigateToFriendsLandingEventStart = {
                            startPage = l_AppPage_0.Home, 
                            startTime = os.clock()
                        }
                    }
                }));
            end, {
                v43, 
                v38.friendCount
            }), 
            friendsAndRecList = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 and v38.carouselList then v38.carouselList else v38.friendsAndRecList else nil, 
            users = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else if l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 and v38.carouselList then v38.carouselList else v38.friendsAndRecList, 
            fetchNext = if not not l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 and l_FFlagFriendsCarouselPagination_0 then v38.fetchMoreFriends else nil, 
            socialOnboardingBtns = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v38.socialOnboardingBtns, 
            addFriendsBtn = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v38.addFriendsBtn, 
            paginatedCarouselEnabled = if not v33 then nil else v38.carouselList ~= nil, 
            friendCount = v38.friendCount, 
            friendRequestCount = v38.friendRequestCount, 
            fetchingStatus = v38.fetchingStatus, 
            userSeen = v47, 
            onFindFriendsTileActivated = v2.useCallback(function()
                v38.navigateFromAddFriends();
                v43(l_EventNames_0.ViewAddFriends, {
                    friendCount = v38.friendCount, 
                    recommendationLimit = true, 
                    recommendationCount = v38.recommendationCount, 
                    requestCount = v38.friendRequestCount, 
                    showContactImporterModal = not not v38.showContactImporter or false
                });
            end, {
                v43, 
                v38.navigateFromAddFriends, 
                v38.friendCount, 
                v38.recommendationCount, 
                v38.friendRequestCount
            }), 
            onUserTileActivated = v2.useCallback(function(v52, v53)
                v43(l_EventNames_0.UserPressed, {
                    presence = v52.userPresenceType or v52.presence and v52.presence.userPresenceType, 
                    absolutePosition = v53.absolutePosition, 
                    friendId = v52.id, 
                    friendStatus = v52, 
                    recommendationContextType = v52.contextType, 
                    recommendationRank = v52.rank, 
                    isRecommendation = not not v52.contextType or false, 
                    universeId = v52
                });
                if not (not l_getFFlagUpdateFriendCarousel10ft_0() or not v48) and v48.uiMode == l_UiMode_0.TenFoot then
                    local _ = nil;
                    (if not v30 then v38.openPlayerContextualMenu else v51)({
                        subjectUserId = v52.id, 
                        subjectPresence = if not v52.userPresenceType then nil else {
                            locationString = v52.lastLocation, 
                            locationPlaceId = v52.placeId, 
                            locationRootPlaceId = v52.rootPlaceId, 
                            locationUniverseId = v52.universeId, 
                            status = l_convertUserPresenceTypeToString_0(v52.userPresenceType)
                        }, 
                        robloxFriendshipStatus = v23(v52), 
                        friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue()
                    });
                    return ;
                else
                    local v55 = nil;
                    v55 = not not l_FFlagContactRecs_0 and v52.contextType == l_RecommendationContextType_0.Contacts;
                    v38.openProfilePeekView(v52.id, {
                        openJoinable = true, 
                        profilePeekViewProps = {
                            resetPeekView = true, 
                            absolutePosition = v53.absolutePosition, 
                            isHomePageCarousel = true, 
                            source = v12.HomepageFriendsCarouselSourceName, 
                            recommendationRank = v52.rank, 
                            isRecommendation = not not v52.contextType or false, 
                            mutualFriendsCount = not not v52.mutualFriendsList and #v52.mutualFriendsList or 0, 
                            recommendationSessionId = v38.recommendationSessionId, 
                            recommendationContextType = if not v52.contextType then nil else v52.contextType.rawValue(), 
                            contextualInfoType = l_getRecommendationContextualInfoType_0(v52), 
                            contactProps = if not v55 then nil else {
                                contactId = v52.entityId, 
                                contactName = v52.entityDisplayName, 
                                avatarImageUrl = if not v52.thumbnailEntities then nil else v52.thumbnailEntities.avatarImageUrl
                            }, 
                            profileType = if not v55 then nil else "FromContacts"
                        }, 
                        contextualMenuProps = {
                            user = v52, 
                            absolutePosition = v53.absolutePosition, 
                            positionIndex = v53.positionIndex, 
                            anchorSpaceSize = v53.anchorSpaceSize, 
                            anchorSpacePosition = v53.anchorSpacePosition, 
                            onOpen = v53.onOpen, 
                            onClose = v53.onClose, 
                            source = v12.HomepageFriendsCarouselSourceName
                        }
                    });
                    return ;
                end;
            end, {
                v43, 
                v38.openProfilePeekView, 
                v38.recommendationSessionId
            }), 
            showNewBadge = not not v38.showContactImporter and (v38.showNewAddFriendsUIVariant or false), 
            showNewAddFriendsUIVariant = v38.showNewAddFriendsUIVariant
        })
    });
end;
if not l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then
    return l_RoactRodux_0.connect(v7, v8)(v56);
else
    return (l_RoactRodux_0.connect(v7, v8)((v9(v56))));
end;
