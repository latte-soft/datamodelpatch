local l_UserModel_0 = require(game:GetService("CorePackages").Workspace.Packages.UserLib).Models.UserModel;
return function(v1, v2)
    local l_FriendCount_0 = v1.FriendCount;
    local v4 = v1.FriendPresenceCounts[l_UserModel_0.PresenceType.ONLINE] or 0;
    local v5 = v1.FriendPresenceCounts[l_UserModel_0.PresenceType.IN_GAME] or 0;
    v2.EventStream:setRBXEventStream("onlineFriends", "usersFriendsPresenceOnAppStartup", {
        onlineFriendCount = v4 + v5, 
        inGameFriendCount = v5, 
        totalFriendCount = l_FriendCount_0
    });
end;
