local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportComingSoonPrompt);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogController);
local v7 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v9 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local _ = v9.ActionTypes;
local l_GetFFlagLuafiedReportFullFlow_0 = v5.GetFFlagLuafiedReportFullFlow;
local l_GetFFlagVRAbuseReportLocales_0 = v5.GetFFlagVRAbuseReportLocales;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return (v14(function()
    local v16 = l_useNavigation_0();
    local v17, v18 = v3.useReducer(v9.reportAnalyticsReducer, v9.EMPTY_LOGGING_STATE);
    local function v19()
        v15.closeOverlay(v16);
    end;
    local v20 = v3.useCallback(function()
        v9.sendEventData(v17, v7.ANALYTICS_EVENT_NAMES.ABANDONED);
    end, {
        v18, 
        v17
    });
    local v21 = v3.useCallback(function()
        v18({
            type = v9.ActionTypes.SET_IS_SEEN_SUMMARY_PAGE
        });
    end, {
        v18, 
        v17
    });
    local v22 = {
        reportEntryPoint = v7.REPORT_ENTRYPOINT.Item, 
        assetTypeName = v16.getParam("assetTypeName"), 
        itemId = v16.getParam("itemId"), 
        itemName = v16.getParam("itemName"), 
        itemCreatorName = v16.getParam("itemCreatorName")
    };
    if not l_GetFFlagLuafiedReportFullFlow_0() then
        return (v3.createElement(v4, {
            onClose = v19
        }));
    else
        return (v3.createElement(v6, {
            reportData = v22, 
            reportSurface = v7.BEDUI_SURFACES.VR, 
            locale = not l_GetFFlagVRAbuseReportLocales_0() and "en_us" or l_LocalizationService_0.RobloxLocaleId, 
            submissionEntryPoint = v7.SAFETY_EVENT_SUBMISSION_ENTRY_POINT.VR, 
            analyticsState = v17, 
            analyticsDispatch = v18, 
            onClose = v19, 
            onSummaryPageMounted = v21, 
            onLogAbandon = v20
        }));
    end;
end));
