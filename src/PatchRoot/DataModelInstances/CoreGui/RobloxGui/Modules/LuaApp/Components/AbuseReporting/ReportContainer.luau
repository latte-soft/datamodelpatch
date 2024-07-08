local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportComingSoonPrompt);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogController);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v8 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local v9 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_GetFFlagLuafiedReportFullFlow_0 = v5.GetFFlagLuafiedReportFullFlow;
local l_GetFFlagVRAbuseReportLocales_0 = v5.GetFFlagVRAbuseReportLocales;
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = v5.GetFFlagLuaAppNewStreamNotificationsEnabled;
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
return function()
    local v16 = l_useDispatch_0();
    local v17 = l_useNavigation_0();
    local v18, v19 = v3.useReducer(v9.reportAnalyticsReducer, v9.EMPTY_LOGGING_STATE);
    local v20 = v17.getParam("reportData");
    local function v21()
        if not ((not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() or not v20) or not v20.onCloseCallback) then
            v20.onCloseCallback();
        end;
        v16(v14());
    end;
    local v22 = v3.useCallback(function()
        v9.sendEventData(v18, v8.ANALYTICS_EVENT_NAMES.ABANDONED);
    end, {
        v19, 
        v18
    });
    local v23 = v3.useCallback(function()
        v19({
            type = v9.ActionTypes.SET_IS_SEEN_SUMMARY_PAGE
        });
    end, {
        v19, 
        v18
    });
    if l_GetFFlagLuafiedReportFullFlow_0() or not (not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() or not v20) and v20.reportEntryPoint == "Notification" then
        return (v3.createElement(v6, {
            reportSurface = if (not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v20) and v20.reportSurface then v20.reportSurface else v8.BEDUI_SURFACES.VR, 
            locale = not l_GetFFlagVRAbuseReportLocales_0() and "en_us" or l_LocalizationService_0.RobloxLocaleId, 
            reportData = v20, 
            submissionEntryPoint = if (not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v20) and v20.submissionEntryPoint then v20.submissionEntryPoint else v8.SAFETY_EVENT_SUBMISSION_ENTRY_POINT.VR, 
            analyticsState = v18, 
            analyticsDispatch = v19, 
            onClose = v21, 
            onSummaryPageMounted = v23, 
            onLogAbandon = v22
        }));
    else
        return (v3.createElement(v4, {
            onClose = v21
        }));
    end;
end;
