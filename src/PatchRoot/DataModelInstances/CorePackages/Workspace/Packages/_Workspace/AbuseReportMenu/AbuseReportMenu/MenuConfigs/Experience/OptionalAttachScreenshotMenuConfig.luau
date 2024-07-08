local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v4 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
return {
    componentType = "button", 
    getIsVisible = function(_)
        return v3.getReportAnythingExperienceEnabled();
    end, 
    getIsDisabled = function(_, v7)
        return v7.reportAnythingState.attachCompleted;
    end, 
    variant = "secondary", 
    getIconSrc = function(v8)
        if not v8.reportAnythingState.attachCompleted then
            return "icons/controls/screenshot";
        else
            return "icons/actions/accept";
        end;
    end, 
    getButtonLabel = function(v9)
        if not v9.reportAnythingState.attachCompleted then
            return "Capture Scene";
        else
            return "Scene Captured";
        end;
    end, 
    onClick = function(_, _, v12)
        v12.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementCaptureScene
        });
        v4.mountAnnotationPage(v2.ReportTypes.Experience, v12.hideReportTab, v12.reportAnythingAnalytics, v12.reportAnythingState, v12.reportAnythingDispatch);
    end, 
    fieldLabel = "Attach Screenshot? (optional)", 
    componentName = "OptionalScreenshot"
};
