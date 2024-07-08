local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local v4 = require(l_Parent_0.Cryo);
local l_AnalyticsActions_0 = v3.AnalyticsActions;
local v6 = {
    typeofabuseSelection = v4.None, 
    reasonSelection = v4.None
};
return function(v7, v8)
    local v9 = table.clone(v7);
    local l_type_0 = v8.type;
    if l_type_0 == l_AnalyticsActions_0.Reset then
        local l_menuEverShown_0 = v9.menuEverShown;
        v9 = v3.AnalyticsInitialState;
        v9.menuEverShown = l_menuEverShown_0;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SetMenuOpenedTimestamp then
        v9.menuEverShown = true;
        v9.menuOpenedUnixTimestampMilliseconds = v8.timestamp;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementExperiencePersonChanged then
        v9.experiencePersonChangeCount = v9.experiencePersonChangeCount + 1;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementTypeofabuseChanged then
        v9.typeofabuseChangeCount = v9.typeofabuseChangeCount + 1;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementPersonChanged then
        v9.personChangeCount = v9.personChangeCount + 1;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementReasonChanged then
        v9.reasonChangeCount = v9.reasonChangeCount + 1;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementCaptureScene then
        v9.captureSceneCount = v9.captureSceneCount + 1;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SetViewportInformation then
        v9.viewportSizeX = v8.viewportSizeX;
        v9.viewportSizeY = v8.viewportSizeY;
        v9.isPortraitMode = v8.viewportSizeX < v8.viewportSizeY;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SetSubmissionCompleted then
        v9.isSubmissionCompleted = true;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SetTypeOfAbuseSelection then
        v9.typeofabuseSelection = v8.selection;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SetReasonSelection then
        v9.reasonSelection = v8.selection;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SetCommentAdded then
        v9.commentAdded = v8.commentAdded;
        return v9;
    elseif l_type_0 == l_AnalyticsActions_0.SwitchToExperienceInitialSelections then
        return (v4.Dictionary.join(v9, v6, v3.AnalyticsExpeirenceInitialSelections));
    else
        if l_type_0 == l_AnalyticsActions_0.SwitchToPersonInitialSelections then
            v9 = v4.Dictionary.join(v9, v6, v3.AnalyticsPersonInitialSelections);
        end;
        return v9;
    end;
end;
