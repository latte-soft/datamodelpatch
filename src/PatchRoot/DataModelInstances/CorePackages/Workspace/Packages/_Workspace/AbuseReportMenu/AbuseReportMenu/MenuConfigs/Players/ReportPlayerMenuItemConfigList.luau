local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_MenuConfigs_0 = l_script_FirstAncestor_0.MenuConfigs;
return {
    require(l_MenuConfigs_0.Players.MethodOfAbuseModalMenuConfig), 
    require(l_MenuConfigs_0.Players.PlayerModalSelectorMenuConfig), 
    require(l_MenuConfigs_0.Players.AbuseReasonModalSelectorMenuConfig), 
    require(l_MenuConfigs_0.Players.OptionalAttachScreenshotMenuConfig), 
    require(l_MenuConfigs_0.Players.FreeFormCommentMenuConfig), 
    (require(l_MenuConfigs_0.Players.SubmitReportButtonMenuConfig))
};
