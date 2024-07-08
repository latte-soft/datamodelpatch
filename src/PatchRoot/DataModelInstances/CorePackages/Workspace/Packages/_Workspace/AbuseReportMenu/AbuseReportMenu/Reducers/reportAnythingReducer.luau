local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportAnythingActions_0 = v2.ReportAnythingActions;
return function(v4, v5)
    local v6 = table.clone(v4);
    local l_type_0 = v5.type;
    if l_type_0 == l_ReportAnythingActions_0.ClearAll then
        return v2.ReportAnythingInitialState;
    elseif l_type_0 == l_ReportAnythingActions_0.ClearAnnotationFlowProperties then
        v6.annotationPoints = {};
        v6.attachCompleted = false;
        v6.annotationPageSeen = false;
        v6.annotationOptionSeen = false;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.SetScreenshotId then
        v6.screenshotId = v5.screenshotId;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.SetScreenshotContentId then
        v6.screenshotContentId = v5.screenshotContentId;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.SetAnnotationPoints then
        v6.annotationPoints = v5.annotationPoints;
        v6.annotationPageSeen = true;
        v6.annotationOptionSeen = true;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.SetIdentificationResults then
        v6.identificationResults = v5.identificationResults;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.CompleteAttachment then
        v6.attachCompleted = true;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.SetAnnotationCircleRadius then
        v6.annotationCircleRadius = v5.radius;
        return v6;
    elseif l_type_0 == l_ReportAnythingActions_0.SetAnnotationAreaDimensions then
        v6.annotationAreaWidth = v5.width;
        v6.annotationAreaHeight = v5.height;
        return v6;
    else
        if l_type_0 == l_ReportAnythingActions_0.SetAnnotationOptionSeen then
            v6.annotationOptionSeen = true;
        end;
        return v6;
    end;
end;
