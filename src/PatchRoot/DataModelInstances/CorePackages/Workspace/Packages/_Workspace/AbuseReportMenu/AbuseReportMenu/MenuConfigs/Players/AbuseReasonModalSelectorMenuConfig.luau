local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_Parent_0.Cryo);
return {
    componentType = "modalSelector", 
    getIsVisible = function(_)
        return true;
    end, 
    getMenuItems = function(v6)
        return v4.List.map(v4.Dictionary.values(if v6.methodOfAbuse == v2.AbuseMethods.VoiceChat then v2.PlayerVoiceAbuseTypes else v2.PlayerAbuseTypes), function(v7)
            return {
                label = v7
            };
        end);
    end, 
    getSelectedValue = function(v8)
        return v8.abuseReason;
    end, 
    onUpdateSelectedOption = function(v9, _, v11, v12)
        v12.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementReasonChanged
        });
        v12.analyticsDispatch({
            type = v2.AnalyticsActions.SetReasonSelection, 
            selection = v9.label
        });
        v11({
            type = v2.PlayerMenuActions.UpdateAbuseReason, 
            abuseReason = v9.label
        });
    end, 
    fieldLabel = "Reason for Abuse?", 
    componentName = "AbuseReason"
};
