return require(script.Parent.Parent.ActionCreator)("SetPlayerIsCreator", function(v0, v1)
    return {
        player = v0, 
        userId = v0.UserId, 
        isCreator = v1
    };
end);
