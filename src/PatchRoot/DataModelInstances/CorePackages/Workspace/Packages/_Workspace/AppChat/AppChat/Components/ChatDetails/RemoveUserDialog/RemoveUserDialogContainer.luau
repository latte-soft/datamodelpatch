local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v6.memo;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v14 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v15 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v16 = require(script.Parent.RemoveUserDialogLayout);
local v17 = {
    conversationId = nil, 
    participantId = nil, 
    onModalClose = function()
    end, 
    titleKey = "Feature.Chat.Action.RemoveUser", 
    messageKey = "Feature.Chat.Message.RemoveUser", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Remove", 
    failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser", 
    failureBodyKey = "Feature.Chat.Message.FailedToRemoveUser", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
RemoveUserDialogContainer = function(v18)
    local v19 = v5.Dictionary.join(v17, v18);
    local v20, v21 = l_useState_0(true);
    local v22, v23 = l_useState_0(false);
    local v24, v25 = l_useState_0(false);
    local v26 = l_useDispatch_0();
    local v29 = l_useCallback_0(function(v27, v28)
        if not v15() then
            return v26(v14.RemoveFromConversation.API(v27, v28));
        else
            return v26(v4.rodux.RemoveUserFromConversation.API(v28, v27));
        end;
    end, l_dependencyArray_0(v26));
    local v31 = l_useSelector_0(function(v30)
        return {
            conversationTitle = (v30.ChatAppReducer.Conversations[v19.conversationId] or {
                title = nil
            }).title, 
            targetUser = v2(v30, v30.Users[v19.participantId])
        };
    end);
    return v6.createElement(v16, v5.Dictionary.join(v19, l_useLocalization_0({
        titleText = v19.titleKey, 
        bodyText = {
            v19.messageKey; 
            USERNAME = v31.targetUser.displayName
        }, 
        cancelText = v19.cancelTitleKey, 
        confirmText = v19.confirmationTitleKey, 
        failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser", 
        failureBodyText = {
            v19.failureBodyKey; 
            USERNAME = v31.targetUser.displayName, 
            CONVERSATION_TITLE = v31.conversationTitle
        }, 
        failureButtonText = "Feature.Chat.Action.Confirm"
    }), v31, {
        onActivated = l_useCallback_0(function()
            v23(true);
            v21(false);
            v29(v19.participantId, v19.conversationId):andThen(function()
                v19.onModalClose();
            end):catch(function()
                v23(false);
                v21(true);
                v25(true);
            end);
            return true;
        end, l_dependencyArray_0(v19.participantId, v19.conversationId)), 
        displayFailed = v24, 
        isModalVisible = v20, 
        isLoading = v22
    }));
end;
return l_memo_0(RemoveUserDialogContainer);
