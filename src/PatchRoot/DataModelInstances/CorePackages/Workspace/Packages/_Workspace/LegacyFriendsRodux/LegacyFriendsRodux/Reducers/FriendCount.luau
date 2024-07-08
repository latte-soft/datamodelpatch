local l_SetFriendCount_0 = require(script:FindFirstAncestor("LegacyFriendsRodux").Actions).SetFriendCount;
return function(v1, v2)
    v1 = v1 or 0;
    if v2.type == l_SetFriendCount_0.name then
        v1 = v2.count;
    end;
    return v1;
end;
