return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3)
    return {
        conversationId = v0, 
        messages = v1, 
        shouldMarkConversationUnread = v2, 
        exclusiveStartMessageId = v3
    };
end);
