local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(script.Parent.ParticipantDialog);
local v9 = {
    conversationId = nil, 
    participantId = nil, 
    showRemoveUserButton = false, 
    viewProfileText = "Feature.Chat.Label.ViewProfile", 
    reportUserText = "Feature.Chat.Action.ReportUser", 
    removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup", 
    cancelText = "Feature.Chat.Action.Cancel", 
    openViewProfile = nil, 
    openReportUser = nil, 
    openRemoveUserDialog = nil, 
    onDismiss = nil
};
ParticipantDialogContainer = function(v10)
    local v11 = v3.Dictionary.join(v9, v10);
    return v4.createElement(v8, v3.Dictionary.join(v11, l_useLocalization_0({
        viewProfileText = v11.viewProfileText, 
        reportUserText = v11.reportUserText, 
        removeFromGroupText = v11.removeFromGroupText, 
        cancelText = v11.cancelText
    }), {
        showViewProfileButton = v6(function(v12)
            return v12.getChatViewProfileOption();
        end)
    }));
end;
return l_memo_0(ParticipantDialogContainer);
