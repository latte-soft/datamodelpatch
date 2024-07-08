local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
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
local l_ResponseIndicator_0 = v2.Components.ResponseIndicator;
local v17 = require(script.Parent.LeaveGroupDialog);
local v18 = {
    conversationId = nil, 
    onModalClose = function()
    end, 
    onLeaveSuccess = function()
    end, 
    titleKey = "Feature.Chat.Heading.LeaveGroup", 
    cancelKey = "Feature.Chat.Action.Stay", 
    confirmKey = "Feature.Chat.Action.Leave", 
    bodyKey = "Feature.Chat.Message.LeaveGroup", 
    failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup", 
    failureBodyKey = "Feature.Chat.Message.FailedToLeaveGroup", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
LeaveGroupDialogContainer = function(v19)
    local v20 = v5.Dictionary.join(v18, v19);
    local v21, v22 = l_useState_0(true);
    local v23, v24 = l_useState_0(false);
    local v25, v26 = l_useState_0(false);
    local v27 = l_useDispatch_0();
    local v30 = l_useCallback_0(function(v28, v29)
        if not v15() then
            return v27(v14.RemoveFromConversation.API(v28, v29));
        else
            return v27(v4.rodux.RemoveUserFromConversation.API(v29, v28));
        end;
    end, l_dependencyArray_0(v27));
    local v32 = l_useSelector_0(function(v31)
        return {
            localUserId = v31.LocalUserId, 
            conversationTitle = (v31.ChatAppReducer.Conversations[v20.conversationId] or {
                title = nil
            }).title
        };
    end);
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        LeaveGroupDialog = v21 and v6.createElement(v17, v5.Dictionary.join(v20, l_useLocalization_0({
            titleText = v20.titleKey, 
            cancelText = v20.cancelKey, 
            confirmText = v20.confirmKey, 
            bodyText = v20.bodyKey, 
            failureTitleText = v20.failureTitleKey, 
            failureBodyText = {
                v20.failureBodyKey; 
                CONVERSATION_TITLE = v32.conversationTitle
            }, 
            failureButtonText = v20.failureButtonKey
        }), v32, {
            onActivated = l_useCallback_0(function()
                v24(true);
                v22(false);
                v30(v32.localUserId, v20.conversationId):andThen(function()
                    v20.onModalClose();
                    v20.onLeaveSuccess();
                end):catch(function()
                    v24(false);
                    v22(true);
                    v26(true);
                end);
                return true;
            end, l_dependencyArray_0(v32.localUserId, v20.conversationId)), 
            displayFailed = v25
        })), 
        ResponseIndicator = v23 and v6.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        })
    });
end;
return l_memo_0(LeaveGroupDialogContainer);
