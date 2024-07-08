return function(v0, v1)
    if not v1 then
        if not v0 then
            return Enum.FriendStatus.NotFriend;
        else
            return v0;
        end;
    else
        return Enum.FriendStatus.FriendRequestReceived;
    end;
end;
