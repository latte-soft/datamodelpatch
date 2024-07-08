local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactNavigation);
local v6 = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Packages.React);
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v11 = require(l_script_FirstAncestor_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v12 = require(l_script_FirstAncestor_0.LuaApp.Navigation.isRootRouteInRN);
local v13 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_withNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).withNavigationProps;
local v16 = require(l_script_FirstAncestor_0.Common.memoize);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local _ = require(script.Parent.mapStateToProps);
local _ = require(script.Parent.mapDispatchToProps);
local v22 = require(l_script_FirstAncestor_0.Profile);
local l_PeekViewEntryPoint_0 = v22.PeekViewEntryPoint;
local l_ProfileScreens_0 = v22.ProfileScreens;
local l_ProfileTypes_0 = v22.ProfileTypes;
local _ = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenProfilePeekView);
local l_peekViewDismissedEvent_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).analytics.peekViewDismissedEvent;
local l_GetFFlagPeekViewScrimLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPeekViewScrimLogging;
local v29 = require(l_script_FirstAncestor_0.LuaApp.Flags.FullProfileViewIXP);
local v30 = v4.Component:extend("ProfileUniversalAppWrapper");
v30.defaultProps = {
    enteredChatFromEntryPoint = function()
    end, 
    renderProfilePeekView = nil
};
v30.init = function(v31)
    local l_props_0 = v31.props;
    v31.navigationAppContainer = v5.createAppContainer(l_PeekViewEntryPoint_0, nil);
    if l_props_0.debug_navigationAppContainer then
        v31.navigationAppContainer = l_props_0.debug_navigationAppContainer;
    end;
    v31._robloxEventReceiver = l_RobloxEventReceiver_0.new(v31.props.notificationService);
    v31.openChatDialog = function(v33)
        l_props_0.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.ProfilePeekView);
        l_GuiService_0:BroadcastNotification(v33, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
    end;
    v31.joinGame = function(v34, v35, v36)
        l_LaunchGame_0(nil, nil, {
            userId = v34
        }, v31.props.game, v35, v36);
    end;
    v31.navigateToLuaAppPages = {
        [l_ProfileScreens_0.ProfilePeekView] = l_props_0.openProfilePeekView, 
        [l_ProfileScreens_0.ViewUserProfile] = l_props_0.openProfileFullPage, 
        [l_ProfileScreens_0.GameDetailsPeekView] = l_props_0.openGameDetailsPeekView, 
        [l_ProfileScreens_0.Chat] = v31.openChatDialog, 
        [l_ProfileScreens_0.JoinGame] = v31.joinGame, 
        [l_ProfileScreens_0.ViewUserFriends] = l_props_0.openViewUserFriends, 
        [l_ProfileScreens_0.ViewUserFollowing] = l_props_0.openViewUserFollowing, 
        [l_ProfileScreens_0.ViewUserFollowers] = l_props_0.openViewUserFollowers, 
        [l_ProfileScreens_0.ItemDetails] = l_props_0.openAppItemDetails, 
        [l_ProfileScreens_0.ReportUser] = l_props_0.openReportUser, 
        [l_ProfileScreens_0.PurchaseErrorToast] = l_props_0.showPurchaseErrorToast, 
        [l_ProfileScreens_0.NetworkingErrorToast] = l_props_0.showNetworkingErrorToast, 
        [l_ProfileScreens_0.ProfileQRCodePage] = l_props_0.navigateTo3DQRCodePage, 
        [l_ProfileScreens_0.EditProfilePage] = function(v37)
            v31.props.openEditProfilePage(v6.Dictionary.join(v37, {
                robloxEventReceiver = v31._robloxEventReceiver
            }));
        end
    };
    v31.isAndroidBackButtonHandlerDisabled = v16(function(v38, v39, v40)
        local v41 = false;
        if v38 == v13.ProfilePeekView then
            v41 = v39 == v40;
        end;
        return not v41;
    end);
    v31.renderAndroidBackButtonNavigationHandler = v16(function(v42)
        return function(v43)
            return v4.createElement(v11, {
                canGoBackInRN = not v12(v43.state), 
                navigateBackInRN = v43.pop, 
                disabled = v42
            });
        end;
    end);
    v31.onPeekViewClosed = function()
        if l_props_0.onPeekViewClosed then
            l_props_0.onPeekViewClosed();
        end;
        l_props_0.navigateBackInAppRoute(true);
    end;
    if l_GetFFlagPeekViewScrimLogging_0() then
        v31.onPeekViewGoBack = function()
            if l_props_0.eventIngestService then
                l_peekViewDismissedEvent_0.logEvent(l_props_0.eventIngestService, "ProfilePeekView", {
                    dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
                    page = l_props_0.currentAppPageName
                });
            end;
            l_props_0.navigateBackInAppRoute();
        end;
    end;
    v31.abbreviateCount = function(v44)
        return l_abbreviateCount_0(v44, l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId):GetLocale());
    end;
    v31.renderProfilePeekView = l_props_0.renderProfilePeekView or function()
        local l_props_1 = v31.props;
        return v4.createElement(v31.navigationAppContainer, {
            profileType = l_props_1.profileType, 
            profileUserId = l_props_1.profileUserId, 
            peekViewProps = {
                showBackButton = l_props_1.showBackButton, 
                mountAsFullView = ((not not v29.GetFFlagFullProfileViewIXPSetupEnabled() and l_props_1.showFullProfileView) and l_props_1.profileType ~= l_ProfileTypes_0.FromContacts) and true or l_props_1.mountAsFullView, 
                onPeekViewClosed = v31.onPeekViewClosed, 
                onPeekViewGoBack = if not l_GetFFlagPeekViewScrimLogging_0() then l_props_0.navigateBackInAppRoute else v31.onPeekViewGoBack
            }, 
            navigationParams = {
                absolutePosition = l_props_1.absolutePosition, 
                isHomePageCarousel = l_props_1.isHomePageCarousel, 
                recommendationContextType = l_props_1.recommendationContextType, 
                isRecommendation = l_props_1.isRecommendation, 
                mutualFriendsCount = l_props_1.mutualFriendsCount, 
                recommendationSessionId = l_props_1.recommendationSessionId, 
                recommendationRank = l_props_1.recommendationRank, 
                source = l_props_1.source, 
                offNetworkFriendRequestToken = l_props_1.offNetworkFriendRequestToken, 
                shareLinkId = l_props_1.shareLinkId, 
                contextualInfoType = l_props_1.contextualInfoType, 
                contextualInfoDisplay = l_props_1.contextualInfoDisplay
            }, 
            contactProps = l_props_1.contactProps or {
                contactId = l_props_1.contactId, 
                contactName = l_props_1.contactName
            }, 
            analyticsProps = l_props_1.analyticsProps, 
            navigateToLuaAppPages = v31.navigateToLuaAppPages, 
            renderAndroidBackButtonNavigationHandler = v31.renderAndroidBackButtonNavigationHandler((v31.isAndroidBackButtonHandlerDisabled(l_props_1.currentAppPageName, l_props_1.currentAppPageDetail, l_props_1.profileUserId))), 
            abbreviateCount = v31.abbreviateCount, 
            robloxEventReceiver = v31._robloxEventReceiver, 
            catalogAnalytics = l_props_1.catalogAnalytics, 
            eventIngestService = l_props_1.eventIngestService, 
            sessionService = l_props_1.sessionService, 
            sessionType = l_SessionType_0, 
            localUserId = l_props_1.localUserId, 
            wideMode = l_props_1.wideMode
        });
    end;
end;
v30.render = function(v46)
    return v46.renderProfilePeekView();
end;
v30.didMount = function(v47)
    if v47.props.onOpen then
        v47.props.onOpen();
    end;
end;
v30.willUnmount = function(v48)
    if v48.props.onClose then
        v48.props.onClose();
    end;
end;
return (l_withNavigationProps_0(function(v49, v50)
    return v6.Dictionary.join(v50 or {}, {
        profileUserId = v49
    });
end)(v30));
