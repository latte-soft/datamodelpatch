local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_NetworkingFriends_0 = v0.NetworkingFriends;
local l_NetworkingBlocking_0 = v0.NetworkingBlocking;
local l_OpenReportDialog_0 = v0.OpenReportDialog;
return function(v4)
    return {
        blockUser = function(v5)
            return v4(l_NetworkingBlocking_0.BlockUserById.API({
                userId = v5.targetUserId, 
                currentUserId = v5.currentUserId
            }));
        end, 
        unFriendUser = function(v6)
            return v4(l_NetworkingFriends_0.UnfriendTargetUserId.API(v6));
        end, 
        ignoreFriendRequest = function(v7)
            return v4(l_NetworkingFriends_0.DeclineFriendRequestFromUserId.API(v7));
        end, 
        reportUser = function(v8)
            return v4(l_OpenReportDialog_0(v8));
        end
    };
end;
