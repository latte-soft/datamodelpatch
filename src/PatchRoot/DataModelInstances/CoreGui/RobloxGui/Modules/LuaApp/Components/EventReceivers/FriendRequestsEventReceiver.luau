local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(script.Parent.EventNetworking);
local function _(v4)
    return ({
        FriendshipRequested = true, 
        FriendshipDeclined = true, 
        FriendshipCreated = true
    })[v4];
end;
local v6 = v1.PureComponent:extend("FriendRequestsEventReceiver");
v6.init = function(v7)
    v7.tokens = {
        v7.props.RobloxEventReceiver:observeEvent("FriendshipNotifications", function(v8)
            if ({
                FriendshipRequested = true, 
                FriendshipDeclined = true, 
                FriendshipCreated = true
            })[v8.Type] and not v7.props.friendRequestCountStatus ~= v3.RoduxNetworking.Enum.NetworkStatus.Fetching then
                v7.props.dispatchFetchFriendRequestsCount(v7.props.localUserId);
            end;
        end)
    };
end;
v6.render = function(_)
    return nil;
end;
v6.willUnmount = function(v10)
    for _, v12 in pairs(v10.tokens) do
        v12:disconnect();
    end;
end;
return v2.connect(function(v13)
    return {
        localUserId = v13.LocalUserId, 
        friendRequestCountStatus = v3.FriendsNetworking.GetFriendRequestsCount.getStatus(v13)
    };
end, function(v14, _)
    return {
        dispatchFetchFriendRequestsCount = function(v16)
            return v14(v3.FriendsNetworking.GetFriendRequestsCount.API(v16));
        end
    };
end)(v6);
