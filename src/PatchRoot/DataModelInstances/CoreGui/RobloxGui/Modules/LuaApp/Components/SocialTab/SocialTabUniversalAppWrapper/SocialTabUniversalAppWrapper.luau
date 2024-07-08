local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.RoactNavigation);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadingStateContainer_0 = v4.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_Contexts_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v13 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v14 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v15 = require(l_script_FirstAncestor_0.LuaApp.Models.User);
local v16 = require(l_script_FirstAncestor_0.LuaApp.Util.joinGame);
local l_getEntryPointWithParentContext_0 = require(l_CorePackages_0.Workspace.Packages.FriendsLanding).getEntryPointWithParentContext;
local v18 = require(l_script_FirstAncestor_0.LuaApp.Config);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v20 = require(l_script_FirstAncestor_0.LuaApp.PerformanceTesting);
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local l_SetAppLoaded_0 = v13.Actions.SetAppLoaded;
local v23 = require(l_script_FirstAncestor_0.LuaApp.Enum.NotificationType);
local v24 = require(l_script_FirstAncestor_0.LuaApp.Enum.RetrievalStatus);
local l_llama_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).llama;
local v26 = require(script.Parent.Parent.utils.formatUser);
local l_ChatEventReceiver_0 = v13.Components.EventReceivers.ChatEventReceiver;
local v28 = require(l_script_FirstAncestor_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v29 = require(l_script_FirstAncestor_0.Common.Signal);
local v30 = require(l_script_FirstAncestor_0.Common.GetDefaultQualityLevel);
local l_AndroidBackButtonConnection_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).AndroidBackButtonConnection;
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).EnumScreens;
local _ = require(l_CorePackages_0.Workspace.Packages.AppChat).Screens;
local v34 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTabLoader.Container);
local l_Context_0 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTab).Context;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v37 = require(l_script_FirstAncestor_0.LuaApp.Components.Players.PlayerSearch);
local _ = require(l_script_FirstAncestor_0.Profile.Flags.ProfileIXPTest);
local l_OffPlatformFriendRequestsIXP_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Flags.OffPlatformFriendRequestsIXP;
local v40 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v41 = require(l_script_FirstAncestor_0.LuaApp.Flags.GetFFlagLuaProfileShareEnabled);
local v42 = require(l_script_FirstAncestor_0.LuaApp.Http.UrlBuilder);
local l_GetFFlagLuafiedReportEntryPoints_0 = v40.GetFFlagLuafiedReportEntryPoints;
local l_EntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).EntryPoint;
local v45 = require(l_script_FirstAncestor_0.LuaApp.Components.Chat.ExternalNavigationHandler.Container);
local v46 = require(l_script_FirstAncestor_0.LuaApp.Hooks.useRoactService);
local v47 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalytics);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local _ = require(l_CorePackages_0.Workspace.Packages.ProfileQRCode);
local v50 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v51 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v52 = require(l_script_FirstAncestor_0.LuaApp.Constants);
local l_ConvertUniverseIdToString_0 = v40.ConvertUniverseIdToString;
local v54 = require(l_script_FirstAncestor_0.LuaApp.Experiment.RoactAppExperiment);
local v55 = require(l_script_FirstAncestor_0.LuaApp.Experiment.AppUserLayers);
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP;
local v57 = require(l_script_FirstAncestor_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v59 = game:DefineFastFlag("SocialTabShouldRequestPushPermissions", false);
local l_GetFFlagLuaAppEnableSquadPage_0 = v40.GetFFlagLuaAppEnableSquadPage;
local l_isAppChatChannelsAPIEnabled_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Flags.isAppChatChannelsAPIEnabled;
local v62 = v3.PureComponent:extend("SocialTabUniversalAppWrapper");
v62.defaultProps = {
    renderSocialTab = function()
        return v3.createElement(v34);
    end, 
    renderRoactChat = function()
        return l_Context_0.with(function(v63)
            return not not v63.wasEverVisible and v3.createElement(l_EntryPoint_0, v63) or nil;
        end);
    end, 
    runService = l_RunService_0, 
    externalContentSharingProtocol = l_ExternalContentSharingProtocol_0.default
};
v62.init = function(v64)
    v64.state = {
        wasChatEverTapped = v64.props.isVisible, 
        externalNavigationByScreen = {}
    };
    v64.chatToastRef = v3.createRef();
    v64.androidBackButtonConnection = l_AndroidBackButtonConnection_0(v64.props.guiService, v23);
    v64.androidBackButtonConnectionSocialTab = l_AndroidBackButtonConnection_0(v64.props.guiService, v23);
    v64._rnBypassActionSignal = v29.new();
    v64._rnBypassActionSignalSocialTab = v29.new();
    v64.backButtonEnabled = false;
    v64._performanceTesting = v20;
    v64._robloxEventReceiver = l_RobloxEventReceiver_0.new(v64.props.notificationService);
    if not l_isAppChatChannelsAPIEnabled_0() then
        v64.fetchChatSettings = function()
            return v64.props.fetchChatSettings();
        end;
        v64.getLoadingState = function()
            if v64.state.wasChatEverTapped then
                local v65 = l_RetrievalStatus_0.fromRawValue(v64.props.retrievalStatus);
                if v64.state.wasEverDoneRetrieving then
                    v65 = l_RetrievalStatus_0.fromRawValue(v24.Done);
                end;
                return v3.createElement(l_LoadingStateContainer_0, {
                    dataStatus = v65, 
                    onRetry = v64.fetchChatSettings, 
                    renderOnLoaded = v64.renderOnLoaded
                });
            else
                return nil;
            end;
        end;
    end;
    v64.renderOnLoaded = function()
        if v64.state.wasChatEverTapped then
            return v3.createFragment({
                screen = v64.props.renderSocialTab(), 
                externalNavigation = v3.createElement(v45, {
                    navigationByScreen = v64.state.externalNavigationByScreen
                })
            });
        else
            return nil;
        end;
    end;
    v64.setBackButtonEnabled = function(v66)
        v64.backButtonEnabled = v66;
    end;
    v64.setTabBarVisibleFromChat = function(v67)
        v64.props.setTabBarVisibleFromChat(not not v64.props.shouldSystemBarUsuallyBePresent or v67);
    end;
    v64.setActiveConversationId = function(v68)
        l_Logger_0:debug("{} setting activeConversationId as {}", script.Name, v68);
        v64:setState({
            activeConversationId = v68 or v3.None
        });
    end;
    v64.getActiveConversationId = function()
        return v64.state.activeConversationId;
    end;
    v64.initRoactChatNavigation = function()
        v64._rnBypassActionSignalSocialTab:fire(v5.Actions.navigate({
            routeName = l_EnumScreens_0.RoactChat
        }));
    end;
    v64.updateExternalNavigationForScreen = function(v69, v70)
        v64:setState(function(v71, _)
            if not v69 then
                local v73 = l_llama_0.Dictionary.copy(v71.externalNavigationByScreen);
                v73[v70] = nil;
                return {
                    externalNavigationByScreen = v73
                };
            else
                return {
                    externalNavigationByScreen = l_llama_0.Dictionary.join(v71.externalNavigationByScreen, {
                        [v70] = v69
                    })
                };
            end;
        end);
    end;
    v64.navigateDownToNotifications = function(v74)
        v74 = v74 or false;
        v64.props.navigateDownToNotifications(function()
            if v74 then
                v64.setTabBarVisibleFromChat(true);
            end;
        end);
    end;
    v64.openProfileWebView = function(v75)
        v64.props.navigateDownToViewUserProfile(v75, function()
            if v64.props.wideMode then
                v64.setTabBarVisibleFromChat(v64.props.wideMode);
            end;
        end);
    end;
    v64.openProfilePeekView = function(v76, v77)
        v64.props.openProfilePeekView(v76, {
            onClose = function()
                if v64.state.getIsTabBarEnabled then
                    v64.setTabBarVisibleFromChat(v64.state.getIsTabBarEnabled());
                end;
                if not (not v77 or not v77.onClose) then
                    v77.onClose();
                end;
            end, 
            onOpen = function()
                v64.setTabBarVisibleFromChat(false);
                if not (not v77 or not v77.onOpen) then
                    v77.onOpen();
                end;
            end, 
            resetPeekView = true
        });
    end;
    v64.navigateDownToReportAbuse = function(v78, v79)
        if not v64.props.useLuafiedReportFlow then
            v64.props.navigateDownToReportAbuse(v78, v79);
            return ;
        else
            v64.props.openReportDialog(v78, v79);
            return ;
        end;
    end;
    v64.navigateDownToPrivacySettings = function()
        v64.props.navigateDownToPrivacySettings();
    end;
    v64.navigateDownToGroups = function()
        v64.props.navigateDownToGroups(function()
            v64.setTabBarVisibleFromChat(true);
        end);
    end;
    v64.navigateDownToAddFriends = function()
        v64.props.navigateDownToAddFriends(function()
            v64.setTabBarVisibleFromChat(true);
        end);
    end;
    v64.navigateDownToProfileShare = function(v80)
        v64.props.externalContentSharingProtocol:shareUrl({
            url = v42.user.appsflyer({
                userId = v80, 
                sourceType = "ProfileShare"
            }), 
            context = "ProfileShareAtSocialTabPage"
        });
    end;
    v64.navigateDownToSquadLobby = function(v81)
        v64.props.navigateDownToSquadLobby(v81);
    end;
    v64.FriendFinder = function()
        v64.props.navigateDownToFriendFinder(function()
            v64.setTabBarVisibleFromChat(true);
        end);
    end;
    v64.AddFriendsAccountProvider = function(v82)
        v64.props.navigateDownToAddFriendsAccountProvider(v82);
    end;
    v64.setIsTabBarEnabled = function(v83)
        v64:setState({
            getIsTabBarEnabled = v83
        });
    end;
    v64.openUserContextualMenu = function(v84)
        local l_onClose_0 = v84.onClose;
        v64.props.openContextualMenu((l_llama_0.Dictionary.join(v84, {
            onCloseGameDetails = function()
                v64.setTabBarVisibleFromChat(true);
            end, 
            onClose = function()
                if l_onClose_0 then
                    l_onClose_0();
                end;
            end, 
            onCloseProfileWebview = function()
                v64.setTabBarVisibleFromChat(true);
            end, 
            user = v26(v84.user)
        })));
    end;
    v64.navigateToUserInfo = function(v86, v87)
        if v87 then
            local v88 = v87.contextualMenuProps or {};
            if v87.contextualMenuProps then
                v88 = l_llama_0.Dictionary.join(v88, {
                    onCloseGameDetails = function()
                        v64.setTabBarVisibleFromChat(true);
                    end, 
                    onClose = function()
                        if v87.contextualMenuProps.onClose then
                            v87.contextualMenuProps.onClose();
                        end;
                    end, 
                    onCloseProfileWebview = function()
                        v64.setTabBarVisibleFromChat(true);
                    end, 
                    user = v26(v87.contextualMenuProps.user)
                });
            end;
            v64.props.navigateToUserInfo(v86, {
                contextualMenuProps = v88, 
                profilePeekViewProps = l_llama_0.Dictionary.join(v87.profilePeekViewProps or {}, {
                    resetPeekView = true, 
                    onClose = function()
                        if v64.state.getIsTabBarEnabled then
                            v64.setTabBarVisibleFromChat(v64.state.getIsTabBarEnabled());
                        end;
                        if not (not v87.profilePeekViewProps or not v87.profilePeekViewProps.onClose) then
                            v87.profilePeekViewProps.onClose();
                        end;
                    end, 
                    onOpen = function()
                        v64.setTabBarVisibleFromChat(false);
                        if not (not v87.profilePeekViewProps or not v87.profilePeekViewProps.onOpen) then
                            v87.profilePeekViewProps.onOpen();
                        end;
                    end, 
                    source = v87.source
                }), 
                openJoinable = v87.openJoinable, 
                entryPoint = v87.entryPoint
            });
            return ;
        else
            v64.openProfileWebView(v86);
            return ;
        end;
    end;
    v64.navigateToLuaAppPages = {
        [l_EnumScreens_0.GameDetail] = v64.props.navigateToGameDetails, 
        [l_EnumScreens_0.ViewUserProfile] = v64.navigateToUserInfo, 
        [l_EnumScreens_0.Notifications] = v64.navigateDownToNotifications, 
        [l_EnumScreens_0.LearnMore] = v64.props.openLearnMoreLink, 
        [l_EnumScreens_0.ReportAbuse] = v64.navigateDownToReportAbuse, 
        [l_EnumScreens_0.PrivacySettings] = v64.navigateDownToPrivacySettings, 
        [l_EnumScreens_0.AddFriends] = v64.navigateDownToAddFriends, 
        [l_EnumScreens_0.Groups] = v64.navigateDownToGroups, 
        [l_EnumScreens_0.FriendFinder] = v64.FriendFinder, 
        [l_EnumScreens_0.AddFriendsAccountProvider] = v64.AddFriendsAccountProvider, 
        [l_EnumScreens_0.ProfileShare] = v64.navigateDownToProfileShare, 
        [l_EnumScreens_0.ViewUser] = v64.openUserContextualMenu, 
        [l_EnumScreens_0.VerifiedBadgeModal] = v64.props.openVerifiedBadgeModal, 
        [l_EnumScreens_0.DiscoverabilityModal] = v64.props.openDiscoverabilityModal, 
        [l_EnumScreens_0.ProfileQRCode] = function()
            v64.props.navigateTo3DQRCodePage({
                source = l_Contexts_0.AddFriends
            });
        end, 
        [l_EnumScreens_0.SearchPage] = function()
            v64.props.navigation.navigate(v14.SearchPage, {
                defaultSearchType = v52.SearchTypes.Players
            });
        end, 
        [l_EnumScreens_0.AmpWizardContainer] = v64.props.openAmpWizardContainer, 
        [l_EnumScreens_0.SquadLobby] = if not l_GetFFlagLuaAppEnableSquadPage_0() then nil else v64.navigateDownToSquadLobby
    };
    v64.luaAppPages = {
        playerSearchPage = v37
    };
    local v89 = nil;
    v89 = l_RunService_0.RenderStepped:Connect(function()
        if v89 then
            v89:Disconnect();
        end;
        settings().Rendering.QualityLevel = v30();
    end);
    v64.onBackButtonPressed = function()
        if not v64.props.canGoBack then
            if not v64.backButtonEnabled then
                v64.androidBackButtonConnection.showExitDialog();
                return ;
            else
                v64._rnBypassActionSignal:fire(v5.Actions.back());
                return ;
            end;
        else
            v64.props.navigateBack();
            return ;
        end;
    end;
    v64.isAndroidBackButtonHandlerDisabled = function(v90)
        local v91 = true;
        if v90 ~= v14.GameDetail then
            v91 = true;
            if v90 ~= v14.ShareGameToChat then
                v91 = true;
                if v90 ~= v14.ProfilePeekView then
                    v91 = true;
                    if v90 ~= v14.AvatarExperienceWrapperTransparent then
                        v91 = v90 == v14.AvatarExperienceWrapper;
                    end;
                end;
            end;
        end;
        return v91;
    end;
    v64._navigatingFromSocialTabEvent = nil;
    v64.setNavigatingFromSocialTabEvent = function(v92)
        v64._navigatingFromSocialTabEvent = {
            startTime = os.clock(), 
            startPage = l_EnumScreens_0.SocialTab, 
            endPage = v92
        };
    end;
    v64.getNavigatingFromSocialTabEvent = function()
        return v64._navigatingFromSocialTabEvent;
    end;
    if v59 then
        l_default_0:requestPermissions({
            l_default_0.Permissions.POST_NOTIFICATIONS
        });
    end;
    v64.generateContext = l_memoize_0(function(v93, v94, v95, v96, v97, v98, v99, v100, v101, v102)
        return {
            wasEverVisible = v64.state.wasEverVisible, 
            localUserId = v94, 
            isVisible = v93, 
            pageType = v97, 
            parameters = v98, 
            navigationProps = v95, 
            logger = l_Logger_0, 
            navigateToLuaAppPages = v64.navigateToLuaAppPages, 
            rnBypassActionSignal = v64._rnBypassActionSignal, 
            rnBypassActionSignalSocialTab = v64._rnBypassActionSignalSocialTab, 
            getActiveConversationId = v64.getActiveConversationId, 
            setActiveConversationId = v64.setActiveConversationId, 
            setBackButtonEnabled = v64.setBackButtonEnabled, 
            setTabBarVisible = v64.setTabBarVisibleFromChat, 
            luaAppPages = v64.luaAppPages, 
            wideMode = v99, 
            notificationCount = v96, 
            robloxEventReceiver = v64._robloxEventReceiver, 
            userInputService = l_UserInputService_0, 
            roactChatEntryPoint = l_EntryPoint_0, 
            getFriendsLandingEntryPoint = l_getEntryPointWithParentContext_0, 
            androidBackButtonConnection = v64.androidBackButtonConnectionSocialTab, 
            signal = v29, 
            androidBackButtonHandlerDisabled = v64.isAndroidBackButtonHandlerDisabled(v100), 
            setIsTabBarEnabled = not not v101 and v64.setIsTabBarEnabled or nil, 
            isLuaProfilePageEnabled = v101, 
            useRoactService = v46, 
            roactAnalytics = v47, 
            roactAnalyticsCommonGameEvents = l_RoactAnalyticsCommonGameEvents_0, 
            joinGame = v16, 
            openGameDetails = v50, 
            navigateDown = v51, 
            presenceType = v15.PresenceType, 
            appPage = v14, 
            convertUniverseIdToString = l_ConvertUniverseIdToString_0, 
            setNavigatingFromSocialTabEvent = v64.setNavigatingFromSocialTabEvent, 
            getNavigatingFromSocialTabEvent = v64.getNavigatingFromSocialTabEvent, 
            isProfileShareEnabled = v64.props.isProfileSharePolicyEnabled and (v41() or v64.props.luaProfileShareEnabled), 
            luaAddFriendsPageEnabled = v102, 
            setAppLoaded = l_SetAppLoaded_0, 
            fetchUnreadConversationCount = v64.props.fetchUnreadConversationCount, 
            notificationService = v64.props.notificationService, 
            config = v18, 
            toggleChatPaused = v64.props.toggleChatPaused, 
            performanceTesting = v20, 
            notificationType = v23, 
            contactImporterAndPYMKEnabled = (not not v64.props.contactImporterAndPYMKEnabled and v64.props.isContactImporterPolicyEnabled or v64.props.isLocalUserSoothsayer) or nil, 
            diagService = v64.props.roactAnalytics.Diag, 
            eventIngestService = v64.props.eventIngestService, 
            openProfilePeekView = v64.props.openProfilePeekView, 
            closeCentralOverlay = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v64.props.closeCentralOverlay, 
            openLearnMoreLink = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v64.props.openLearnMoreLink, 
            showToast = if not l_SelfViewProfileDiscoverabilityUpsellIXP_0.SetupEnabled() then nil else v64.props.showToast, 
            discoverabilityUpsellOnProfileSelfViewEnabled = v64.props.discoverabilityUpsellOnProfileSelfViewEnabled, 
            updateExternalNavigationForScreen = v64.updateExternalNavigationForScreen, 
            initialRouteName = v64.props.initialRouteName, 
            openPlayerContextualMenu = v64.props.openPlayerContextualMenu
        };
    end);
end;
v62.render = function(v103)
    return l_withStyle_0(function(_)
        return v3.createElement(l_Context_0.Provider, {
            value = v103.generateContext(v103.props.isVisible, v103.props.localUserId, v103.props.navigationProps, v103.props.notificationCount, v103.props.pageType, v103.props.parameters, v103.props.wideMode, v103.props.currentAppPage, true, v103.props.luaAddFriendsPageEnabled)
        }, {
            SocialTab = v3.createElement(v28, {
                BorderSizePixel = 0, 
                BackgroundColor3 = v103.props.BackgroundColor, 
                BackgroundTransparency = v103.props.BackgroundTransparency, 
                useFullScalePage = v103.props.useFullScalePage, 
                includeStatusBar = true
            }, {
                ChatEventReceiver = v3.createElement(l_ChatEventReceiver_0, {
                    robloxEventReceiver = v103._robloxEventReceiver, 
                    rnBypassActionSignal = v103._rnBypassActionSignal, 
                    initRoactChatNavigation = v103.initRoactChatNavigation, 
                    activeConversationId = v103.state.activeConversationId
                }), 
                SocialTab = v103.renderOnLoaded()
            })
        });
    end);
end;
v62.didMount = function(v105)
    l_Logger_0:info("Initializing SocialTabUniversalAppWrapper");
    if v105.props.isVisible and v105.props.toggleChatPaused ~= nil then
        v105.props.toggleChatPaused(false);
    end;
end;
v62.didUpdate = function(v106, v107, _)
    if v107.isVisible ~= v106.props.isVisible then
        v106.androidBackButtonConnection.disconnect();
        if v107.isVisible then
            v106._performanceTesting:Stop();
            v106.props.setThrottleFramerateEnabled(false);
            v106.props.toggleChatPaused(true);
        else
            v106._performanceTesting:Initialize();
            v106.props.setThrottleFramerateEnabled(v18.General.PerformanceTestingMode == Enum.VirtualInputMode.None);
            v106.props.toggleChatPaused(false);
            return ;
        end;
    end;
end;
v62.getDerivedStateFromProps = function(v109, v110)
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    if v109.isVisible then
        v111 = true;
    end;
    if v109.retrievalStatus == v24.Done then
        v112 = true;
    end;
    if v110.wasChatEverTapped == false and v109.isVisible == true then
        v113 = true;
    end;
    return {
        wasChatEverTapped = v113, 
        wasEverVisible = v111, 
        wasEverDoneRetrieving = v112
    };
end;
v62.willUnmount = function(v114)
    v114.androidBackButtonConnection.disconnect();
end;
return (v54.connectUserLayer({
    v55.SocialFriendsLayer, 
    v55.SocialProfileLayer
}, function(v115, _)
    local v117 = v115[v55.SocialFriendsLayer] or {};
    return {
        luaAddFriendsPageEnabled = v117.show_lua_add_friends_page == "True", 
        luaProfileShareEnabled = v117.show_profile_share == "True", 
        discoverabilityUpsellOnProfileSelfViewEnabled = l_SelfViewProfileDiscoverabilityUpsellIXP_0.experimentOrRolloutEnabled(v115), 
        contactImporterAndPYMKEnabled = l_OffPlatformFriendRequestsIXP_0.experimentOrRolloutEnabled(v115), 
        contactImporterExperimentVariant = l_OffPlatformFriendRequestsIXP_0.getExperimentVariant(v115)
    };
end)((v57((l_UniversalAppPolicy_0.connect(function(v118)
    return {
        isProfileSharePolicyEnabled = v118.getProfileShareEnabled(), 
        isContactImporterPolicyEnabled = v118.getContactImporterEnabled(), 
        shouldSystemBarUsuallyBePresent = v118.getShouldSystemBarUsuallyBePresent(), 
        useLuafiedReportFlow = if not l_GetFFlagLuafiedReportEntryPoints_0() then nil else v118.getUseLuafiedReportFlow()
    };
end)(v62))))));
