local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_Parent_0.AppChatNetworking);
local l_ResponseStatus_0 = v13.Constants.ResponseStatus;
local v15 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v16 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local l_ResponseIndicator_0 = v5.Components.ResponseIndicator;
local v18 = require(script.Parent.EditChatGroupNameDialog);
local v19 = require(l_script_FirstAncestor_0.Logger);
local v22 = {
    Success = function()
        return {
            visible = false, 
            isLoading = false, 
            warningTextKey = nil
        };
    end, 
    Moderated = function()
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = "Feature.Chat.Response.ChatNameFullyModerated"
        };
    end, 
    Default = function(v20, v21)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = {
                "Feature.Chat.Message.FailedToRenameConversation"; 
                EXISTING_NAME = v20, 
                NEW_NAME = v21
            }
        };
    end, 
    Waiting = function()
        return {
            visible = true, 
            isLoading = true
        };
    end
};
local v23 = {
    conversationId = nil, 
    onModalClose = function()
    end, 
    titleKey = "Feature.Chat.Label.ChatGroupName", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Save", 
    placeholderTextKey = "Feature.Chat.Description.NameGroupChat"
};
EditChatGroupNameDialogContainer = function(v24)
    local v25 = v3.Dictionary.join(v23, v24);
    local v26, v27 = l_useState_0({
        visible = true, 
        isLoading = false
    });
    local v28 = l_useDispatch_0();
    local v31 = l_useCallback_0(function(v29, v30)
        if not v16() then
            return v28(v15.RenameGroupConversation.API(v29, v30));
        else
            return v28(v13.rodux.UpdateConversationTitle.API(v29, v30));
        end;
    end, l_dependencyArray_0(v28));
    local v35 = l_useSelector_0(function(v32)
        local v33 = v32.ChatAppReducer.Conversations[v25.conversationId];
        local v34 = "";
        if not (not v33 or v33.isDefaultTitle) then
            v34 = v33.title;
        end;
        return v34;
    end);
    return v4.createElement(v4.Fragment, nil, {
        responseIndicator = v26.isLoading and v4.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        dialog = v26.visible and v4.createElement(v18, v3.Dictionary.join(v25, l_useLocalization_0({
            titleText = v25.titleKey, 
            placeholderText = v25.placeholderTextKey, 
            cancelText = v25.cancelTitleKey, 
            confirmText = v25.confirmationTitleKey, 
            warningText = v26.warningTextKey
        }), {
            onActivated = l_useCallback_0(function(v36)
                v27(v22.Waiting());
                v31(v25.conversationId, v36.InputBox):andThen(function(v37)
                    if not v16() then
                        if v37.responseBody and v37.responseBody.resultType == "Success" then
                            v27(v22.Success());
                            v25.onModalClose();
                            return ;
                        elseif v37.responseBody and v37.responseBody.resultType == "Moderated" then
                            v27(v22.Moderated());
                            return ;
                        else
                            v27(v22.Default(v35, v36.InputBox));
                            return ;
                        end;
                    elseif not ((not v37 or not v37.responseBody) or not v37.responseBody.conversations) and v37.responseBody.conversations[1] then
                        if v37.responseBody.conversations[1].status == l_ResponseStatus_0.SUCCESS then
                            v27(v22.Success());
                            v25.onModalClose();
                            return ;
                        elseif v37.responseBody and v37.responseBody.conversations[1].status == l_ResponseStatus_0.MODERATED then
                            v19.error("Conversation rename was moderated.");
                            v27(v22.Moderated());
                            return ;
                        else
                            v19.error("Conversation rename request failed.");
                            v27(v22.Default(v35, v36.InputBox));
                            return ;
                        end;
                    else
                        v19.error("Conversation rename response is invalid.");
                        v27(v22.Default(v35, v36.InputBox));
                        return ;
                    end;
                end):catch(function(_)
                    v27(v22.Default(v35, v36.InputBox));
                end);
                return true;
            end, l_dependencyArray_0(v25.conversationId, v35)), 
            inputText = v35, 
            conversationTitle = v35
        }))
    });
end;
return l_memo_0(EditChatGroupNameDialogContainer);
