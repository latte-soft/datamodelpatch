local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_SessionService_0 = game:GetService("SessionService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local v13 = not not l_game_EngineFeature_0 and game:GetService("AppUpdateService") or nil;
local l_IXPService_0 = game:GetService("IXPService");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StartupMessageService_0 = game:GetService("StartupMessageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v20 = require(l_CorePackages_0.Roact);
local v21 = require(l_CorePackages_0.Rodux);
local v22 = require(l_CorePackages_0.RoactRodux);
local v23 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local v25 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v28 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_GameProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol;
local l_MakeOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.GraphQlShared).MakeOmniRecommendationsRequest;
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_PrefetchProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PrefetchProtocol).PrefetchProtocol;
local v33 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v34 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol);
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local v36 = require(l_Modules_0.Common.Signal);
local v37 = require(l_Modules_0.Common.Analytics);
local v38 = require(l_Modules_0.LuaApp.AppReducer);
local l_useUserAgreements_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).useUserAgreements;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v41 = require(l_Modules_0.LuaApp.Components.AppConfigurer);
local l_ProviderContainer_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.ProviderContainer;
local v43 = require(l_Modules_0.LuaApp.Components.EventStreamUpdater);
local v44 = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
local v45 = require(l_Modules_0.LuaApp.Components.AppPresence);
local v46 = require(l_Modules_0.LuaApp.Components.MutedErrorReporter);
local v47 = require(l_Modules_0.LuaApp.Components.EventReceiverLifecycleAdapter);
local v48 = require(l_Modules_0.LuaApp.Components.MemStorageSubscriberLifecycleAdapter);
local v49 = require(l_Modules_0.LuaApp.Components.LocalPlayerManager);
local v50 = require(l_Modules_0.LuaApp.Components.ViewportManager);
local v51 = require(l_Modules_0.LuaApp.Components.FrameRateManager);
local v52 = require(l_Modules_0.LuaApp.Components.LocaleManager);
local v53 = require(l_Modules_0.LuaApp.Components.LocalStorageListener);
local v54 = require(l_Modules_0.LuaApp.LuaAppBacktraceLogger);
local v55 = require(l_Modules_0.LuaApp.Components.Session.SessionManager);
local v56 = require(l_Modules_0.LuaApp.Components.Session.UserHeartbeatsManager);
local v57 = require(l_Modules_0.LuaApp.Components.WebViewEventHandler);
local v58 = require(l_CorePackages_0.Packages.UIBlox);
local _ = require(l_Modules_0.LuaApp.Experiment.getAllAppUserLayers);
local v60 = require(l_Modules_0.LuaApp.mutedError);
local v61 = require(l_Modules_0.LuaApp.Util.createRoduxErrorReporter);
local v62 = require(l_Modules_0.LuaApp.Components.SiteAlertManager);
local l_InAppAchievementManager_0 = require(l_CorePackages_0.Workspace.Packages.Achievements).InAppAchievementManager;
local l_Provider_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local l_AppReadyHandler_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).AppReadyHandler;
local l_RnBypassAdapter_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).RnBypassAdapter;
local v67 = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider);
local v68 = require(l_Modules_0.AvatarExperience.Common.Context.BodyDataProvider);
local l_GetFFlagColorPickerSliderOptimization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagColorPickerSliderOptimization;
local l_GetFFlagEnableResponsiveProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableResponsiveProvider;
local v71 = require(l_Modules_0.LuaApp.LocalizationProvider);
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v74 = require(l_Modules_0.LuaApp.DesignTokenMappers.tokenMappers);
local v75 = require(l_Modules_0.LuaApp.Components.AppGridProvider);
local l_SelectionCursorProvider_0 = v58.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v58.App.SelectionCursor.CursorProvider;
local v78 = require(l_Modules_0.LuaApp.ThemeProvider);
local v79 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v82 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local v83 = require(l_Modules_0.LuaApp.Components.EventReceivers.BadgeEventReceiver);
local v84 = require(l_Modules_0.LuaApp.Components.EventReceivers.RobuxEventReceiver);
local v85 = require(l_Modules_0.LuaApp.Components.EventReceivers.FriendshipEventReceiver);
local v86 = require(l_Modules_0.LuaApp.Components.EventReceivers.NavigationEventReceiver);
local v87 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EventReceivers.EventReceiver);
local v88 = require(l_Modules_0.LuaApp.Components.EventReceivers.UniversalAppRobloxHybridEventReceiver);
local v89 = require(l_Modules_0.LuaApp.Components.EventReceivers.ThemeChangeEventReceiver);
local v90 = require(l_Modules_0.LuaApp.Components.EventReceivers.DeepLinkEventReceiver);
local v91 = require(l_Modules_0.LuaApp.Components.EventReceivers.MarketplaceServiceEventReciever);
local v92 = require(l_Modules_0.LuaApp.Components.LuaAppBacktraceReporterAdaptor);
local v93 = require(l_Modules_0.LuaApp.Components.EventReceivers.FullscreenEventReceiver);
local v94 = require(l_Modules_0.LuaApp.Components.EventReceivers.DisplayNameEventReceiver);
local v95 = require(l_Modules_0.LuaApp.Components.EventReceivers.FriendRequestsEventReceiver);
local v96 = require(l_Modules_0.LuaApp.Components.EventReceivers.ScreenTimeEventReceiver);
local v97 = require(l_Modules_0.LuaApp.Components.EventReceivers.ModerationEventReceiver);
local v98 = require(l_Modules_0.LuaApp.Components.EventReceivers.CsatSurveyInterceptEventReceiver);
local v99 = require(l_Modules_0.LuaApp.Components.EventReceivers.MenuCsatInterceptEventReceiver);
local v100 = require(l_Modules_0.LuaApp.Components.EventReceivers.PresenceEventReceiver);
local v101 = require(l_Modules_0.LuaApp.Components.EventReceivers.ReturnFromGameReceiver);
local v102 = require(l_Modules_0.LuaApp.Components.EventReceivers.OnGameLeaveReceiver);
local l_SquadEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.Squads).SquadEventReceiver;
local l_ChallengeDialogEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).ChallengeDialogEventReceiver;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local v106 = require(l_Modules_0.LuaApp.Components.EventReceivers.PurchaseProcessedEventReceiver);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v108 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v109 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v110 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppBrowserService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppBrowserService;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppSystemInfo_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSystemInfo;
local l_AppPlatformService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPlatformService;
local l_AppAppLifecycleService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppAppLifecycleService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppGame_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGame;
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local l_AppPermissions_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPermissions;
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local v123 = require(l_Modules_0.LuaApp.Services.AppWebView);
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppContentProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppContentProvider;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v128 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v129 = require(l_Modules_0.LuaApp.Http.wrapRequestWithMiddleware);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v133 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local v134 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local l_AppUpdateServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).AppUpdateServiceWrapper;
local v136 = require(l_Modules_0.LuaApp.Components.AppUpdate.AppUpdateManager);
local v137 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local _ = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v140 = require(l_Modules_0.LuaApp.Components.NavbarExperimentation);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Experiments.NewChatTabExperimentation.default;
local _ = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v143 = require(l_Modules_0.LuaApp.Experiment.ExperienceMenuIXPPreload);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v145 = require(l_Modules_0.LuaApp.Services.CommonGameEvents);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_createPerformFetchMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.Http).createPerformFetchMiddleware;
local l_AppStartupMessageService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupMessageService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local v155 = require(l_Modules_0.LuaApp.FlagSettings);
local v156 = tonumber(settings():GetFVariable("LuaAnalyticsReleasePeriod"));
local v157 = v155.LuaAppPresencePollingIntervalInSeconds();
local v158 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppReturnFromGame);
local v159 = require(l_Modules_0.LuaApp.Components.AppSound.BackgroundSoundManager);
local v160 = require(l_Modules_0.LuaApp.Components.EventReceivers.NativeShellEventReceiver);
local v161 = require(l_Modules_0.Luobu.Components.EventReceivers.TencentNoticeEventReceiver);
local v162 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v163 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v164 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.PaginatedFetchThunk);
local v165 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.AvatarEditorServiceThunk);
local v166 = require(l_Modules_0.LuaApp.Util.getHasBackgroundMusic);
local v167 = require(l_Modules_0.LuaApp.Components.EventReceivers.IsCsatSurveyInterceptEnabled);
local v168 = require(l_Modules_0.LuaApp.Components.EventReceivers.IsMenuCsatSurveyInterceptEnabled);
local v169 = require(l_Modules_0.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Utils.getLegacyRouteFromRoactNavigationState;
local l_QueryRefetchManager_0 = require(l_CorePackages_0.Workspace.Packages.QueryRefetch).QueryRefetchManager;
local l_StartupMessageContainer_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).StartupMessageContainer;
local v173 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v174 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback);
local l_InteractionFeedbackContext_0 = v174.InteractionFeedbackContext;
local l_FeedbackManagerInjectionContextProvider_0 = v174.FeedbackManagerInjectionContextProvider;
local l_InteractionFeedbackAppConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).InteractionFeedbackAppConfig;
if require(l_Modules_0.LuaApp.Bootcamp.Util.EnableLuaAppBootcamp)() then
    local l_status_0, l_result_0 = pcall(require, l_Modules_0.LuaApp.Bootcamp.Util.LuaAppBootcampUtil);
    if not l_status_0 then
        warn("Failed to require Bootcamp modules.");
    else
        l_result_0.runBootcamp();
    end;
end;
local v180 = {
    FFlagAXUseRoduxExtraArg = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUseRoduxExtraArg), 
    FIntLuaAppBatchFetchingStatusDelayMs = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLuaAppBatchFetchingStatusDelayMs, 
    FFlagLuaAppBatchSingleFetches = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBatchSingleFetches, 
    FFlagLuobuCJVMorePageShowTencentNotice = require(l_Modules_0.Luobu.Flags.FFlagLuobuCJVMorePageShowTencentNotice), 
    FFlagLuobuShowTencentNoticePopup = require(l_Modules_0.Luobu.Flags.FFlagLuobuShowTencentNoticePopup), 
    GetFFlagIXPExperimentCache = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache), 
    GetFFlagInjectAnalyticsService = require(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService), 
    GetFFlagLuaAppEnableSquadPage = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage, 
    GetFStringLuaAppUnloadEventEnabledPageNames = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames), 
    IsPrefetchOneCopyEnabled = require(l_CorePackages_0.Workspace.Packages.SharedFlags).IsPrefetchOneCopyEnabled, 
    GetFFlagLuaSystemInfoService = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaSystemInfoService, 
    GetFFlagLuaAppNavigationAnalytics = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppNavigationAnalytics), 
    GetFFlagDebugLuaAppInspectRodux = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugLuaAppInspectRodux), 
    GetFFlagLuaAppChallengeDialogEventReceiverEnabled = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogEventReceiverEnabled, 
    GetFFlagStartupDeprecationMessage = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagStartupDeprecationMessage, 
    FFlagUnifyNavigationGraph = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph, 
    GetFFlagUserAgreementsOnAppForegrounded = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUserAgreementsOnAppForegrounded, 
    GetFFlagEnableUISoundAndHaptics = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics, 
    GetFFlagMoveUpdateCheckToUniversalApp = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMoveUpdateCheckToUniversalApp, 
    GetFFlagItemsReceivedAlert = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagItemsReceivedAlert
};
local v181 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local v182 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v183 = if not v180.FFlagUnifyNavigationGraph then nil else require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v184 = v20.Component:extend("UniversalApp");
v184.defaultProps = {
    httpService = l_HttpService_0, 
    rbxAnalyticsService = if not v180.GetFFlagInjectAnalyticsService() then nil else l_RbxAnalyticsService_0, 
    ixpService = if not v180.GetFFlagInjectAnalyticsService() then nil else l_IXPService_0
};
v184.init = function(v185)
    v28.default:logEventOnce("universal_app_init_begin");
    v185._pageObjectManager = v44.new();
    local _ = nil;
    local v187 = {
        if not v180.FFlagAXUseRoduxExtraArg then v21.thunkMiddleware else v21.makeThunkMiddleware({
            avatarEditorService = l_AvatarEditorService_0, 
            pageObjectManager = v185._pageObjectManager
        })
    };
    v185._rnBypassActionSignal = v36.new();
    table.insert(v187, (v162.middleware(function(...)
        v185._rnBypassActionSignal:fire(...);
    end)));
    if not v180.FFlagAXUseRoduxExtraArg then
        table.insert(v187, (v164.middleware(v185._pageObjectManager, l_AvatarEditorService_0)));
        table.insert(v187, (v165.middleware(l_AvatarEditorService_0)));
    end;
    if v180.FFlagLuaAppBatchSingleFetches then
        table.insert(v187, l_createPerformFetchMiddleware_0(v180.FIntLuaAppBatchFetchingStatusDelayMs / 1000));
    end;
    local v188 = v61(v60);
    v185._storeDevtools = if not v180.GetFFlagDebugLuaAppInspectRodux() then nil else require(l_CorePackages_0.Packages.Dev.RoduxDevtools).new();
    v185._store = v21.Store.new(v38, nil, v187, v188, v185._storeDevtools);
    v185._analytics = if not v180.GetFFlagInjectAnalyticsService() then v37.new() else v37.new(v185.props.rbxAnalyticsService);
    v185._systemInfo = if not v180.GetFFlagLuaSystemInfoService() then nil else l_SystemInfoProtocol_0.default;
    v185._linking = l_LinkingProtocol_0.default;
    v185._logging = v28.default;
    v185._game = l_GameProtocol_0.default;
    v185._makeOmniRecommendationsRequest = not not v180.IsPrefetchOneCopyEnabled() and l_MakeOmniRecommendationsRequest_0 or nil;
    v185._permissions = l_PermissionsProtocol_0.default;
    v185._prefetch = l_PrefetchProtocol_0.default;
    v185._webView = not not v34.isEnabled() and v34.default or nil;
    v185._externalContentSharing = l_ExternalContentSharingProtocol_0.default;
    v185._localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v185._robloxEventReceiver = l_RobloxEventReceiver_0.new(l_NotificationService_0);
    if not v180.GetFFlagLuaAppNavigationAnalytics() then
        v185._experienceEventReceiver = nil;
        local v189 = v180.GetFStringLuaAppUnloadEventEnabledPageNames();
        if v189 and #v189 > 0 then
            v185._experienceEventReceiver = v82.new();
        end;
    end;
    v185._guiService = l_GuiService_0;
    v185._startupMessage = if not v180.GetFFlagStartupDeprecationMessage() then nil else l_StartupMessageService_0;
    v185._eventIngest = l_EventIngest_0.new(l_EventIngestService_0);
    v185._appUpdate = not not l_game_EngineFeature_0 and l_AppUpdateServiceWrapper_0.new(v13) or nil;
    v185._commonGameEvents = v145.get(l_SessionService_0, v185._analytics, v185._eventIngest);
    v185._appStartupSequence = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence.default;
    v185._focusNavigationService = v23.FocusNavigationService.new(v23.EngineInterface.CoreGui);
    if v180.GetFFlagUserAgreementsOnAppForegrounded() then
        pcall(function()
            v185._platformService = game:GetService("PlatformService");
        end);
        pcall(function()
            v185._appLifecycleService = game:GetService("AppLifecycleService");
        end);
    end;
    v185.routeSignal = v36.new();
    v185._updateRoute = function(v190)
        v185.routeSignal:fire((l_getLegacyRouteFromRoactNavigationState_0(v190)));
    end;
    v185._connectRouteSignal = function(v191)
        return v185.routeSignal:connect(v191);
    end;
    v54:connectToStore(v185._store);
    v185._appRequestService = v129(l_requestInternalWrapper_0(v185.props.httpService), v185._store, v185._guiService);
    if v180.GetFFlagIXPExperimentCache() then
        v173.default:initialize();
    end;
    if v140.isEnabled() then
        v140.default:initialize();
    end;
    if l_default_0.isEnabled() then
        l_default_0:initialize(v173);
    end;
    v185._achievementManager = l_InAppAchievementManager_0.new(v185._store);
    v28.default:logEventOnce("universal_app_init_end");
end;
v184.appendRoactServiceProviders = function(v192, v193)
    table.insert(v193, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [v108] = v192._analytics, 
                [v109] = v192._localization, 
                [v110] = v192._appRequestService, 
                [l_AppBrowserService_0] = l_BrowserService_0, 
                [l_AppNotificationService_0] = l_NotificationService_0, 
                [l_AppGuiService_0] = v192._guiService, 
                [l_AppSystemInfo_0] = if not v180.GetFFlagLuaSystemInfoService() then nil else v192._systemInfo, 
                [l_AppLinking_0] = v192._linking, 
                [l_AppLogging_0] = v192._logging, 
                [l_AppGame_0] = v192._game, 
                [l_AppOmniRecommendationsRequest_0] = v192._makeOmniRecommendationsRequest, 
                [l_AppPermissions_0] = v192._permissions, 
                [l_AppPrefetch_0] = v192._prefetch, 
                [v123] = not not v34.isEnabled() and v192._webView or nil, 
                [l_AppRunService_0] = l_RunService_0, 
                [l_AppContentProvider_0] = l_ContentProvider_0, 
                [l_AppUserInputService_0] = l_UserInputService_0, 
                [l_AppPlatformService_0] = if not v180.GetFFlagUserAgreementsOnAppForegrounded() then nil else v192._platformService, 
                [l_AppAppLifecycleService_0] = if not v180.GetFFlagUserAgreementsOnAppForegrounded() then nil else v192._appLifecycleService, 
                [l_AppSessionService_0] = l_SessionService_0, 
                [v128] = v192._eventIngest, 
                [l_AppUserGameSettings_0] = l_UserGameSettings_0, 
                [l_AppUpdateService_0] = v192._appUpdate, 
                [l_RoactAnalyticsCommonGameEvents_0] = v192._commonGameEvents, 
                [l_AppStartupSequenceTag_0] = v192._appStartupSequence, 
                [l_AppStartupMessageService_0] = if not v180.GetFFlagStartupDeprecationMessage() then nil else v192._startupMessage
            }
        }
    });
end;
local function v194()
    l_useUserAgreements_0();
    return nil;
end;
local function _(v195)
    local v196 = v20.PureComponent:extend("NavigationAppContainer");
    v196.router = v195.router;
    v196.render = function(v197)
        return v197.props.children;
    end;
    return v25.createAppContainer(v196);
end;
v184.render = function(v199)
    local l_appName_0 = v199.props.appName;
    local l_v79_0 = v79;
    local v202 = {};
    if v180.FFlagUnifyNavigationGraph then
        local v203 = {};
        local l_v182_0 = v182;
        local v205 = v20.PureComponent:extend("NavigationAppContainer");
        v205.router = l_v182_0.router;
        v205.render = function(v206)
            return v206.props.children;
        end;
        v203.class = v25.createAppContainer(v205);
        v203.props = {
            onNavigationStateChange = v183("UniversalApp")
        };
        table.insert(v202, v203);
    end;
    table.insert(v202, {
        class = v137.Provider, 
        props = {
            value = if not v180.GetFFlagInjectAnalyticsService() then l_IXPService_0 else v199.props.ixpService
        }
    });
    table.insert(v202, {
        class = v22.StoreProvider, 
        props = {
            store = v199._store
        }
    });
    table.insert(v202, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0, 
                l_AvatarPolicies_0, 
                l_SharePolicies_0, 
                l_ShareTargetGamePolicies_0
            }, 
            policyData = if not v180.GetFFlagInjectAnalyticsService() then nil else v199.props.policyData
        }
    });
    v199:appendRoactServiceProviders(v202);
    table.insert(v202, {
        class = l_UiModeStyleProvider_0, 
        props = {
            style = {
                themeName = "dark", 
                fontName = "gotham"
            }
        }
    });
    table.insert(v202, {
        class = l_DesignTokenProvider_0, 
        props = {
            tokenMappers = v74
        }
    });
    table.insert(v202, {
        class = v75
    });
    table.insert(v202, {
        class = v78, 
        props = {
            theme = l_v79_0, 
            themeName = "dark"
        }
    });
    table.insert(v202, {
        class = v71, 
        props = {
            localization = v199._localization
        }
    });
    table.insert(v202, {
        class = v23.FocusNavigationContext.Provider, 
        props = {
            value = v199._focusNavigationService
        }
    });
    table.insert(v202, {
        class = l_Provider_0
    });
    table.insert(v202, {
        class = v67
    });
    if l_GetFFlagColorPickerSliderOptimization_0() then
        table.insert(v202, {
            class = v68
        });
    end;
    table.insert(v202, {
        class = v133.Provider
    });
    table.insert(v202, {
        class = v134.Provider, 
        props = {
            pageObjectManager = v199._pageObjectManager
        }
    });
    table.insert(v202, {
        class = l_ApolloProvider_0, 
        props = {
            client = v181
        }
    });
    if v180.GetFFlagEnableUISoundAndHaptics() then
        table.insert(v202, {
            class = l_InteractionFeedbackContext_0.Provider, 
            props = {
                value = l_InteractionFeedbackAppConfig_0
            }
        });
        table.insert(v202, {
            class = l_FeedbackManagerInjectionContextProvider_0
        });
    end;
    if l_GetFFlagEnableResponsiveProvider_0() then
        table.insert(v202, {
            class = v33.ResponsiveProvider
        });
    end;
    local v207 = {};
    table.insert(v207, v160);
    table.insert(v207, v143);
    local v208 = {
        v86, 
        v83, 
        v84, 
        v85, 
        v87, 
        v89, 
        v90, 
        v97, 
        not not v158() and v101 or nil, 
        not (not v167() or v168()) and v98 or nil, 
        not not v168() and v99 or nil, 
        v102, 
        if not v180.GetFFlagLuaAppEnableSquadPage() then nil else l_SquadEventReceiver_0, 
        if not v180.GetFFlagItemsReceivedAlert() then nil else v106
    };
    table.insert(v208, v94);
    table.insert(v208, v91);
    table.insert(v208, v88);
    table.insert(v208, v93);
    table.insert(v208, v96);
    if not (not v180.FFlagLuobuCJVMorePageShowTencentNotice and not v180.FFlagLuobuShowTencentNoticePopup) then
        table.insert(v208, v161);
    end;
    table.insert(v208, v95);
    table.insert(v208, v100);
    if v180.GetFFlagLuaAppChallengeDialogEventReceiverEnabled() then
        table.insert(v208, l_ChallengeDialogEventReceiver_0);
    end;
    local v209 = nil;
    if not (not v34.isEnabled() or l_GetFFlagEnableUnifiedWebViews_0()) then
        v209 = v20.createElement(v57, {
            webView = v199._webView, 
            localization = v199._localization
        });
    end;
    return v20.createElement(l_ProviderContainer_0, {
        providers = v202
    }, {
        CursorProvider = v20.createElement(l_SelectionCursorProvider_0, {}, {
            NewCursorProvider = v20.createElement(l_CursorProvider_0, {}, {
                EventReceivers = v20.createElement(v47, {
                    RobloxEventReceiver = v199._robloxEventReceiver, 
                    receiverComponents = v208
                }), 
                MemStorageSubscribers = not not next(v207) and v20.createElement(v48, {
                    receiverComponents = v207
                }) or nil, 
                LocalPlayerManager = v20.createElement(v49), 
                ViewportManager = v20.createElement(v50), 
                FrameRateManager = v20.createElement(v51), 
                LocaleManager = v20.createElement(v52, {
                    localization = v199._localization
                }), 
                EventStreamUpdater = v20.createElement(v43, {
                    releasePeriod = v156
                }), 
                LocalStorageListener = v20.createElement(v53), 
                AppPresence = v157 > 0 and v20.createElement(v45) or nil, 
                MutedErrorReporter = v20.createElement(v46, {
                    appName = l_appName_0
                }), 
                BacktraceReporterAdaptor = v20.createElement(v92), 
                SessionManager = v20.createElement(v55, {
                    connectRouteSignal = v199._connectRouteSignal
                }), 
                UserHeartbeatsManager = v20.createElement(v56), 
                WebViewEventHandler = v209, 
                SiteAlertManager = v20.createElement(v62), 
                ContactImporterManager = v20.createElement(v169), 
                AppBackgroundSoundManager = if not v166() then nil else v20.createElement(v159), 
                AppUpdateManager = if not v180.GetFFlagMoveUpdateCheckToUniversalApp() then nil else v20.createElement(v136), 
                UserAgreementsManager = v20.createElement(v194), 
                QueryRefetchManager = v20.createElement(l_QueryRefetchManager_0, {
                    robloxEventReceiver = v199._robloxEventReceiver
                }), 
                AppReadyHandler = if not v180.FFlagUnifyNavigationGraph then nil else v20.createElement(l_AppReadyHandler_0), 
                RnBypassAdapter = if not v180.FFlagUnifyNavigationGraph then nil else v20.createElement(l_RnBypassAdapter_0, {
                    rnBypassActionSignal = v199._rnBypassActionSignal, 
                    ApplyRoactNavigationHistory = v163, 
                    updateRoute = v199._updateRoute
                }), 
                AppConfigurer = v20.createElement(v41, {
                    experienceEventReceiver = if not v180.GetFFlagLuaAppNavigationAnalytics() then v199._experienceEventReceiver else nil, 
                    store = v199._store, 
                    rnBypassActionSignal = if not v180.FFlagUnifyNavigationGraph then v199._rnBypassActionSignal else nil, 
                    updateRoute = if not v180.FFlagUnifyNavigationGraph then v199._updateRoute else nil
                }), 
                StartupMessageContainer = if not v180.GetFFlagStartupDeprecationMessage() then nil else v20.createElement(l_StartupMessageContainer_0)
            })
        })
    });
end;
return v184;
