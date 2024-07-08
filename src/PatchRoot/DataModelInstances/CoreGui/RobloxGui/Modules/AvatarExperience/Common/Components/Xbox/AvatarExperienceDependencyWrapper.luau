local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RunService_0 = game:GetService("RunService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_IXPService_0 = game:GetService("IXPService");
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v11 = require(l_Modules_0:FindFirstChild("Shell").AppState);
local l_ProviderContainer_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.ProviderContainer;
local v13 = require(l_Modules_0.LuaApp.LocalizationProvider);
local l_AppStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppStyleProvider;
local v15 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local v23 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v25 = require(l_Modules_0.LuaApp.Actions.SetLocalUserId);
local v26 = require(l_Modules_0.LuaApp.Http.request);
local v27 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v28 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v29 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AvatarExperienceConsoleManager);
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppContentProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppContentProvider;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v35 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v37 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local v38 = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.UIBlox).App.SelectionImage.SelectionCursorProvider;
local v40 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EventReceivers.EventReceiver);
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v42 = require(l_Modules_0.LuaApp.DesignTokenMappers.tokenMappers);
local v43 = require(l_Modules_0.AvatarExperience.Flags.FFlagShowCreateCostumeXBoxSignalR);
local v44 = v8.Component:extend("AvatarExperienceDependencyWrapper");
v44.init = function(v45)
    v45.providers = {};
    local v46 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local l_v26_0 = v26;
    local v48 = l_EventIngest_0.new(l_EventIngestService_0);
    v45._robloxEventReceiver = l_RobloxEventReceiver_0.new(l_NotificationService_0);
    local v49 = {
        themeName = "dark", 
        fontName = "gotham"
    };
    table.insert(v45.providers, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0, 
                l_AvatarPolicies_0, 
                l_SharePolicies_0
            }
        }
    });
    table.insert(v45.providers, {
        class = l_AppStyleProvider_0, 
        props = {
            style = v49
        }
    });
    table.insert(v45.providers, {
        class = v13, 
        props = {
            localization = v46
        }
    });
    table.insert(v45.providers, {
        class = v29.Provider, 
        props = {
            value = l_IXPService_0
        }
    });
    table.insert(v45.providers, {
        class = v35.Provider
    });
    table.insert(v45.providers, {
        class = v37.Provider, 
        props = {
            pageObjectManager = v11.pageObjectManager
        }
    });
    table.insert(v45.providers, {
        class = v38
    });
    table.insert(v45.providers, {
        class = l_DesignTokenProvider_0, 
        props = {
            tokenMappers = v42
        }
    });
    v45.services = {
        [v23] = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId), 
        [v28] = l_Analytics_0.new(), 
        [v27] = l_v26_0, 
        [l_AppRunService_0] = l_RunService_0, 
        [l_AppContentProvider_0] = l_ContentProvider_0, 
        [l_AppNotificationService_0] = l_NotificationService_0, 
        [v15] = v48
    };
    v45.props.store:dispatch(v25((tostring(v45.props.store:getState().RobloxUser.rbxuid))));
end;
v44.render = function(v50)
    return v8.createElement(v9.StoreProvider, {
        store = v50.props.store
    }, {
        providers = v8.createElement(l_ProviderContainer_0, {
            providers = v50.providers
        }, {
            CursorProvider = v8.createElement(l_SelectionCursorProvider_0, {}, {
                services = v8.createElement(l_RoactServices_0.ServiceProvider, {
                    services = v50.services
                }, {
                    ServiceUsers = v8.createFragment({
                        AvatarEditorEventReceiver = v43 and v8.createElement(v40, {
                            RobloxEventReceiver = v50._robloxEventReceiver
                        }), 
                        ScreenRoot = v8.createElement(v31, {
                            store = v50.props.store
                        })
                    })
                })
            })
        })
    });
end;
return v44;
