return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        newConversationId = v0.newConversationId, 
        oldFriendConversationId = v0.oldFriendConversationId
    };
end);
