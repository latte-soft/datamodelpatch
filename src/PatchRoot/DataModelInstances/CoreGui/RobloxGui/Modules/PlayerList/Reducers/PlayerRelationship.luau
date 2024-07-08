local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v1.createReducer({}, {
    [require(l_Actions_0.AddPlayer).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            [v5.userId] = {
                isBlocked = false, 
                friendStatus = Enum.FriendStatus.Unknown, 
                isFollowing = false, 
                isFollower = false
            }
        });
    end, 
    [require(l_Actions_0.RemovePlayer).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            [v7.userId] = v2.None
        });
    end, 
    [require(l_Actions_0.SetPlayerIsBlocked).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            [v9.userId] = {
                isBlocked = v9.isBlocked, 
                friendStatus = v8[v9.userId].friendStatus, 
                isFollowing = v8[v9.userId].isFollowing, 
                isFollower = v8[v9.userId].isFollower
            }
        });
    end, 
    [require(l_Actions_0.SetPlayerFollowRelationship).name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            [v11.userId] = {
                isBlocked = v10[v11.userId].isBlocked, 
                friendStatus = v10[v11.userId].friendStatus, 
                isFollowing = v11.isFollowing, 
                isFollower = v11.isFollower
            }
        });
    end, 
    [require(l_Actions_0.SetPlayerIsFollowing).name] = function(v12, v13)
        return v2.Dictionary.join(v12, {
            [v13.userId] = {
                isBlocked = v12[v13.userId].isBlocked, 
                friendStatus = v12[v13.userId].friendStatus, 
                isFollowing = v13.isFollowing, 
                isFollower = v12[v13.userId].isFollower
            }
        });
    end, 
    [require(l_Actions_0.SetPlayerFriendStatus).name] = function(v14, v15)
        return v2.Dictionary.join(v14, {
            [v15.userId] = {
                isBlocked = v14[v15.userId].isBlocked, 
                friendStatus = v15.friendStatus, 
                isFollowing = v14[v15.userId].isFollowing, 
                isFollower = v14[v15.userId].isFollower
            }
        });
    end
}));
