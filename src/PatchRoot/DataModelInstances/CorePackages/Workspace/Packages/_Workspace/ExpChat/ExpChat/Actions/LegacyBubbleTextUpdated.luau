return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1)
    return {
        messageId = v0, 
        newText = v1
    };
end);
