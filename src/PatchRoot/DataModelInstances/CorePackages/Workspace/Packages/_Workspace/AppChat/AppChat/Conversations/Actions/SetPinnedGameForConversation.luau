return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2)
    return {
        universeId = v0, 
        rootPlaceId = v1, 
        conversationId = v2
    };
end);
