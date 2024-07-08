return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        conversationId = v0, 
        userId = v1, 
        value = v2
    };
end);
