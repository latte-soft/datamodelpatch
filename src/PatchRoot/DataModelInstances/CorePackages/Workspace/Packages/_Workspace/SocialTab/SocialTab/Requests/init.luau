local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
return {
    FetchChatSettings = require(l_script_FirstAncestor_0.Parent.AppChat).Conversations.Thunks.FetchChatSettings, 
    GetUserV2FromUserId = require(l_script_FirstAncestor_0.dependencies).NetworkingUsers.GetUserV2FromUserId, 
    GetUnreadConversationCount = require(script.GetUnreadConversationCount)
};
