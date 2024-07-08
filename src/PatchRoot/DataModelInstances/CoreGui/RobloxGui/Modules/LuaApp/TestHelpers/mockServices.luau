local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.RoactNavigation);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.Common.Analytics);
local v11 = require(l_Modules_0.LuaApp.AppReducer);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v13 = require(l_Modules_0.LuaApp.TestHelpers.MockRequest);
local v14 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppContentProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppContentProvider;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local l_MockOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.GraphQlShared).MockOmniRecommendationsRequest;
local v26 = require(l_Modules_0.LuaApp.TestHelpers.MockSessionService);
local v27 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppSystemInfo_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSystemInfo;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v31 = require(l_Modules_0.LuaApp.TestHelpers.MockSystemInfo);
local v32 = require(l_Modules_0.LuaApp.TestHelpers.MockUserInputService);
local v33 = require(l_Modules_0.LuaApp.TestHelpers.MockLinking);
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v35 = require(l_Modules_0.LuaApp.TestHelpers.MockLogging);
local v36 = require(l_Modules_0.LuaApp.TestHelpers.MockEventIngestService);
local v37 = require(l_Modules_0.LuaApp.TestHelpers.MockGuiService);
local v38 = require(l_Modules_0.LuaApp.TestHelpers.MockRunService);
local l_MockContentProvider_0 = v7.UnitTestHelpers.MockContentProvider;
local v40 = require(l_Modules_0.LuaApp.TestHelpers.MockUserGameSettings);
local l_MockAppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.MockEngineServices).MockAppUpdateService;
local v42 = require(l_Modules_0.LuaApp.TestHelpers.MockAvatarEditorService);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v44 = require(l_Modules_0.LuaApp.ThemeProvider);
local l_AppStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppStyleProvider;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.Style).Constants;
local v47 = require(l_Modules_0.LuaApp.Components.AppGridProvider);
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v49 = require(l_Modules_0.LuaApp.DesignTokenMappers.tokenMappers);
local v50 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v51 = require(l_Modules_0.LuaApp.LocalizationProvider);
local v52 = require(l_Modules_0.LuaApp.Themes.ClassicTheme);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local l_FocusControllerProvider_0 = require(l_CorePackages_0.Workspace.Packages.UnitTestHelpers).FocusControllerProvider;
local v60 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.AvatarEditorServiceThunk);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v62 = require(l_Modules_0.LuaApp.Services.CommonGameEvents);
local l_appendApolloClientToReducer_0 = require(l_Modules_0.LuaApp.TestHelpers.ApolloClientTestUtils).appendApolloClientToReducer;
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_AppStartupSequence_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence;
local v66 = require(l_Modules_0.AvatarExperience.Common.Context.BodyDataProvider);
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_MockNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.MockEngineServices).MockNotificationService;
local v69 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v70 = require(l_Modules_0.LuaApp.TestHelpers.MockIXPService);
local v71 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local v72 = require(l_Modules_0.LuaApp.TestHelpers.makeMockThunkMiddleware);
local v73 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback);
local l_InteractionFeedbackContext_0 = v73.InteractionFeedbackContext;
local l_FeedbackManagerInjectionContextProvider_0 = v73.FeedbackManagerInjectionContextProvider;
local l_InteractionFeedbackAppConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).InteractionFeedbackAppConfig;
local l_GetFFlagColorPickerSliderOptimization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagColorPickerSliderOptimization;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local v79 = v9.strictInterface({
    includeTopBarSearchSignalProvider = v9.optional(v9.boolean), 
    includeIXPServiceProvider = v9.optional(v9.boolean), 
    includeABTestServiceProvider = v9.optional(v9.boolean), 
    browserTrackerABTests = v9.optional(v9.table), 
    userABTests = v9.optional(v9.table), 
    browserTrackerLayers = v9.optional(v9.table), 
    userLayers = v9.optional(v9.table), 
    includeStoreProvider = v9.optional(v9.boolean), 
    store = v9.optional(v9.table), 
    initialStoreState = v9.optional(v9.table), 
    includeAppGridProvider = v9.optional(v9.boolean), 
    includeStyleProvider = v9.optional(v9.boolean), 
    includeDesignTokenProvider = v9.optional(v9.boolean), 
    includeThemeProvider = v9.optional(v9.boolean), 
    includeAppPolicyProvider = v9.optional(v9.boolean), 
    includeLocalizationProvider = v9.optional(v9.boolean), 
    includeNavigationProvider = v9.optional(v9.boolean), 
    includeFocusControllerProvider = v9.optional(v9.boolean), 
    includeDefaultAvatarEditorServiceMock = v9.optional(v9.boolean), 
    includeApolloProvider = v9.optional(v9.boolean), 
    includeCursorProvider = v9.optional(v9.boolean), 
    includeRootRNAppContainer = v9.optional(v9.boolean), 
    middlewareList = v9.optional(v9.table), 
    focusController = v9.optional(v9.table), 
    captureFocusOnMount = v9.optional(v9.boolean), 
    includeContentProvider = v9.optional(v9.boolean), 
    theme = v9.optional(v9.table), 
    appPolicy = v9.optional(v9.table), 
    themeName = v9.optional(v9.string), 
    appStyle = v9.optional(v9.table), 
    appGridConfig = v9.optional(v9.table), 
    localization = v9.optional(v9.table), 
    navigation = v9.optional(v9.table), 
    extraServices = v9.optional(v9.map(v9.table, v9.any)), 
    apolloClient = v9.optional(v9.table), 
    includeInteractionFeedbackProvider = v9.optional(v9.boolean)
});
local function v82()
    return {
        includeInteractionFeedbackProvider = true, 
        includeTopBarSearchSignalProvider = false, 
        includeABTestServiceProvider = false, 
        includeIXPServiceProvider = true, 
        browserTrackerABTests = {}, 
        userABTests = {}, 
        browserTrackerLayers = {}, 
        userLayers = {}, 
        includeStoreProvider = false, 
        store = nil, 
        initialStoreState = nil, 
        includeStyleProvider = true, 
        includeAppGridProvider = false, 
        includeDesignTokenProvider = false, 
        includeThemeProvider = true, 
        includeAppPolicyProvider = false, 
        includeLocalizationProvider = true, 
        includeNavigationProvider = true, 
        includeFocusControllerProvider = false, 
        includeDefaultAvatarEditorServiceMock = false, 
        includeApolloProvider = false, 
        includeCursorProvider = false, 
        includeRootRNAppContainer = false, 
        apolloClient = nil, 
        focusController = nil, 
        captureFocusOnMount = false, 
        includeContentProvider = true, 
        middlewareList = nil, 
        theme = v52, 
        appPolicy = {}, 
        themeName = "Classic", 
        appStyle = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham, 
            deviceType = "Desktop"
        }, 
        appGridConfig = nil, 
        localization = l_Localization_0.new("en-us"), 
        navigation = {
            isFocused = function()
                return false;
            end, 
            addListener = function()
                return {
                    remove = function()
                    end
                };
            end, 
            getParam = function(_, v81)
                return v81;
            end, 
            navigate = function()
            end, 
            goBack = function()
            end, 
            state = {
                routeName = "DummyRoute"
            }
        }, 
        extraServices = nil
    };
end;
local function v86(v83)
    local v84 = v2.Component:extend("WrappedNavigator");
    v84.router = v50.router;
    v84.render = function(_)
        return v83;
    end;
    return v8.createAppContainer(v84);
end;
assert(v79((v82())));
return function(v87, v88)
    assert(v87, "Expected a map of components, received none");
    local v89 = v82();
    if v88 then
        assert(v79(v88));
        v89 = v5.Dictionary.join(v89, v88);
    end;
    local l_store_0 = v89.store;
    local v91 = {
        services = {
            [v14] = v10.mock(), 
            [v15] = l_Localization_0.new("en-us"), 
            [v16] = v13.simpleSuccessRequest("{}"), 
            [l_AppNotificationService_0] = l_MockNotificationService_0.new(), 
            [l_AppGuiService_0] = v37.new(), 
            [l_AppRunService_0] = v38.new(), 
            [l_AppSessionService_0] = v26.new(), 
            [v27] = v36.new(), 
            [l_AppUserGameSettings_0] = v40.new(), 
            [l_AppUpdateService_0] = l_MockAppUpdateService_0.new(), 
            [l_AppSystemInfo_0] = v31.new(), 
            [l_AppLinking_0] = v33.new(), 
            [l_AppLogging_0] = v35.new(), 
            [l_AppContentProvider_0] = l_MockContentProvider_0.new(), 
            [l_AppStartupSequenceTag_0] = l_AppStartupSequence_0.new(), 
            [l_AppOmniRecommendationsRequest_0] = l_MockOmniRecommendationsRequest_0.SuccessfulRequest({}), 
            [l_AppUserInputService_0] = v32.new()
        }
    };
    if v89.extraServices ~= nil then
        for v92, v93 in pairs(v89.extraServices) do
            assert(type(v92) == "table", "Expected key to be a table");
            v91.services[v92] = v93;
        end;
    end;
    if v91.services[l_RoactAnalyticsCommonGameEvents_0] == nil then
        v91.services[l_RoactAnalyticsCommonGameEvents_0] = v62.get(v91.services[l_AppSessionService_0], v91.services[v14], v91.services[v27]);
    end;
    local l_v87_0 = v87;
    if v89.includeTopBarSearchSignalProvider then
        l_v87_0 = {
            TopBarSearchSignalProvider = v3.createElement(v71.Provider, {}, l_v87_0)
        };
    end;
    if v89.includeIXPServiceProvider then
        l_v87_0 = {
            IXPServiceProvider = v3.createElement(v69.Provider, {
                value = v70.new(v89.browserTrackerLayers, v89.userLayers, true)
            }, l_v87_0)
        };
    end;
    if v89.includeAppGridProvider then
        assert(v89.includeStoreProvider, "includeStoreProvider must be set to `true` in order to include AppGridProvider");
        assert(v89.includeAppPolicyProvider, "includeAppPolicyProvider must be set to `true` in order to include AppGridProvider");
        assert(v89.includeDesignTokenProvider, "includeDesignTokenProvider must be set to `true` in order to include AppGridProvider");
        l_v87_0 = {
            AppGridProvider = v3.createElement(v47, {
                config = v89.appGridConfig
            }, l_v87_0)
        };
    end;
    if v89.includeDesignTokenProvider then
        l_v87_0 = {
            DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
                tokenMappers = v49
            }, l_v87_0)
        };
    end;
    if v89.includeThemeProvider then
        l_v87_0 = {
            ThemeProvider = v3.createElement(v44, {
                theme = v89.theme, 
                themeName = v89.themeName
            }, l_v87_0)
        };
    end;
    if v89.includeCursorProvider then
        assert(v89.includeStyleProvider, "includeStyleProvider must be set to `true` in order to include CursorProvider");
        l_v87_0 = {
            CursorProvider = v3.createElement(v7.App.SelectionCursor.CursorProvider, {}, l_v87_0)
        };
    end;
    if v89.includeRootRNAppContainer then
        l_v87_0 = {
            RNAppContainer = v3.createElement(v86(l_v87_0))
        };
    end;
    if v89.includeStyleProvider then
        l_v87_0 = {
            StyleProvider = v3.createElement(l_AppStyleProvider_0, {
                style = v89.appStyle
            }, l_v87_0)
        };
    end;
    if v89.includeAppPolicyProvider then
        l_v87_0 = {
            AppPolicyProvider = v3.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0, 
                    l_ChatPolicies_0, 
                    l_AvatarPolicies_0, 
                    l_SharePolicies_0, 
                    l_ShareTargetGamePolicies_0
                }, 
                policyData = v89.appPolicy
            }, l_v87_0)
        };
    end;
    if v89.includeContentProvider then
        l_v87_0 = {
            ContentProvider = v3.createElement(v7.App.Context.ContentProvider.Provider, {
                value = l_MockContentProvider_0.new()
            }, l_v87_0)
        };
    end;
    local v95 = {
        v72()
    };
    if v89.includeDefaultAvatarEditorServiceMock then
        table.insert(v95, (v60.middleware(v42.new())));
    end;
    if v89.middlewareList then
        v95 = v5.List.join(v95, v89.middlewareList);
    end;
    if v89.apolloClient then
        v11 = l_appendApolloClientToReducer_0(v11, v89.apolloClient);
    end;
    if not v89.initialStoreState then
        if not l_store_0 then
            l_store_0 = v4.Store.new(v11, nil, v95);
        elseif getmetatable(l_store_0) == nil then
            l_store_0 = v4.Store.new(v11, l_store_0, v95);
        end;
    else
        l_store_0 = v4.Store.new(v11, v89.initialStoreState, v95);
    end;
    if v89.includeStoreProvider then
        l_v87_0 = {
            StoreProvider = v3.createElement(v6.StoreProvider, {
                store = l_store_0
            }, l_v87_0)
        };
    end;
    if v89.includeLocalizationProvider then
        l_v87_0 = {
            LocalizationProvider = v3.createElement(v51, {
                localization = v89.localization
            }, l_v87_0)
        };
    end;
    if v89.includeNavigationProvider then
        l_v87_0 = {
            NavigationProvider = v3.createElement(v8.Provider, {
                value = v89.navigation
            }, l_v87_0)
        };
    end;
    if v89.includeApolloProvider then
        assert(v89.apolloClient ~= nil, "An apollo client instance must be provided to mockServices when using includeApolloProvider");
        l_v87_0 = {
            ApolloProvider = v3.createElement(l_ApolloProvider_0, {
                client = v89.apolloClient
            }, l_v87_0)
        };
    end;
    if l_GetFFlagColorPickerSliderOptimization_0() then
        l_v87_0 = {
            BodyDataProvider = v3.createElement(v66, {}, l_v87_0)
        };
    end;
    if not (not l_GetFFlagEnableUISoundAndHaptics_0() or not v89.includeInteractionFeedbackProvider) then
        l_v87_0 = {
            InteractionFeedbackContextProvider = v3.createElement(l_InteractionFeedbackContext_0.Provider, {
                value = l_InteractionFeedbackAppConfig_0
            }, {
                FeedbackManagerInjectionContextProvider = v3.createElement(l_FeedbackManagerInjectionContextProvider_0, nil, l_v87_0)
            })
        };
    end;
    l_v87_0 = v3.createElement(l_RoactServices_0.ServiceProvider, v91, l_v87_0);
    if v89.includeFocusControllerProvider then
        l_v87_0 = v3.createElement(l_FocusControllerProvider_0, {
            captureFocusOnMount = v89.captureFocusOnMount, 
            focusController = v89.focusController
        }, l_v87_0);
    end;
    return l_v87_0;
end;
