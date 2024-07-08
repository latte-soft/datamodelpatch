local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v4 = require(l_Modules_0.LuaApp.mutedError);
local v5 = require(l_CorePackages_0.tutils);
local v6 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting);
local v7 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogBody);
local v8 = require(l_Modules_0.LuaApp.Components.AbuseReporting.submitAbuseReport);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v10 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local v11 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_UIConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ServerUI).UIConfiguration;
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_isShowEUDSAIllegalContentReportingLink_0 = v6.isShowEUDSAIllegalContentReportingLink;
local l_isInDSAFeaturesOverrideList_0 = v6.isInDSAFeaturesOverrideList;
local l_GetFFlagLuafiedReportErrorStates_0 = v3.GetFFlagLuafiedReportErrorStates;
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = v3.GetFFlagLuaAppNewStreamNotificationsEnabled;
local l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 = v3.GetFFlagDSALuaGeoGateBEDUIDevMode;
local l_ActionTypes_0 = v11.ActionTypes;
local v21 = {
    BEDUI_LOADING = "BEDUI_LOADING", 
    BEDUI_ERROR = "BEDUI_ERROR", 
    SUBMIT_LOADING = "SUBMIT_LOADING", 
    SUBMIT_ERROR = "SUBMIT_ERROR", 
    SUCCESS = "SUCCESS"
};
local function v23(v22)
    if not (v22 ~= v10.REPORT_ENTRYPOINT.Profile) or v22 == v10.REPORT_ENTRYPOINT.Chat then
        return v10.BEDUI_FETCH_CONTEXT.Profile;
    elseif v22 == v10.REPORT_ENTRYPOINT.ExperienceDetails then
        return v10.BEDUI_FETCH_CONTEXT.Experience;
    elseif v22 == v10.REPORT_ENTRYPOINT.Item then
        return v10.BEDUI_FETCH_CONTEXT.Item;
    elseif l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v22 == v10.REPORT_ENTRYPOINT.Notification then
        return v10.BEDUI_FETCH_CONTEXT.Notification;
    else
        return "";
    end;
end;
local v24 = l_UIConfiguration_0.new({
    enableLogging = false, 
    maxRetryCount = 2, 
    roduxKeyPath = "AbuseReporting"
});
local v25 = {
    BEDUILoading = false, 
    BEDUIError = false, 
    submitLoading = false, 
    submitError = false, 
    statusPrimaryText = "", 
    statusSecondaryText = ""
};
local function v29(v26, v27)
    if l_GetFFlagLuafiedReportErrorStates_0() then
        local v28 = table.clone(v25);
        if v27.type == v21.BEDUI_LOADING then
            v28.BEDUILoading = true;
            return v28;
        elseif v27.type == v21.BEDUI_ERROR then
            v28.BEDUIError = true;
            v28.statusPrimaryText = v10.BEDUI_FETCH_FAILURE_PRIMARY;
            v28.statusSecondaryText = v10.BEDUI_FETCH_FAILURE_SECONDARY;
            return v28;
        elseif v27.type == v21.SUBMIT_LOADING then
            v28.submitLoading = true;
            return v28;
        elseif v27.type == v21.SUBMIT_ERROR then
            v28.submitError = true;
            v28.statusPrimaryText = v10.REPORT_SUBMIT_FAILURE;
            return v28;
        elseif v27.type == v21.SUCCESS then
            return v28;
        else
            error("Unknown Action: " .. v27.type);
            return v28;
        end;
    else
        return v26;
    end;
end;
return function(v30)
    local v31 = l_useDispatch_0();
    local v32, v33 = v2.useState(nil);
    local v34, v35 = v2.useState(nil);
    local v36, v37 = v2.useState({});
    local v38, v39 = v2.useState({});
    local v40, v41 = v2.useReducer(v29, (table.clone(v25)));
    local l_reportEntryPoint_0 = v30.reportData.reportEntryPoint;
    v2.useEffect(function()
        v41({
            type = v21.BEDUI_LOADING
        });
        v30.analyticsDispatch({
            type = l_ActionTypes_0.SET_BASIC_INFO, 
            dialogEntryPoint = l_reportEntryPoint_0, 
            platform = v30.reportSurface
        });
        local v43 = v23(l_reportEntryPoint_0);
        if v43 ~= "" then
            local l_V1_0 = v10.BEDUI_VERSIONS.V1;
            if not l_GetFFlagDSALuaGeoGateBEDUIDevMode_0() then
                if l_isInDSAFeaturesOverrideList_0() then
                    l_V1_0 = v10.BEDUI_VERSIONS.DEV;
                end;
            elseif l_isShowEUDSAIllegalContentReportingLink_0() then
                l_V1_0 = v10.BEDUI_VERSIONS.DEV;
            end;
            v31(v24:fetch(v10.BEDUI_BASE_URL, {
                version = l_V1_0, 
                surface = v30.reportSurface, 
                context = v43, 
                locale = v30.locale
            })):andThen(function(v45)
                local l_responseBody_0 = v45.responseBody;
                if l_responseBody_0 then
                    v33(l_responseBody_0.components);
                    v35(l_responseBody_0.components.listSelection);
                end;
                v41({
                    type = v21.SUCCESS
                });
            end):catch(function(v47)
                v4("(Abuse Reporting [VR]) BEDUI fetch failed: " .. v5.toString(v47));
                v41({
                    type = v21.BEDUI_ERROR
                });
            end);
        end;
    end, {
        l_reportEntryPoint_0, 
        v30.reportSurface, 
        v30.locale, 
        v31
    });
    return v2.createElement(v7, {
        currentList = v34, 
        selectionData = v36, 
        BEDUIComponents = v32, 
        reportData = v30.reportData, 
        reportSurface = if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else v30.reportSurface, 
        prevListNodes = v38, 
        analyticsDispatch = v30.analyticsDispatch, 
        onSelect = function(v48, v49, v50, v51)
            v39(function(v52)
                local v53 = table.clone(v52);
                table.insert(v53, v34);
                return v53;
            end);
            v37(function(v54)
                local v55 = table.clone(v54);
                table.insert(v55, {
                    tagValues = v48, 
                    heading = v49, 
                    humanReadableText = v50
                });
                return v55;
            end);
            v35(v51);
            v30.analyticsDispatch({
                type = l_ActionTypes_0.INCREMENT_SELECTION_ITEM
            });
        end, 
        onSubmitReport = function()
            local function _()
                v31(v14(v10.SUCCESS_TOAST_DATA));
                v11.sendEventData(v30.analyticsState, v10.ANALYTICS_EVENT_NAMES.SUBMITTED);
                v30.onClose();
            end;
            v41({
                type = v21.SUBMIT_LOADING
            });
            local l_url_0 = v32.submission.url;
            if not (not (#v36 > 0) or not l_url_0) then
                v31(v8(v36, l_url_0, v30.reportData, v30.submissionEntryPoint)):andThen(function()
                    if l_GetFFlagLuafiedReportErrorStates_0() then
                        v41({
                            type = v21.SUCCESS
                        });
                        v31(v14(v10.SUCCESS_TOAST_DATA));
                        v11.sendEventData(v30.analyticsState, v10.ANALYTICS_EVENT_NAMES.SUBMITTED);
                        v30.onClose();
                    end;
                end):catch(function(v58)
                    v4("(Abuse Reporting [VR]) Report submission failed" .. v5.toString(v58));
                    v41({
                        type = v21.SUBMIT_ERROR
                    });
                end):finally(if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then nil else function()
                    if not (not v30.reportData or not v30.reportData.onSubmitReportCallback) then
                        v30.reportData.onSubmitReportCallback();
                    end;
                end);
                if not l_GetFFlagLuafiedReportErrorStates_0() then
                    v31(v14(v10.SUCCESS_TOAST_DATA));
                    v11.sendEventData(v30.analyticsState, v10.ANALYTICS_EVENT_NAMES.SUBMITTED);
                    v30.onClose();
                end;
            end;
        end, 
        onSummaryPageMounted = v30.onSummaryPageMounted, 
        onLogAbandon = v30.onLogAbandon, 
        onBack = function()
            if #v38 > 0 then
                v35(v38[#v38]);
                v39(function(v59)
                    local v60 = table.clone(v59);
                    table.remove(v60);
                    return v60;
                end);
                table.remove(v36);
                v37(v36);
                v30.analyticsDispatch({
                    type = l_ActionTypes_0.INCREMENT_BACK_BUTTON_CLICK
                });
                v41({
                    type = v21.SUCCESS
                });
            end;
        end, 
        onClose = v30.onClose, 
        loadingState = v40
    });
end;
