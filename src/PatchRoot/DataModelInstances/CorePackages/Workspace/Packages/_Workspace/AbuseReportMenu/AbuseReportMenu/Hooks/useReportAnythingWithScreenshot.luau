local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_script_FirstAncestor_0.Hooks.useHideForScreenshot);
local v4 = require(l_script_FirstAncestor_0.Hooks.useCaptureScreenshot);
local v5 = require(l_script_FirstAncestor_0.Reducers.reportAnythingReducer);
local v6 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
return function(v7, v8, v9, v10)
    local v11 = v6.getReportAnythingAvatarEnabled();
    local v12 = v6.getReportAnythingExperienceEnabled();
    local v13, v14 = v1.useReducer(v5, v2.ReportAnythingInitialState);
    v3((v11 or v12) and v13.screenshotContentId == "", v7, v8, v9, v4(v1.useCallback(function(v15)
        v14({
            type = v2.ReportAnythingActions.SetScreenshotContentId, 
            screenshotContentId = v15
        });
    end), v1.useCallback(function(v16)
        v14({
            type = v2.ReportAnythingActions.SetScreenshotId, 
            screenshotId = v16
        });
    end), v1.useCallback(function(v17)
        v14({
            type = v2.ReportAnythingActions.SetIdentificationResults, 
            identificationResults = v17
        });
    end)), function()
        v10(v13, v14);
    end);
    return v13, v14;
end;
