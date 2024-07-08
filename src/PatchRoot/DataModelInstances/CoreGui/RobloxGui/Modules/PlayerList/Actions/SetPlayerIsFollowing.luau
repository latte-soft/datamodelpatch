return require(script.Parent.Parent.ActionCreator)("SetPlayerIsFollowing", function(v0, v1)
    return {
        player = v0, 
        userId = v0.UserId, 
        isFollowing = v1
    };
end);
