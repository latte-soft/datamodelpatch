return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        conversationId = v0, 
        fetchingOlderMessages = v1
    };
end);
