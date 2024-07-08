return require(script.Parent.Parent.ActionCreator)("SetPlayerIsBlocked", function(v0, v1)
    return {
        player = v0, 
        userId = v0.UserId, 
        isBlocked = v1
    };
end);
