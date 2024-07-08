local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
local l_RoduxNetworking_0 = v0.RoduxNetworking;
local l_Promise_0 = v0.Promise;
local l_t_0 = v0.t;
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
local l_FriendsNetworking_0 = v0.FriendsNetworking;
local v6 = l_t_0.strictInterface({
    localUserId = l_t_0.string, 
    inactiveFriendsNetworkRequestStatus = l_t_0.string, 
    onResolve = l_t_0.union(l_t_0.callback, l_t_0.table), 
    onError = l_t_0.union(l_t_0.callback, l_t_0.table)
});
return function(v7)
    return {
        refreshPageData = function(v8)
            assert(v6(v8));
            return l_Promise_0.all({
                v7(l_FriendsNetworking_0.GetFriendsFromUserId.API(v8.localUserId)), 
                v7(l_FriendsNetworking_0.GetFriendRequestsCount.API()), 
                v7(function(_)
                    if not (v8.inactiveFriendsNetworkRequestStatus ~= l_NetworkStatus_0.NotStarted) or v8.inactiveFriendsNetworkRequestStatus == l_NetworkStatus_0.Failed then
                        return v7(l_FriendsNetworking_0.GetInactiveFriends.API(v8.localUserId));
                    else
                        return l_Promise_0.resolve();
                    end;
                end)
            }):andThen(v8.onResolve):catch(v8.onError);
        end, 
        getFriendRequestsCount = function()
            return v7(l_FriendsNetworking_0.GetFriendRequestsCount.API());
        end
    };
end;
