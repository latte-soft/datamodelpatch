local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialContextToasts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Promise);
local l_UsersGetPresence_0 = require(l_Parent_0.UserLib).Requests.UsersGetPresence;
local v6 = require(l_Parent_0.UserProfiles);
local l_getCombinedNameFromId_0 = v6.Selectors.getCombinedNameFromId;
local l_PostSendExperienceInvite_0 = require(l_Parent_0.GameInvite).PostSendExperienceInvite;
local l_JoinExperience_0 = require(l_Parent_0.NotificationsCommon).JoinExperience;
local v10 = require(l_script_FirstAncestor_0.Enums.SocialContextToastDiagKeys);
local v11 = require(l_script_FirstAncestor_0.Actions.SetToastContent);
local v12 = require(l_script_FirstAncestor_0.Actions.SetConfirmationModal);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v14 = require(l_script_FirstAncestor_0.Enums.ToastTypes);
local v15 = require(l_script_FirstAncestor_0.Enums.SocialContextToastAnalyticsActionTypes);
local v16 = require(l_script_FirstAncestor_0.SocialContextToastEvents);
local l_DEPRECATED_FriendsGetFriendStatuses_0 = require(l_Parent_0.Http).Requests.DEPRECATED_FriendsGetFriendStatuses;
local l_GetFFlagEnableSocialContextToastFollowFriend_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialContextToastFollowFriend;
local l_GetFFlagEnableSocialContextToastNonRootPlace_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialContextToastNonRootPlace;
local l_GetFFlagEnableSocialContextToastInviteBack_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialContextToastInviteBack;
local l_GetFFlagShowSocialContextToastToAll_0 = require(l_Parent_0.SharedFlags).GetFFlagShowSocialContextToastToAll;
local l_SocialContextToastIxpConfig_0 = require(l_Parent_0.SharedFlags).SocialContextToastIxpConfig;
local v23 = game:DefineFastFlag("UseBatchRequestFriendStatus", false);
local l_GetFFlagSocialContextToastEventStream_0 = require(l_Parent_0.SharedFlags).GetFFlagSocialContextToastEventStream;
game:DefineFastFlag("OnlyShowToastFromFriends", false);
local v25 = game:DefineFastInt("SocialContextToastDelay", 10);
local function _(v26)
    if not l_GetFFlagShowSocialContextToastToAll_0() then
        local l_status_0, l_result_0 = pcall(function()
            return v26:GetLayerData("PlayerApp.GameJoin.UX");
        end);
        if (not l_status_0 or not l_result_0) or not l_result_0.IsInformationalSCTEnabled then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v39(v30, v31)
    local v32 = {};
    for v33 = 1, #v31 do
        v32[v33] = tostring(v31[v33]);
    end;
    return v4.new(function(v34, _)
        v30:query({
            query = v6.Queries.userProfilesAllNamesByUserIds, 
            variables = {
                userIds = v32
            }
        }):andThen(function(v36)
            local v37 = {};
            for v38 = 1, #v31 do
                table.insert(v37, {
                    userId = v31[v38], 
                    name = l_getCombinedNameFromId_0(v36.data, v31[v38])
                });
            end;
            v34(v37);
        end);
    end);
end;
local function _(v40, v41, v42)
    if v42 then
        v40 = v3.List.removeValue(v40, v41);
        table.insert(v40, 1, v41);
        return v40;
    else
        return v40;
    end;
end;
local function v53(v44, v45, v46, v47, v48, v49, v50)
    if #v47 == 0 then
        return v45(v11(nil));
    else
        v44.analytics.Diag:reportCounter(v10.YouJoinedFriends, 1);
        if l_GetFFlagSocialContextToastEventStream_0() then
            v16(v44.eventIngest, {
                toastType = v14.YouJoinedFriends, 
                friendId = table.concat(v47, ","), 
                universeId = v49, 
                placeId = v50, 
                actionType = v15.Shown
            });
        end;
        if v46 > 0 then
            local l_v47_0 = v47;
            if v48 then
                l_v47_0 = v3.List.removeValue(l_v47_0, v46);
                table.insert(l_v47_0, 1, v46);
                v47 = l_v47_0;
            else
                v47 = l_v47_0;
            end;
        end;
        return v39(v44.apolloClient, v47):andThen(function(v52)
            v45(v11({
                toastType = v14.YouJoinedFriends, 
                userList = v52
            }));
        end);
    end;
end;
local function v74(v54, v55, v56, v57, v58, v59)
    local l_analytics_0 = v54.analytics;
    l_UsersGetPresence_0(v54.networking, {
        v56
    }):andThen(function(v61)
        if (not v61.responseBody or not v61.responseBody.userPresences) or #v61.responseBody.userPresences == 0 then
            return ;
        else
            local v62 = v61.responseBody.userPresences[1];
            local l_universeId_0 = v62.universeId;
            if tostring(l_universeId_0) == tostring(v58) then
                if not l_GetFFlagEnableSocialContextToastNonRootPlace_0() then
                    return v53(v54, v55, v56, v57, false, v58, v59);
                else
                    l_analytics_0.Diag:reportCounter(v10.FollowedFriendInOtherPlace, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v54.eventIngest, {
                            toastType = v14.FriendInNonRootPlace, 
                            friendId = tostring(v56), 
                            universeId = v58, 
                            placeId = v59, 
                            actionType = v15.Shown
                        });
                    end;
                    return v39(v54.apolloClient, {
                        v56
                    }):andThen(function(v64)
                        if #v64 == 0 then
                            return ;
                        else
                            v55(v11({
                                toastType = v14.FriendInNonRootPlace, 
                                joinerUserId = v56, 
                                joinerName = v64[1].name
                            }));
                            return ;
                        end;
                    end);
                end;
            elseif l_universeId_0 ~= nil then
                if not l_GetFFlagEnableSocialContextToastFollowFriend_0() or not l_SocialContextToastIxpConfig_0.CheckIsActionableToastEnabled() then
                    return v53(v54, v55, v56, v57, false, v58, v59);
                else
                    l_analytics_0.Diag:reportCounter(v10.FollowedFriendInOtherUniverse, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v54.eventIngest, {
                            toastType = v14.FollowYourFriend, 
                            friendId = tostring(v56), 
                            universeId = v58, 
                            placeId = v59, 
                            actionType = v15.Shown
                        });
                    end;
                    local function v66(v65)
                        if v65 then
                            l_analytics_0.Diag:reportCounter(v10.ConfirmLeaveGameButtonClicked, 1);
                            if l_GetFFlagSocialContextToastEventStream_0() then
                                v16(v54.eventIngest, {
                                    toastType = "LeaveGameConfirmationModal", 
                                    friendId = tostring(v56), 
                                    universeId = v58, 
                                    placeId = v59, 
                                    actionType = v15.ButtonClicked
                                });
                            end;
                            l_JoinExperience_0(string.format("roblox://userid=%s&placeid=%s", tostring(v56), v62.placeId), true);
                            return ;
                        else
                            v55(v12(false));
                            return ;
                        end;
                    end;
                    local function v67()
                        l_analytics_0.Diag:reportCounter(v10.JoinFriendButtonClicked, 1);
                        if l_GetFFlagSocialContextToastEventStream_0() then
                            v16(v54.eventIngest, {
                                toastType = v14.FollowYourFriend, 
                                friendId = tostring(v56), 
                                universeId = v58, 
                                placeId = v59, 
                                actionType = v15.ButtonClicked
                            });
                        end;
                        v55(v12(true, v66));
                    end;
                    return v39(v54.apolloClient, {
                        v56
                    }):andThen(function(v68)
                        if #v68 == 0 then
                            return ;
                        else
                            v55(v11({
                                toastType = v14.FollowYourFriend, 
                                joinerUserId = v56, 
                                joinerName = v68[1].name, 
                                experienceName = v62.lastLocation, 
                                onActivated = v67
                            }));
                            return ;
                        end;
                    end);
                end;
            elseif not l_GetFFlagEnableSocialContextToastInviteBack_0() or not l_SocialContextToastIxpConfig_0.CheckIsActionableToastEnabled() then
                return v53(v54, v55, v56, v57, false, v58, v59);
            else
                l_analytics_0.Diag:reportCounter(v10.FollowedFriendNotInGame, 1);
                if l_GetFFlagSocialContextToastEventStream_0() then
                    v16(v54.eventIngest, {
                        toastType = v14.InviteBack, 
                        friendId = tostring(v56), 
                        universeId = v58, 
                        placeId = v59, 
                        actionType = v15.Shown
                    });
                end;
                local function v71()
                    l_analytics_0.Diag:reportCounter(v10.InviteBackButtonClicked, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(v54.eventIngest, {
                            toastType = v14.InviteBack, 
                            friendId = tostring(v56), 
                            universeId = v58, 
                            placeId = v59, 
                            actionType = v15.ButtonClicked
                        });
                    end;
                    l_PostSendExperienceInvite_0(v54.networking, tostring(v56), tostring(v59), "SocialContextToast"):andThen(function(_)
                        v55(v11({
                            toastType = v14.InviteSuccess
                        }));
                    end, function(_)
                        v55(v11({
                            toastType = v14.InviteFailure
                        }));
                    end);
                end;
                return v39(v54.apolloClient, {
                    v56
                }):andThen(function(v72)
                    if #v72 == 0 then
                        return ;
                    else
                        v55(v11({
                            toastType = v14.InviteBack, 
                            joinerUserId = v56, 
                            joinerName = v72[1].name, 
                            onActivated = v71
                        }));
                        return ;
                    end;
                end);
            end;
        end;
    end, function(_)
        l_analytics_0.Diag:reportCounter(v10.ErrorFetchingPresence, 1);
    end);
end;
SocialContextToastDispatcher = function(v75)
    local l_services_0 = v75.services;
    local l_analytics_1 = l_services_0.analytics;
    local l_playersService_0 = l_services_0.playersService;
    local l_ixpService_0 = l_services_0.ixpService;
    local v80 = v2.createRef();
    local l_networking_0 = l_services_0.networking;
    local v82 = v2.useRef(nil);
    local v83 = l_useDispatch_0();
    local function v98()
        local l_LocalPlayer_0 = l_playersService_0.LocalPlayer;
        local l_FollowUserId_0 = l_LocalPlayer_0.FollowUserId;
        local v86 = false;
        local v87 = {};
        if not v23 then
            for _, v89 in pairs(l_playersService_0:GetPlayers()) do
                local l_UserId_0 = v89.UserId;
                if l_UserId_0 == l_FollowUserId_0 then
                    v86 = true;
                end;
                if l_LocalPlayer_0:IsFriendsWith(l_UserId_0) then
                    table.insert(v87, l_UserId_0);
                end;
            end;
            if not (l_FollowUserId_0 > 0) or v86 then
                return v53(l_services_0, v83, l_FollowUserId_0, v87, v86, v75.gameId, v75.placeId);
            else
                return v74(l_services_0, v83, l_FollowUserId_0, v87, v75.gameId, v75.placeId);
            end;
        else
            local v91 = {};
            for _, v93 in pairs(l_playersService_0:GetPlayers()) do
                table.insert(v91, v93.UserId);
            end;
            l_DEPRECATED_FriendsGetFriendStatuses_0(l_networking_0, v91):andThen(function(v94)
                if (not v94 or not v94.responseBody) or not v94.responseBody.data then
                    return ;
                else
                    for _, v96 in pairs(v94.responseBody.data) do
                        local l_id_0 = v96.id;
                        if l_id_0 == l_FollowUserId_0 then
                            v86 = true;
                        end;
                        if v96.status == "Friends" then
                            table.insert(v87, l_id_0);
                        end;
                    end;
                    if not (l_FollowUserId_0 > 0) or v86 then
                        return v53(l_services_0, v83, l_FollowUserId_0, v87, v86, v75.gameId, v75.placeId);
                    else
                        return v74(l_services_0, v83, l_FollowUserId_0, v87, v75.gameId, v75.placeId);
                    end;
                end;
            end);
            return ;
        end;
    end;
    local function v105(v99)
        local l_LocalPlayer_1 = l_playersService_0.LocalPlayer;
        if v99.FollowUserId == l_LocalPlayer_1.UserId then
            if not game:GetFastFlag("OnlyShowToastFromFriends") then
                l_analytics_1.Diag:reportCounter(v10.YouWereFollowed, 1);
                v39(l_services_0.apolloClient, {
                    v99.UserId
                }):andThen(function(v101)
                    v83(v11({
                        toastType = v14.FriendJoinedYou, 
                        joinerUserId = v99.UserId, 
                        joinerName = v101[1].name
                    }));
                end);
            else
                local l_status_1, l_result_1 = pcall(function()
                    return l_LocalPlayer_1:IsFriendsWith(v99.UserId);
                end);
                if not (not l_status_1 or not l_result_1) then
                    l_analytics_1.Diag:reportCounter(v10.YouWereFollowed, 1);
                    if l_GetFFlagSocialContextToastEventStream_0() then
                        v16(l_services_0.eventIngest, {
                            toastType = v14.FriendJoinedYou, 
                            friendId = tostring(v99.UserId), 
                            universeId = v75.gameId, 
                            placeId = v75.placeId, 
                            actionType = v15.Shown
                        });
                    end;
                    v39(l_services_0.apolloClient, {
                        v99.UserId
                    }):andThen(function(v104)
                        v83(v11({
                            toastType = v14.FriendJoinedYou, 
                            joinerUserId = v99.UserId, 
                            joinerName = v104[1].name
                        }));
                    end);
                    return ;
                end;
            end;
        end;
    end;
    v2.useEffect(function()
        task.delay(v25, function()
            local l_l_ixpService_0_0 = l_ixpService_0;
            local v107;
            if not l_GetFFlagShowSocialContextToastToAll_0() then
                local l_status_2, l_result_2 = pcall(function()
                    return l_l_ixpService_0_0:GetLayerData("PlayerApp.GameJoin.UX");
                end);
                v107 = not not l_status_2 and ((l_result_2 and l_result_2.IsInformationalSCTEnabled) and true or false);
            else
                v107 = true;
            end;
            if v107 then
                if not v80.current then
                    if #l_playersService_0:GetPlayers() > 0 then
                        v98();
                    end;
                    v82.current = l_playersService_0.PlayerAdded:Connect(v105);
                end;
                return ;
            else
                return ;
            end;
        end);
        return function()
            v80.current = true;
            if v82.current then
                v82.current:disconnect();
            end;
        end;
    end, {});
end;
return SocialContextToastDispatcher;
