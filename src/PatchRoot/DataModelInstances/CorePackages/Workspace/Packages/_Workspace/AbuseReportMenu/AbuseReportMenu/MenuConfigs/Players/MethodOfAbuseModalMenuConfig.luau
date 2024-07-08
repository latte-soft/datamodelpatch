local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local v5 = require(l_script_FirstAncestor_0.Utility.getAvailableMethodsOfAbuse);
local v6 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local l_default_0 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.VoiceChat.VoiceChatServiceManager).default;
local v8 = require(l_Parent_0.Cryo);
return {
    componentType = "modalSelector", 
    getIsVisible = function(v9)
        return v9.isVoiceEnabled or v6.getReportAnythingAvatarEnabled();
    end, 
    getMenuItems = function(v10)
        return v5(v10.isVoiceEnabled and not v8.isEmpty(l_default_0:getRecentUsersInteractionData()), v6.getReportAnythingAvatarEnabled());
    end, 
    getSelectedValue = function(v11)
        return v11.methodOfAbuse;
    end, 
    onUpdateSelectedOption = function(v12, v13, v14, v15)
        v14({
            type = v4.PlayerMenuActions.UpdateMethodOfAbuse, 
            methodOfAbuse = v12.label
        });
        if v12.label ~= v13.methodOfAbuse then
            v15.reportAnythingDispatch({
                type = v4.ReportAnythingActions.ClearAnnotationFlowProperties
            });
            v15.analyticsDispatch({
                type = v4.AnalyticsActions.IncrementTypeofabuseChanged
            });
            v15.analyticsDispatch({
                type = v4.AnalyticsActions.SetTypeOfAbuseSelection, 
                selection = v12.label
            });
        end;
    end, 
    fieldLabel = "Type Of Abuse?", 
    componentName = "MethodOfAbuse"
};
