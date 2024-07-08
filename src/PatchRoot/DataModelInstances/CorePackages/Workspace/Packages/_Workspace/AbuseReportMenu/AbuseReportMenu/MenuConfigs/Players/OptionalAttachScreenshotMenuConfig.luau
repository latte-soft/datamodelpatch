local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v4 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
return {
    componentType = "button", 
    getIsVisible = function(v5)
        local v6 = v3.getReportAnythingAvatarEnabled();
        if v6 then
            v6 = true;
            if v5.methodOfAbuse ~= v2.AbuseMethods.Other then
                v6 = v5.methodOfAbuse == v2.AbuseMethods.Avatar;
            end;
        end;
        return v6;
    end, 
    getIsDisabled = function(_, v8)
        return v8.reportAnythingState.attachCompleted;
    end, 
    variant = "secondary", 
    getIconSrc = function(v9)
        if not v9.reportAnythingState.attachCompleted then
            return "icons/controls/screenshot";
        else
            return "icons/actions/accept";
        end;
    end, 
    getButtonLabel = function(v10)
        if not v10.reportAnythingState.attachCompleted then
            return "Capture Scene";
        else
            return "Scene Captured";
        end;
    end, 
    onClick = function(_, _, v13)
        v13.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementCaptureScene
        });
        v4.mountAnnotationPage(v2.ReportTypes.Person, v13.hideReportTab, v13.reportAnythingAnalytics, v13.reportAnythingState, v13.reportAnythingDispatch);
    end, 
    fieldLabel = "Attach Screenshot? (optional)", 
    componentName = "OptionalScreenshot"
};
