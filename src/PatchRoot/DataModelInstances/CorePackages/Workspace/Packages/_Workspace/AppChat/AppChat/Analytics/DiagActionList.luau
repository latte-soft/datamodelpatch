local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(script.Parent.EventNames);
local l_DiagEventTypes_0 = require(l_script_FirstAncestor_0.Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
return {
    [v1.ChatLandingScreenRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingScreenRenderedCounter", "ChatLandingScreenRendered")
    }, 
    [v1.AppChatVisible] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("AppChatVisibleCounter", "AppChatVisible")
    }, 
    [v1.ChatLandingSearchBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingSearchBtnClickedCounter", "ChatLandingSearchBtnClicked")
    }, 
    [v1.ChatLandingComposeBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingComposeBtnClickedCounter", "ChatLandingComposeBtnClicked")
    }, 
    [v1.ChatLandingNotifBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingNotifBtnClickedCounter", "ChatLandingNotifBtnClicked")
    }, 
    [v1.ChatLandingConversationClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingConversationClickedCounter", "ChatLandingConversationClicked")
    }, 
    [v1.ChatLandingGroupsBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingGroupsBtnClicked", "ChatLandingGroupsBtnClicked")
    }, 
    [v1.ConversationScreenRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationScreenRenderedCounter", "ConversationScreenRendered")
    }, 
    [v1.ConversationSendBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationSendBtnClickedCounter", "ConversationSendBtnClicked")
    }, 
    [v1.ConversationScreenExit] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationScreenExitCounter", "ConversationScreenExit")
    }, 
    [v1.ConversationInfoBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationInfoBtnClickedCounter", "ConversationInfoBtnClicked")
    }, 
    [v1.ConversationMessageSent] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationMessageSentCounter", "ConversationMessageSent")
    }, 
    [v1.NewConversationCreated] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("NewConversationCreatedCounter", "NewConversationCreated")
    }, 
    [v1.ChatDetailsRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsRenderedCounter", "ChatDetailsRendered")
    }, 
    [v1.ChatEmptyStateScreenRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatEmptyStateScreenRenderedCounter", "ChatEmptyStateScreenRendered")
    }, 
    [v1.ChatAddFriendsBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatAddFriendsBtnClickedCounter", "ChatAddFriendsBtnClicked")
    }
};
