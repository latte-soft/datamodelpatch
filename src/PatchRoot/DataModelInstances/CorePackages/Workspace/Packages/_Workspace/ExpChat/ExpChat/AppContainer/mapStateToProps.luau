return function(v0, _)
    return {
        canLocalUserChat = v0.CanLocalUserChat, 
        isChatInputBarVisible = v0.ChatVisibility.isChatInputBarEnabled.value, 
        isChatWindowVisible = v0.ChatVisibility.isChatWindowEnabled.value, 
        chatTopBarVisibility = v0.ChatVisibility.isChatInputBarEnabled._topBarVisibility and v0.ChatVisibility.isChatWindowEnabled._topBarVisibility, 
        messages = v0.Messages.windowMessagesInOrder, 
        lastGeneralActivityTimestamp = v0.ChatVisibility.transparency.lastGeneralActivityTimestamp, 
        lastMessageActivityTimestamp = v0.ChatVisibility.transparency.lastMessageActivityTimestamp, 
        isTextBoxFocused = v0.ChatVisibility.transparency.isTextBoxFocused, 
        chatLayoutAlignment = v0.ChatLayout.Alignment, 
        chatWindowSettings = v0.ChatLayout.ChatWindowSettings, 
        clientSettings = v0.ClientSettings
    };
end;
