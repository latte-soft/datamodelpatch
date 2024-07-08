local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = game:DefineFastFlag("SwitchCSRootProviderTranslationsPackage", false);
local v4 = nil;
v4 = if not v3 then require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization else require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.Rodux);
local v10 = require(l_CorePackages_0.RoactRodux);
local v11 = require(l_CorePackages_0.UIBlox);
local l_SelectionCursorProvider_0 = v11.App.SelectionImage.SelectionCursorProvider;
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v14 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_Provider_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local l_DeviceType_0 = v13.DeviceType;
local l_GamepadDisconnectTokenMapper_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectTokenMapper;
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local v19 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback);
local l_InteractionFeedbackContext_0 = v19.InteractionFeedbackContext;
local l_FeedbackManagerInjectionContextProvider_0 = v19.FeedbackManagerInjectionContextProvider;
local l_InteractionFeedbackAppConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).InteractionFeedbackAppConfig;
local v23 = game:DefineFastFlag("CoreScriptsDynamicDefaultDeviceType", false);
local v24 = v14.FocusNavigationService.new(v14.EngineInterface.CoreGui);
local v25 = nil;
v25 = if not v23 then {
    themeName = "dark", 
    fontName = "gotham", 
    deviceType = l_DeviceType_0.Desktop
} else {
    themeName = "dark", 
    fontName = "gotham", 
    deviceType = if not l_GuiService_0:IsTenFootInterface() then l_DeviceType_0.Desktop else l_DeviceType_0.Console
};
return function(v26)
    local v28 = v8.createElement(v10.StoreProvider, {
        store = v9.Store.new(function(v27)
            return v27;
        end, {}, {})
    }, {
        AppStyleProvider = v8.createElement(v11.App.Style.AppStyleProvider, {
            style = v7.Dictionary.join(v25, v26.styleOverride or {})
        }, {
            DesignTokenProvider = v8.createElement(l_DesignTokenProvider_0, {
                tokenMappers = {
                    GamepadDisconnect = l_GamepadDisconnectTokenMapper_0
                }
            }, {
                CursorProvider = v8.createElement(l_SelectionCursorProvider_0, {}, {
                    LocalizationProvider = v8.createElement(l_LocalizationProvider_0, {
                        localization = v4.new(l_LocalizationService_0.RobloxLocaleId)
                    }, {
                        FocusNavigationProvider = v8.createElement(v14.FocusNavigationContext.Provider, {
                            value = v24
                        }, {
                            FocusNavigationRegistryProvider = v8.createElement(l_Provider_0, nil, v26.children)
                        })
                    })
                })
            })
        })
    });
    if l_GetFFlagEnableUISoundAndHaptics_0() then
        v28 = v8.createElement(l_InteractionFeedbackContext_0.Provider, {
            value = l_InteractionFeedbackAppConfig_0
        }, {
            tree = v8.createElement(l_FeedbackManagerInjectionContextProvider_0, nil, {
                tree = v28
            })
        });
    end;
    return v28;
end;
