return {
    createConversation = require(script.createConversation), 
    SendPolicies = require(script.SendPolicies), 
    SendTextMessage = require(script.SendTextMessage), 
    SendMessageUsingPolicy = require(script.SendMessageUsingPolicy), 
    ReceivedChatResponse = require(script.ReceivedChatResponse), 
    getAllFriendsAsync = require(script.getAllFriendsAsync), 
    getAllUserPresences = require(script.getAllUserPresences), 
    DEPRECATED_getConversations = require(script.DEPRECATED_getConversations), 
    paginateAndRefreshConversations = require(script.paginateAndRefreshConversations), 
    DEPRECATED_getLocalUserConversations = require(script.DEPRECATED_getLocalUserConversations), 
    DEPRECATED_refreshConversations = require(script.DEPRECATED_refreshConversations), 
    DEPRECATED_FetchChatData = require(script.DEPRECATED_FetchChatData), 
    fetchChatMetadata = require(script.fetchChatMetadata), 
    FetchInitialChatData = require(script.FetchInitialChatData), 
    FetchChatSettings = require(script.FetchChatSettings), 
    NavigateIntoChat = require(script.NavigateIntoChat)
};
