return function(v0, v1)
    v0.cache:evict({
        id = v0.cache:identify({
            __typename = "Friend", 
            id = v1.userId, 
            targetUserId = v1.targetUserId
        })
    });
    v0.cache:gc();
end;
