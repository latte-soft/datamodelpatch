local v0 = require(script:FindFirstAncestor("FriendsLanding").Friends.mapToUsers);
return function(v1, _)
    return {
        localUserId = v1.LocalUserId, 
        friends = v0(v1)(v1.LocalUserId)
    };
end;
