local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Players_0 = game:GetService("Players");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.Logout);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v7 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v8 = require(script.Parent.ClearApp);
local v9 = require(script.Parent.AppStorageUtilities);
local v10 = require(script.Parent.GetLocaleAndGotoLoginPage);
local v11 = require(script.Parent.User);
local v12 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v14 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v16 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v17 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local v20 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v21 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons);
local v22 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v23 = require(l_Modules_0.LuaApp.Components.EventReceivers.CsatSurveyConstants);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
local v25 = require(l_Modules_0.TopBar.Flags.FFlagEnableGamepadMenuSelector);
return function(v26, v27, v28)
    return function(v29)
        l_Logger_0:info(string.format("[%f] Logout() (Universal App)", tick()));
        local v30 = v5(v26);
        l_Players_0:SetLocalPlayerInfo(-1, "", "", 0, true);
        v12.Batch({
            v30
        }):andThen(function()
            v29:dispatch(v8());
            v29:dispatch(l_SetAuthenticationStatus_0(v4.LOGGED_OUT));
            v29:dispatch(v10(v26));
            v11.clearLocalStorage();
            if v18() then
                v17.default:clearCache();
            end;
            if v19() then
                l_AppStorageService_0:SetItem(v23.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, "{}");
            end;
            if v24() then
                v9.setRobloxLocaleId("");
            end;
            if v25 then
                l_AppStorageService_0:SetItem("GamepadMenuVirtualCursorPromptShown", "false");
            end;
            l_AppStorageService_0:flush();
            l_MemStorageService_0:Fire(v14.ThemeUpdate, "dark");
            l_MemStorageService_0:SetItem(v14.RobuxBalance, "0");
            l_MemStorageService_0:SetItem(v14.RobuxBalanceLocalized, "--");
            v16.clearUserLayers();
            v20.default:logRobloxTelemetryEvent(v21, nil, {
                lualogoutreasons = v28 or v22.Unknown
            });
            v27:BroadcastNotification("", v7.DID_LOG_OUT);
        end);
    end;
end;
