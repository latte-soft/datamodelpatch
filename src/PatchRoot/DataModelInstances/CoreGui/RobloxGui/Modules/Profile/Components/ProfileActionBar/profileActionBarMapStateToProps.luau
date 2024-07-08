local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RetrievalStatus_0 = v1.UIBlox.App.Loading.Enum.RetrievalStatus;
local _ = require(l_Parent_0.Reducers.Root);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local l_NetworkingBlocking_0 = v1.NetworkingBlocking;
local v8 = require(l_Parent_0.Common.ProfileTypes);
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
return function(v10, v11)
    if v11.profileType == v8.FromContacts then
        return {
            actionBarLoadingStatus = l_RetrievalStatus_0.Done.rawValue(), 
            isDeleted = false
        };
    else
        local v12 = v11.profileUserId or "";
        local v13 = l_getDeepValue_0(v10, string.format("Profile.ProfilePageDataStatus.%s", v12));
        local v14 = l_getDeepValue_0(v10, string.format("Profile.AdditionalUserFields.%s.isDeleted", v12));
        local v15 = not (#v12 > 0);
        if not v15 then
            v15 = true;
            if l_NetworkingFriends_0.UnfriendTargetUserId.getStatus(v10, v12) ~= l_NetworkStatus_0.Fetching then
                v15 = true;
                if l_NetworkingFriends_0.RequestFriendshipFromUserId.getStatus(v10, v12) ~= l_NetworkStatus_0.Fetching then
                    v15 = true;
                    if l_NetworkingFriends_0.AcceptFriendRequestFromUserId.getStatus(v10, v12) ~= l_NetworkStatus_0.Fetching then
                        v15 = true;
                        if l_NetworkingFriends_0.AcceptFriendRequestWithToken.getStatus(v10, v12) ~= l_NetworkStatus_0.Fetching then
                            v15 = true;
                            if l_NetworkingFriends_0.DeclineFriendRequestFromUserId.getStatus(v10, v12) ~= l_NetworkStatus_0.Fetching then
                                v15 = true;
                                if l_NetworkingBlocking_0.BlockUserById.getStatus(v10, v12) ~= l_NetworkStatus_0.Fetching then
                                    v15 = l_NetworkingBlocking_0.UnblockUserById.getStatus(v10, v12) == l_NetworkStatus_0.Fetching;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return {
            actionBarLoadingStatus = (not not v15 and l_RetrievalStatus_0.Fetching.rawValue() or v13) or l_RetrievalStatus_0.NotStarted.rawValue(), 
            isDeleted = v14 or false
        };
    end;
end;
