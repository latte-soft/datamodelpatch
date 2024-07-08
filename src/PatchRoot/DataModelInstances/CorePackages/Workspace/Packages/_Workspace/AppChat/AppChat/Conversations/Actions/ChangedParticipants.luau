return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3)
    return {
        conversationId = v0, 
        participants = v1, 
        title = v2, 
        lastUpdated = v3
    };
end);
