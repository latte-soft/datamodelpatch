local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(script.Parent.User);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLocalizationConsistencyFixes);
local v9 = require(l_Modules_0.TopBar.Flags.FFlagEnableGamepadMenuSelector);
local v10 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v11 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.ClearApp);
local _ = require(l_CorePackages_0.Packages.Promise);
local v14 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v15 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v16 = require(l_Modules_0.LuaApp.Components.EventReceivers.CsatSurveyConstants);
local v17 = require(l_Modules_0.LuaApp.Constants);
return function()
    return function(v18)
        v18:dispatch(v12());
        v4.clearLocalStorage();
        if v6() then
            v10.default:clearCache();
        end;
        if v7() then
            l_AppStorageService_0:SetItem(v16.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, v17.Auth.DefaultUnauthenticatedCsatCompletedSurveyIds);
        end;
        if v8() then
            v11.setRobloxLocaleId(v17.Auth.DefaultUnauthenticatedRobloxLocaleId);
        end;
        if v9 then
            l_AppStorageService_0:SetItem("GamepadMenuVirtualCursorPromptShown", v17.Auth.DefaultUnauthenticatedGamepadMenuVirtualCursorPromptShown);
        end;
        l_MemStorageService_0:Fire(v14.ThemeUpdate, v17.Auth.DefaultUnauthenticatedAppTheme);
        l_MemStorageService_0:SetItem(v14.RobuxBalance, v17.Auth.DefaultUnauthenticatedRobuxBalance);
        l_MemStorageService_0:SetItem(v14.RobuxBalanceLocalized, v17.Auth.DefaultUnauthenticatedRobuxBalanceLocalized);
        v15.clearUserLayers();
    end;
end;
