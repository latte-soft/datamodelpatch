local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v8 = require(l_CorePackages_0.Roact);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.RoactRodux);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v14 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v15 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v16 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v18 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v19 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForSurveyPrompt);
local v20 = require(script.Parent.CsatSurveyConstants);
local v21 = require(script.Parent.CsatSurveyInterceptUtils);
local v22 = require(script.Parent.Parent.Parent.Flags.GetFFlagLuaAppEnableSurveySessions);
local v23 = require(script.Parent.Parent.Parent.Flags.GetFFlagLuaAppEnableSurveyTitleTranslation);
local l_GetFFlagChromeSurveySupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSurveySupport;
local v25 = game:DefineFastFlag("SurveyPlaceIdSupport", false);
local v26 = v8.PureComponent:extend("CsatSurveyInterceptEventReceiver");
v26.validateProps = v12.strictInterface({
    RobloxEventReceiver = v12.table, 
    baseUrlFormat = v12.string, 
    surveyId = v12.string, 
    isQualified = v12.boolean, 
    restrictTextInput = v12.boolean, 
    openWebView = v12.callback, 
    openSurveyPrompt = v12.callback, 
    eventType = v12.string, 
    showPrompt = v12.boolean, 
    analyticsService = v12.optional(v12.union(v12.Instance, v12.table)), 
    titleText = v12.string, 
    bodyText = v12.string, 
    cancelButtonText = v12.string, 
    confirmButtonText = v12.string, 
    sessionService = v12.optional(v12.union(v12.Instance, v12.table)), 
    localization = v12.optional(v12.table), 
    surveyName = v12.string, 
    menuVersion = v12.string
});
v26.defaultProps = {
    baseUrlFormat = "", 
    surveyId = "", 
    isQualified = false, 
    restrictTextInput = false, 
    eventType = "", 
    showPrompt = false, 
    analyticsService = l_RbxAnalyticsService_0, 
    titleText = "", 
    bodyText = "", 
    cancelButtonText = "", 
    confirmButtonText = "", 
    surveyName = "", 
    menuVersion = ""
};
v26.getSurveyUrl = function(v27, v28, v29)
    assert(v12.string(v27.props.baseUrlFormat));
    assert(v12.string(v27.props.surveyId));
    assert(v12.boolean(v27.props.restrictTextInput));
    local v30 = v28 or tostring(l_Players_0.LocalPlayer.UserId);
    assert(v12.string(v30));
    local v31 = "";
    if not v25 or not game:GetEngineFeature("SessionServiceStringReflection") then
        if not (not v22() or not game:GetEngineFeature("SessionServiceStringReflection")) then
            v31 = v27.props.sessionService:generateSessionInfoString(false, false, false, false);
        end;
    else
        v31 = v27.props.sessionService:generateSessionInfoString(false, true, false, false);
    end;
    return (v18.fromString(v27.props.baseUrlFormat)({
        surveyId = v27.props.surveyId or "", 
        userId = v30 or "0", 
        restrictTextInput = tostring(v27.props.restrictTextInput) or "true", 
        sessionIds = if not not v22() and game:GetEngineFeature("SessionServiceStringReflection") then v31 else "", 
        menuVersion = (not not l_GetFFlagChromeSurveySupport_0() and v27.props.surveyName == v20.CHROME_SURVEY_NAME) and v27.props.menuVersion or "", 
        chromeExposureCount = ((not not l_GetFFlagChromeSurveySupport_0() and v27.props.surveyName == v20.CHROME_SURVEY_NAME) and v29) and v29.chromeSeenCount or ""
    }));
end;
v26.getCompletedSurveyIds = function(v32)
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem(v20.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS);
    end);
    if l_status_0 and l_result_0 ~= "" then
        return l_HttpService_0:JSONDecode(l_result_0);
    else
        warn("Unable to fetch completed survey ids from app storage ", l_result_0);
        v32.props.analyticsService:SetRBXEventStream(v20.ANALYTICS_CONTEXT_APP, v20.ANALYTICS_SURVEY_EVENT, v20.ANALYTICS_EXPERIMENT_MENU_GET_COMPLETED_SURVEY_IDS_FIELD, {
            error = l_result_0
        });
        return {};
    end;
end;
v26.hasCompletedSurvey = function(v35)
    assert(v12.string(v35.props.surveyId));
    for _, v37 in ipairs(v35.completedSurveyIds) do
        if v37 == v35.props.surveyId then
            return true;
        end;
    end;
    return false;
end;
v26.trackSurveyIdLocally = function(v38)
    assert(v12.string(v38.props.surveyId));
    if not v38:hasCompletedSurvey() then
        if v20.LOCAL_STORAGE_CSAT_SURVEY_IDS_LIMIT <= #v38.completedSurveyIds then
            v38.completedSurveyIds = v9.List.getRange(v38.completedSurveyIds, 2, #v38.completedSurveyIds);
        end;
        table.insert(v38.completedSurveyIds, v38.props.surveyId);
        local l_status_1, l_result_1 = pcall(function()
            l_AppStorageService_0:SetItem(v20.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, l_HttpService_0:JSONEncode(v38.completedSurveyIds) or "{}");
            l_AppStorageService_0:Flush();
        end);
        if not l_status_1 then
            warn("Uncaught exception for setting completed CSAT survey ids on app storage", l_result_1);
            v38.props.analyticsService:SetRBXEventStream(v20.ANALYTICS_CONTEXT_APP, v20.ANALYTICS_SURVEY_EVENT, v20.ANALYTICS_EXPERIMENT_MENU_SET_COMPLETED_SURVEY_IDS_FIELD, {
                error = l_result_1
            });
        end;
        return ;
    else
        return ;
    end;
end;
v26.canShowSurvey = function(v41)
    assert(v12.string(v41.props.surveyId));
    if not (v41.props.surveyId ~= "") or v41.props.surveyId == nil then
        return false;
    elseif not v41:hasCompletedSurvey() then
        if l_GetFFlagChromeSurveySupport_0() and v41.props.surveyName == v20.CHROME_SURVEY_NAME then
            return v41.props.isQualified and v21.canShowChromeSurvey(v41.props.menuVersion);
        else
            return v41.props.isQualified;
        end;
    else
        return false;
    end;
end;
v26.openSurveyWebview = function(v42, v43, v44)
    if v42:canShowSurvey() then
        local v45 = v42:getSurveyUrl(v43, if not l_GetFFlagChromeSurveySupport_0() then nil else v44);
        local v46 = not v23() and "Survey" or v42.props.localization:Format(v20.WEBVIEW_NAME_KEY);
        if not v42.props.showPrompt then
            wait(0.2);
            v42.props.openWebView(v45, v46);
            v42:trackSurveyIdLocally();
        else
            v42.surveyPromptFunc = function()
                wait(0.2);
                v42.props.openWebView(v45, v46);
                v42:trackSurveyIdLocally();
            end;
            v42.surveyPromptClose = function()
                v42:trackSurveyIdLocally();
            end;
            v42.props.openSurveyPrompt(v42.surveyPromptFunc, v42.surveyPromptClose, v42.props.titleText, v42.props.bodyText, v42.props.cancelButtonText, v42.props.confirmButtonText);
            return ;
        end;
    end;
end;
v26.init = function(v47)
    v47.completedSurveyIds = v47:getCompletedSurveyIds();
    v47.subscriber = l_MessageBus_0.Subscriber.new();
    v47.subscriber:subscribe(v20.ON_SURVEY_EVENT_DESCRIPTOR, function(v48)
        if v47.props.eventType == v48.eventType and v48.eventType == v20.EVENT_TYPE_ENUM.ON_LEAVE_BUTTON_CLICK then
            v47.subscriber:unsubscribe(v20.ON_SURVEY_EVENT_DESCRIPTOR);
            v47:openSurveyWebview(v48.userId, if not l_GetFFlagChromeSurveySupport_0() then nil else v48.customProps);
        end;
    end);
end;
v26.render = function(_)
end;
v26 = l_RoactAppPolicy_0.connect(function(v50, _)
    return {
        restrictTextInput = v50.getCsatSurveyRestrictTextInput() or false
    };
end)((v16.connectUserLayer({
    v15.GameLeaveLayer, 
    v15.ExperienceMenuLayer
}, function(v52, _)
    local v54 = v52[v15.GameLeaveLayer] or {};
    return {
        baseUrlFormat = v54.baseUrlFormat, 
        surveyId = v54.surveyId, 
        isQualified = v54.isQualified, 
        eventType = v54.eventType, 
        showPrompt = v54.showPrompt, 
        titleText = v54.titleText or "", 
        bodyText = v54.bodyText or "", 
        cancelButtonText = v54.cancelButtonText or "", 
        confirmButtonText = v54.confirmButtonText or "", 
        surveyName = not not l_GetFFlagChromeSurveySupport_0() and v54.surveyName or "", 
        menuVersion = not not l_GetFFlagChromeSurveySupport_0() and (v52[v15.ExperienceMenuLayer] or {}).menuVersion or ""
    };
end)((v10.connect(nil, function(v55)
    return {
        openWebView = function(v56, v57)
            return v55(v13(v56, v57));
        end, 
        openSurveyPrompt = function(v58, v59, v60, v61, v62, v63)
            v55(v19(v58, v59, v60, v61, v62, v63));
        end
    };
end)(v26)))));
if not (not (v22() and game:GetEngineFeature("SessionServiceStringReflection")) and not v23()) then
    v26 = l_RoactServices_0.connect({
        sessionService = if not not v22() and game:GetEngineFeature("SessionServiceStringReflection") then l_AppSessionService_0 else nil, 
        localization = if not v23() then nil else v14
    })(v26);
end;
return v26;
