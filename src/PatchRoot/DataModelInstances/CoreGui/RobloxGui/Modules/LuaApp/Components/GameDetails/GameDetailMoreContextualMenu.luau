local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Otter);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.Packages.ApolloClient);
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local l_IXPService_0 = game:GetService("IXPService");
local v10 = require(l_Modules_0.Common.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v12 = require(l_CorePackages_0.Workspace.Packages.RoactAppExperiment);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v16 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v18 = require(l_Modules_0.LuaApp.Actions.Games.SetGameFavorite);
local v19 = require(l_Modules_0.LuaApp.Thunks.Games.GamePostFavorite);
local v20 = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
local v21 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local v22 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v23 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v24 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v25 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v26 = require(l_Modules_0.LuaApp.AppPage);
local v27 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v28 = require(l_Modules_0.LuaApp.Thunks.OpenReportDialog);
local v29 = require(l_Modules_0.LuaApp.Thunks.OpenReportScreen);
local v30 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents);
local v31 = require(l_Modules_0.LuaApp.withLocalization);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v33 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v34 = require(l_Modules_0.LuaApp.Constants);
local v35 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local l_useQuery_0 = v7.useQuery;
local l_gql_0 = v7.gql;
local l_useUserExperiment_0 = v12.useUserExperiment;
local l_CopyExperienceLink_0 = v30.CopyExperienceLink;
local l_Favorite_0 = v30.Favorite;
local l_Follow_0 = v30.Follow;
local l_OpenMore_0 = v30.OpenMore;
local l_ShareExperienceLink_0 = v30.ShareExperienceLink;
local l_ShareGameToChat_0 = v30.ShareGameToChat;
local v45 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v46 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v47 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppFixFavoriteAndFollowOptionsText);
local v48 = require(l_Modules_0.LuaApp.Flags.GetLuaAppGameDetailsMoreShareButtonEnabledV2);
local v49 = require(l_Modules_0.LuaApp.Flags.GetGameDetailsShareButtonAppsflyerRollout);
local l_GetFFlagLuafiedReportEntryPoints_0 = v45.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v45.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagTenFootUiDisableInviteFriends_0 = v45.GetFFlagTenFootUiDisableInviteFriends;
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = v45.GetFFlagEnableUniversalAppGameInviteUnification;
local l_GetFStringUniversalAppGameInviteMenuLayer_0 = v45.GetFStringUniversalAppGameInviteMenuLayer;
local v55 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixNotificationsEnabledLimitReached);
local v56 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAddNotificationsEnabledAgeGate);
local v57 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModalManager_0 = v57.GameInviteModalManager;
local l_GameInviteAnalyticsManager_0 = v57.GameInviteAnalyticsManager;
local l_GameInviteConstants_0 = v57.GameInviteConstants;
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local v62 = game:DefineFastString("ExperienceDetailsCopyLinkExperimentVariant", "enableCopyLinkButton");
local v63 = game:DefineFastString("SocialExperienceDetailsContextualMenuLayer", "Social.ExperienceDetailsContextualMenu");
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local l_Images_0 = v4.App.ImageSet.Images;
local v67 = v3.PureComponent:extend("GameDetailMoreContextualMenu");
local function v74(v68, v69, v70, v71)
    local _ = nil;
    local v73 = nil;
    if not v69 then
        v69 = DateTime;
    end;
    if not v68 then
        return v46.game.info.appsflyer({
            universeId = v70, 
            placeId = v71
        }), v73;
    else
        v73 = tostring(v69.now().UnixTimestampMillis);
        return v46.sharelinks.shortUrl({
            linkId = v68, 
            type = v35.ExperienceDetails, 
            stamp = v73
        }), v73;
    end;
end;
v67.defaultProps = {
    externalContentSharingProtocol = l_ExternalContentSharingProtocol_0.default, 
    onClose = function()
    end
};
v67.init = function(v75)
    v75.isMounted = false;
    v75.getMenuPos = function()
        if v75.props.menuPosition == nil then
            return UDim2.fromOffset(0, 0);
        else
            return v75.props.menuPosition;
        end;
    end;
    v75.getMenuSize = function()
        return UDim2.new(0, 300, 1, 0);
    end;
    v75.getMenuAnchor = function()
        if not (v75.props.menuPosition ~= nil) or v75.props.screenSize == nil then
            return nil;
        elseif not v75.props.menuAnchorPoint then
            return Vector2.new(0, 0);
        else
            return v75.props.menuAnchorPoint;
        end;
    end;
    v75.getLinkPage = function()
        return (v46.game.report({
            placeId = v75.props.rootPlaceId
        }));
    end;
    v75.closeCallback = function()
        if v75.props.onClose then
            v75.props.onClose();
        end;
        v75.props.closeCallback();
    end;
end;
v67.renderContextualMenuContent = function(v76, v77)
    local v78 = {};
    local l_rootPlaceId_0 = v76.props.rootPlaceId;
    local l_eventIngest_0 = v76.props.eventIngest;
    local l_networking_0 = v76.props.networking;
    local l_universeId_0 = v76.props.universeId;
    local l_guiService_0 = v76.props.guiService;
    local v84 = l_Images_0["icons/actions/favoriteOn"];
    local v85 = l_Images_0["icons/actions/favoriteOff"];
    local v86 = v76.props.isFavorite ~= nil and (v76.props.isFavorite or false);
    local v87 = v76.props.isFavorite == nil;
    local v88 = not not v86 and v84 or v85;
    local l_favoriteLabel_0 = v77.favoriteLabel;
    if v47 then
        l_favoriteLabel_0 = not not v86 and v77.favoritedLabel or v77.favoriteLabel;
    end;
    table.insert(v78, {
        icon = v88, 
        text = l_favoriteLabel_0, 
        stayOnActivated = true, 
        onActivated = function()
            if not (not v76.isMounted or v87) and l_rootPlaceId_0 then
                local l_l_networking_0_0 = l_networking_0;
                v76.props.setGameFavorite(l_universeId_0, not v86);
                v76.props.gamePostFavorite(l_l_networking_0_0, l_universeId_0, not v86);
                l_Favorite_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, not v86);
                return ;
            else
                return ;
            end;
        end
    });
    if not v76.props.enableNotificationsDiscoverability then
        local v91 = if not v56() then nil else v76.props.isLocalUserUnder13;
        local v92 = v76.props.gameFollowings == nil;
        local v93 = v76.props.gameFollowings ~= nil and (v76.props.gameFollowings.canFollow or false);
        local v94 = v76.props.gameFollowings ~= nil and (v76.props.gameFollowings.isFollowed or false);
        local v95 = l_Images_0["icons/common/notificationOn"];
        local v96 = l_Images_0["icons/common/notificationOff"];
        local l_followLabel_0 = v77.followLabel;
        if v47 then
            l_followLabel_0 = not not v94 and v77.followingLabel or v77.followLabel;
        end;
        if not v91 then
            table.insert(v78, {
                text = l_followLabel_0, 
                icon = not not v94 and v95 or v96, 
                disabled = v92, 
                stayOnActivated = true, 
                onActivated = function()
                    if not (not v76.isMounted or v92) and l_rootPlaceId_0 then
                        local l_isFollowed_0 = v76.props.gameFollowings.isFollowed;
                        local l_setCurrentToastMessage_0 = v76.props.setCurrentToastMessage;
                        if not v55() then
                            if v93 or l_isFollowed_0 then
                                v76.props.setGameFollow(l_universeId_0, not l_isFollowed_0);
                                v76.props.sendGameFollow(l_networking_0, l_universeId_0, not l_isFollowed_0, false, nil, nil);
                            else
                                l_setCurrentToastMessage_0({
                                    toastType = v23.GameFollowError, 
                                    toastMessage = not v76.props.enableNotificationsRebrand and "Feature.GameFollows.TooltipFollowLimitReached" or "Feature.GameFollows.TooltipNotificationsLimitReached"
                                });
                                return ;
                            end;
                        else
                            local v100 = v76.props.notificationsEnabled.count or 0;
                            local v101 = v76.props.notificationsEnabled.limit or 0;
                            if l_isFollowed_0 then
                                v76.props.setExperienceNotificationsEnabledCount(v100 - 1);
                            elseif v101 <= v100 then
                                l_setCurrentToastMessage_0({
                                    toastType = v23.GameFollowError, 
                                    toastMessage = not v76.props.enableNotificationsRebrand and "Feature.GameFollows.TooltipFollowLimitReached" or "Feature.GameFollows.TooltipNotificationsLimitReached"
                                });
                                return ;
                            else
                                v76.props.setExperienceNotificationsEnabledCount(v100 + 1);
                            end;
                            v76.props.setGameFollow(l_universeId_0, not l_isFollowed_0);
                            v76.props.sendGameFollow(l_networking_0, l_universeId_0, not l_isFollowed_0, false, v100, v101);
                        end;
                        l_Follow_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, not l_isFollowed_0);
                        return ;
                    else
                        return ;
                    end;
                end
            });
        end;
    end;
    if not v76.props.inviteFriendsDisabled then
        table.insert(v78, {
            text = v77.inviteFriends, 
            icon = l_Images_0["icons/actions/friends/friendInvite"], 
            onActivated = function()
                if v76.isMounted and l_rootPlaceId_0 then
                    local v102 = false;
                    if l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
                        local v103 = l_GetFStringUniversalAppGameInviteMenuLayer_0();
                        local l_status_0, l_result_0 = pcall(function()
                            return l_IXPService_0:GetUserLayerVariables(v103);
                        end);
                        if l_status_0 then
                            l_IXPService_0:LogUserLayerExposure(v103);
                            v102 = not not l_result_0 and (l_result_0.inAppGameInviteUXRefresh2023 and true or false);
                        end;
                    end;
                    if not v102 then
                        v76.props.navigateDown({
                            name = v26.ShareGameToChat, 
                            detail = l_rootPlaceId_0, 
                            extraProps = {
                                source = "GameDetailMoreContextualMenu"
                            }
                        });
                        l_ShareGameToChat_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0);
                    else
                        l_GameInviteAnalyticsManager_0:withButtonName(l_GameInviteAnalyticsManager_0.ButtonName.GameDetailsMoreMenu);
                        l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, l_universeId_0);
                        l_GameInviteModalManager_0:openModal({
                            trigger = l_GameInviteConstants_0.Triggers.GameDetailsMoreMenu, 
                            rootPlaceId = l_rootPlaceId_0, 
                            universeId = l_universeId_0
                        });
                    end;
                    v76.closeCallback();
                    return ;
                else
                    return ;
                end;
            end
        });
    end;
    if v76.props.enableCopyLink then
        table.insert(v78, {
            icon = l_Images_0["icons/menu/link"], 
            onActivated = function()
                if v76.isMounted and l_rootPlaceId_0 then
                    local v106, v107 = v74(v76.props.shareLinkId, v76.props.dateTimeOverride, l_universeId_0, l_rootPlaceId_0);
                    v76.props.externalContentSharingProtocol:shareUrl({
                        context = "GameDetailsMoreWebURL", 
                        url = v106
                    });
                    l_CopyExperienceLink_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, {
                        stamp = v107
                    });
                    v76.props.setCurrentToastMessage({
                        toastMessage = "Feature.GameDetails.Toast.LinkCopied", 
                        toastType = v23.SuccessConfirmation
                    });
                    v76.closeCallback();
                    return ;
                else
                    return ;
                end;
            end, 
            text = v77.copyLink
        });
    end;
    if not (not v76.props.shareButtonEnabled or not v76.props.shouldShowShareButton) then
        table.insert(v78, {
            text = v77.share, 
            icon = l_Images_0["icons/actions/share"], 
            onActivated = function()
                if v76.isMounted and l_rootPlaceId_0 then
                    if not v76.props.shouldShareToProvider then
                        local v108 = nil;
                        local v109 = nil;
                        if not v76.props.shareToAppsflyer then
                            v108 = v46.game.info.webpage({
                                placeId = l_rootPlaceId_0
                            });
                        else
                            local v110, v111 = v74(v76.props.shareLinkId, v76.props.dateTimeOverride, l_universeId_0, l_rootPlaceId_0);
                            v108 = v110;
                            v109 = v111;
                        end;
                        l_ShareExperienceLink_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, {
                            shortShareLinkFailed = not v76.props.shareLinkId, 
                            shareToAppsflyer = v76.props.shareToAppsflyer, 
                            stamp = v109, 
                            linkId = v76.props.shareLinkId
                        });
                        v76.props.externalContentSharingProtocol:shareUrl({
                            url = v108, 
                            context = "GameDetailsMoreWebURL"
                        });
                    else
                        v76.props.navigateDown({
                            name = v26.SdkShare, 
                            extraProps = {
                                universeId = l_universeId_0, 
                                context = "GameDetailsMoreWebURL"
                            }
                        });
                    end;
                    v76.closeCallback();
                    return ;
                else
                    return ;
                end;
            end
        });
    end;
    if not v76.props.reportingDisabled then
        table.insert(v78, {
            text = v77.report, 
            icon = l_Images_0["icons/actions/feedback"], 
            onActivated = function()
                if v76.isMounted and l_rootPlaceId_0 then
                    if not v76.props.useLuafiedReportFlow then
                        if v76.props.supportsWebViews then
                            v76.props.navigateDown({
                                name = v26.GenericWebPage, 
                                detail = v76:getLinkPage(), 
                                extraProps = {
                                    title = v77.localizedTextReport
                                }
                            });
                        else
                            v76.props.setToastMessage(v34.WEBVIEWS_UNAVAILABLE_TOAST);
                            return ;
                        end;
                    elseif (not l_GetFFlagEnableAbuseReport10ft_0() or not l_guiService_0) or not l_guiService_0:IsTenFootInterface() then
                        v76.props.reportExperienceDialog({
                            reportEntryPoint = v34.ReportDialogEntryPoints.ExperienceDetails, 
                            universeId = l_universeId_0, 
                            rootPlaceId = l_rootPlaceId_0
                        });
                    else
                        v76.props.reportExperienceScreen({
                            context = v34.ReportScreen.Contexts.Experience, 
                            assetId = tostring(l_rootPlaceId_0), 
                            reportAbuseVector = v34.ReportScreen.AbuseVectors.Place, 
                            platform = v34.ReportScreen.Platforms.Console
                        });
                    end;
                    v76.closeCallback();
                    return ;
                else
                    return ;
                end;
            end
        });
    end;
    return v78;
end;
v67.renderLandscapeContextualMenu = function(v112, v113)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = v112.getMenuPos(), 
        Size = v112.getMenuSize()
    }, {
        ContextMenu = v3.createElement(l_ContextualMenu_0, {
            buttonProps = v112:renderContextualMenuContent(v113), 
            open = true, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            openPositionX = UDim.new(0, 0), 
            openPositionY = UDim.new(0, 0), 
            closeBackgroundVisible = false, 
            screenSize = v112.props.screenSize, 
            onDismiss = v112.closeCallback, 
            contextMenuWidthOverride = UDim.new(1, 0), 
            anchorPointOverride = v112:getMenuAnchor(), 
            motorOverrideOptions = {
                motorCallback = v5.instant, 
                open = {
                    targetValue = 1
                }, 
                close = {
                    targetValue = 0
                }
            }
        })
    });
end;
v67.renderPortraitContextualMenu = function(v114, v115)
    local l_screenSize_0 = v114.props.screenSize;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(if not (v114.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then (l_screenSize_0 ~= nil and l_screenSize_0.X > 0) and (v114.props.menuPosition.X.Offset / l_screenSize_0.X) / 2 or 0 else 0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        ContextMenu = v3.createElement(l_ContextualMenu_0, {
            buttonProps = v114:renderContextualMenuContent(v115), 
            open = true, 
            menuDirection = l_MenuDirection_0.Up, 
            openPositionY = UDim.new(1, -76), 
            closeBackgroundVisible = false, 
            screenSize = l_screenSize_0, 
            onDismiss = v114.closeCallback
        })
    });
end;
v67.didMount = function(v117)
    v117.isMounted = true;
    local l_currentPage_0 = v117.props.currentPage;
    if l_currentPage_0 ~= v26.GameDetail and l_currentPage_0 ~= v26.ExperienceDetail then
        v117.closeCallback();
        return ;
    else
        l_OpenMore_0(v117.props.eventIngest, "GameDetailMoreContextualMenu", v117.props.rootPlaceId);
        return ;
    end;
end;
v67.willUnmount = function(v119)
    v119.isMounted = false;
end;
v67.render = function(v120)
    return v31({
        favoriteLabel = "Feature.Favorites.Label.Favorite", 
        favoritedLabel = "Feature.Favorites.Label.Favorited", 
        followLabel = not v120.props.enableNotificationsRebrand and "Feature.GameDetails.Label.Follow" or "Feature.GameFollows.LabelNotifications", 
        followingLabel = "Feature.Friends.Label.Following", 
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        copyLink = "Feature.GameDetails.Action.CopyLink", 
        share = "Feature.SocialShare.Action.Share", 
        report = "Feature.GameDetails.Action.Report"
    })(function(v121)
        if not (v120.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then
            return v120:renderLandscapeContextualMenu(v121);
        else
            return v120:renderPortraitContextualMenu(v121);
        end;
    end);
end;
v67 = l_RoactAppPolicy_0.connect(function(v122, _)
    return {
        shouldShowShareButton = v122.shouldShowGameDetailsShareButton(), 
        shouldShareToProvider = v122.shouldShareToAccountProvider(), 
        reportingDisabled = v122.getGameReportingDisabled(), 
        supportsWebViews = v122.getWebViewSupport(), 
        useLuafiedReportFlow = if l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v122.getUseLuafiedReportFlow() else nil, 
        inviteFriendsDisabled = if not l_GetFFlagTenFootUiDisableInviteFriends_0() then nil else v122.getInviteFriendsDisabled()
    };
end)((v10.connect(function(v124, v125)
    local v126 = v124.GameDetails[v125.universeId];
    local v127 = v124.Games[v125.universeId];
    return {
        rootPlaceId = not not v126 and v126.rootPlaceId or v127 and v127.placeId, 
        isFavorite = v124.GameFavorites[v125.universeId], 
        gameFollowings = v124.GameFollowings[v125.universeId], 
        currentPage = v124.Navigation.currentRoute.routeName, 
        shareButtonEnabled = v48(v124.LocalUserId), 
        shareToAppsflyer = v49(v124.LocalUserId), 
        screenSize = v124.ScreenSize, 
        deviceOrientation = v124.DeviceOrientation, 
        notificationsEnabled = if not v55() then nil else v124.ExperienceNotificationsEnabled or {}, 
        isLocalUserUnder13 = if not v56() then nil else v124.IsLocalUserUnder13
    };
end, function(v128)
    return {
        closeCallback = function()
            v128(v25());
        end, 
        gamePostFavorite = function(v129, v130, v131)
            return v128(v19(v129, v130, v131));
        end, 
        setGameFavorite = function(v132, v133)
            return v128(v18(v132, v133));
        end, 
        sendGameFollow = function(v134, v135, v136, v137, v138, v139)
            return v128(v21(v134, v135, v136, v137, v138, v139));
        end, 
        setGameFollow = function(v140, v141)
            return v128(v20(v140, v141));
        end, 
        setCurrentToastMessage = function(v142)
            return v128(v33(v142));
        end, 
        navigateDown = function(v143)
            return v128(v27(v143));
        end, 
        setToastMessage = function(v144)
            return v128(v33(v144));
        end, 
        reportExperienceDialog = if not l_GetFFlagLuafiedReportEntryPoints_0() then nil else function(v145)
            return v128(v28(v145));
        end, 
        reportExperienceScreen = if not l_GetFFlagEnableAbuseReport10ft_0() then nil else function(v146)
            return v128(v29(v146));
        end, 
        setExperienceNotificationsEnabledCount = if not v55() then nil else function(v147)
            return v128(v22(v147));
        end
    };
end)(v67)));
if l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then
    v67 = v12.connectUserLayer({
        v24.ExperienceDetailsPageLayer
    }, function(v148, _)
        local v150 = (v148[v24.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1;
        return {
            enableNotificationsDiscoverability = v150 == 2, 
            enableNotificationsRebrand = v150 > 0
        };
    end)(v67);
end;
local v151 = l_gql_0("\t\tquery ExperienceDetailsLink($universeId: String $universeId) {\n\t\t\t\tlinkId\n\t\t\t}\n\t\t}\n\t");
local l_v67_0 = v67;
return l_RoactServices_0.connect({
    networking = v14, 
    localization = v15, 
    eventIngest = v16, 
    guiService = if not l_GetFFlagEnableAbuseReport10ft_0() then nil else l_AppGuiService_0
})(function(v153)
    local _ = nil;
    local v155 = nil;
    local v156 = l_useQuery_0(v151, {
        variables = {
            universeId = v153.universeId
        }
    });
    if not (not v156.data or not v156.data.experienceDetailsLinkByUniverseId) then
        v155 = v156.data.experienceDetailsLinkByUniverseId.linkId;
    end;
    return v3.createElement(l_v67_0, (v6.Dictionary.join(v153, {
        enableCopyLink = l_useUserExperiment_0({
            v63
        }, function(v157)
            return (v157[v63] or {})[v62];
        end, true), 
        shareLinkId = v155
    })));
end);
