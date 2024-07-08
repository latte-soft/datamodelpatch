local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_UIBlox_0 = v5.UIBlox;
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage);
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local v11 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback);
local l_InteractionFeedbackContext_0 = v11.InteractionFeedbackContext;
local l_FeedbackManagerInjectionContextProvider_0 = v11.FeedbackManagerInjectionContextProvider;
local l_InteractionFeedbackAppConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).InteractionFeedbackAppConfig;
local v15 = nil;
local v16 = nil;
if not v9() then
    v15 = require(script.Localization.Localization);
    v16 = require(script.Localization.LocalizationProvider);
else
    v15 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
    v16 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
end;
local l_SelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.SelectionCursorProvider;
local v18 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v19 = require(script.SetupFunctions.bindMenuActions);
local v20 = require(script.SetupFunctions.registerSetCores);
local v21 = require(script.SetupFunctions.requestGameNameAndDescription);
local v22 = require(script.createStore);
local v23 = require(script.Components.App);
local v24 = require(script.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider);
local v25 = require(l_RobloxGui_0.Modules.VoiceChat.initVoiceChatStore);
local v26 = require(l_RobloxGui_0.Modules.TrustAndSafety);
local v27 = require(script.Actions.SetLocaleId);
local v28 = require(script.Actions.SetInspectMenuEnabled);
local v29 = require(script.Actions.SetCurrentPage);
local v30 = require(script.Actions.SetScreenSize);
local v31 = require(script.Actions.SetMenuIconTooltipOpen);
local v32 = require(script.Actions.SetRespawning);
local v33 = require(script.Thunks.OpenMenu);
local v34 = require(script.Thunks.CloseMenu);
local v35 = require(script.InGameMenuPolicy);
local v36 = require(script.GlobalConfig);
local v37 = require(script.Resources.Constants);
local v38 = require(script.Flags.GetFFlagIGMGamepadSelectionHistory);
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local v41 = v22();
return {
    mountInGameMenu = function()
        v20(v41);
        v19(v41);
        v21(v41);
        if v36.propValidation then
            l_Roact_0.setGlobalConfig({
                propValidation = true
            });
        end;
        if v36.elementTracing then
            l_Roact_0.setGlobalConfig({
                elementTracing = true
            });
        end;
        v41.changed:connect(function(v42, v43)
            if v42.isMenuOpen ~= v43.isMenuOpen then
                l_BindableEvent_0:Fire(v42.isMenuOpen);
            end;
            local l_enabled_0 = v42.respawn.enabled;
            local l_enabled_1 = v43.respawn.enabled;
            local l_customCallback_0 = v42.respawn.customCallback;
            local l_customCallback_1 = v43.respawn.customCallback;
            if l_enabled_0 ~= l_enabled_1 and l_customCallback_0 ~= l_customCallback_1 then
                l_BindableEvent_1:Fire(l_enabled_0, l_customCallback_0);
            end;
        end);
        local v48 = v15.new(l_LocalizationService_0.RobloxLocaleId);
        v41:dispatch(v27(l_LocalizationService_0.RobloxLocaleId));
        l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
            v48:SetLocale(l_LocalizationService_0.RobloxLocaleId);
            v41:dispatch(v27(l_LocalizationService_0.RobloxLocaleId));
        end);
        v41:dispatch(v28(l_GuiService_0:GetInspectMenuEnabled()));
        l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v49)
            v41:dispatch(v28(v49));
        end);
        v25(v41);
        local v50 = v18({
            LocalizationProvider = l_Roact_0.createElement(v16, {
                localization = v48
            }, {
                CursorProvider = l_Roact_0.createElement(l_SelectionCursorProvider_0, {}, {
                    FocusHandlerContextProvider = not not v38() and l_Roact_0.createElement(v24, {}, {
                        InGameMenu = l_Roact_0.createElement(v23)
                    }) or nil, 
                    InGameMenu = not v38() and l_Roact_0.createElement(v23) or nil
                })
            })
        });
        if l_GetFFlagEnableUISoundAndHaptics_0() then
            v50 = l_Roact_0.createElement(l_InteractionFeedbackContext_0.Provider, {
                value = l_InteractionFeedbackAppConfig_0
            }, {
                ThemeProvider = l_Roact_0.createElement(l_FeedbackManagerInjectionContextProvider_0, nil, {
                    themeProvider = v50
                })
            });
        end;
        local v52 = l_Roact_0.createElement("ScreenGui", {
            ResetOnSpawn = false, 
            IgnoreGuiInset = true, 
            DisplayOrder = v37.DisplayOrder.RootMenu, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            [l_Roact_0.Change.AbsoluteSize] = function(v51)
                v41:dispatch(v30(v51.AbsoluteSize));
            end
        }, {
            StoreProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
                store = v41
            }, {
                PolicyProvider = l_Roact_0.createElement(v35.Provider, {
                    policy = {
                        v35.Mapper
                    }
                }, {
                    ThemeProvider = v50
                })
            })
        });
        local v53 = UserSettings().GameSettings:InStudioMode() and game:GetService("StudioService"):HasInternalPermission();
        local v54 = l_Roact_0.mount(v52, l_CoreGui_0, "InGameMenu");
        if v53 then
            require(l_CorePackages_0.DeveloperTools).forCoreGui("InGameMenu", {
                rootInstance = "InGameMenu"
            }):addRoactTree("Roact tree", v54, l_Roact_0);
        end;
    end, 
    openInGameMenu = function(v55)
        v41:dispatch(v33(v37.AnalyticsMenuOpenTypes.TopbarButton, v55));
    end, 
    closeInGameMenu = function()
        v34(v41);
    end, 
    openReportDialog = function(v56, v57)
        v41:dispatch(v33(v37.AnalyticsMenuOpenTypes.ReportAbuseTriggered, v37.ReportDialogKey));
        v26.openReportDialogForPlayer(v56, if v57 ~= nil then v57 else v37.AnalyticsInGameMenuName);
    end, 
    openGameSettingsPage = function()
        v41:dispatch(v33(v37.AnalyticsMenuOpenTypes.SettingsTriggered));
        v41:dispatch(v29("GameSettings"));
    end, 
    openGameLeavePage = function()
        v41:dispatch(v33(v37.AnalyticsMenuOpenTypes.GamepadLeaveGame));
        v41:dispatch(v29(v37.LeaveGamePromptPageKey));
    end, 
    openCharacterResetPage = function()
        v41:dispatch(v33(v37.AnalyticsMenuOpenTypes.GamepadResetCharacter));
        v41:dispatch(v29(v37.MainPagePageKey));
        v41:dispatch(v32(true));
    end, 
    openPlayersPage = function()
        v41:dispatch(v33(v37.AnalyticsMenuOpenTypes.PlayersTriggered));
        v41:dispatch(v29("Players"));
    end, 
    getOpenChangedEvent = function()
        return l_BindableEvent_0;
    end, 
    getOpen = function()
        return v41:getState().isMenuOpen;
    end, 
    getRespawnBehaviour = function()
        local v58 = v41:getState();
        return v58.respawn.enabled, v58.respawn.customCallback;
    end, 
    getRespawnBehaviourChangedEvent = function()
        return l_BindableEvent_1;
    end, 
    setMenuIconTooltipOpen = function(v59)
        v41:dispatch(v31(v59));
    end
};
