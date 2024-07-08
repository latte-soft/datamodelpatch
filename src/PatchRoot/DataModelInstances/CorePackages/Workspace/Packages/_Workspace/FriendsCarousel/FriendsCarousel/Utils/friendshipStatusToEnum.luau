return function(v0)
    if not v0.isFriendWithUser then
        if not v0.hasIncomingFriendRequest then
            if not v0.hasPendingFriendRequest then
                return Enum.FriendStatus.NotFriend;
            else
                return Enum.FriendStatus.FriendRequestSent;
            end;
        else
            return Enum.FriendStatus.FriendRequestReceived;
        end;
    else
        return Enum.FriendStatus.Friend;
    end;
end;
