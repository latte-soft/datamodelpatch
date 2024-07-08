local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local v1 = require(l_script_FirstAncestor_0.Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")));
local v2 = require(l_script_FirstAncestor_0.Analytics.EventConstants);
local l_interactionEventName_0 = v2.interactionEventName;
return {
    sendDialogOpenedEvent = function(v4, v5, v6)
        v1:sendEventDeferred(v2.context.dialogOpened, l_interactionEventName_0, {
            dialog_opened_type = v4, 
            dialog_opened_type_internal_id = v5, 
            dialog_opened_is_expired = v6
        });
    end, 
    sendDialogActionSelectedEvent = function(v7, v8, v9)
        v1:sendEventDeferred(v2.context.dialogActionSelected, l_interactionEventName_0, {
            dialog_action_selected_type = v7, 
            dialog_action_selected_type_internal_id = v8, 
            dialog_action_selected_action = v9
        });
    end, 
    sendDialogAbandonedEvent = function(v10, v11)
        v1:sendEventDeferred(v2.context.dialogAbandoned, l_interactionEventName_0, {
            dialog_abandoned_type = v10, 
            dialog_abandoned_type_internal_id = v11
        });
    end
};
