local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_Parent_0.Cryo);
return {
    componentType = "dropdown", 
    getIsVisible = function(_)
        return true;
    end, 
    getMenuItems = function(v6)
        return v4.Dictionary.values(if v6.methodOfAbuse == "Voice Chat" then v2.PlayerVoiceAbuseTypes else v2.PlayerAbuseTypes);
    end, 
    onUpdateSelectedOption = function(v7, _, v9, v10)
        v10.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementReasonChanged
        });
        v10.analyticsDispatch({
            type = v2.AnalyticsActions.SetReasonSelection, 
            selection = v7
        });
        v9({
            type = v2.PlayerMenuActions.UpdateAbuseReason, 
            abuseReason = v7
        });
    end, 
    fieldLabel = "Reason for Abuse?", 
    componentName = "AbuseReason"
};
