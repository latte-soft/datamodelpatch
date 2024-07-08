local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useState_0 = v4.useState;
local v11 = require(l_Parent_0.AppChatNetworking);
local v12 = require(script.Parent.CreateUnfilteredChatDialog);
local v14 = {
    conversationId = nil, 
    onModalClose = function()
    end, 
    navigateToConversation = function(_)
    end, 
    titleKey = "Feature.Chat.Action.Create", 
    cancelKey = "Feature.Chat.Action.Hello", 
    confirmKey = "Feature.Chat.Action.Create", 
    bodyKey = "Feature.Chat.Action.Create", 
    failureTitleKey = "Feature.Chat.Action.Hello", 
    failureBodyKey = "Feature.Chat.Action.Hello", 
    failureButtonKey = "Feature.Chat.Action.Hello"
};
CreateUnfilteredChatDialogContainer = function(v15)
    local v16 = v3.Dictionary.join(v14, v15);
    local v17, v18 = l_useState_0(false);
    local v19, v20 = l_useState_0(false);
    local v21 = l_useScreenSize_0();
    local v22 = l_useDispatch_0();
    local v26 = l_useCallback_0(function()
        v18(true);
        v22(v11.rodux.DuplicateConversation.API(v16.conversationId, "trusted_comms")):andThen(function(v23)
            local l_responseBody_0 = v23.responseBody;
            local v25 = ((l_responseBody_0 and l_responseBody_0.conversations) and l_responseBody_0.conversations[1]) and l_responseBody_0.conversations[1].id;
            if not v25 then
                v20(true);
                return ;
            else
                v16.navigateToConversation(v25);
                return ;
            end;
        end):catch(function()
            v20(true);
        end):finally(function()
            v18(false);
        end);
        return true;
    end, l_dependencyArray_0(v22, v18, v20, v16.navigateToConversation));
    local v27 = {
        titleText = "Create upgraded conversation", 
        cancelText = "Cancel", 
        confirmText = "Confirm", 
        bodyText = "Create a new upgraded conversation that allows messaging without filters. All members of this conversation will be invited, but some may not be eligible to join.", 
        failureTitleText = "Network Error", 
        failureBodyText = "Failed to create upgraded conversation. Please try again.", 
        failureButtonText = "Confirm"
    };
    return v4.createElement(v12, {
        titleText = v27.titleText, 
        bodyText = v27.bodyText, 
        cancelText = v27.cancelText, 
        confirmText = v27.confirmText, 
        failureTitleText = v27.failureTitleText, 
        failureBodyText = v27.failureBodyText, 
        failureButtonText = v27.failureButtonText, 
        screenSize = v21, 
        displayFailed = v19, 
        isLoading = v17, 
        onActivated = v26, 
        onModalClose = v16.onModalClose
    });
end;
return l_memo_0(CreateUnfilteredChatDialogContainer);
