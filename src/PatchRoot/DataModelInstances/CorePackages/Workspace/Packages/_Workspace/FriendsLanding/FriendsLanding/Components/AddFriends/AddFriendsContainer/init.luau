local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_script_FirstAncestor_0.AddFriends.Analytics);
local l_setupFireEvent_0 = v3.setupFireEvent;
local l_EventNames_0 = v3.EventNames;
local v6 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_SocialLibraries_0 = v6.SocialLibraries;
local l_SocialCommon_0 = v6.SocialCommon;
local l_Promise_0 = v6.Promise;
local l_Roact_0 = v6.Roact;
local l_RoactRodux_0 = v6.RoactRodux;
local l_RoactAppExperiment_0 = v6.RoactAppExperiment;
local l_UIBlox_0 = v6.UIBlox;
local l_FormFactor_0 = v6.FormFactor;
local l_Dash_0 = v6.Dash;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v18 = require(l_script_FirstAncestor_0.EnumScreens);
local v19 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v20 = require(script.Parent.AddFriendsPage);
local v21 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v22 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v23 = require(script.mapStateToProps);
local v24 = require(script.mapDispatchToProps);
local l_AddFriendsPageLoadAnalytics_0 = v21.AddFriendsPageLoadAnalytics;
local l_AddFriendsSearchbarPressedEvent_0 = v21.AddFriendsSearchbarPressedEvent;
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagShowContactImporterTooltipOnce);
local v28 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local v29 = require(l_script_FirstAncestor_0.Utils.contactImporterTooltip);
local v30 = require(l_script_FirstAncestor_0.Utils.getShowNewAddFriendsPageVariant);
local l_Contexts_0 = v6.SocialLuaAnalytics.Analytics.Enums.Contexts;
local _ = require(l_Parent_0.PlayerContextualMenu);
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local _ = require(l_script_FirstAncestor_0.Components.AddFriends.AddFriendsTile.getFriendRequestHandlersExtraProps);
local l_getFStringSocialFriendsLayer_0 = v6.getFStringSocialFriendsLayer;
local l_FFlagFixContactRecsFriendRequestLogging_0 = require(l_Parent_0.SharedFlags).FFlagFixContactRecsFriendRequestLogging;
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagAddPYMKToConsoleAddFriends);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAddIgnoreAllFriendRequestsModal);
local v39 = l_Roact_0.PureComponent:extend("AddFriendsContainer");
v39.init = function(v40)
    v40.state = {
        visibleRows = 6
    };
    v40.fireAnalyticsEvent = l_setupFireEvent_0({
        infoForAllEvents = {
            uid = v40.props.localUserId, 
            recommendationSessionId = v40.props.friendRecommendationsSessionId
        }, 
        analytics = {
            Diag = v40.props.diagService, 
            EventStream = v40.props.eventIngestService
        }
    });
    v40.getLimitPerPage = function()
        if not v40.props.wideMode then
            return 25;
        else
            return 50;
        end;
    end;
    v40.showToast = function(v41)
        if v41 then
            v40.props.navigation.navigate(v18.GenericToast, {
                toastProps = {
                    toastContent = v41
                }
            });
            return ;
        else
            return ;
        end;
    end;
    local function _(v42, v43)
        return function(...)
            return v42(...):andThen(function()
                v40.showToast(v43);
            end):catch(function()
                v40.showToast({
                    toastTitle = v40.props.localized.networkErrorText
                });
            end);
        end;
    end;
    local function v50()
        return l_Promise_0.all({
            v40.props.getFriendRequestsCount(v40.props.localUserId), 
            v40.props.getFriendRequests({
                isRefresh = true, 
                localUserId = v40.props.localUserId, 
                limit = v40.getLimitPerPage()
            }), 
            if not v40.props.shouldShowPYMKSection then nil else v40.props.getFriendRecommendations({
                localUserId = v40.props.localUserId
            })
        }):andThen(function(v45)
            local v46 = v45[2];
            local v47 = if not v40.props.shouldShowPYMKSection then nil else v45[3];
            if not v40.props.shouldShowPYMKSection then
                v40.fireAnalyticsEvent(l_EventNames_0.PageLoad, l_AddFriendsPageLoadAnalytics_0(v46));
                v40:setState({
                    visibleRows = 6
                });
                return ;
            else
                local l_data_0 = v47.responseBody.data;
                local v49 = not not l_data_0 and #l_data_0 or 0;
                v40.fireAnalyticsEvent(l_EventNames_0.PageLoad, l_Dash_0.join(l_AddFriendsPageLoadAnalytics_0(v46), {
                    recommendationSessionId = v47.responseBody.recommendationRequestId, 
                    recommendationCount = v49
                }));
                v40:setState({
                    visibleRows = if v49 > 0 then v40.props.initialRequestsRows else 6
                });
                return ;
            end;
        end);
    end;
    local v51 = nil;
    local l_v50_0 = v50 --[[ copy: 3 -> 5 ]];
    local l_v51_0 = v51 --[[ copy: 4 -> 6 ]];
    v40.refreshPage = function(...)
        return l_v50_0(...):andThen(function()
            v40.showToast(l_v51_0);
        end):catch(function()
            v40.showToast({
                toastTitle = v40.props.localized.networkErrorText
            });
        end);
    end;
    v40.contactImporterWarningSeen = function()
        if not v27() then
            v40.props.contactImporterWarningSeen();
            return ;
        else
            v29.updateKey(l_AppStorageService_0, true);
            return ;
        end;
    end;
    v50 = function(_, v55, v56)
        v40.contactImporterWarningSeen();
        v40.props.analytics:buttonClick(v19.AcceptFriendship, l_Dash_0.join(v56, {
            targetUserId = v55, 
            contextOverride = l_Contexts_0.AddFriends, 
            recommendationSessionId = v40.props.friendRecommendationsSessionId
        }));
        return v40.props.acceptFriendRequest({
            currentUserId = v40.props.localUserId, 
            targetUserId = v55
        }):andThen(function()
            v40.props.getFriendRequestsCount(v40.props.localUserId);
        end);
    end;
    v51 = {
        toastTitle = v40.props.localized.friendAddedText, 
        iconImage = l_Images_0["icons/actions/friends/friendAdd"]
    };
    local l_v50_1 = v50 --[[ copy: 3 -> 7 ]];
    local l_v51_1 = v51 --[[ copy: 4 -> 8 ]];
    v40.handleAcceptFriendRequest = function(...)
        return l_v50_1(...):andThen(function()
            v40.showToast(l_v51_1);
        end):catch(function()
            v40.showToast({
                toastTitle = v40.props.localized.networkErrorText
            });
        end);
    end;
    v50 = function(_, v60, v61)
        v40.contactImporterWarningSeen();
        v40.props.analytics:buttonClick(v19.DeclineFriendship, l_Dash_0.join(v61, {
            targetUserId = v60, 
            contextOverride = l_Contexts_0.AddFriends
        }));
        return v40.props.declineFriendRequest({
            currentUserId = v40.props.localUserId, 
            targetUserId = v60
        }):andThen(function()
            v40.props.getFriendRequestsCount(v40.props.localUserId);
        end);
    end;
    v51 = {
        toastTitle = v40.props.localized.requestIgnoredText, 
        iconImage = l_Images_0["icons/actions/reject"]
    };
    local l_v50_2 = v50 --[[ copy: 3 -> 9 ]];
    local l_v51_2 = v51 --[[ copy: 4 -> 10 ]];
    v40.handleDeclineFriendRequest = function(...)
        return l_v50_2(...):andThen(function()
            v40.showToast(l_v51_2);
        end):catch(function()
            v40.showToast({
                toastTitle = v40.props.localized.networkErrorText
            });
        end);
    end;
    local v64;
    if not v38 then
        v50 = function()
            v40.contactImporterWarningSeen();
            v40.props.analytics:buttonClick(v19.IgnoreAllButton, {
                contextOverride = "friendRequestsPage"
            });
            return v40.props.ignoreAllFriendsRequests({
                currentUserId = v40.props.localUserId
            }):andThen(function()
                v40.props.getFriendRequestsCount(v40.props.localUserId);
            end);
        end;
        v51 = {
            toastTitle = v40.props.localized.allRequestsIgnoredText, 
            iconImage = l_Images_0["icons/actions/reject"]
        };
        local l_v50_3 = v50 --[[ copy: 3 -> 13 ]];
        local l_v51_3 = v51 --[[ copy: 4 -> 14 ]];
        v64 = function(...)
            return l_v50_3(...):andThen(function()
                v40.showToast(l_v51_3);
            end):catch(function()
                v40.showToast({
                    toastTitle = v40.props.localized.networkErrorText
                });
            end);
        end;
    else
        v64 = function()
            v40.contactImporterWarningSeen();
            v40.props.analytics:buttonClick(v19.IgnoreAllButton, {
                contextOverride = "friendRequestsPage"
            });
            return v40.props.ignoreAllFriendsRequests({
                currentUserId = v40.props.localUserId
            }):andThen(function(v67)
                v40.props.getFriendRequestsCount(v40.props.localUserId);
                v40.showToast({
                    toastTitle = if (not not v67 and v67.responseBody) and v67.responseBody.backgrounded then v40.props.localized.allRequestsIgnoredBackgroundedText else v40.props.localized.allRequestsIgnoredText, 
                    iconImage = l_Images_0["icons/actions/reject"]
                });
            end);
        end;
    end;
    v40.handleIgnoreAllFriendsRequests = v64;
    v50 = function(_, v69, v70, v71)
        v40.contactImporterWarningSeen();
        v40.props.analytics:buttonClick(v19.RequestFriendship, l_Dash_0.join(v71, {
            targetUserId = v69, 
            contactId = if (not not l_FFlagFixContactRecsFriendRequestLogging_0 and v71) and v71.contextType == l_ContextualInfoTypes_0.Contacts then v69 else nil, 
            contextOverride = l_Contexts_0.AddFriends, 
            recommendationSessionId = v40.props.friendRecommendationsSessionId
        }));
        return v40.props.requestFriendship({
            currentUserId = v40.props.localUserId, 
            targetUserId = v69, 
            friendshipOriginSourceType = v70, 
            contextType = if not v71 then nil else v71.contextType, 
            contactId = if not not v71 and v71.contextType == l_ContextualInfoTypes_0.Contacts then v69 else nil
        }):andThen(function()
            v40.props.getFriendRequestsCount(v40.props.localUserId);
        end);
    end;
    v51 = {
        toastTitle = v40.props.localized.requestSentText, 
        iconImage = l_Images_0["icons/actions/friends/friendAdd"]
    };
    local l_v50_4 = v50 --[[ copy: 3 -> 11 ]];
    local l_v51_4 = v51 --[[ copy: 4 -> 12 ]];
    v40.handleRequestFriendship = function(...)
        return l_v50_4(...):andThen(function()
            v40.showToast(l_v51_4);
        end):catch(function()
            v40.showToast({
                toastTitle = v40.props.localized.networkErrorText
            });
        end);
    end;
    v40.getNextVisibleRows = function(v74, v75, v76)
        v40.contactImporterWarningSeen();
        local l_friendRequests_0 = v75.friendRequests;
        local l_receivedCount_0 = v75.receivedCount;
        local l_visibleRows_0 = v74.visibleRows;
        local v80 = #l_friendRequests_0;
        local v81 = math.min(l_receivedCount_0, v76 * (l_visibleRows_0 + 6));
        local v82 = math.ceil(v81 / v76);
        if v81 <= v80 then
            return {
                visibleRows = v82
            };
        else
            return nil;
        end;
    end;
    v50 = function(v83, v84)
        return v40.props.getFriendRequests({
            limit = v40.getLimitPerPage(), 
            cursor = v83
        }):andThen(function()
            v40:setState(function(v85, v86)
                return v40.getNextVisibleRows(v85, v86, v84) or {
                    visibleRows = math.ceil(#v86.friendRequests / v84)
                };
            end);
        end, function()
            v40:setState(function(_, v88)
                return {
                    visibleRows = math.ceil(#v88.friendRequests / v84)
                };
            end);
        end);
    end;
    v51 = nil;
    v40.handleGetFriendRequests = function(...)
        return v50(...):andThen(function()
            v40.showToast(v51);
        end):catch(function()
            v40.showToast({
                toastTitle = v40.props.localized.networkErrorText
            });
        end);
    end;
    v40.handleLoadMoreRequests = function(v89)
        v40.contactImporterWarningSeen();
        v40:setState(function(v90, v91)
            local v92 = v40.getNextVisibleRows(v90, v91, v89);
            if not v92 then
                if v91.nextPageCursor then
                    v40.handleGetFriendRequests(v91.nextPageCursor, v89);
                end;
                return nil;
            else
                return v92;
            end;
        end);
    end;
    v40.openPlayerContextualMenu = function(v93)
        v40.props.openPlayerContextualMenu(v93);
    end;
    v40.handleNavigateDownToViewUserProfile = function(v94, v95)
        v40.contactImporterWarningSeen();
        local l_navigateToLuaAppPages_0 = v40.props.navigateToLuaAppPages;
        if not (not l_navigateToLuaAppPages_0 or not l_navigateToLuaAppPages_0[v18.ViewUserProfile]) then
            local v97 = not not v95 and v95.profilePeekViewProps or {};
            v97.recommendationSessionId = v40.props.friendRecommendationsSessionId;
            v40.props.analytics:buttonClick(v19.PlayerTile, (l_Dash_0.join(v97, {
                contextOverride = "friendRequestsPage", 
                subPage = "peekView", 
                page = "playerProfile", 
                targetUserId = v94, 
                contextualInfoDisplay = l_Dash_0.None, 
                source = l_Dash_0.None
            })));
            v40.props.analytics:navigate("ViewUserProfileAddFriends");
            l_navigateToLuaAppPages_0[v18.ViewUserProfile](v94, {
                profilePeekViewProps = v97
            });
        end;
    end;
    v40.handleOpenLearnMore = function()
        v40.contactImporterWarningSeen();
        local l_navigateToLuaAppPages_1 = v40.props.navigateToLuaAppPages;
        if l_navigateToLuaAppPages_1 then
            l_navigateToLuaAppPages_1[v18.LearnMore]();
        end;
    end;
    v40.handleOpenPhoneVerificationLinkWebview = function(v99)
        local l_navigateToLuaAppPages_2 = v40.props.navigateToLuaAppPages;
        if l_navigateToLuaAppPages_2 then
            l_navigateToLuaAppPages_2[v18.PhoneVerification](v99);
        end;
    end;
    v40.fireContactImporterAnalyticsEvents = function()
        v40.props.analytics:navigate("ConnectWithFriends");
        v40.props.analytics:buttonClick(v19.ConnectWithFriends, {
            contextOverride = l_Contexts_0.AddFriends
        });
    end;
    v40.fireContactImporterSeenEvent = function()
        v40.props.analytics:impressionEvent(v28.ContactImporterBannerSeen);
    end;
    v40.fireSearchbarPressedEvent = function()
        l_AddFriendsSearchbarPressedEvent_0(v40.props.analytics, {
            formFactor = not not v40.props.wideMode and l_FormFactor_0.WIDE or l_FormFactor_0.COMPACT
        });
        v40.fireAnalyticsEvent(l_EventNames_0.OpenUserSearch);
    end;
    v40.fireProfileQRCodeBannerSeenEvent = function()
        v40.props.analytics:impressionEvent(v28.ProfileQRCodeBannerSeen);
    end;
    v40.fireProfileQRCodeBannerPressedEvent = function()
        v40.props.analytics:navigate("ProfileQRCodePage");
        v40.props.analytics:buttonClick(v19.ProfileQRCode, {
            contextOverride = l_Contexts_0.AddFriends
        });
    end;
end;
v39.didMount = function(v101)
    v101.refreshPage();
    v101.fireAnalyticsEvent = l_setupFireEvent_0({
        infoForAllEvents = {
            uid = v101.props.localUserId, 
            recommendationSessionId = v101.props.friendRecommendationsSessionId
        }, 
        analytics = {
            Diag = v101.props.diagService, 
            EventStream = v101.props.eventIngestService
        }
    });
end;
v39.didUpdate = function(v102, v103, _)
    if v103.recommendationSessionId ~= v102.props.recommendationSessionId then
        v102.fireAnalyticsEvent = l_setupFireEvent_0({
            infoForAllEvents = {
                uid = v102.props.localUserId, 
                recommendationSessionId = v102.props.friendRecommendationsSessionId
            }, 
            analytics = {
                Diag = v102.props.diagService, 
                EventStream = v102.props.eventIngestService
            }
        });
    end;
end;
v39.render = function(v105)
    local l_contactImporterAndPYMKEnabled_0 = v105.props.contactImporterAndPYMKEnabled;
    return l_Roact_0.createElement(v20, {
        navigateToLuaAppPages = v105.props.navigateToLuaAppPages, 
        screenSize = v105.props.screenSize, 
        globalGuiInset = v105.props.globalGuiInset, 
        friendRecommendations = v105.props.friendRecommendations, 
        friendRecommendationsCount = not not v105.props.friendRecommendations and #v105.props.friendRecommendations or 0, 
        friendRecommendationsSessionId = v105.props.friendRecommendationsSessionId, 
        friendRequests = v105.props.friendRequests, 
        friendRequestsCount = v105.props.receivedCount, 
        contactImporterWarningSeen = v105.contactImporterWarningSeen, 
        analytics = v105.props.analytics, 
        visibleRows = v105.state.visibleRows, 
        amIFollowingUser = v105.props.amIFollowingUser, 
        isUserFollowingMe = v105.props.isUserFollowingMe, 
        getFriendshipRequestSentFromExperience = v105.props.getFriendshipRequestSentFromExperience, 
        handleAcceptFriendRequest = v105.handleAcceptFriendRequest, 
        handleDeclineFriendRequest = v105.handleDeclineFriendRequest, 
        handleIgnoreAllFriendsRequests = v105.handleIgnoreAllFriendsRequests, 
        handleRequestFriendship = v105.handleRequestFriendship, 
        handleLoadMoreRequests = v105.handleLoadMoreRequests, 
        openPlayerContextualMenu = v105.openPlayerContextualMenu, 
        refreshPage = v105.refreshPage, 
        handleNavigateDownToViewUserProfile = v105.handleNavigateDownToViewUserProfile, 
        handleOpenLearnMoreLink = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.handleOpenLearnMore, 
        navigation = v105.props.navigation, 
        contactImporterAndPYMKEnabled = l_contactImporterAndPYMKEnabled_0, 
        localUserId = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.props.localUserId, 
        shouldShowContactImporterFeature = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.props.shouldShowContactImporterFeature, 
        fireContactImporterAnalyticsEvents = v105.fireContactImporterAnalyticsEvents, 
        fireContactImporterSeenEvent = v105.fireContactImporterSeenEvent, 
        shouldShowContactImporterUpsellModal = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.props.shouldShowContactImporterUpsellModal, 
        isPhoneVerified = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.props.isPhoneVerified, 
        hasOSPermissions = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.props.hasOSPermissions, 
        canUploadContacts = if not l_contactImporterAndPYMKEnabled_0 then nil else v105.props.canUploadContacts, 
        isDiscoverabilityUnset = v105.props.isDiscoverabilityUnset, 
        getUserSettingsMetadata = v105.props.getUserSettingsMetadata, 
        showTooltip = v105.props.showTooltip, 
        setScreenTopBar = v105.props.setScreenTopBar, 
        addFriendsPageSearchbarEnabled = v105.props.addFriendsPageSearchbarEnabled, 
        fireSearchbarPressedEvent = v105.fireSearchbarPressedEvent, 
        openProfilePeekView = v105.props.openProfilePeekView, 
        showNewAddFriendsPageVariant = v105.props.showNewAddFriendsPageVariant, 
        fireProfileQRCodeBannerSeenEvent = v105.fireProfileQRCodeBannerSeenEvent, 
        fireProfileQRCodeBannerPressedEvent = v105.fireProfileQRCodeBannerPressedEvent, 
        shouldShowPYMKSection = v105.props.shouldShowPYMKSection, 
        pymkEnabledForConsole = if not v37 then nil else v105.props.pymkEnabledForConsole
    });
end;
v39.willUnmount = function(v107)
    v107.props.getFriendRequestsCount(v107.props.localUserId);
end;
return (l_compose_0(l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialFriendsLayer_0()
}, function(v108, _)
    return {
        showNewAddFriendsPageVariant = v30(v108[l_getFStringSocialFriendsLayer_0()] or {})
    };
end))((l_compose_0(l_RoactRodux_0.connect(v23, v24), v21.connect(function(v110)
    return {
        analytics = v110
    };
end), v22.connect(function(v111)
    return {
        wideMode = v111.wideMode, 
        openPlayerContextualMenu = v111.openPlayerContextualMenu, 
        setScreenTopBar = v111.setScreenTopBar
    };
end))(v39))));
