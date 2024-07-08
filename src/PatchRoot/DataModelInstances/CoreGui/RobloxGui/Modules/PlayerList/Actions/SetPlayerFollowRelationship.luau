return require(script.Parent.Parent.ActionCreator)("SetPlayerFollowRelationship", function(v0, v1, v2)
    return {
        player = v0, 
        userId = v0.UserId, 
        isFollower = v1, 
        isFollowing = v2
    };
end);
