local l_networkRequests_0 = script.Parent.networkRequests;
local v1 = require(l_networkRequests_0.createAddToConversation);
local v2 = require(l_networkRequests_0.createRemoveFromConversation);
local v3 = require(l_networkRequests_0.createRenameGroupConversation);
local v4 = require(l_networkRequests_0.createStartGroupConversation);
local v5 = require(l_networkRequests_0.createStartOneToOneConversation);
local v6 = require(l_networkRequests_0.createSetConversationUniverse);
local v7 = require(l_networkRequests_0.createResetConversationUniverse);
local v8 = require(l_networkRequests_0.createSendMessage);
local v9 = require(l_networkRequests_0.createSendGameLinkMessage);
local v10 = require(l_networkRequests_0.createUpdateUserTypingStatus);
local v11 = require(l_networkRequests_0.createMarkAsRead);
local v12 = require(l_networkRequests_0.createMarkAsSeen);
local v13 = require(l_networkRequests_0.createGetMessages);
local v14 = require(l_networkRequests_0.createGetUserConversations);
local v15 = require(l_networkRequests_0.createGetConversations);
local v16 = require(l_networkRequests_0.createGetLatestMessages);
local v17 = require(l_networkRequests_0.createGetUnreadConversationCount);
local v18 = require(l_networkRequests_0.createGetUnreadMessages);
local v19 = require(l_networkRequests_0.createGetChatSettings);
local v20 = require(l_networkRequests_0.createGetRolloutSettings);
local v21 = require(l_networkRequests_0.createGetMetadata);
return function(v22)
    return {
        AddToConversation = v1(v22), 
        RemoveFromConversation = v2(v22), 
        RenameGroupConversation = v3(v22), 
        StartGroupConversation = v4(v22), 
        StartOneToOneConversation = v5(v22), 
        SetConversationUniverse = v6(v22), 
        ResetConversationUniverse = v7(v22), 
        SendMessage = v8(v22), 
        SendGameLinkMessage = v9(v22), 
        UpdateUserTypingStatus = v10(v22), 
        MarkAsRead = v11(v22), 
        MarkAsSeen = v12(v22), 
        GetMessages = v13(v22), 
        GetUserConversations = v14(v22), 
        GetConversations = v15(v22), 
        GetLatestMessages = v16(v22), 
        GetUnreadConversationCount = v17(v22), 
        GetUnreadMessages = v18(v22), 
        GetChatSettings = v19(v22), 
        GetRolloutSettings = v20(v22), 
        GetMetadata = v21(v22)
    };
end;
