local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
return {
    componentType = "dropdown", 
    getIsVisible = function(_)
        return true;
    end, 
    getMenuItems = function(_)
        return {};
    end, 
    onUpdateSelectedOption = function(_, _)
    end, 
    readonlyValue = require(l_script_FirstAncestor_0.Components.Constants).InappropriateContentAbuseReason, 
    fieldLabel = "Reason for Abuse?", 
    componentName = "AbuseReason"
};
