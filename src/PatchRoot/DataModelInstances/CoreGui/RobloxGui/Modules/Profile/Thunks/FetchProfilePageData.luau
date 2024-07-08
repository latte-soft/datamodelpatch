local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v1.Promise;
local v3 = require(l_script_FirstAncestor_0.Reducers.Actions.SetProfilePageDataStatus);
local v4 = require(l_script_FirstAncestor_0.Reducers.Actions.SetNextDataExpirationTime);
local l_RetrievalStatus_0 = v1.UIBlox.App.Loading.Enum.RetrievalStatus;
local l_NetworkingUsers_0 = v1.NetworkingUsers;
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local l_NetworkingPresence_0 = v1.NetworkingPresence;
local l_NetworkingBlocking_0 = v1.NetworkingBlocking;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v11 = require(l_script_FirstAncestor_0.Common.ProfileScreens);
local v12 = require(l_script_FirstAncestor_0.Thunks.FetchCurrentlyWearing);
local l_NetworkingPremiumFeatures_0 = v1.NetworkingPremiumFeatures;
local v14 = game:DefineFastInt("LuaProfileRefreshIntervalSeconds", 1800);
local v15 = game:DefineFastFlag("LuaProfileStopCallingFriendRequests", false);
local l_GetUserPremiumMembershipStatus_0 = l_NetworkingPremiumFeatures_0.GetUserPremiumMembershipStatus;
local function v21(v17, v18, _)
    local v20 = tostring(v17:getState().LocalUserId);
    return {
        v17:dispatch(l_NetworkingUsers_0.GetUserV2FromUserId.API(v18)), 
        v17:dispatch(l_GetUserPremiumMembershipStatus_0.API(v18)), 
        v17:dispatch(l_NetworkingFriends_0.GetFriendsCountFromUserId.API(v18)), 
        v17:dispatch(l_NetworkingFriends_0.GetFollowersCount.API(v18)), 
        v17:dispatch(l_NetworkingFriends_0.GetFollowingsCount.API(v18)), 
        v17:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API({
            v18
        })), 
        v17:dispatch(l_NetworkingBlocking_0.GetBlockedUsers.API()), 
        v17:dispatch(l_NetworkingFriends_0.GetExtendedFriendshipStatus.API({
            targetUserId = v18
        })), 
        v17:dispatch(l_NetworkingFriends_0.GetUserFollowers.API({
            targetUserId = tostring(v17:getState().LocalUserId)
        })), 
        v17:dispatch(l_NetworkingFriends_0.GetFollowingExists.API({
            targetUserIds = {
                v18
            }
        })), 
        if not v15 then v17:dispatch(l_NetworkingFriends_0.GetFriendRequests.API({
            fetchMutualFriends = false, 
            currentUserId = v20
        })) else if v18 == v20 then v17:dispatch(l_NetworkingFriends_0.GetFriendRequests.API({
            fetchMutualFriends = false, 
            currentUserId = v20
        })) else nil
    };
end;
local function v26(v22, v23, v24)
    local v25 = l_getDeepValue_0(v22:getState(), string.format("Profile.AdditionalUserFields.%s.isDeleted", v23));
    if not (v24 or v22:getState().Profile.CurrentlyWearing[v23] == nil) or v25 then
        return l_Promise_0.resolve();
    else
        return v22:dispatch(v12(v23));
    end;
end;
return function(v27, v28)
    if type(v27) ~= "string" then
        error("FetchProfilePageData thunk expects profileUserId to be a string");
    end;
    return function(v29)
        local v30 = v29:getState();
        if v30.Profile.ProfilePageDataStatus[v27] == l_RetrievalStatus_0.Fetching.rawValue() then
            return l_Promise_0.resolve({});
        else
            local v31 = false;
            local v32 = v11.ProfilePeekView .. v27;
            local v33 = not not v28 and v28.currentTime or tick();
            local v34 = v30.Profile.NextDataExpirationTime[v32];
            if not (v34 ~= nil) or v34 < v33 then
                v31 = true;
            end;
            local v35 = v21(v29, v27, v31);
            if #v35 > 0 then
                v29:dispatch(v3(v27, l_RetrievalStatus_0.Fetching.rawValue()));
                return l_Promise_0.all(v35):andThen(function(v36)
                    local v37 = l_getDeepValue_0(v29:getState(), string.format("Profile.Users.byUserId.%s", v27)) ~= nil;
                    v29:dispatch(v3(v27, not not v37 and l_RetrievalStatus_0.Done.rawValue() or l_RetrievalStatus_0.Failed.rawValue()));
                    if v37 then
                        v33 = not not v28 and v28.currentTime or tick();
                        v34 = math.floor(v33 + v14);
                        v29:dispatch(v4(v32, v34));
                    end;
                    v26(v29, v27, v31);
                    if not v37 then
                        return l_Promise_0.reject();
                    else
                        return l_Promise_0.resolve({
                            friendStatus = v36[8].responseBody.status, 
                            playerPresence = v36[6].responseBody.userPresences[1].userPresenceType
                        });
                    end;
                end);
            else
                return v26(v29, v27, v31);
            end;
        end;
    end;
end;
