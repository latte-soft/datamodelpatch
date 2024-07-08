local l_Parent_0 = script.Parent.Parent;
local l_FriendStatuses_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics.Analytics.Enums.FriendStatuses;
local _ = require(l_Parent_0.Common.LocalTypes);
return function(v3)
    if not v3.isFriendWithUser then
        if not v3.hasPendingFriendRequest then
            if not v3.hasIncomingFriendRequest then
                return l_FriendStatuses_0.NotFriends;
            else
                return l_FriendStatuses_0.RequestReceived;
            end;
        else
            return l_FriendStatuses_0.RequestSent;
        end;
    else
        return l_FriendStatuses_0.Friends;
    end;
end;
