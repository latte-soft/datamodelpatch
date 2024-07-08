local v0 = require(script.Parent.Parent.Parent.dependencies);
local l_NetworkingFriends_0 = v0.NetworkingFriends;
local l_NetworkStatus_0 = v0.RoduxNetworking.Enum.NetworkStatus;
return function(v3, v4, v5)
    local v6 = l_NetworkingFriends_0.GetFriendsFromUserId.getStatus(v3, v4);
    if v5 then
        local v7 = l_NetworkingFriends_0.GetFriendRecommendationsFromUserId.getStatus(v3, v4);
        if v6 == l_NetworkStatus_0.Done then
            v6 = if v7 == l_NetworkStatus_0.Failed then l_NetworkStatus_0.Failed else if v7 == l_NetworkStatus_0.Done then l_NetworkStatus_0.Done else l_NetworkStatus_0.Fetching;
        end;
    end;
    if v6 == l_NetworkStatus_0.Failed then
        v6 = l_NetworkStatus_0.Done;
    end;
    return v6;
end;
