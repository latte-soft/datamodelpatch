local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UserProfiles);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v7 = require(l_Parent_0.RoactUtils);
local l_RoactRodux_0 = v7.Hooks.RoactRodux;
local v9 = require(l_Parent_0.RobloxAppHooks);
local v10 = require(l_Parent_0.RobloxAppEnums);
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_AppPage_0 = v10.AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_Parent_0.ToastRodux);
local v15 = require(l_Parent_0.ExperienceAnalytics);
local l_getCurrentRouteState_0 = require(l_Parent_0.Navigation).getCurrentRouteState;
local v17 = require(l_CorePackages_0.Workspace.Packages.ExperienceService);
local l_ExperienceService_0 = v17.ExperienceService;
local l_UseExperienceService_0 = v17.Flags.UseExperienceService;
local l_default_0 = v17.GameProtocol.default;
local l_GameParams_0 = v17.GameParams;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local v23 = require(l_Parent_0.RobloxAppSessionization);
local v24 = require(l_Parent_0.Dash);
local l_SetGamePlaySession_0 = v23.SetGamePlaySession;
local l_SessionType_0 = v23.SessionType;
local l_RecommendationContextType_0 = require(l_Parent_0.RoduxFriends).config({
    keyPath = "PlayerContextualMenu.Friends"
}).Enums.RecommendationContextType;
local l_useRecommendationContextualInfoDisplay_0 = require(l_Parent_0.SocialCommon).Hooks.useRecommendationContextualInfoDisplay;
local _ = require(script.Parent.Types);
local v30 = require(script.Parent.getPresenceIcon);
local v31 = require(script.Parent.getPresenceText);
local v32 = require(l_Parent_0.UIBlox);
local l_Images_0 = v32.App.ImageSet.Images;
local l_Button_0 = v32.App.Button.Button;
local l_ButtonType_0 = v32.App.Button.Enum.ButtonType;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v37 = require(l_script_FirstAncestor_0.Analytics);
local l_setupFireEvent_0 = v37.setupFireEvent;
local l_EventNames_0 = v37.EventNames;
local l_AnalyticsService_0 = v37.AnalyticsService;
local v41 = require(l_script_FirstAncestor_0.Http.Friends);
local v42 = require(l_script_FirstAncestor_0.Http.Blocking);
local v43 = require(l_script_FirstAncestor_0.Components.PlayerContextualMenuComponent);
local v44 = require(script.Parent.HttpRequest.useHttpRequest);
local _ = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingFriends.Enums;
local v46 = game:DefineFastString("PlayerContextualMenuVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local v47 = game:DefineFastFlag("PlatformProfileUseNewLocalization", false);
local v48 = require(l_script_FirstAncestor_0.Flags.FFlagRefactorPlayerContextualMenuForContacts);
local v49 = if not not game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil;
local v50 = game:DefineFastFlag("PlayerContextualMenuGameJoinAttribution", false);
local function v51()
end;
local function v59(v52, v53, v54, v55, v56)
    if v50 then
        l_SetGamePlaySession_0(v56, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
    end;
    v52(l_EventNames_0.JoinExperience, {
        profileUserId = v54
    });
    local v57 = l_HttpService_0:GenerateGUID(false);
    v15.Events.gamePlayIntent(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
        friendId = v54, 
        pageName = v53, 
        placeId = if not v55 then nil else v55.locationPlaceId, 
        rootPlaceId = if not v55 then nil else v55.locationRootPlaceId, 
        joinAttemptId = v57
    });
    if not l_UseExperienceService_0() then
        local v58 = l_GameParams_0.fromUserId(v54);
        v58.joinAttemptId = v57;
        l_default_0:launchGame(v58, "PlayerContextualMenu");
        return ;
    else
        l_ExperienceService_0:LaunchExperience({
            userId = v54, 
            joinAttemptId = v57
        }, "PlayerContextualMenu");
        return ;
    end;
end;
local v60 = {
    AcceptFriendRequest = "Feature.Friends.Action.AcceptFriend", 
    AddFriend = "Feature.PlayerSearchResults.Action.AddFriend", 
    Block = "Feature.Friends.Action.Block", 
    Unblock = "Feature.Friends.Action.Unblock", 
    Chat = "CommonUI.Features.Label.Chat", 
    IgnoreFriendRequest = "Feature.AddFriends.Action.IgnoreFriendRequest", 
    Join = "Feature.Chat.Drawer.Join", 
    PendingRequest = "Feature.Friends.Action.PendingRequest", 
    Report = "Feature.Catalog.Action.Report", 
    Unfriend = "Feature.Friends.Action.Unfriend", 
    ViewDetails = "Feature.Profile.Label.ViewDetails", 
    ViewGamerCardWord = "Xbox.Old.ViewGamerCardWord", 
    ViewPlatformProfile = "Feature.Friends.Action.ViewPlatformProfile", 
    FriendRequestAccepted = "Feature.Friends.Action.FriendAdded", 
    FriendRequestIgnored = "Feature.AddFriends.Action.RequestIgnored", 
    FriendRequestSent = "Feature.Friends.Action.FriendRequestSent", 
    SomethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    UserBlocked = "Feature.Profile.Action.UserBlocked"
};
return function(v61)
    local v62 = l_RoactRodux_0.useDispatch();
    local v63 = v9.useLocalUserId();
    local v64 = v7.Hooks.useNavigation();
    local v65 = v9.useRoactService(l_AppSessionService_0);
    local v66 = l_useLocalization_0(v60);
    local v67 = {
        toastMessage = v66.SomethingIsWrong, 
        isLocalized = true, 
        toastType = v14.Enums.ToastType.NetworkingError
    };
    local v68 = v4.useMemo(function()
        return l_setupFireEvent_0({
            analytics = l_AnalyticsService_0, 
            infoForAllEvents = {
                uid = v63
            }
        });
    end, l_dependencyArray_0(v63));
    local v69 = v44();
    local v70, v71 = v4.useState({
        status = "NotStarted", 
        isPlayable = false
    });
    v4.useEffect(function()
        if not (not v61.subjectPresence or not v61.subjectPresence.locationUniverseId) then
            v71({
                status = "Fetching", 
                isPlayable = false
            });
            v69(l_Url_0.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. v61.subjectPresence.locationUniverseId, "GET"):andThen(function(v72)
                if not (not v72.responseBody or not v72.responseBody[1]) then
                    v71({
                        status = "Finished", 
                        isPlayable = v72.responseBody[1].isPlayable
                    });
                end;
            end):catch(function(_)
                v71({
                    status = "Failed", 
                    isPlayable = false
                });
            end);
        end;
    end, {
        (tostring(v61.subjectPresence))
    });
    local v75 = l_useDesignTokens_0(function(v74)
        return {
            iconEmphasis = v74.Semantic.Icon.Emphasis, 
            onlinePresence = v74.Semantic.Color.Common.Online, 
            joinEventButtonHeight = v74.Global.Size_600
        };
    end);
    local v76 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v61.subjectUserId
        }, 
        query = v5.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v77 = "";
    local v78 = "";
    local v79 = "";
    local v80 = "";
    if v76.data then
        v77 = v5.Selectors.getUsernameFromId(v76.data, v61.subjectUserId);
        v78 = v5.Selectors.getDisplayNameFromId(v76.data, v61.subjectUserId);
        v79 = v5.Selectors.getPlatformNameFromId(v76.data, v61.subjectUserId);
        if v49 then
            v80 = v5.Selectors.getPlatformProfileIdFromId(v76.data, v61.subjectUserId);
        end;
    end;
    local v81 = not not v79 and v79 ~= "";
    if v48 and v61.recommendationContext == l_RecommendationContextType_0.Contacts then
        v78 = v61.contactName or "";
    end;
    local v82, v83 = v30(v61.subjectPresence, v75);
    if v61.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
        v82 = nil;
        v83 = nil;
    end;
    local v84 = if v61.robloxFriendshipStatus == Enum.FriendStatus.Friend then v31(v61.subjectPresence) else nil;
    if not (not v48 or not v61.recommendationContext) then
        local v85 = l_useRecommendationContextualInfoDisplay_0({
            contextType = v61.recommendationContext, 
            mutualFriendsCount = v61.mutualFriendsCount
        });
        v84 = v85.text;
        v82 = v85.icon;
    end;
    local v87 = v4.useCallback(function()
        v68(l_EventNames_0.ViewExperienceDetails, {
            profileUserId = v61.subjectUserId
        });
        v62(v61.closeCentralOverlayThunk());
        if not (not v61.subjectPresence or not v61.subjectPresence.locationUniverseId) then
            local v86 = tostring(v61.subjectPresence.locationUniverseId);
            if v65 then
                l_SetGamePlaySession_0(v65, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            v15.Events.gameDetailReferral(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
                pg = l_getCurrentRouteState_0(v64).routeName, 
                universeId = v86, 
                pid = v61.subjectPresence.locationPlaceId, 
                friendId = v61.subjectUserId
            });
            v64.navigate(l_AppPage_0.ExperienceDetail, {
                detail = v86
            });
        end;
    end, {
        v68, 
        v61.subjectUserId, 
        v61.closeCentralOverlayThunk, 
        v61.subjectPresence, 
        v64, 
        v65
    });
    local v88 = v4.useMemo(function()
        if (v61.subjectPresence ~= nil and v61.subjectPresence.status == "InGame") and not v70.isPlayable then
            return function()
                return v4.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    onActivated = v87, 
                    isLoading = false, 
                    size = UDim2.new(1, 0, 0, v75.joinEventButtonHeight), 
                    text = v66.ViewDetails, 
                    layoutOrder = 100
                });
            end;
        else
            return nil;
        end;
    end, {
        v70, 
        (tostring(v61.subjectPresence))
    });
    local v89 = if (v61.robloxFriendshipStatus == Enum.FriendStatus.Friend and v61.subjectPresence) and v61.subjectPresence.status == "InGame" then v66.Join else nil;
    local v90 = v4.useCallback(function()
        v59(v68, l_getCurrentRouteState_0(v64).routeName, v61.subjectUserId, v61.subjectPresence, if not v50 then nil else v65);
    end, l_dependencyArray_0(v68, v64, v61.subjectUserId, v61.subjectPresence, if not v50 then nil else v65));
    local v91 = v4.useCallback(function()
        v68(l_EventNames_0.ReportPlayer, {
            profileUserId = v61.subjectUserId
        });
        v62(v61.closeCentralOverlayThunk());
        v64.navigate(l_AppPage_0.ReportScreen, {
            reportData = {
                assetId = v61.subjectUserId, 
                reportAbuseVector = "user", 
                context = "profile", 
                platform = "console"
            }
        });
    end, l_dependencyArray_0(v62, v64, v61.subjectUserId, v61.closeCentralOverlayThunk));
    local v92 = if not v49 then nil else v4.useCallback(function()
        v68(l_EventNames_0.ViewPlatformProfile, {
            profileUserId = v61.subjectUserId
        });
        v49:ShowProfile(v80);
    end, {
        v80, 
        v62, 
        v64, 
        v61.subjectUserId, 
        v61.closeCentralOverlayThunk
    });
    local v94 = v4.useCallback(function()
        v68(l_EventNames_0.BlockPlayer, {
            profileUserId = v61.subjectUserId
        });
        v62(v42.BlockUserById.API({
            userId = v61.subjectUserId, 
            currentUserId = v63
        })):andThen(function()
            v62(v14.Actions.SetCurrentToastMessage({
                toastMessage = v66.UserBlocked, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v62(v61.closeCentralOverlayThunk());
        end):catch(function(_)
            v62(v14.Actions.SetCurrentToastMessage(v67));
        end);
    end, l_dependencyArray_0(v66, v63, v62, v61.closeCentralOverlayThunk, v61.subjectUserId));
    local v96 = v4.useCallback(function()
        v62(v42.UnblockUserById.API({
            userId = v61.subjectUserId, 
            currentUserId = v63
        })):andThen(function()
            v62(v61.closeCentralOverlayThunk());
        end):catch(function(_)
            v62(v14.Actions.SetCurrentToastMessage(v67));
        end);
    end, l_dependencyArray_0(v63, v62, v61.closeCentralOverlayThunk, v61.subjectUserId));
    local v97 = v4.useCallback(function()
        v68(l_EventNames_0.Unfriend, {
            profileUserId = v61.subjectUserId
        });
        v62(v41.UnfriendTargetUserId.API({
            targetUserId = v61.subjectUserId, 
            currentUserId = v63
        })):andThen(function()
            v62(v14.Actions.SetCurrentToastMessage({
                toastMessage = v66.Unfriend, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v62(v61.closeCentralOverlayThunk());
        end):catch(function()
            v62(v14.Actions.SetCurrentToastMessage(v67));
        end);
    end, l_dependencyArray_0(v66, v63, v62, v61.subjectUserId, v61.closeCentralOverlayThunk));
    local v98 = v4.useCallback(function()
        v68(l_EventNames_0.RequestFriendship, {
            profileUserId = v61.subjectUserId
        });
        v62(if (not not v48 and v61.recommendationContext == l_RecommendationContextType_0.Contacts) and v61.contactId then v41.RequestFriendshipFromContactId.API({
            contactId = v61.contactId, 
            currentUserId = v63
        }) else v41.RequestFriendshipFromUserId.API({
            targetUserId = v61.subjectUserId, 
            currentUserId = v63, 
            friendshipOriginSourceType = v61.friendshipOriginSourceType
        })):andThen(function()
            v62(v14.Actions.SetCurrentToastMessage({
                toastMessage = v66.FriendRequestSent, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v62(v61.closeCentralOverlayThunk());
        end):catch(function()
            v62(v14.Actions.SetCurrentToastMessage(v67));
        end);
    end, if not v48 then l_dependencyArray_0(v66, v63, v62, v61.closeCentralOverlayThunk, v61.subjectUserId) else {
        v66, 
        v63, 
        v62, 
        v61.closeCentralOverlayThunk, 
        v61.subjectUserId, 
        v61.recommendationContext, 
        v61.contactId, 
        v61.friendshipOriginSourceType
    });
    local v99 = v4.useCallback(function()
        v68(l_EventNames_0.AcceptFriendRequest, {
            profileUserId = v61.subjectUserId
        });
        v62(v41.AcceptFriendRequestFromUserId.API({
            targetUserId = v61.subjectUserId, 
            currentUserId = v63
        })):andThen(function()
            v62(v14.Actions.SetCurrentToastMessage({
                toastMessage = v66.FriendRequestAccepted, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v62(v61.closeCentralOverlayThunk());
        end):catch(function()
            v62(v14.Actions.SetCurrentToastMessage(v67));
        end);
    end, l_dependencyArray_0(v66, v63, v62, v61.closeCentralOverlayThunk, v61.subjectUserId));
    local v100 = v4.useCallback(function()
        v68(l_EventNames_0.IgnoreFriendRequest, {
            profileUserId = v61.subjectUserId
        });
        v62(v41.DeclineFriendRequestFromUserId.API({
            targetUserId = v61.subjectUserId, 
            currentUserId = v63
        })):andThen(function()
            v62(v14.Actions.SetCurrentToastMessage({
                toastMessage = v66.FriendRequestIgnored, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v62(v61.closeCentralOverlayThunk());
        end):catch(function()
            v62(v14.Actions.SetCurrentToastMessage(v67));
        end);
    end, l_dependencyArray_0(v66, v63, v62, v61.closeCentralOverlayThunk, v61.subjectUserId));
    local v102 = l_RoactRodux_0.useSelector(function(v101)
        return v101.PlayerContextualMenu.IsBlockedByMe[v61.subjectUserId] or false;
    end);
    return v4.createElement(v43, {
        headerProps = v4.useMemo(function()
            return {
                displayNameItem = {
                    labelText = v78, 
                    icon = nil, 
                    isLoading = v76.loading
                }, 
                userNameItem = if not not v48 and v61.recommendationContext == l_RecommendationContextType_0.Contacts then nil else {
                    labelText = "@" .. v77, 
                    icon = nil, 
                    isLoading = v76.loading
                }, 
                vendorNameItem = if not not v48 and v79 == "" then nil else {
                    labelText = v79 or "", 
                    icon = not not v81 and {
                        Image = v46, 
                        ImageRectOffset = Vector2.zero, 
                        ImageRectSize = Vector2.zero
                    } or nil, 
                    isLoading = v76.loading
                }, 
                contextText = v84, 
                contextIcon = v82, 
                contextIconColor = if not v83 then nil else v83.Color3, 
                contextIconTransparency = if not v83 then nil else v83.Transparency, 
                joinEventText = v89, 
                joinEventOnActivated = v90, 
                renderJoinEventButton = v88
            };
        end, l_dependencyArray_0(v76, v78, v77, v79, v81, v82, v84, v83, v88, v89, v90, if not v48 then nil else v61.recommendationContext)), 
        buttonProps = v4.useMemo(function()
            local v103 = {
                icon = l_Images_0["icons/actions/feedback"], 
                text = v66.Report, 
                onActivated = v91
            };
            local v104 = {
                icon = v46, 
                text = if not v47 then v66.ViewGamerCardWord else v66.ViewPlatformProfile, 
                onActivated = v92
            };
            local v105 = {
                icon = l_Images_0["icons/actions/block"], 
                text = v66.Block, 
                onActivated = v94
            };
            local v106 = {
                icon = l_Images_0["icons/actions/block"], 
                text = v66.Unblock, 
                onActivated = v96
            };
            local v107 = {
                icon = l_Images_0["icons/actions/friends/friendRemove"], 
                text = v66.Unfriend, 
                onActivated = v97
            };
            local v108 = {
                icon = l_Images_0["icons/actions/friends/friendAdd"], 
                text = v66.AddFriend, 
                onActivated = v98
            };
            local v109 = {
                icon = l_Images_0["icons/actions/friends/friendpending"], 
                text = v66.PendingRequest, 
                onActivated = v51
            };
            local v110 = {
                icon = l_Images_0["icons/actions/friends/friendpending"], 
                text = v66.AcceptFriendRequest, 
                onActivated = v99
            };
            local v111 = {
                icon = l_Images_0["icons/actions/reject"], 
                text = v66.IgnoreFriendRequest, 
                onActivated = v100
            };
            local function v113()
                local v112 = if not v102 then v105 else v106;
                if v61.robloxFriendshipStatus == Enum.FriendStatus.Friend then
                    return {
                        v103, 
                        v105, 
                        v107
                    };
                elseif v61.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then
                    if not v48 or not v61.contactId then
                        return {
                            v108, 
                            v103, 
                            v112
                        };
                    else
                        return {
                            v108
                        };
                    end;
                elseif v61.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then
                    return {
                        v109, 
                        v103, 
                        v112
                    };
                elseif v61.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then
                    return {
                        v110, 
                        v111, 
                        v103, 
                        v112
                    };
                else
                    return {
                        v103, 
                        v112
                    };
                end;
            end;
            if not ((not v49 or not v49:IsProfileEnabled()) or not v80) and v80 ~= "" then
                return v24.append({
                    v104
                }, (v113()));
            else
                return (v113());
            end;
        end, if not v48 then if v49 then {
            v61.robloxFriendshipStatus, 
            v102, 
            v80
        } else l_dependencyArray_0(v61.robloxFriendshipStatus, v102) else if v49 then {
            v61.robloxFriendshipStatus, 
            v102, 
            v80, 
            v61.contactId
        } else {
            v61.robloxFriendshipStatus, 
            v102, 
            v61.contactId
        }), 
        width = UDim.new(0, 400)
    });
end;
