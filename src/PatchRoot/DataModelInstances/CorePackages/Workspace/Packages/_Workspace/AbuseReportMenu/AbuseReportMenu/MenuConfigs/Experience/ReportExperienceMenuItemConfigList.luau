local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_MenuConfigs_0 = l_script_FirstAncestor_0.MenuConfigs;
return {
    require(l_MenuConfigs_0.Experience.AbuseReasonMenuConfig), 
    require(l_MenuConfigs_0.Experience.OptionalAttachScreenshotMenuConfig), 
    require(l_MenuConfigs_0.Experience.FreeFormCommentMenuConfig), 
    (require(l_MenuConfigs_0.Experience.SubmitReportButtonMenuConfig))
};
