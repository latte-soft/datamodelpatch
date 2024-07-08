local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ModalBottomSheet_0 = require(l_Parent_0.UIBlox).ModalBottomSheet;
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(script.Parent.Logger);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_memo_0 = v6.memo;
local v8 = {
    conversationId = nil, 
    participantId = nil, 
    showRemoveUserButton = false, 
    showViewProfileButton = true, 
    viewProfileText = "localizedText.ViewProfile", 
    reportUserText = "localizedText.ReportUser", 
    removeFromGroupText = "localizedText.RemoveFromGroup", 
    cancelText = "localizedText.Cancel", 
    openViewProfile = function()
        v4:warning("openViewProfile was not passed to ParticipantDialog");
    end, 
    openReportUser = function()
        v4:warning("openReportUser was not passed to ParticipantDialog");
    end, 
    openRemoveUserDialog = function()
        v4:warning("openRemoveUserDialog was not passed to ParticipantDialog");
    end, 
    onDismiss = function()
        v4:warning("onDismiss was not passed to ParticipantDialog");
    end
};
ParticipantDialog = function(v9)
    local v10 = v5.Dictionary.join(v8, v9);
    local l_conversationId_0 = v10.conversationId;
    local l_participantId_0 = v10.participantId;
    local l_showRemoveUserButton_0 = v10.showRemoveUserButton;
    local v14 = {};
    if v10.showViewProfileButton then
        table.insert(v14, {
            text = v10.viewProfileText, 
            onActivated = function()
                v4:info("User activated viewProfile | userId: {}", l_participantId_0);
                v10.openViewProfile(l_participantId_0);
            end
        });
    end;
    table.insert(v14, {
        text = v10.reportUserText, 
        onActivated = function()
            v4:info("User activated reportUser | userId: {}, conversationId: {}", l_participantId_0, l_conversationId_0);
            v10.openReportUser(l_participantId_0, l_conversationId_0);
        end
    });
    if l_showRemoveUserButton_0 then
        table.insert(v14, {
            text = v10.removeFromGroupText, 
            onActivated = function()
                v10.openRemoveUserDialog(l_participantId_0, l_conversationId_0);
            end
        });
    end;
    table.insert(v14, {
        text = v10.cancelText, 
        onActivated = function()
        end
    });
    return v6.createElement(l_ModalBottomSheet_0, {
        bottomGap = 10, 
        onDismiss = v10.onDismiss, 
        buttonModels = v14, 
        screenWidth = 400, 
        showImages = false
    });
end;
return l_memo_0(ParticipantDialog);
