local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v5 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local function v13(v6, v7, v8)
    local v9 = math.floor(workspace:GetServerTimeNow() * 1000);
    local v10 = 0;
    if v6.menuOpenedUnixTimestampMilliseconds > 0 then
        v10 = math.floor(v9 - v6.menuOpenedUnixTimestampMilliseconds);
    end;
    local v11, _ = v5.interpretAnnotations(v7);
    return (v2.Dictionary.join({
        placeId = game.PlaceId, 
        isPortraitMode = v6.isPortraitMode, 
        viewportSizeX = v6.viewportSizeX, 
        viewportSizeY = v6.viewportSizeY, 
        timeSpentMs = v10, 
        experiencePersonChangeCount = v6.experiencePersonChangeCount, 
        typeofabuseChangeCount = v6.typeofabuseChangeCount, 
        personChangeCount = v6.personChangeCount, 
        reasonChangeCount = v6.reasonChangeCount, 
        captureSceneCount = v6.captureSceneCount, 
        reasonSelection = v6.reasonSelection, 
        commentAdded = v6.commentAdded, 
        experiencePersonSelection = v6.experiencePersonSelection, 
        annotationFinalCount = #v7.annotationPoints, 
        avatarFinalCount = #v11, 
        interactionType = not v6.isSubmissionCompleted and 2 or 1, 
        typeofabuseSelection = v6.typeofabuseSelection
    }, v8));
end;
return {
    forPersonReport = function(v14, v15, v16)
        local v17 = v13(v14, v15, v16);
        local v18 = nil;
        local l_Chat_0 = v3.AnalyticsAbuseMethods.Chat;
        for v20, v21 in pairs(v3.AbuseMethodToAnalyticsMapping) do
            if v20 == v14.typeofabuseSelection then
                v18 = v21;
                l_Chat_0 = v21;
            end;
        end;
        v17.typeofabuseSelection = v18;
        v17.inferredTypeofabuseSelection = l_Chat_0;
        return v17;
    end, 
    forExperienceReport = function(v22, v23, v24)
        local v25 = v13(v22, v23, v24);
        v25.typeofabuseSelection = v3.AnalyticsAbuseMethods.Game;
        v25.inferredTypeofabuseSelection = v3.AnalyticsAbuseMethods.Game;
        return v25;
    end
};
