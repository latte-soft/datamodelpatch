return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0)
    return {
        bubbleChatSettings = v0.bubbleChatSettings or {}, 
        chatWindowSettings = v0.chatWindowSettings or {}, 
        chatInputBarSettings = v0.chatInputBarSettings or {}
    };
end);
