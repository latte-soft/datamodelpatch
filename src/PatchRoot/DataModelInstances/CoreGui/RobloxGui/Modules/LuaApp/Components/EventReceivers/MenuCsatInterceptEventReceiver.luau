local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.RoactRodux);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v12 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v13 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v15 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v16 = require(script.Parent.CsatSurveyConstants);
local v17 = v6.PureComponent:extend("MenuCsatInterceptEventReceiver");
v17.validateProps = v10.strictInterface({
    RobloxEventReceiver = v10.table, 
    baseUrlFormat = v10.string, 
    surveyId = v10.string, 
    isQualified = v10.boolean, 
    restrictTextInput = v10.boolean, 
    openWebView = v10.callback, 
    menuVersion = v10.string, 
    analyticsService = v10.optional(v10.union(v10.Instance, v10.table))
});
v17.defaultProps = {
    baseUrlFormat = "", 
    surveyId = "", 
    isQualified = false, 
    restrictTextInput = false, 
    menuVersion = "", 
    analyticsService = l_RbxAnalyticsService_0
};
v17.getSurveyUrl = function(v18)
    assert(v10.string(v18.props.baseUrlFormat));
    assert(v10.string(v18.props.surveyId));
    assert(v10.boolean(v18.props.restrictTextInput));
    assert(v10.string(v18.props.menuVersion));
    local v19 = tostring(l_Players_0.LocalPlayer.UserId);
    assert(v10.string(v19));
    return (v15.fromString(v18.props.baseUrlFormat)({
        surveyId = v18.props.surveyId or "", 
        userId = v19 or "0", 
        restrictTextInput = tostring(v18.props.restrictTextInput) or "true", 
        menuVersion = v18.props.menuVersion or ""
    }));
end;
v17.getCompletedSurveyIds = function(v20)
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem(v16.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS);
    end);
    if l_status_0 and l_result_0 ~= "" then
        return l_HttpService_0:JSONDecode(l_result_0);
    else
        warn("Unable to fetch completed survey ids from app storage ", l_result_0);
        v20.props.analyticsService:SetRBXEventStream(v16.ANALYTICS_CONTEXT_APP, v16.ANALYTICS_EXPERIMENT_MENU_TEST, v16.ANALYTICS_EXPERIMENT_MENU_GET_COMPLETED_SURVEY_IDS_FIELD, {
            error = l_result_0
        });
        return {};
    end;
end;
v17.hasCompletedSurvey = function(v23)
    assert(v10.string(v23.props.surveyId));
    for _, v25 in ipairs(v23.completedSurveyIds) do
        if v25 == v23.props.surveyId then
            return true;
        end;
    end;
    return false;
end;
v17.trackSurveyIdLocally = function(v26)
    assert(v10.string(v26.props.surveyId));
    if not v26:hasCompletedSurvey() then
        if v16.LOCAL_STORAGE_CSAT_SURVEY_IDS_LIMIT <= #v26.completedSurveyIds then
            v26.completedSurveyIds = v7.List.getRange(v26.completedSurveyIds, 2, #v26.completedSurveyIds);
        end;
        table.insert(v26.completedSurveyIds, v26.props.surveyId);
        local l_status_1, l_result_1 = pcall(function()
            l_AppStorageService_0:SetItem(v16.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, l_HttpService_0:JSONEncode(v26.completedSurveyIds) or "{}");
            l_AppStorageService_0:Flush();
        end);
        if not l_status_1 then
            warn("Uncaught exception for setting completed CSAT survey ids on app storage", l_result_1);
            v26.props.analyticsService:SetRBXEventStream(v16.ANALYTICS_CONTEXT_APP, v16.ANALYTICS_EXPERIMENT_MENU_TEST, v16.ANALYTICS_EXPERIMENT_MENU_SET_COMPLETED_SURVEY_IDS_FIELD, {
                error = l_result_1
            });
        end;
        return ;
    else
        return ;
    end;
end;
parseCountData = function(v29)
    if not v29 or typeof(v29) ~= "string" then
        return nil, nil;
    else
        local v30 = v29:split(":");
        return v30[1], v30[2];
    end;
end;
v17.isQualified = function(_)
    local v32 = false;
    local l_status_2, l_result_2 = pcall(function()
        return l_AppStorageService_0:GetItem(v16.LOCAL_STORAGE_KEY_EXPERIENCE_MENU_CSAT_QUALIFICATION);
    end);
    local v35, v36 = parseCountData(l_result_2);
    if not (not (v36 == v16.EXPERIENCE_MENU_TEST_VERSION) or not tonumber(v35)) then
        v32 = v16.EXPERIENCE_MENU_CSAT_QUALIFICATION_THRESHOLD <= tonumber(v35);
    end;
    if not l_status_2 or not v32 then
        return false;
    else
        return true;
    end;
end;
v17.canShowSurvey = function(v37)
    assert(v10.string(v37.props.surveyId));
    if not (v37.props.surveyId ~= "") or v37.props.surveyId == nil then
        return false;
    elseif not (v37.props.menuVersion ~= "") or v37.props.menuVersion == nil then
        return false;
    elseif not v37:hasCompletedSurvey() then
        local v38 = v37:getCurrentMenuVersion();
        local v39 = false;
        if v37.props.menuVersion == "v3t3" then
            v39 = v37.props.menuVersion == v38;
        end;
        local v40 = false;
        if v37.props.menuVersion == "v1t3" then
            v40 = v37.props.menuVersion == v38;
        end;
        return not not v37:isQualified() and v39 or v40;
    else
        return false;
    end;
end;
v17.getCurrentMenuVersion = function(_)
    local l_status_3, l_result_3 = pcall(function()
        return l_AppStorageService_0:GetItem(v16.LOCAL_STORAGE_KEY_EXPERIENCE_MENU_VERSION);
    end);
    if l_status_3 and l_result_3 ~= "" then
        return l_result_3;
    else
        return nil;
    end;
end;
v17.init = function(v44)
    v44.completedSurveyIds = v44:getCompletedSurveyIds();
    v44.subscriber = l_MessageBus_0.Subscriber.new();
    v44.subscriber:subscribe(v16.ON_GAME_LEAVE_DESCRIPTOR, function(_)
        v44.subscriber:unsubscribe(v16.ON_GAME_LEAVE_DESCRIPTOR);
        if v44:canShowSurvey() then
            local v46 = v44:getSurveyUrl();
            wait(0.2);
            if v46 ~= nil then
                v44.props.openWebView(v46, "Survey");
                v44:trackSurveyIdLocally();
            end;
        end;
    end);
end;
v17.render = function(_)
end;
return (l_RoactAppPolicy_0.connect(function(v48, _)
    return {
        restrictTextInput = v48.getCsatSurveyRestrictTextInput() or false
    };
end)((v13.connectUserLayer({
    v12.GameLeaveLayer, 
    v12.ExperienceMenuLayer
}, function(v50, _)
    local v52 = v50[v12.GameLeaveLayer] or {};
    return {
        baseUrlFormat = v52.baseUrlFormat, 
        surveyId = v52.surveyId, 
        isQualified = v52.isQualified, 
        menuVersion = (v50[v12.ExperienceMenuLayer] or {}).menuVersion
    };
end)((v8.connect(nil, function(v53)
    return {
        openWebView = function(v54, v55)
            return v53(v11(v54, v55));
        end
    };
end)(v17))))));
